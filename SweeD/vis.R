library('ggplot2')
library(gridExtra)
library(grid)

vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

output1='/home/kiwoong/Projects/sfrugi_invasive/SweeD/Sweed.invasive.pdf'
output2='/home/kiwoong/Projects/sfrugi_invasive/SweeD/Sweed.native.pdf'
output3='/home/kiwoong/Projects/sfrugi_invasive/SweeD/PSsites.txt'

v2=read.table('/home/kiwoong/Projects/sfrugi_invasive/SweeD/result/SweeD_parsed.p2',header=T)
v1=read.table('/home/kiwoong/Projects/sfrugi_invasive/SweeD/result/SweeD_parsed.p1',header=T)

v1$i=c(1:nrow(v1))
v2$i=c(1:nrow(v2))

v1$cate='native hybrid populations'
v2$cate='invasive populations'

v=rbind(v1,v2)

vg.1=aggregate(v$i,by=list(v$chrN),min)
vg.2=aggregate(v$i,by=list(v$chrN),max)
vg=merge(vg.1,vg.2,by="Group.1")
vg$center=with(vg,x.x+x.y)/2
colnames(vg)[1]='chro'

##################################################################
##################################################################
v2.sel=subset(v2,likelihood>100)

#> v2.sel
#      chrN      pos likelihood        alpha     i                 cate
#7740     8  8556673   271.5797 2.442453e-05  7740 invasive populations
#7741     8  8568251   424.7075 1.683120e-05  7741 invasive populations
#7742     8  8579829   422.2157 1.724059e-05  7742 invasive populations
#7743     8  8591407   291.1918 2.255077e-05  7743 invasive populations
#7744     8  8602985   160.6988 3.766353e-05  7744 invasive populations

#13846   14 12286688   231.7101 1.788944e-05 13846 invasive populations
#13847   14 12301228   274.8894 1.519827e-05 13847 invasive populations
#13849   14 12330309   251.6889 1.480212e-05 13849 invasive populations
#13852   14 12373930   128.3220 1.433440e-05 13852 invasive populations
#13855   14 12417552   170.3114 1.170334e-05 13855 invasive populations

#28311   29  6529550   356.7434 1.874210e-05 28311 invasive populations
#28312   29  6550613   630.9610 1.194098e-05 28312 invasive populations
#28313   29  6571676   863.4313 9.656765e-06 28313 invasive populations
#28314   29  6592739   928.3419 9.960451e-06 28314 invasive populations
#28315   29  6613802   235.8856 1.462946e-05 28315 invasive populations
#28316   29  6634864   406.6286 1.329594e-05 28316 invasive populations
#28317   29  6655927   524.6843 1.659435e-05 28317 invasive populations
#28318   29  6676990   381.9284 2.214889e-05 28318 invasive populations
#28319   29  6698053   345.9050 1.204301e-05 28319 invasive populations
#28320   29  6719116   180.3427 2.971865e-05 28320 invasive populations

#28777   29 16344888   109.0495 2.121248e-05 28777 invasive populations

#28900   29 18935631   130.4917 1.122053e-05 28900 invasive populations
#28901   29 18956694   131.4524 1.137248e-05 28901 invasive populations
#28904   29 19019883   127.3109 8.922604e-06 28904 invasive populations

#28911   29 19167324   114.6554 1.419746e-05 28911 invasive populations

#28981   29 20641731   113.7830 1.438180e-04 28981 invasive populations


##################################################################
##################################################################

v1.sel1=subset(v1,i>(7742-50) & i < (7742+50))
v1.sel2=subset(v1,i>(13849-50) & i < (13849+50))
v1.sel3=subset(v1,i>(28315-50) & i < (28315+50))
v1.sel4=subset(v1,i>(28777-50) & i < (28777+50))
#v1.sel5=subset(v1,i>(28901-50) & i < (28901+50))
v1.sel56=subset(v1,i>(28901-50) & i < (28945))
v1.sel7=subset(v1,i>(28946) & i < (28981+50))

p1=ggplot(v1.sel1, aes(x=pos/1e6, y=likelihood)) +  geom_point(size = 1)+geom_text(x = 8579829/1e6, y = 422.2157, label = ".",col='red',size=10)+xlab('position (Mb)')+ylab('composite likelihood')+theme_bw()+ggtitle('chr8')+theme(plot.title = element_text(hjust = 0.5))+ylim(0,430)
#7740     8  8556673   271.5797 2.442453e-05  7740 invasive populations
#7741     8  8568251   424.7075 1.683120e-05  7741 invasive populations
#7742     8  8579829   422.2157 1.724059e-05  7742 invasive populations
#7743     8  8591407   291.1918 2.255077e-05  7743 invasive populations
#7744     8  8602985   160.6988 3.766353e-05  7744 invasive populations

p2=ggplot(v1.sel2, aes(x=pos/1e6, y=likelihood)) +  geom_point(size = 1)+geom_text(x = 12330309/1e6, y = 251.6889, label = ".",col='red',size=10)+xlab('position (Mb)')+ylab('composite likelihood')+theme_bw()+ggtitle('chr14')+theme(plot.title = element_text(hjust = 0.5))+ylim(0,260)
#13846   14 12286688   231.7101 1.788944e-05 13846 invasive populations
#13847   14 12301228   274.8894 1.519827e-05 13847 invasive populations
#13849   14 12330309   251.6889 1.480212e-05 13849 invasive populations
#13852   14 12373930   128.3220 1.433440e-05 13852 invasive populations
#13855   14 12417552   170.3114 1.170334e-05 13855 invasive populations

