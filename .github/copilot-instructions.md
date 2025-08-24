# reservatoriosBR R Package Development

Always reference these instructions first and fallback to search or bash commands only when you encounter unexpected information that does not match the info here.

reservatoriosBR is an R package that provides access to Brazilian reservoir data from multiple sources including SAR-ANA (Brazilian National Water Agency) and ONS (National Electric System Operator). The package contains 9 main functions for accessing reservoir information and historical data.

## Working Effectively

### System Setup and Dependencies
- Install R and system dependencies:
  ```bash
  sudo apt update && sudo apt install -y r-base r-base-dev
  sudo apt install -y libcurl4-openssl-dev libssl-dev libxml2-dev libgit2-dev pandoc
  ```
- Install R package dependencies:
  ```bash
  sudo apt install -y r-cran-devtools r-cran-roxygen2 r-cran-pkgdown
  sudo apt install -y r-cran-dplyr r-cran-rvest r-cran-jsonlite r-cran-magrittr r-cran-readr r-cran-tibble r-cran-tidyr
  ```
- **NETWORK DEPENDENCY**: Some R packages (like `janitor`, `glue`) may require internet access to CRAN. If CRAN is unreachable, document this limitation in your changes.

### Package Build and Check
- Build the package (takes ~1 second):
  ```bash
  R CMD build .
  ```
- Check package integrity (takes ~30 seconds):
  ```bash
  R CMD check --as-cran reservatoriosBR_1.1.tar.gz
  ```
- **IMPORTANT**: Package check may fail due to missing `janitor` dependency if CRAN is unreachable. This is expected in restricted environments.

### Development Workflow
- Load package for development:
  ```r
  library(devtools)
  devtools::load_all()
  ```
- Update documentation (takes ~5 seconds):
  ```r
  roxygen2::roxygenise()
  ```
- Install package dependencies:
  ```r
  devtools::install_deps()
  ```

### Testing Package Functions
- Test basic package information:
  ```r
  # Load the package
  library(reservatoriosBR)
  
  # Get package function information
  info_reservatoriosBR()
  
  # List available reservoirs (takes ~1-2 seconds, downloads from GitHub)
  tabela_reservatorios()
  tabela_reservatorios_ONS()
  ```
- **VALIDATION REQUIREMENT**: Always test at least one data retrieval function after making changes:
  ```r
  # Test data retrieval (requires internet access to government APIs)
  # Expected: 804 rows, 12 columns of Brazilian reservoir data
  result <- tabela_reservatorios()
  cat('Dataset has', nrow(result), 'rows and', ncol(result), 'columns')
  ```
- **MANUAL VALIDATION**: After code changes, verify actual data retrieval works:
  ```bash
  cd /path/to/reservatoriosBR
  R -e "source('R/tabela_reservatorios.R'); result <- tabela_reservatorios(); print(head(result, 2))"
  ```

### Documentation and Website
- Build pkgdown documentation site (takes ~30 seconds, requires internet):
  ```bash
  R -e "pkgdown::build_site()"
  ```
- **NEVER CANCEL**: Site building may take up to 2 minutes when downloading external resources. Set timeout to 5+ minutes.
- Preview documentation locally:
  ```bash
  # Open docs/index.html in browser after building
  ```

### GitHub Actions Workflows
- **pkgdown.yaml**: Automatically builds and deploys documentation website on push to main/master
- **test-coverage.yaml**: Runs test coverage analysis using `covr` package
- Both workflows run on Ubuntu with R 4.x and take approximately 5-10 minutes each
- **NEVER CANCEL**: CI workflows may take up to 15 minutes for full completion

## Validation Scenarios

### After Making Code Changes
1. **Always build and check the package**:
   ```bash
   cd /path/to/reservatoriosBR
   R CMD build .
   R CMD check --as-cran reservatoriosBR_*.tar.gz  # Set timeout to 60+ minutes
   ```

2. **Test package loading**:
   ```r
   devtools::load_all()
   library(reservatoriosBR)
   ```

3. **Validate core functionality**:
   ```r
   # Test metadata functions (takes ~1-2 seconds each)
   info_reservatoriosBR()
   
   # Test data retrieval - ALWAYS verify this works after changes
   result <- tabela_reservatorios()  # Should return 804 rows, 12 columns
   print(paste("Retrieved", nrow(result), "reservoir records"))
   
   # Test other data functions if internet available
   try(ultima_medicao())
   ```

