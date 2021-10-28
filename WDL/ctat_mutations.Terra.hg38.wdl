version 1.0







import "https://github.com/NCIP/ctat-mutations/raw/4df77d986be8b916069aae4f47a66f09a20d7891/WDL/ctat_mutations.Terra.wdl" as CTAT_Mutations_Terra







workflow ctat_mutations_Terra_hg19 {





  input {



    String docker



    String sample_id



    File left



    File? right



	String gs_base_url = "gs://ctat_genome_libs/__genome_libs_StarFv1.10/GRCh38_gencode_v22_CTAT_lib_Mar012021.plug-n-play"





    Ctat_mutations_config pipe_inputs_config = {



      "genome_version" : "hg38",



      "gtf" : gs_base_url + "/ref_annot.gtf",



      "ref_bed" : gs_base_url + "/ctat_mutation_lib/refGene.sort.bed.gz",



      "ref_fasta" : gs_base_url + "/ref_genome.fa",



      "ref_fasta_index" : gs_base_url + "/ref_genome.fa.fai",



      "ref_dict" : gs_base_url + "/ref_genome.dict",



      "cravat_lib_tar_gz" : gs_base_url + "/ctat_mutation_lib/cravat.tar.bz2",



      "db_snp_vcf" : gs_base_url + "/ctat_mutation_lib/dbsnp.vcf.gz",



      "db_snp_vcf_index" : gs_base_url + "/ctat_mutation_lib/dbsnp.vcf.gz.tbi",



      "cosmic_vcf" : gs_base_url + "/ctat_mutation_lib/cosmic.vcf.gz",



      "cosmic_vcf_index" : gs_base_url + "/ctat_mutation_lib/cosmic.vcf.gz.csi",



      "gnomad_vcf" : gs_base_url + "/ctat_mutation_lib/gnomad-lite.vcf.gz",



      "gnomad_vcf_index" : gs_base_url + "/ctat_mutation_lib/gnomad-lite.vcf.gz.csi",



      "ref_splice_adj_regions_bed" : gs_base_url + "/ctat_mutation_lib/ref_annot.splice_adj.bed.gz",



      "repeat_mask_bed" : gs_base_url + "/ctat_mutation_lib/repeats_ucsc_gb.bed.gz",



      "rna_editing_vcf" : gs_base_url + "/ctat_mutation_lib/RNAediting.library.vcf.gz",



      "rna_editing_vcf_index" : gs_base_url + "/ctat_mutation_lib/RNAediting.library.vcf.gz.csi",



      "star_reference" : gs_base_url + "/ref_genome.fa.star.idx.tar.bz2"



    }



  }



  



  call CTAT_Mutations_Terra.ctat_mutations_Terra {







    input:



      docker = docker,



      sample_id = sample_id,



      left = left,



      right = right,



      pipe_inputs_config = pipe_inputs_config



  }











  







}