p3=ggplot(v1.sel3, aes(x=pos/1e6, y=likelihood)) +  geom_point(size = 1)+geom_text(x = 6655927/1e6, y = 524.6843, label = ".",col='red',size=10)+xlab('position (Mb)')+ylab('composite likelihood')+theme_bw()+ggtitle('chr29')+theme(plot.title = element_text(hjust = 0.5))+ylim(0,530)
#28311   29  6529550   356.7434 1.874210e-05 28311 invasive populations
#28312   29  6550613   630.9610 1.194098e-05 28312 invasive populations
#28313   29  6571676   863.4313 9.656765e-06 28313 invasive populations
#28314   29  6592739   928.3419 9.960451e-06 28314 invasive populations
#28315   29  6613802   235.8856 1.462946e-05 28315 invasive populations
#28316   29  6634864   406.6286 1.329594e-05 28316 invasive populations
#28317   29  6655927   524.6843 1.659435e-05 28317 invasive populations
#28318   29  6676990   381.9284 2.214889e-05 28318 invasive populations
#28319   29  6698053   345.9050 1.204301e-05 28319 invasive populations
#28320   29  6719116   180.3427 2.971865e-05 28320 invasive populations

p4=ggplot(v1.sel4, aes(x=pos/1e6, y=likelihood)) +  geom_point(size = 1)+geom_text(x = 16344888/1e6, y = 109.0495, label = ".",col='red',size=10)+xlab('position (Mb)')+ylab('composite likelihood')+theme_bw()+ggtitle('chr29')+theme(plot.title = element_text(hjust = 0.5))
#28777   29 16344888   109.0495 2.121248e-05 28777 invasive populations

p56=ggplot(v1.sel56, aes(x=pos/1e6, y=likelihood)) +  geom_point(size = 1)+geom_text(x = 18956694/1e6, y = 131.4524, label = ".",col='red',size=10)+xlab('position (Mb)')+ylab('composite likelihood')+theme_bw()+ggtitle('chr29')+theme(plot.title = element_text(hjust = 0.5))+geom_text(x = 19167324/1e6, y = 114.6554, label = ".",col='red',size=10)
#28900   29 18935631   130.4917 1.122053e-05 28900 invasive populations
#28901   29 18956694   131.4524 1.137248e-05 28901 invasive populations
#28904   29 19019883   127.3109 8.922604e-06 28904 invasive populations

#28911   29 19167324   114.6554 1.419746e-05 28911 invasive populations

p6=ggplot(v1.sel6, aes(x=pos/1e6, y=likelihood)) +  geom_point(size = 1)+geom_text(x = 19167324/1e6, y = 114.6554, label = ".",col='red',size=10)+xlab('position (Mb)')+ylab('composite likelihood')+theme_bw()+ggtitle('chr29')+theme(plot.title = element_text(hjust = 0.5))

p7=ggplot(v1.sel7, aes(x=pos/1e6, y=likelihood)) +  geom_point(size = 1)+geom_text(x = 20641731/1e6, y = 113.6554, label = ".",col='red',size=10)+xlab('position (Mb)')+ylab('composite likelihood')+theme_bw()+ggtitle('chr29')+theme(plot.title = element_text(hjust = 0.5))+ylim(0,115)
#28981   29 20641731   113.7830 1.438180e-04 28981 invasive populations

### Positively selected loci:: 
# p1,p2,p3,p7

p8=ggplot(v2, aes(x=i, y=likelihood,color=as.factor(chrN))) +  geom_point(size = 0.3)+scale_color_manual(values = rep(c("darkslateblue","cadetblue"), nrow(v)))+ labs(x = NULL, y = 'composite likelihood')+ scale_x_continuous(label = vg$chro,breaks = vg$center)+theme_bw()+theme(legend.position = "none",panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())+geom_text(x = 7742, y = 500, label = "*",col='red',size=6)+geom_text(x = 13849, y = 300, label = "*",col='red',size=6)+geom_text(x = 28315.5, y = 950, label = "*",col='red',size=6)+geom_text(x = 28981, y = 150, label = "*",col='red',size=6)


##################################################################
##################################################################
##################################################################

##################################################################
##################################################################
##################################################################

pdf(output1,width=15,height=4)
p8
dev.off()

pdf(output2,width=15,height=9)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2,3)))
print(p1, vp = vplayout(1,1))
print(p2, vp = vplayout(1,2))
print(p3, vp = vplayout(1,3))
print(p4, vp = vplayout(2,1))
print(p56, vp = vplayout(2,2))
#print(p6, vp = vplayout(2,2))
print(p7, vp = vplayout(2,3))
dev.off()

##################################################

#row(v2)
#[1] 29000
 
nrow(v2.sel)/nrow(v2)*100
#> nrow(v2.sel)/nrow(v2)*100
#[1] 0.08965517
# 0.090%

#> summary(v2$likelihood)
 #   Min.  1st Qu.   Median     Mean  3rd Qu.     Max. 
 # 0.0000   0.0772   0.4350   1.3918   1.2567 928.3419 