### Before Committing Changes
- **Always update documentation if you modified function signatures**:
  ```r
  roxygen2::roxygenise()
  ```
- **Check that NAMESPACE is properly updated**:
  ```bash
  git diff NAMESPACE
  ```
- **Verify no build artifacts are committed**:
  ```bash
  # These should be in .Rbuildignore and not committed:
  # *.tar.gz, docs/ (unless intentional), .Rproj.user/
  ```

## Common Development Tasks

### Adding a New Function
1. Create function in appropriate R/ file
2. Add roxygen2 documentation with `@export` if public
3. Update documentation: `roxygen2::roxygenise()`
4. Test the function: `devtools::load_all(); your_function()`
5. Build and check: `R CMD build . && R CMD check *.tar.gz`

### Modifying Data Sources
- Most functions in this package scrape web data from government sources
- **Always verify URLs are still accessible** when modifying data retrieval functions
- **Test with actual data** - don't just check syntax
- Functions that access external data: `reservatorio_sin()`, `reservatorio_cantareira()`, `reservatorio_nordeste_semiarido()`, `ultima_medicao()`, `ONS_reservatorios()`, `ONS_EAR_subsistemas()`

### Updating Package Metadata
- Modify DESCRIPTION file for version bumps, dependency changes
- Update _pkgdown.yml for website configuration
- **Always rebuild documentation** after metadata changes

## Repository Structure

### Key Directories and Files
```
├── .github/workflows/          # CI/CD pipelines
├── .Rbuildignore              # Files to exclude from package build
├── DESCRIPTION                # Package metadata and dependencies
├── NAMESPACE                  # Exported functions (auto-generated)
├── R/                        # Package source code
│   ├── ONS_*.R               # ONS data retrieval functions
│   ├── reservatorio_*.R      # Reservoir-specific functions
│   ├── tabela_*.R           # Metadata/lookup table functions
│   └── utils-pipe.R         # Pipe operator
├── man/                     # Documentation (auto-generated)
├── docs/                    # pkgdown website (auto-generated)
├── inst/extdata/           # Package data files
└── _pkgdown.yml           # Website configuration
```

### Important Files to Check After Changes
- **Always check NAMESPACE** - should be auto-generated by roxygen2
- **Always check man/*.Rd files** - should reflect your documentation changes
- **Check .Rbuildignore** - ensure build artifacts aren't included in package

## Timing Expectations

- Package build: ~1 second (verified)
- Package check: 30 seconds to 2 minutes depending on dependencies
- Documentation generation: 5-30 seconds
- pkgdown site build: 30 seconds to 5 minutes (requires internet)
- GitHub Actions workflows: 5-15 minutes each
- **Data retrieval functions**: 1-3 seconds per function (requires internet)
- **NEVER CANCEL** any build or check command - they may appear stuck but are processing

## Known Limitations

### Network Dependencies
- CRAN package installation may fail in restricted network environments (documented limitation)
- External data sources work: GitHub (✓), Government websites (varies by site)
- pkgdown site building requires internet access for external resources
- **VERIFIED WORKING**: tabela_reservatorios() successfully downloads 804 reservoir records from GitHub

### Missing Dependencies
- `janitor` package may not be available in all environments
- If missing dependencies prevent package loading, document this in your changes rather than attempting complex workarounds
- **Always test in the actual target environment** before considering the package fully functional

## Development Best Practices

- **Use devtools workflow**: `load_all()` for testing, `check()` for validation
- **Follow R package conventions**: Document all exported functions with roxygen2
- **Test with real data**: This package accesses live government data sources
- **Respect external APIs**: Don't overwhelm external data sources with rapid requests
- **Keep documentation current**: Always run `roxygen2::roxygenise()` after function changes
- **Version appropriately**: Follow semantic versioning in DESCRIPTION file

## Troubleshooting

### Package Won't Load
- Check for missing dependencies in DESCRIPTION
- Verify NAMESPACE is up to date: `roxygen2::roxygenise()`
- Check R syntax errors: `R CMD check package_name.tar.gz`

### Documentation Issues
- Rebuild with: `roxygen2::roxygenise()`
- Check roxygen2 comments in R/ files for syntax errors
- Verify _pkgdown.yml configuration is valid YAML

### CI/CD Failures
- Check GitHub Actions logs for specific error messages
- Common issues: missing system dependencies, network timeouts, R version compatibility
- **Always wait for full completion** - workflows may take 15+ minutes