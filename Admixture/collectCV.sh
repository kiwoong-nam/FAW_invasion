 #!/bin/bash
 
 cd /home/kiwoong/Projects/sfrugi_invasive/Admixture/result/
 grep CV *log  | head -n 7 | tail -n 6 | sed 's/^.* (//' | sed 's/).* /\t/' | sed 's/K=//' > CV.txt
 
