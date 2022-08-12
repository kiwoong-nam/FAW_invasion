library("ggplot2")

output='/home/kiwoong/Projects/sfrugi_invasive/PCA.nuclear.pdf'

v=read.table('/home/kiwoong/Projects/sfrugi_invasive/sudee.old/sfrugi_Invasive/sudeedirectory/Invasive.SNP.PCA.eigenvec')
p=read.table('/home/kiwoong/Projects/sfrugi_invasive/sudee.old/sfrugi_Invasive/sudeedirectory/Invasive.SNP.PCA.eigenval')
sample=read.table("/home/kiwoong/Projects/sfrugi_invasive/samples.txt",sep="\t",header=T)
colnames(v)[1]='sample_ID'

vs=merge(v,sample,by='sample_ID')

p=ggplot(vs,aes(x=V3,y=V4,col=Pop,shape=Host.plants))+geom_point()+xlab(paste("PC1, ",format(p$V1[1]*100/sum(p$V1),digits=4),"%",sep=''))+ylab(paste("PC2, ",format(p$V1[2]*100/sum(p$V1),digits=4),"%",sep=''))+ theme(axis.text.x = element_text(size=8),axis.text.y = element_text(size=8),legend.text = element_text(size = 15))+theme_bw()+theme(legend.title = element_blank())
	
pdf(output,height=5,width=7.2)
p
dev.off()



