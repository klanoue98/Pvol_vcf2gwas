#!/bin/bash
#SBATCH -J vcf2gwas
#SBATCH -o vcf2gwas.out
#SBATCH -e vcf2gwas.err
#SBATCH -N 1
#SBATCH -n 20
#SBATCH -t 96:00:00
#SBATCH -p normal
#SBATCH --mail-user=katherine.lanoue@tamucc.edu
#SBATCH --mail-type=begin                    # email me when the job starts
#SBATCH --mail-type=end                      # email me when the job ends

cd /work/marinegenomics/klanoue/lionfish_genome/02_loci_identification/vcf2gwas

conda activate vcf2gwas

vcf2gwas -v TotalRawSNPs.vcf.gz -pf units.csv -p 1 -lm

# -v vcf file containing all SNPs
# -pf phenotype file
# -cf 'PCA' extracts principle components from the VCF file or can specify a covariate file
# -P perform PCA on phenotypes and use resulting PCs as phenotypes for GEMMA analysis
# -lm linear model analysis with default settings
# -lmm Association Tests with Univariate Linear Mixed Models: specify which frequentist test to use (default: 1: performs Wald test)
