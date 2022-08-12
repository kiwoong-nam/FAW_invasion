library('ggplot2')

v=read.table('/home/kiwoong/Projects/sfrugi_invasive/TPI/TPI.invasive.eigenvec')
p=read.table('/home/kiwoong/Projects/sfrugi_invasive/TPI/TPI.invasive.eigenval')
sample=read.table("/home/kiwoong/Projects/sfrugi_invasive/samples.txt",sep="\t",header=T)
output='/home/kiwoong/Projects/sfrugi_invasive/TPI/markerN.pdf'

colnames(v)[1]='sample_ID'

vs=merge(v,sample,by='sample_ID')
vs$TPI=NA
vs$TPI[vs$V3>0.15]='sfR'
vs$TPI[vs$V3<0.15]='sfC'

vs$Host.plant=NA
vs$Host.plant[vs$Host.plants=='Corn']='Corn'
vs$Host.plant[vs$Host.plants=='Unknown']='Unknown'
vs$Host.plant[vs$Host.plants=='Rice' | vs$Host.plants=='Grass']='Grass/Rice'

vt=vs[c(1,14,16,19,18,13)]

vi=subset(vt,Pop=='Uganda' | Pop=='Benin' | Pop == 'Malawi' | Pop == 'China' | Pop == 'India')
vn=subset(vt,!(Pop=='Uganda' | Pop=='Benin' | Pop == 'Malawi' | Pop == 'China' | Pop == 'India'))

vi$origin='Invasive population'
vn$origin='Native population'

va=rbind(vi,vn)

colnames(va)[6]='mt'

vg=data.frame()
O=unique(va$origin)
P=sort(unique(va$Host.plant))

for(or in O) 
{
	for(pl in P) 
	{
		vk=subset(va,origin==or & Host.plant==pl)
		tpi.sfC=nrow(subset(vk,TPI=='sfC'))
		tpi.sfR=nrow(subset(vk,TPI=='sfR'))
		mt.sfC=nrow(subset(vk,mt=='sfC'))
		mt.sfR=nrow(subset(vk,mt=='sfR'))
		
		dt1=data.frame(or,pl,'TPI','sfC',tpi.sfC)
		dt2=data.frame(or,pl,'TPI','sfR',tpi.sfR)
		dt3=data.frame(or,pl,'mt','sfC',mt.sfC)
		dt4=data.frame(or,pl,'mt','sfR',mt.sfR)
		colnames(dt1)=c('origin','host.plant','marker','strain','N')
		colnames(dt2)=c('origin','host.plant','marker','strain','N')
		colnames(dt3)=c('origin','host.plant','marker','strain','N')
		colnames(dt4)=c('origin','host.plant','marker','strain','N')
		dt3$marker='mt-COX1'
		dt4$marker='mt-COX1'

		dt=rbind(dt1,dt2,dt3,dt4)
		vg=rbind(vg,dt)
	}
}

#levels(vg$host.plant)=c('Corn','Grass/Rice','Unknown')
#levels(vg$origin)=c('Native population','Invasive population')
#levels(vg$strain)=c('sfR','sfC')
	
p=ggplot(vg,aes(fill=strain,y=N,x=marker))+geom_bar(stat='identity',position='dodge')+facet_grid(origin~host.plant)+theme_bw()+ylab('sample number')+xlab(NULL)+ scale_fill_manual(values=c("blue", "red"))

write.table(va,"/home/kiwoong/Projects/sfrugi_invasive/TPI/markers.txt",quote=F,row.names=F,sep="\t")
write.table(vg,"/home/kiwoong/Projects/sfrugi_invasive/TPI/markers_gr.txt",quote=F,row.names=F,sep="\t")

pdf(output,height=5,width=5)
p
dev.off()

