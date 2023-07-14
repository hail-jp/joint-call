# joint-call
## DL_japan105
* 実行コマンド
```sh
$ chmod +x src/dl_list.sh
$ ./src/dl_list.sh data/igsr-jpt.tsv.tsv
```
* 説明
    * for分でigsr-jpt.tsv.tsvの1列目に記載されている105人分に関して、[GATKフォルダ](https://ddbj.nig.ac.jp/public/public-human-genomes/GRCh38/1000Genomes/GVCF/)以下のデータをダウンロードする
    * igsr-jpt.tsv.tsvは[IGSR: The International Genome Sample Resource](https://www.internationalgenome.org/data-portal/population/JPT)から入手しました。
    * 読み込んだtsvファイルの１列目を見ているだけなので、
    * 1sample 約8GBなので、105sampleだと約840GBになるので、ダウンロード先のデータ容量に気をつけてください。
    * 「data/NAxxxxx」という形でsampleごとにディレクトリが作成され、そこにダウンロードされる。
    * ダウンロードされるファイル
        * PAR.g.vcf.gz.tbi
        * PAR.g.vcf.gz
        * autosome.g.vcf.gz
        * autosome.g.vcf.gz.tbi
        * chrX.g.vcf.gz
        * chrX.g.vcf.gz.tbi