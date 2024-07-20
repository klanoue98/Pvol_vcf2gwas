# Pterois volitans vcf2gwas

## Introduction

Utilizing program vcf2gwas (git@github.com:frankvogt/vcf2gwas.git) to perform Genome-Wide Association Study (GWAS) on the final SNPs after filtering loci output from Eric Anderson's mega-non-model-snakemake-wgs-snakeflow (git@github.com:eriqande/mega-non-model-wgs-snakeflow.git). 

Working directory: work/marinegenomics/klanoue/lionfish_genome/vcf2gwas

From vcf2gwas github: "vcf2gwas is a Python-built API for GEMMA, PLINK and bcftools performing GWAS directly from a VCF file as well as multiple post-analysis operations."


## Installation with conda

Create and activate local environment
```{python}
conda create -n vcf2gwas

conda activate vcf2gwas

#Make sure latest conda version is running
conda update -n vcf2gwas -c conda-forge conda
```

Install vcf2gwas package
```{python}
conda install vcf2gwas -c conda-forge -c bioconda -c fvogt257 
```

Test installation and copy example files into current directory
```{python}
vcf2gwas -v test

conda deactivate
```


## Create Input files

VCF file with all SNPs
- ~10 million SNPs going into vcf2gwas
  
```{bash}
#Transform bcf file with all SNPs from Eric's snake flow into a vcf file and put into wd.
bcftools convert -O v -o TotalRawSNPs.vcf.gz all.bcf
```

Phenotype file
- Dscribes the phenotype(s) that are used in GEMMA
- need to be in csv format
- col1. IDs of individuals (10 males; 10 females) that match IDs in VCF file provided
- next column titled phenotype "sex", data is binary, denoting males as "1" and females as "0"

Covariate file (Optional)
- used to provide covariates for the GEMMA analysis when running the linear model or the linear mixed model
- the covariate file has to be formatted in the same way as the phenotype file, with individual IDs in the first column and the covariates in the remaining columns with their respective names as column names.

Gene File (optional)
- provides specific genes to compare results

Relatedness Matrix (optional)
- to perform GWAS, GEMMA needs a relatedness matrix, which vcf2gwas will calculate by default.

**Run script vcf2gwas.sh if using program on a slurm cluster**

## Output
Quality control successful (Duration: 10 hours, 35 minutes, 55.2 seconds)
SNPs successfully filtered (Duration: 4 minutes, 35.3 seconds)
Aftr filtering in pipeline; going into GEMMA
 - number of total SNPs/var        =  7957630
 - number of analyzed SNPs         =  6873119
 
After GEMMA and p-value summarizing
Number of significant SNPs: 1
Level of significance: 7.27e-09
Number of total SNPs: 6873119

Output will be saved in $WORK/Output/Linear_Model/Sex/Sex_20240304_115014/

Variants with the best p_wald score saved in $WORK/Output/Linear_Model/Sex/Sex_20240304_115014/best_p-values

Manhattan plot saved as "p_wald_manh_Sex_mod_sub_units_TotalRawSNPs.png" in $WORK/Output/Linear_Model/Sex/Sex_20240304_115014/manhattan 

QQ-plot saved as "p_wald_qq_Sex_mod_sub_units_TotalRawSNPs.png" in $WORK/Output/Linear_Model/Sex/Sex_20240304_115014/QQ

Top SNPs summarized and saved as "summarized_top_SNPs_complete_units_TotalRawSNPs.csv" in $WORK/Output/Linear_Model/Summary/summary_units_TotalRawSNPs_20240304_115014

Significant SNPs summarized and saved as "summarized_sig_SNPs_complete_units_TotalRawSNPs.csv" in $WORK/Output/Linear_Model/Summary/summary_units_TotalRawSNPs_20240304_115014

Merged (top + significant) SNPs summarized and saved as "summarized_merge_SNPs_complete_units_TotalRawSNPs.csv" in $WORK/Output/Linear_Model/Summary/summary_units_TotalRawSNPs_20240304_115014

Quality control files moved to $WORRK/Output/Linear_Model/QC
