#!/bin/bash
#SBATCH --mem=100G
#SBATCH -c 4

cd /home/knam/work/sfrugi_Invasive/Tree_outgroup/ref

/home/knam/save/programs/bowtie2-2.3.4.1-linux-x86_64/bowtie2  --very-sensitive-local -p 4 -x sfC.ver7 -U ../vcf/SRR5132437.truncated.gz | /home/knam/save/programs/samtools-1.9/samtools view -b -h -o /home/knam/work/sfrugi_Invasive/Tree_outgroup/bam_gvcf/SRR5132437.raw.bam

cd /home/knam/work/sfrugi_Invasive/Tree_outgroup/bam_gvcf/

/home/knam/save/programs/samtools-1.9/samtools sort -o SRR5132437.sorted.bam SRR5132437.raw.bam

#rm SRR5132437.raw.bam

java -Xmx4g -Djava.io.tmpdir=temp.SRR5132437 -jar /home/knam/save/programs/picard.jar MarkDuplicates INPUT=SRR5132437.sorted.bam OUTPUT=SRR5132437.dupl_rm.bam REMOVE_DUPLICATES=true METRICS_FILE=SRR5132437.metricN.log ASSUME_SORTED=True MAX_FILE_HANDLES_FOR_READ_ENDS_MAP=1000 

#rm -rf temp.SRR5132437
#rm SRR5132437.sorted.bam

java -Xmx4g -Djava.io.tmpdir=temp.SRR5132437 -jar /home/knam/save/programs/picard.jar AddOrReplaceReadGroups INPUT=SRR5132437.dupl_rm.bam OUTPUT=SRR5132437.bam RGID=SRR5132437 RGLB=lib1 RGPL=illumina RGPU=unit1 RGSM=SRR5132437;

#rm -rf temp.SRR5132437
#rm SRR5132437.dupl_rm.bam

/home/knam/save/programs/samtools-1.9/samtools index SRR5132437.bam
/home/knam/save/programs/samtools-1.9/samtools stats SRR5132437.bam > SRR5132437.stats
/home/knam/save/programs/samtools-1.9/samtools index SRR5132437.bam

/home/knam/save/programs/gatk-4.1.2.0/gatk HaplotypeCaller -R /home/knam/work/sfrugi_Invasive/Tree_outgroup/ref/sfC.ver7.fa -I SRR5132437.bam -O SRR5132437.g.vcf.gz -ERC GVCF

/home/knam/save/programs/gatk-4.1.2.0/gatk GenotypeGVCFs -R /home/knam/work/sfrugi_Invasive/Tree_outgroup/ref/sfC.ver7.fa --variant SRR5132437.g.vcf.gz -O ../vcf/SRR5132437.vcf.gz -all-sites

cd ../vcf

/home/knam/save/programs/gatk-4.1.2.0/gatk SelectVariants -select-type SNP -R /home/knam/work/sfrugi_Invasive/Tree_outgroup/ref/sfC.ver7.fa -V SRR5132437.vcf.gz -O SRR5132437.SNP.vcf.gz

/home/knam/save/programs/gatk-4.1.2.0/gatk VariantFiltration -R /home/knam/work/sfrugi_Invasive/Tree_outgroup/ref/sfC.ver7.fa -V SRR5132437.SNP.vcf.gz --filter-expression "QD < 2.0 || FS > 60.0 || MQ < 40.0 || MQRankSum < -12.5 || ReadPosRankSum < -8.0" --filter-name "my_snp_filter" -O SRR5132437.annotated.SNP.vcf.gz

zcat SRR5132437.annotated.SNP.vcf.gz | grep -P '#|PASS' > SRR5132437.filtered.SNP.vcf

/home/knam/save/programs/htslib-1.9/bgzip SRR5132437.filtered.SNP.vcf
/home/knam/save/programs/htslib-1.9/tabix -p vcf SRR5132437.filtered.SNP.vcf.gz





