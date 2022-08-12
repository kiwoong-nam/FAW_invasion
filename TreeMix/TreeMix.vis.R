source('/home/kiwoong/bioinformatics/treemix/src/plotting_funcs.R')

pdf("/home/kiwoong/Projects/sfrugi_invasive/TreeMIX/figure/NE3.pdf",width=12,height=8)
plot_tree("/home/kiwoong/Projects/sfrugi_invasive/TreeMIX/result/Outgrouped.3")
dev.off()

pdf("/home/kiwoong/Projects/sfrugi_invasive/TreeMIX/figure/NE4.pdf",width=10,height=8)
plot_tree("/home/kiwoong/Projects/sfrugi_invasive/TreeMIX/result/Outgrouped.4")
dev.off()

pdf("/home/kiwoong/Projects/sfrugi_invasive/TreeMIX/figure/NE5.pdf",width=10,height=8)
plot_tree("/home/kiwoong/Projects/sfrugi_invasive/TreeMIX/result/Outgrouped.5")
dev.off()

pdf("/home/kiwoong/Projects/sfrugi_invasive/TreeMIX/figure/NE6.pdf",width=7,height=6)
plot_tree("/home/kiwoong/Projects/sfrugi_invasive/TreeMIX/result/Outgrouped.6")
dev.off()



