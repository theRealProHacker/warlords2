; ovl43 stub 3051 file_off 0x64300 size 0xf97

ovl43_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec18           sub sp, 0x18                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  90               nop                                      
  0009  0e               push cs                                  
  000a  e86007           call 0x76d                               
  000d  9a5c007330       lcall 0x3073, 0x5c                       -> ovl47:0bd9
  0012  c41e6444         les bx, ptr [0x4464]                     
  0016  26c687200300     mov byte ptr es:[bx + 0x320], 0          
  001c  b8042c           mov ax, 0x2c04                           
  001f  8ec0             mov es, ax                               
  0021  268b3e8101       mov di, word ptr es:[0x181]              
  0026  e98804           jmp 0x4b1                                
  0029  8bdf             mov bx, di                               
  002b  6bdb16           imul bx, bx, 0x16                        
  002e  b81d1e           mov ax, 0x1e1d                           
  0031  8ec0             mov es, ax                               
  0033  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0038  98               cwde                                     
  0039  ba042c           mov dx, 0x2c04                           
  003c  8ec2             mov es, dx                               
  003e  263b061001       cmp ax, word ptr es:[0x110]              
  0043  7403             je 0x48                                  
  0045  e96904           jmp 0x4b1                                
  0048  8bdf             mov bx, di                               
  004a  6bdb16           imul bx, bx, 0x16                        
  004d  b81d1e           mov ax, 0x1e1d                           
  0050  8ec0             mov es, ax                               
  0052  2683bf8088ff     cmp word ptr es:[bx - 0x7780], -1        
  0058  7537             jne 0x91                                 
  005a  8bdf             mov bx, di                               
  005c  6bdb16           imul bx, bx, 0x16                        
  005f  b81d1e           mov ax, 0x1e1d                           
  0062  8ec0             mov es, ax                               
  0064  2683bf8288ff     cmp word ptr es:[bx - 0x777e], -1        
  006a  7525             jne 0x91                                 
  006c  8bdf             mov bx, di                               
  006e  6bdb16           imul bx, bx, 0x16                        
  0071  b81d1e           mov ax, 0x1e1d                           
  0074  8ec0             mov es, ax                               
  0076  2680bf908865     cmp byte ptr es:[bx - 0x7770], 0x65      
  007c  7513             jne 0x91                                 
  007e  8bdf             mov bx, di                               
  0080  6bdb16           imul bx, bx, 0x16                        
  0083  b81d1e           mov ax, 0x1e1d                           
  0086  8ec0             mov es, ax                               
  0088  26c687908866     mov byte ptr es:[bx - 0x7770], 0x66      
  008e  e92004           jmp 0x4b1                                
  0091  8bdf             mov bx, di                               
  0093  6bdb16           imul bx, bx, 0x16                        
  0096  b81d1e           mov ax, 0x1e1d                           
  0099  8ec0             mov es, ax                               
  009b  2683bf8088fe     cmp word ptr es:[bx - 0x7780], -2        
  00a1  7537             jne 0xda                                 
  00a3  8bdf             mov bx, di                               
  00a5  6bdb16           imul bx, bx, 0x16                        
  00a8  b81d1e           mov ax, 0x1e1d                           
  00ab  8ec0             mov es, ax                               
  00ad  2683bf8288ff     cmp word ptr es:[bx - 0x777e], -1        
  00b3  7525             jne 0xda                                 
  00b5  8bdf             mov bx, di                               
  00b7  6bdb16           imul bx, bx, 0x16                        
  00ba  b81d1e           mov ax, 0x1e1d                           
  00bd  8ec0             mov es, ax                               
  00bf  2680bf908865     cmp byte ptr es:[bx - 0x7770], 0x65      
  00c5  7513             jne 0xda                                 
  00c7  8bdf             mov bx, di                               
  00c9  6bdb16           imul bx, bx, 0x16                        
  00cc  b81d1e           mov ax, 0x1e1d                           
  00cf  8ec0             mov es, ax                               
  00d1  26c687908866     mov byte ptr es:[bx - 0x7770], 0x66      
  00d7  e9d703           jmp 0x4b1                                
  00da  8bdf             mov bx, di                               
  00dc  6bdb16           imul bx, bx, 0x16                        
  00df  b81d1e           mov ax, 0x1e1d                           
  00e2  8ec0             mov es, ax                               
  00e4  2683bf8088ff     cmp word ptr es:[bx - 0x7780], -1        
  00ea  7403             je 0xef                                  
  00ec  e9c601           jmp 0x2b5                                
  00ef  8bdf             mov bx, di                               
  00f1  6bdb16           imul bx, bx, 0x16                        
  00f4  b81d1e           mov ax, 0x1e1d                           
  00f7  8ec0             mov es, ax                               
  00f9  2683bf8288ff     cmp word ptr es:[bx - 0x777e], -1        
  00ff  7403             je 0x104                                 
  0101  e9b101           jmp 0x2b5                                
  0104  8bdf             mov bx, di                               
  0106  6bdb16           imul bx, bx, 0x16                        
  0109  b81d1e           mov ax, 0x1e1d                           
  010c  8ec0             mov es, ax                               
  010e  2680bf908866     cmp byte ptr es:[bx - 0x7770], 0x66      
  0114  7403             je 0x119                                 
  0116  e99c01           jmp 0x2b5                                
  0119  16               push ss                                  
  011a  8d46f8           lea ax, [bp - 8]                         
  011d  50               push ax                                  
  011e  16               push ss                                  
  011f  8d46fa           lea ax, [bp - 6]                         
  0122  50               push ax                                  
  0123  6a00             push 0                                   
  0125  8bdf             mov bx, di                               
  0127  6bdb16           imul bx, bx, 0x16                        
  012a  b81d1e           mov ax, 0x1e1d                           
  012d  8ec0             mov es, ax                               
  012f  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  0134  d1e8             shr ax, 1                                
  0136  257f00           and ax, 0x7f                             
  0139  50               push ax                                  
  013a  90               nop                                      
  013b  0e               push cs                                  
  013c  e8c00a           call 0xbff                               
  013f  83c40c           add sp, 0xc                              
  0142  0bc0             or ax, ax                                
  0144  7426             je 0x16c                                 
  0146  ff76f8           push word ptr [bp - 8]                   
  0149  ff76fa           push word ptr [bp - 6]                   
  014c  8bdf             mov bx, di                               
  014e  6bdb16           imul bx, bx, 0x16                        
  0151  b81d1e           mov ax, 0x1e1d                           
  0154  8ec0             mov es, ax                               
  0156  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  015b  98               cwde                                     
  015c  50               push ax                                  
  015d  90               nop                                      
  015e  0e               push cs                                  
  015f  e8ed0b           call 0xd4f                               
  0162  83c406           add sp, 6                                
  0165  0bc0             or ax, ax                                
  0167  7403             je 0x16c                                 
  0169  e98200           jmp 0x1ee                                
  016c  8bdf             mov bx, di                               
  016e  6bdb16           imul bx, bx, 0x16                        
  0171  b81d1e           mov ax, 0x1e1d                           
  0174  8ec0             mov es, ax                               
  0176  268a878988       mov al, byte ptr es:[bx - 0x7777]        
  017b  98               cwde                                     
  017c  8bdf             mov bx, di                               
  017e  6bdb16           imul bx, bx, 0x16                        
  0181  ba1d1e           mov dx, 0x1e1d                           
  0184  8ec2             mov es, dx                               
  0186  268a978f88       mov dl, byte ptr es:[bx - 0x7771]        
  018b  d1ea             shr dx, 1                                
  018d  83e27f           and dx, 0x7f                             
  0190  3bc2             cmp ax, dx                               
  0192  751d             jne 0x1b1                                
  0194  8bc7             mov ax, di                               
  0196  6bc016           imul ax, ax, 0x16                        
  0199  ba0000           mov dx, 0                                
  019c  03d0             add dx, ax                               
  019e  81c28088         add dx, 0x8880                           
  01a2  681d1e           push 0x1e1d                              
  01a5  52               push dx                                  
  01a6  9abe03620b       lcall 0xb62, 0x3be                       -> 0b62:03be
  01ab  83c404           add sp, 4                                
  01ae  e90003           jmp 0x4b1                                
  01b1  8bdf             mov bx, di                               
  01b3  6bdb16           imul bx, bx, 0x16                        
  01b6  b81d1e           mov ax, 0x1e1d                           
  01b9  8ec0             mov es, ax                               
  01bb  268a878988       mov al, byte ptr es:[bx - 0x7777]        
  01c0  98               cwde                                     
  01c1  257f00           and ax, 0x7f                             
  01c4  8bdf             mov bx, di                               
  01c6  6bdb16           imul bx, bx, 0x16                        
  01c9  ba1d1e           mov dx, 0x1e1d                           
  01cc  8ec2             mov es, dx                               
  01ce  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  01d4  d0e0             shl al, 1                                
  01d6  2608878f88       or byte ptr es:[bx - 0x7771], al         
  01db  8bdf             mov bx, di                               
  01dd  6bdb16           imul bx, bx, 0x16                        
  01e0  b81d1e           mov ax, 0x1e1d                           
  01e3  8ec0             mov es, ax                               
  01e5  26c687908865     mov byte ptr es:[bx - 0x7770], 0x65      
  01eb  e9c302           jmp 0x4b1                                
  01ee  c41e6444         les bx, ptr [0x4464]                     
  01f2  268a872003       mov al, byte ptr es:[bx + 0x320]         
  01f7  98               cwde                                     
  01f8  03d8             add bx, ax                               
  01fa  26c60700         mov byte ptr es:[bx], 0                  
  01fe  8b1e6444         mov bx, word ptr [0x4464]                
  0202  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0207  98               cwde                                     
  0208  c1e002           shl ax, 2                                
  020b  03d8             add bx, ax                               
  020d  8bc7             mov ax, di                               
  020f  6bc016           imul ax, ax, 0x16                        
  0212  ba0000           mov dx, 0                                
  0215  81c28088         add dx, 0x8880                           
  0219  03c2             add ax, dx                               
  021b  26c78792011d1e   mov word ptr es:[bx + 0x192], 0x1e1d     
  0222  2689879001       mov word ptr es:[bx + 0x190], ax         
  0227  8b1e6444         mov bx, word ptr [0x4464]                
  022b  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0230  98               cwde                                     
  0231  03d8             add bx, ax                               
  0233  8bf7             mov si, di                               
  0235  6bf616           imul si, si, 0x16                        
  0238  b81d1e           mov ax, 0x1e1d                           
  023b  06               push es                                  
  023c  8ec0             mov es, ax                               
  023e  268a848488       mov al, byte ptr es:[si - 0x777c]        
  0243  07               pop es                                   
  0244  26884764         mov byte ptr es:[bx + 0x64], al          
  0248  c41e6444         les bx, ptr [0x4464]                     
  024c  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0251  98               cwde                                     
  0252  03d8             add bx, ax                               
  0254  8bf7             mov si, di                               
  0256  6bf616           imul si, si, 0x16                        
  0259  b81d1e           mov ax, 0x1e1d                           
  025c  06               push es                                  
  025d  8ec0             mov es, ax                               
  025f  268a848988       mov al, byte ptr es:[si - 0x7777]        
  0264  07               pop es                                   
  0265  268887c800       mov byte ptr es:[bx + 0xc8], al          
  026a  8bdf             mov bx, di                               
  026c  6bdb16           imul bx, bx, 0x16                        
  026f  b81d1e           mov ax, 0x1e1d                           
  0272  8ec0             mov es, ax                               
  0274  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  0279  d1e8             shr ax, 1                                
  027b  257f00           and ax, 0x7f                             
  027e  c41e6444         les bx, ptr [0x4464]                     
  0282  50               push ax                                  
  0283  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0288  98               cwde                                     
  0289  03d8             add bx, ax                               
  028b  58               pop ax                                   
  028c  2688872c01       mov byte ptr es:[bx + 0x12c], al         
  0291  8bdf             mov bx, di                               
  0293  6bdb16           imul bx, bx, 0x16                        
  0296  b81d1e           mov ax, 0x1e1d                           
  0299  ba0000           mov dx, 0                                
  029c  81c28088         add dx, 0x8880                           
  02a0  03da             add bx, dx                               
  02a2  8b56fa           mov dx, word ptr [bp - 6]                
  02a5  8ec0             mov es, ax                               
  02a7  268917           mov word ptr es:[bx], dx                 
  02aa  8bdf             mov bx, di                               
  02ac  6bdb16           imul bx, bx, 0x16                        
  02af  8b56f8           mov dx, word ptr [bp - 8]                
  02b2  e9b901           jmp 0x46e                                
  02b5  8bdf             mov bx, di                               
  02b7  6bdb16           imul bx, bx, 0x16                        
  02ba  b81d1e           mov ax, 0x1e1d                           
  02bd  8ec0             mov es, ax                               
  02bf  2683bf8088fe     cmp word ptr es:[bx - 0x7780], -2        
  02c5  7403             je 0x2ca                                 
  02c7  e9e701           jmp 0x4b1                                
  02ca  8bdf             mov bx, di                               
  02cc  6bdb16           imul bx, bx, 0x16                        
  02cf  b81d1e           mov ax, 0x1e1d                           
  02d2  8ec0             mov es, ax                               
  02d4  2683bf8288ff     cmp word ptr es:[bx - 0x777e], -1        
  02da  7403             je 0x2df                                 
  02dc  e9d201           jmp 0x4b1                                
  02df  8bdf             mov bx, di                               
  02e1  6bdb16           imul bx, bx, 0x16                        
  02e4  b81d1e           mov ax, 0x1e1d                           
  02e7  8ec0             mov es, ax                               
  02e9  2680bf908866     cmp byte ptr es:[bx - 0x7770], 0x66      
  02ef  7403             je 0x2f4                                 
  02f1  e9bd01           jmp 0x4b1                                
  02f4  16               push ss                                  
  02f5  8d46f0           lea ax, [bp - 0x10]                      
  02f8  50               push ax                                  
  02f9  16               push ss                                  
  02fa  8d46f2           lea ax, [bp - 0xe]                       
  02fd  50               push ax                                  
  02fe  b8042c           mov ax, 0x2c04                           
  0301  8ec0             mov es, ax                               
  0303  26ff361001       push word ptr es:[0x110]                 
  0308  9a57007330       lcall 0x3073, 0x57                       -> ovl47:0b47
  030d  83c40a           add sp, 0xa                              
  0310  8946f4           mov word ptr [bp - 0xc], ax              
  0313  16               push ss                                  
  0314  8d46ea           lea ax, [bp - 0x16]                      
  0317  50               push ax                                  
  0318  ff76f0           push word ptr [bp - 0x10]                
  031b  ff76f2           push word ptr [bp - 0xe]                 
  031e  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  0323  83c408           add sp, 8                                
  0326  837ef400         cmp word ptr [bp - 0xc], 0               
  032a  7429             je 0x355                                 
  032c  837eea08         cmp word ptr [bp - 0x16], 8              
  0330  7d23             jge 0x355                                
  0332  ff76f0           push word ptr [bp - 0x10]                
  0335  ff76f2           push word ptr [bp - 0xe]                 
  0338  8bdf             mov bx, di                               
  033a  6bdb16           imul bx, bx, 0x16                        
  033d  b81d1e           mov ax, 0x1e1d                           
  0340  8ec0             mov es, ax                               
  0342  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0347  98               cwde                                     
  0348  50               push ax                                  
  0349  90               nop                                      
  034a  0e               push cs                                  
  034b  e8010a           call 0xd4f                               
  034e  83c406           add sp, 6                                
  0351  0bc0             or ax, ax                                
  0353  7555             jne 0x3aa                                
  0355  8bdf             mov bx, di                               
  0357  6bdb16           imul bx, bx, 0x16                        
  035a  b81d1e           mov ax, 0x1e1d                           
  035d  ba0000           mov dx, 0                                
  0360  81c28088         add dx, 0x8880                           
  0364  03da             add bx, dx                               
  0366  8ec0             mov es, ax                               
  0368  26c707ffff       mov word ptr es:[bx], 0xffff             
  036d  8bdf             mov bx, di                               
  036f  6bdb16           imul bx, bx, 0x16                        
  0372  b81d1e           mov ax, 0x1e1d                           
  0375  8ec0             mov es, ax                               
  0377  268a878988       mov al, byte ptr es:[bx - 0x7777]        
  037c  98               cwde                                     
  037d  257f00           and ax, 0x7f                             
  0380  8bdf             mov bx, di                               
  0382  6bdb16           imul bx, bx, 0x16                        
  0385  ba1d1e           mov dx, 0x1e1d                           
  0388  8ec2             mov es, dx                               
  038a  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  0390  d0e0             shl al, 1                                
  0392  2608878f88       or byte ptr es:[bx - 0x7771], al         
  0397  8bdf             mov bx, di                               
  0399  6bdb16           imul bx, bx, 0x16                        
  039c  b81d1e           mov ax, 0x1e1d                           
  039f  8ec0             mov es, ax                               
  03a1  26c687908865     mov byte ptr es:[bx - 0x7770], 0x65      
  03a7  e90701           jmp 0x4b1                                
  03aa  c41e6444         les bx, ptr [0x4464]                     
  03ae  268a872003       mov al, byte ptr es:[bx + 0x320]         
  03b3  98               cwde                                     
  03b4  03d8             add bx, ax                               
  03b6  26c60700         mov byte ptr es:[bx], 0                  
  03ba  8b1e6444         mov bx, word ptr [0x4464]                
  03be  268a872003       mov al, byte ptr es:[bx + 0x320]         
  03c3  98               cwde                                     
  03c4  c1e002           shl ax, 2                                
  03c7  03d8             add bx, ax                               
  03c9  8bc7             mov ax, di                               
  03cb  6bc016           imul ax, ax, 0x16                        
  03ce  ba0000           mov dx, 0                                
  03d1  81c28088         add dx, 0x8880                           
  03d5  03c2             add ax, dx                               
  03d7  26c78792011d1e   mov word ptr es:[bx + 0x192], 0x1e1d     
  03de  2689879001       mov word ptr es:[bx + 0x190], ax         
  03e3  8b1e6444         mov bx, word ptr [0x4464]                
  03e7  268a872003       mov al, byte ptr es:[bx + 0x320]         
  03ec  98               cwde                                     
  03ed  03d8             add bx, ax                               
  03ef  8bf7             mov si, di                               
  03f1  6bf616           imul si, si, 0x16                        
  03f4  b81d1e           mov ax, 0x1e1d                           
  03f7  06               push es                                  
  03f8  8ec0             mov es, ax                               
  03fa  268a848488       mov al, byte ptr es:[si - 0x777c]        
  03ff  07               pop es                                   
  0400  26884764         mov byte ptr es:[bx + 0x64], al          
  0404  c41e6444         les bx, ptr [0x4464]                     
  0408  268a872003       mov al, byte ptr es:[bx + 0x320]         
  040d  98               cwde                                     
  040e  03d8             add bx, ax                               
  0410  8bf7             mov si, di                               
  0412  6bf616           imul si, si, 0x16                        
  0415  b81d1e           mov ax, 0x1e1d                           
  0418  06               push es                                  
  0419  8ec0             mov es, ax                               
  041b  268a848988       mov al, byte ptr es:[si - 0x7777]        
  0420  07               pop es                                   
  0421  268887c800       mov byte ptr es:[bx + 0xc8], al          
  0426  8bdf             mov bx, di                               
  0428  6bdb16           imul bx, bx, 0x16                        
  042b  b81d1e           mov ax, 0x1e1d                           
  042e  8ec0             mov es, ax                               
  0430  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  0435  d1e8             shr ax, 1                                
  0437  257f00           and ax, 0x7f                             
  043a  c41e6444         les bx, ptr [0x4464]                     
  043e  50               push ax                                  
  043f  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0444  98               cwde                                     
  0445  03d8             add bx, ax                               
  0447  58               pop ax                                   
  0448  2688872c01       mov byte ptr es:[bx + 0x12c], al         
  044d  8bdf             mov bx, di                               
  044f  6bdb16           imul bx, bx, 0x16                        
  0452  b81d1e           mov ax, 0x1e1d                           
  0455  ba0000           mov dx, 0                                
  0458  81c28088         add dx, 0x8880                           
  045c  03da             add bx, dx                               
  045e  8b56f2           mov dx, word ptr [bp - 0xe]              
  0461  8ec0             mov es, ax                               
  0463  268917           mov word ptr es:[bx], dx                 
  0466  8bdf             mov bx, di                               
  0468  6bdb16           imul bx, bx, 0x16                        
  046b  8b56f0           mov dx, word ptr [bp - 0x10]             
  046e  8ec0             mov es, ax                               
  0470  2689978288       mov word ptr es:[bx - 0x777e], dx        
  0475  8bdf             mov bx, di                               
  0477  6bdb16           imul bx, bx, 0x16                        
  047a  b81d1e           mov ax, 0x1e1d                           
  047d  8ec0             mov es, ax                               
  047f  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  0485  8bdf             mov bx, di                               
  0487  6bdb16           imul bx, bx, 0x16                        
  048a  b81d1e           mov ax, 0x1e1d                           
  048d  8ec0             mov es, ax                               
  048f  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  0495  26808f8e8800     or byte ptr es:[bx - 0x7772], 0          
  049b  8bdf             mov bx, di                               
  049d  6bdb16           imul bx, bx, 0x16                        
  04a0  8ec0             mov es, ax                               
  04a2  26c6879088ff     mov byte ptr es:[bx - 0x7770], 0xff      
  04a8  c41e6444         les bx, ptr [0x4464]                     
  04ac  26fe872003       inc byte ptr es:[bx + 0x320]             
  04b1  8bc7             mov ax, di                               
  04b3  4f               dec di                                   
  04b4  0bc0             or ax, ax                                
  04b6  7403             je 0x4bb                                 
  04b8  e96efb           jmp 0x29                                 
  04bb  c746fc0100       mov word ptr [bp - 4], 1                 
  04c0  c746fe0000       mov word ptr [bp - 2], 0                 
  04c5  e9cb01           jmp 0x693                                
  04c8  8b5efe           mov bx, word ptr [bp - 2]                
  04cb  6bdb41           imul bx, bx, 0x41                        
  04ce  b8042c           mov ax, 0x2c04                           
  04d1  8ec0             mov es, ax                               
  04d3  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  04d8  98               cwde                                     
  04d9  ba042c           mov dx, 0x2c04                           
  04dc  8ec2             mov es, dx                               
  04de  263b061001       cmp ax, word ptr es:[0x110]              
  04e3  7403             je 0x4e8                                 
  04e5  e9a801           jmp 0x690                                
  04e8  8b5efe           mov bx, word ptr [bp - 2]                
  04eb  6bdb41           imul bx, bx, 0x41                        
  04ee  b8042c           mov ax, 0x2c04                           
  04f1  8ec0             mov es, ax                               
  04f3  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  04f9  7f03             jg 0x4fe                                 
  04fb  e99201           jmp 0x690                                
  04fe  8b5efe           mov bx, word ptr [bp - 2]                
  0501  6bdb41           imul bx, bx, 0x41                        
  0504  b8042c           mov ax, 0x2c04                           
  0507  8ec0             mov es, ax                               
  0509  268a87aa15       mov al, byte ptr es:[bx + 0x15aa]        
  050e  2a46fc           sub al, byte ptr [bp - 4]                
  0511  8b5efe           mov bx, word ptr [bp - 2]                
  0514  6bdb41           imul bx, bx, 0x41                        
  0517  ba042c           mov dx, 0x2c04                           
  051a  8ec2             mov es, dx                               
  051c  268887aa15       mov byte ptr es:[bx + 0x15aa], al        
  0521  8b5efe           mov bx, word ptr [bp - 2]                
  0524  6bdb41           imul bx, bx, 0x41                        
  0527  b8042c           mov ax, 0x2c04                           
  052a  8ec0             mov es, ax                               
  052c  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  0532  7e03             jle 0x537                                
  0534  e95901           jmp 0x690                                
  0537  8b5efe           mov bx, word ptr [bp - 2]                
  053a  6bdb41           imul bx, bx, 0x41                        
  053d  8ec0             mov es, ax                               
  053f  26c687aa1500     mov byte ptr es:[bx + 0x15aa], 0         
  0545  b8042c           mov ax, 0x2c04                           
  0548  8ec0             mov es, ax                               
  054a  268b1e1001       mov bx, word ptr es:[0x110]              
  054f  6bdb14           imul bx, bx, 0x14                        
  0552  b8042c           mov ax, 0x2c04                           
  0555  8ec0             mov es, ax                               
  0557  2683bf850100     cmp word ptr es:[bx + 0x185], 0          
  055d  7f03             jg 0x562                                 
  055f  e92e01           jmp 0x690                                
  0562  16               push ss                                  
  0563  8d46f8           lea ax, [bp - 8]                         
  0566  50               push ax                                  
  0567  16               push ss                                  
  0568  8d46fa           lea ax, [bp - 6]                         
  056b  50               push ax                                  
  056c  6a00             push 0                                   
  056e  ff76fe           push word ptr [bp - 2]                   
  0571  90               nop                                      
  0572  0e               push cs                                  
  0573  e88906           call 0xbff                               
  0576  83c40c           add sp, 0xc                              
  0579  0bc0             or ax, ax                                
  057b  7516             jne 0x593                                
  057d  8b5efe           mov bx, word ptr [bp - 2]                
  0580  6bdb41           imul bx, bx, 0x41                        
  0583  b8042c           mov ax, 0x2c04                           
  0586  8ec0             mov es, ax                               
  0588  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  058e  7503             jne 0x593                                
  0590  e9fd00           jmp 0x690                                
  0593  8b5efe           mov bx, word ptr [bp - 2]                
  0596  6bdb41           imul bx, bx, 0x41                        
  0599  b8042c           mov ax, 0x2c04                           
  059c  8ec0             mov es, ax                               
  059e  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  05a4  7452             je 0x5f8                                 
  05a6  8b5efe           mov bx, word ptr [bp - 2]                
  05a9  6bdb41           imul bx, bx, 0x41                        
  05ac  b8042c           mov ax, 0x2c04                           
  05af  8ec0             mov es, ax                               
  05b1  26ffb7b215       push word ptr es:[bx + 0x15b2]           
  05b6  8b5efe           mov bx, word ptr [bp - 2]                
  05b9  6bdb41           imul bx, bx, 0x41                        
  05bc  b8042c           mov ax, 0x2c04                           
  05bf  8ec0             mov es, ax                               
  05c1  26ffb7b015       push word ptr es:[bx + 0x15b0]           
  05c6  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  05cb  83c404           add sp, 4                                
  05ce  8946f6           mov word ptr [bp - 0xa], ax              
  05d1  c41e6444         les bx, ptr [0x4464]                     
  05d5  268a872003       mov al, byte ptr es:[bx + 0x320]         
  05da  98               cwde                                     
  05db  03d8             add bx, ax                               
  05dd  26c60701         mov byte ptr es:[bx], 1                  
  05e1  837ef600         cmp word ptr [bp - 0xa], 0               
  05e5  7d26             jge 0x60d                                
  05e7  b8042c           mov ax, 0x2c04                           
  05ea  8ec0             mov es, ax                               
  05ec  26a11001         mov ax, word ptr es:[0x110]              
  05f0  056400           add ax, 0x64                             
  05f3  8946f6           mov word ptr [bp - 0xa], ax              
  05f6  eb15             jmp 0x60d                                
  05f8  c746f6ffff       mov word ptr [bp - 0xa], 0xffff          
  05fd  c41e6444         les bx, ptr [0x4464]                     
  0601  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0606  98               cwde                                     
  0607  03d8             add bx, ax                               
  0609  26c60702         mov byte ptr es:[bx], 2                  
  060d  ff76f6           push word ptr [bp - 0xa]                 
  0610  ff76f8           push word ptr [bp - 8]                   
  0613  ff76fa           push word ptr [bp - 6]                   
  0616  ff76fe           push word ptr [bp - 2]                   
  0619  90               nop                                      
  061a  0e               push cs                                  
  061b  e8b907           call 0xdd7                               
  061e  83c408           add sp, 8                                
  0621  8956ee           mov word ptr [bp - 0x12], dx             
  0624  8946ec           mov word ptr [bp - 0x14], ax             
  0627  c41e6444         les bx, ptr [0x4464]                     
  062b  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0630  98               cwde                                     
  0631  c1e002           shl ax, 2                                
  0634  03d8             add bx, ax                               
  0636  8b46ee           mov ax, word ptr [bp - 0x12]             
  0639  8b56ec           mov dx, word ptr [bp - 0x14]             
  063c  2689879201       mov word ptr es:[bx + 0x192], ax         
  0641  2689979001       mov word ptr es:[bx + 0x190], dx         
  0646  8b1e6444         mov bx, word ptr [0x4464]                
  064a  268a872003       mov al, byte ptr es:[bx + 0x320]         
  064f  98               cwde                                     
  0650  03d8             add bx, ax                               
  0652  06               push es                                  
  0653  c476ec           les si, ptr [bp - 0x14]                  
  0656  268a4404         mov al, byte ptr es:[si + 4]             
  065a  07               pop es                                   
  065b  26884764         mov byte ptr es:[bx + 0x64], al          
  065f  c41e6444         les bx, ptr [0x4464]                     
  0663  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0668  98               cwde                                     
  0669  03d8             add bx, ax                               
  066b  8a46fe           mov al, byte ptr [bp - 2]                
  066e  268887c800       mov byte ptr es:[bx + 0xc8], al          
  0673  8b1e6444         mov bx, word ptr [0x4464]                
  0677  268a872003       mov al, byte ptr es:[bx + 0x320]         
  067c  98               cwde                                     
  067d  03d8             add bx, ax                               
  067f  8a46f6           mov al, byte ptr [bp - 0xa]              
  0682  2688872c01       mov byte ptr es:[bx + 0x12c], al         
  0687  8b1e6444         mov bx, word ptr [0x4464]                
  068b  26fe872003       inc byte ptr es:[bx + 0x320]             
  0690  ff46fe           inc word ptr [bp - 2]                    
  0693  b8042c           mov ax, 0x2c04                           
  0696  8ec0             mov es, ax                               
  0698  26a17b15         mov ax, word ptr es:[0x157b]             
  069c  3b46fe           cmp ax, word ptr [bp - 2]                
  069f  7e03             jle 0x6a4                                
  06a1  e924fe           jmp 0x4c8                                
  06a4  c41e6444         les bx, ptr [0x4464]                     
  06a8  268a872003       mov al, byte ptr es:[bx + 0x320]         
  06ad  98               cwde                                     
  06ae  8946e8           mov word ptr [bp - 0x18], ax             
  06b1  90               nop                                      
  06b2  0e               push cs                                  
  06b3  e81d01           call 0x7d3                               
  06b6  8b46e8           mov ax, word ptr [bp - 0x18]             
  06b9  5f               pop di                                   
  06ba  5e               pop si                                   
  06bb  c9               leave                                    
  06bc  cb               retf                                     

ovl43_06bd:  ; ENTRY
  06bd  55               push bp                                  
  06be  8bec             mov bp, sp                               
  06c0  83ec02           sub sp, 2                                
  06c3  56               push si                                  
  06c4  90               nop                                      
  06c5  0e               push cs                                  
  06c6  e8a400           call 0x76d                               
  06c9  33f6             xor si, si                               
  06cb  eb7d             jmp 0x74a                                
  06cd  c41e6444         les bx, ptr [0x4464]                     
  06d1  03de             add bx, si                               
  06d3  26803f00         cmp byte ptr es:[bx], 0                  
  06d7  7470             je 0x749                                 
  06d9  c41e6444         les bx, ptr [0x4464]                     
  06dd  03de             add bx, si                               
  06df  268a87c800       mov al, byte ptr es:[bx + 0xc8]          
  06e4  98               cwde                                     
  06e5  6bc041           imul ax, ax, 0x41                        
  06e8  ba042c           mov dx, 0x2c04                           
  06eb  8bd8             mov bx, ax                               
  06ed  8ec2             mov es, dx                               
  06ef  268a87a915       mov al, byte ptr es:[bx + 0x15a9]        
  06f4  98               cwde                                     
  06f5  50               push ax                                  
  06f6  c41e6444         les bx, ptr [0x4464]                     
  06fa  03de             add bx, si                               
  06fc  268a87c800       mov al, byte ptr es:[bx + 0xc8]          
  0701  98               cwde                                     
  0702  50               push ax                                  
  0703  9a52005830       lcall 0x3058, 0x52                       -> ovl44:0000
  0708  83c404           add sp, 4                                
  070b  8946fe           mov word ptr [bp - 2], ax                
  070e  c41e6444         les bx, ptr [0x4464]                     
  0712  03de             add bx, si                               
  0714  268a87c800       mov al, byte ptr es:[bx + 0xc8]          
  0719  98               cwde                                     
  071a  6bc041           imul ax, ax, 0x41                        
  071d  0346fe           add ax, word ptr [bp - 2]                
  0720  ba042c           mov dx, 0x2c04                           
  0723  8bd8             mov bx, ax                               
  0725  8ec2             mov es, dx                               
  0727  268a879715       mov al, byte ptr es:[bx + 0x1597]        
  072c  c41e6444         les bx, ptr [0x4464]                     
  0730  03de             add bx, si                               
  0732  50               push ax                                  
  0733  268a87c800       mov al, byte ptr es:[bx + 0xc8]          
  0738  98               cwde                                     
  0739  6bc041           imul ax, ax, 0x41                        
  073c  ba042c           mov dx, 0x2c04                           
  073f  8bd8             mov bx, ax                               
  0741  8ec2             mov es, dx                               
  0743  58               pop ax                                   
  0744  268887aa15       mov byte ptr es:[bx + 0x15aa], al        
  0749  46               inc si                                   
  074a  c41e6444         les bx, ptr [0x4464]                     
  074e  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0753  98               cwde                                     
  0754  3bc6             cmp ax, si                               
  0756  7e03             jle 0x75b                                
  0758  e972ff           jmp 0x6cd                                
  075b  90               nop                                      
  075c  0e               push cs                                  
  075d  e87300           call 0x7d3                               
  0760  9a2500e830       lcall 0x30e8, 0x25                       -> ovl62:0000
  0765  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  076a  5e               pop si                                   
  076b  c9               leave                                    
  076c  cb               retf                                     

ovl43_076d:  ; ENTRY
  076d  55               push bp                                  
  076e  8bec             mov bp, sp                               
  0770  66833e4c0e00     cmp dword ptr [0xe4c], 0                 
  0776  7545             jne 0x7bd                                
  0778  666856010000     push 0x156                               
  077e  6a00             push 0                                   
  0780  666821030000     push 0x321                               
  0786  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  078b  83c40a           add sp, 0xa                              
  078e  89164e0e         mov word ptr [0xe4e], dx                 
  0792  a34c0e           mov word ptr [0xe4c], ax                 
  0795  52               push dx                                  
  0796  50               push ax                                  
  0797  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  079c  83c404           add sp, 4                                
  079f  89166644         mov word ptr [0x4466], dx                
  07a3  a36444           mov word ptr [0x4464], ax                
  07a6  c41e6444         les bx, ptr [0x4464]                     
  07aa  26c687200300     mov byte ptr es:[bx + 0x320], 0          
  07b0  66ff364c0e       push dword ptr [0xe4c]                   
  07b5  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  07ba  83c404           add sp, 4                                
  07bd  66ff364c0e       push dword ptr [0xe4c]                   
  07c2  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  07c7  83c404           add sp, 4                                
  07ca  89166644         mov word ptr [0x4466], dx                
  07ce  a36444           mov word ptr [0x4464], ax                
  07d1  5d               pop bp                                   
  07d2  cb               retf                                     

ovl43_07d3:  ; ENTRY
  07d3  55               push bp                                  
  07d4  8bec             mov bp, sp                               
  07d6  66ff364c0e       push dword ptr [0xe4c]                   
  07db  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  07e0  83c404           add sp, 4                                
  07e3  5d               pop bp                                   
  07e4  cb               retf                                     

ovl43_07e5:  ; ENTRY
  07e5  55               push bp                                  
  07e6  8bec             mov bp, sp                               
  07e8  83ec02           sub sp, 2                                
  07eb  0e               push cs                                  
  07ec  e87eff           call 0x76d                               
  07ef  c41e6444         les bx, ptr [0x4464]                     
  07f3  268a872003       mov al, byte ptr es:[bx + 0x320]         
  07f8  98               cwde                                     
  07f9  8946fe           mov word ptr [bp - 2], ax                
  07fc  0e               push cs                                  
  07fd  e8d3ff           call 0x7d3                               
  0800  8b46fe           mov ax, word ptr [bp - 2]                
  0803  c9               leave                                    
  0804  cb               retf                                     

ovl43_0805:  ; ENTRY
  0805  55               push bp                                  
  0806  8bec             mov bp, sp                               
  0808  0e               push cs                                  
  0809  e861ff           call 0x76d                               
  080c  c41e6444         les bx, ptr [0x4464]                     
  0810  2680bf200305     cmp byte ptr es:[bx + 0x320], 5          
  0816  7d08             jge 0x820                                
  0818  268a872003       mov al, byte ptr es:[bx + 0x320]         
  081d  98               cwde                                     
  081e  eb03             jmp 0x823                                
  0820  b80500           mov ax, 5                                
  0823  a3520e           mov word ptr [0xe52], ax                 
  0826  c70662440000     mov word ptr [0x4462], 0                 
  082c  c41e6444         les bx, ptr [0x4464]                     
  0830  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0835  98               cwde                                     
  0836  48               dec ax                                   
  0837  3d0400           cmp ax, 4                                
  083a  7d09             jge 0x845                                
  083c  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0841  98               cwde                                     
  0842  48               dec ax                                   
  0843  eb03             jmp 0x848                                
  0845  b80400           mov ax, 4                                
  0848  a36044           mov word ptr [0x4460], ax                
  084b  c706500e0000     mov word ptr [0xe50], 0                  
  0851  0e               push cs                                  
  0852  e87eff           call 0x7d3                               
  0855  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  085a  6a01             push 1                                   
  085c  90               nop                                      
  085d  0e               push cs                                  
  085e  e80d00           call 0x86e                               
  0861  59               pop cx                                   
  0862  9a2f004c30       lcall 0x304c, 0x2f                       -> ovl42:026c
  0867  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  086c  5d               pop bp                                   
  086d  cb               retf                                     

ovl43_086e:  ; ENTRY
  086e  55               push bp                                  
  086f  8bec             mov bp, sp                               
  0871  83ec54           sub sp, 0x54                             
  0874  56               push si                                  
  0875  57               push di                                  
  0876  837e0600         cmp word ptr [bp + 6], 0                 
  087a  7414             je 0x890                                 
  087c  666830003400     push 0x340030                            
  0882  666800006e00     push 0x6e0000                            
  0888  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  088d  83c408           add sp, 8                                
  0890  6a03             push 3                                   
  0892  b8042c           mov ax, 0x2c04                           
  0895  8ec0             mov es, ax                               
  0897  268b1e1001       mov bx, word ptr es:[0x110]              
  089c  d1e3             shl bx, 1                                
  089e  b8042c           mov ax, 0x2c04                           
  08a1  8ec0             mov es, ax                               
  08a3  26ffb7b000       push word ptr es:[bx + 0xb0]             
  08a8  b8042c           mov ax, 0x2c04                           
  08ab  8ec0             mov es, ax                               
  08ad  268b1e1001       mov bx, word ptr es:[0x110]              
  08b2  d1e3             shl bx, 1                                
  08b4  b8042c           mov ax, 0x2c04                           
  08b7  8ec0             mov es, ax                               
  08b9  26ffb7a000       push word ptr es:[bx + 0xa0]             
  08be  6a02             push 2                                   
  08c0  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  08c5  83c408           add sp, 8                                
  08c8  0e               push cs                                  
  08c9  e8a1fe           call 0x76d                               
  08cc  33f6             xor si, si                               
  08ce  e95101           jmp 0xa22                                
  08d1  8b3e6244         mov di, word ptr [0x4462]                
  08d5  03fe             add di, si                               
  08d7  666800000300     push 0x30000                             
  08dd  666802000f00     push 0xf0002                             
  08e3  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  08e8  83c408           add sp, 8                                
  08eb  8bc7             mov ax, di                               
  08ed  40               inc ax                                   
  08ee  50               push ax                                  
  08ef  1e               push ds                                  
  08f0  68640e           push 0xe64                               
  08f3  16               push ss                                  
  08f4  8d46ac           lea ax, [bp - 0x54]                      
  08f7  50               push ax                                  
  08f8  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  08fd  83c40a           add sp, 0xa                              
  0900  16               push ss                                  
  0901  8d46ac           lea ax, [bp - 0x54]                      
  0904  50               push ax                                  
  0905  8bc6             mov ax, si                               
  0907  6bc01e           imul ax, ax, 0x1e                        
  090a  05b000           add ax, 0xb0                             
  090d  50               push ax                                  
  090e  683801           push 0x138                               
  0911  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0916  83c408           add sp, 8                                
  0919  666a00           push 0                                   
  091c  666800000100     push 0x10000                             
  0922  666a00           push 0                                   
  0925  6a00             push 0                                   
  0927  8bc6             mov ax, si                               
  0929  6bc01e           imul ax, ax, 0x1e                        
  092c  05aa00           add ax, 0xaa                             
  092f  50               push ax                                  
  0930  684801           push 0x148                               
  0933  1e               push ds                                  
  0934  682a34           push 0x342a                              
  0937  b8042c           mov ax, 0x2c04                           
  093a  8ec0             mov es, ax                               
  093c  26ff361001       push word ptr es:[0x110]                 
  0941  c41e6444         les bx, ptr [0x4464]                     
  0945  03df             add bx, di                               
  0947  268a4764         mov al, byte ptr es:[bx + 0x64]          
  094b  98               cwde                                     
  094c  50               push ax                                  
  094d  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0952  83c41a           add sp, 0x1a                             
  0955  c41e6444         les bx, ptr [0x4464]                     
  0959  03df             add bx, di                               
  095b  26803f00         cmp byte ptr es:[bx], 0                  
  095f  7558             jne 0x9b9                                
  0961  8b1e6444         mov bx, word ptr [0x4464]                
  0965  03df             add bx, di                               
  0967  268a872c01       mov al, byte ptr es:[bx + 0x12c]         
  096c  98               cwde                                     
  096d  8bd0             mov dx, ax                               
  096f  83fa64           cmp dx, 0x64                             
  0972  7c33             jl 0x9a7                                 
  0974  16               push ss                                  
  0975  8d46fc           lea ax, [bp - 4]                         
  0978  50               push ax                                  
  0979  16               push ss                                  
  097a  8d46fe           lea ax, [bp - 2]                         
  097d  50               push ax                                  
  097e  b8042c           mov ax, 0x2c04                           
  0981  8ec0             mov es, ax                               
  0983  26ff361001       push word ptr es:[0x110]                 
  0988  9a57007330       lcall 0x3073, 0x57                       -> ovl47:0b47
  098d  83c40a           add sp, 0xa                              
  0990  1e               push ds                                  
  0991  686e0e           push 0xe6e                                ; "Standard"
  0994  1e               push ds                                  
  0995  68670e           push 0xe67                                ; "... %s"
  0998  16               push ss                                  
  0999  8d46ac           lea ax, [bp - 0x54]                      
  099c  50               push ax                                  
  099d  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  09a2  83c40c           add sp, 0xc                              
  09a5  eb61             jmp 0xa08                                
  09a7  8bc2             mov ax, dx                               
  09a9  6bc041           imul ax, ax, 0x41                        
  09ac  058115           add ax, 0x1581                           
  09af  68042c           push 0x2c04                              
  09b2  50               push ax                                  
  09b3  1e               push ds                                  
  09b4  68770e           push 0xe77                                ; "... %s"
  09b7  ebdf             jmp 0x998                                
  09b9  c41e6444         les bx, ptr [0x4464]                     
  09bd  03df             add bx, di                               
  09bf  26803f01         cmp byte ptr es:[bx], 1                  
  09c3  751e             jne 0x9e3                                
  09c5  8b1e6444         mov bx, word ptr [0x4464]                
  09c9  03df             add bx, di                               
  09cb  268a87c800       mov al, byte ptr es:[bx + 0xc8]          
  09d0  98               cwde                                     
  09d1  8bd0             mov dx, ax                               
  09d3  6bc041           imul ax, ax, 0x41                        
  09d6  058115           add ax, 0x1581                           
  09d9  68042c           push 0x2c04                              
  09dc  50               push ax                                  
  09dd  1e               push ds                                  
  09de  687e0e           push 0xe7e                                ; "%s ..."
  09e1  ebb5             jmp 0x998                                
  09e3  c41e6444         les bx, ptr [0x4464]                     
  09e7  03df             add bx, di                               
  09e9  268a87c800       mov al, byte ptr es:[bx + 0xc8]          
  09ee  98               cwde                                     
  09ef  8bd0             mov dx, ax                               
  09f1  6bc041           imul ax, ax, 0x41                        
  09f4  058115           add ax, 0x1581                           
  09f7  68042c           push 0x2c04                              
  09fa  50               push ax                                  
  09fb  16               push ss                                  
  09fc  8d46ac           lea ax, [bp - 0x54]                      
  09ff  50               push ax                                  
  0a00  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0a05  83c408           add sp, 8                                
  0a08  16               push ss                                  
  0a09  8d46ac           lea ax, [bp - 0x54]                      
  0a0c  50               push ax                                  
  0a0d  8bc6             mov ax, si                               
  0a0f  6bc01e           imul ax, ax, 0x1e                        
  0a12  05b000           add ax, 0xb0                             
  0a15  50               push ax                                  
  0a16  687001           push 0x170                               
  0a19  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0a1e  83c408           add sp, 8                                
  0a21  46               inc si                                   
  0a22  3b36520e         cmp si, word ptr [0xe52]                 
  0a26  7d03             jge 0xa2b                                
  0a28  e9a6fe           jmp 0x8d1                                
  0a2b  0e               push cs                                  
  0a2c  e8a4fd           call 0x7d3                               
  0a2f  5f               pop di                                   
  0a30  5e               pop si                                   
  0a31  c9               leave                                    
  0a32  cb               retf                                     

ovl43_0a33:  ; ENTRY
  0a33  55               push bp                                  
  0a34  8bec             mov bp, sp                               
  0a36  83ec02           sub sp, 2                                
  0a39  0e               push cs                                  
  0a3a  e830fd           call 0x76d                               
  0a3d  c41e6444         les bx, ptr [0x4464]                     
  0a41  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0a46  98               cwde                                     
  0a47  8946fe           mov word ptr [bp - 2], ax                
  0a4a  0e               push cs                                  
  0a4b  e885fd           call 0x7d3                               
  0a4e  8b46fe           mov ax, word ptr [bp - 2]                
  0a51  48               dec ax                                   
  0a52  3b066044         cmp ax, word ptr [0x4460]                
  0a56  7e12             jle 0xa6a                                
  0a58  6668cf000100     push 0x100cf                             
  0a5e  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  0a63  83c404           add sp, 4                                
  0a66  6a01             push 1                                   
  0a68  eb10             jmp 0xa7a                                
  0a6a  6668cf000200     push 0x200cf                             
  0a70  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  0a75  83c404           add sp, 4                                
  0a78  6a02             push 2                                   
  0a7a  68d100           push 0xd1                                
  0a7d  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  0a82  83c404           add sp, 4                                
  0a85  833e624400       cmp word ptr [0x4462], 0                 
  0a8a  7e1d             jle 0xaa9                                
  0a8c  6668ce000100     push 0x100ce                              ; "%s's Quest"
  0a92  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  0a97  83c404           add sp, 4                                
  0a9a  6a01             push 1                                   
  0a9c  68d000           push 0xd0                                
  0a9f  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  0aa4  83c404           add sp, 4                                
  0aa7  eb12             jmp 0xabb                                
  0aa9  6668ce000200     push 0x200ce                              ; "%s's Quest"
  0aaf  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  0ab4  83c404           add sp, 4                                
  0ab7  6a02             push 2                                   
  0ab9  ebe1             jmp 0xa9c                                
  0abb  c9               leave                                    
  0abc  cb               retf                                     

ovl43_0abd:  ; ENTRY
  0abd  55               push bp                                  
  0abe  8bec             mov bp, sp                               
  0ac0  ff0e6244         dec word ptr [0x4462]                    
  0ac4  ff0e6044         dec word ptr [0x4460]                    
  0ac8  a1500e           mov ax, word ptr [0xe50]                 
  0acb  40               inc ax                                   
  0acc  3d0400           cmp ax, 4                                
  0acf  7d06             jge 0xad7                                
  0ad1  a1500e           mov ax, word ptr [0xe50]                 
  0ad4  40               inc ax                                   
  0ad5  eb03             jmp 0xada                                
  0ad7  b80400           mov ax, 4                                
  0ada  a3500e           mov word ptr [0xe50], ax                 
  0add  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0ae2  6a01             push 1                                   
  0ae4  0e               push cs                                  
  0ae5  e886fd           call 0x86e                               
  0ae8  59               pop cx                                   
  0ae9  9a2f004c30       lcall 0x304c, 0x2f                       -> ovl42:026c
  0aee  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0af3  5d               pop bp                                   
  0af4  cb               retf                                     

ovl43_0af5:  ; ENTRY
  0af5  55               push bp                                  
  0af6  8bec             mov bp, sp                               
  0af8  ff066244         inc word ptr [0x4462]                    
  0afc  ff066044         inc word ptr [0x4460]                    
  0b00  a1500e           mov ax, word ptr [0xe50]                 
  0b03  48               dec ax                                   
  0b04  7e06             jle 0xb0c                                
  0b06  a1500e           mov ax, word ptr [0xe50]                 
  0b09  48               dec ax                                   
  0b0a  eb02             jmp 0xb0e                                
  0b0c  33c0             xor ax, ax                               
  0b0e  a3500e           mov word ptr [0xe50], ax                 
  0b11  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0b16  6a01             push 1                                   
  0b18  0e               push cs                                  
  0b19  e852fd           call 0x86e                               
  0b1c  59               pop cx                                   
  0b1d  9a2f004c30       lcall 0x304c, 0x2f                       -> ovl42:026c
  0b22  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0b27  5d               pop bp                                   
  0b28  cb               retf                                     

ovl43_0b29:  ; ENTRY
  0b29  55               push bp                                  
  0b2a  8bec             mov bp, sp                               
  0b2c  56               push si                                  
  0b2d  0e               push cs                                  
  0b2e  e83cfc           call 0x76d                               
  0b31  c41e6444         les bx, ptr [0x4464]                     
  0b35  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0b3a  98               cwde                                     
  0b3b  8bf0             mov si, ax                               
  0b3d  0e               push cs                                  
  0b3e  e892fc           call 0x7d3                               
  0b41  832e624405       sub word ptr [0x4462], 5                 
  0b46  832e604405       sub word ptr [0x4460], 5                 
  0b4b  eb08             jmp 0xb55                                
  0b4d  ff066244         inc word ptr [0x4462]                    
  0b51  ff066044         inc word ptr [0x4460]                    
  0b55  833e624400       cmp word ptr [0x4462], 0                 
  0b5a  7cf1             jl 0xb4d                                 
  0b5c  8bc6             mov ax, si                               
  0b5e  48               dec ax                                   
  0b5f  3b066044         cmp ax, word ptr [0x4460]                
  0b63  7e05             jle 0xb6a                                
  0b65  a16044           mov ax, word ptr [0x4460]                
  0b68  eb03             jmp 0xb6d                                
  0b6a  8bc6             mov ax, si                               
  0b6c  48               dec ax                                   
  0b6d  a36044           mov word ptr [0x4460], ax                
  0b70  2b066244         sub ax, word ptr [0x4462]                
  0b74  40               inc ax                                   
  0b75  a3520e           mov word ptr [0xe52], ax                 
  0b78  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0b7d  6a01             push 1                                   
  0b7f  0e               push cs                                  
  0b80  e8ebfc           call 0x86e                               
  0b83  59               pop cx                                   
  0b84  9a2f004c30       lcall 0x304c, 0x2f                       -> ovl42:026c
  0b89  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0b8e  5e               pop si                                   
  0b8f  5d               pop bp                                   
  0b90  cb               retf                                     

ovl43_0b91:  ; ENTRY
  0b91  55               push bp                                  
  0b92  8bec             mov bp, sp                               
  0b94  56               push si                                  
  0b95  0e               push cs                                  
  0b96  e8d4fb           call 0x76d                               
  0b99  c41e6444         les bx, ptr [0x4464]                     
  0b9d  268a872003       mov al, byte ptr es:[bx + 0x320]         
  0ba2  98               cwde                                     
  0ba3  8bf0             mov si, ax                               
  0ba5  0e               push cs                                  
  0ba6  e82afc           call 0x7d3                               
  0ba9  8306624405       add word ptr [0x4462], 5                 
  0bae  8306604405       add word ptr [0x4460], 5                 
  0bb3  eb08             jmp 0xbbd                                
  0bb5  ff0e6244         dec word ptr [0x4462]                    
  0bb9  ff0e6044         dec word ptr [0x4460]                    
  0bbd  39366044         cmp word ptr [0x4460], si                
  0bc1  7c07             jl 0xbca                                 
  0bc3  833e624400       cmp word ptr [0x4462], 0                 
  0bc8  7feb             jg 0xbb5                                 
  0bca  8bc6             mov ax, si                               
  0bcc  48               dec ax                                   
  0bcd  3b066044         cmp ax, word ptr [0x4460]                
  0bd1  7e05             jle 0xbd8                                
  0bd3  a16044           mov ax, word ptr [0x4460]                
  0bd6  eb03             jmp 0xbdb                                
  0bd8  8bc6             mov ax, si                               
  0bda  48               dec ax                                   
  0bdb  a36044           mov word ptr [0x4460], ax                
  0bde  2b066244         sub ax, word ptr [0x4462]                
  0be2  40               inc ax                                   
  0be3  a3520e           mov word ptr [0xe52], ax                 
  0be6  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0beb  6a01             push 1                                   
  0bed  0e               push cs                                  
  0bee  e87dfc           call 0x86e                               
  0bf1  59               pop cx                                   
  0bf2  9a2f004c30       lcall 0x304c, 0x2f                       -> ovl42:026c
  0bf7  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0bfc  5e               pop si                                   
  0bfd  5d               pop bp                                   
  0bfe  cb               retf                                     

ovl43_0bff:  ; ENTRY
  0bff  55               push bp                                  
  0c00  8bec             mov bp, sp                               
  0c02  83ec0c           sub sp, 0xc                              
  0c05  56               push si                                  
  0c06  57               push di                                  
  0c07  8b7e06           mov di, word ptr [bp + 6]                
  0c0a  c746f40000       mov word ptr [bp - 0xc], 0               
  0c0f  33f6             xor si, si                               
  0c11  e99300           jmp 0xca7                                
  0c14  8bc6             mov ax, si                               
  0c16  d1e0             shl ax, 1                                
  0c18  8d56f8           lea dx, [bp - 8]                         
  0c1b  03c2             add ax, dx                               
  0c1d  16               push ss                                  
  0c1e  50               push ax                                  
  0c1f  8bdf             mov bx, di                               
  0c21  6bdb41           imul bx, bx, 0x41                        
  0c24  b8042c           mov ax, 0x2c04                           
  0c27  8ec0             mov es, ax                               
  0c29  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0c2e  8bde             mov bx, si                               
  0c30  d1e3             shl bx, 1                                
  0c32  03875c0e         add ax, word ptr [bx + 0xe5c]            
  0c36  50               push ax                                  
  0c37  8bdf             mov bx, di                               
  0c39  6bdb41           imul bx, bx, 0x41                        
  0c3c  b8042c           mov ax, 0x2c04                           
  0c3f  8ec0             mov es, ax                               
  0c41  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0c46  8bde             mov bx, si                               
  0c48  d1e3             shl bx, 1                                
  0c4a  0387540e         add ax, word ptr [bx + 0xe54]            
  0c4e  50               push ax                                  
  0c4f  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  0c54  83c408           add sp, 8                                
  0c57  8bde             mov bx, si                               
  0c59  d1e3             shl bx, 1                                
  0c5b  8d46f8           lea ax, [bp - 8]                         
  0c5e  03d8             add bx, ax                               
  0c60  36833f08         cmp word ptr ss:[bx], 8                  
  0c64  7d40             jge 0xca6                                
  0c66  8bdf             mov bx, di                               
  0c68  6bdb41           imul bx, bx, 0x41                        
  0c6b  b8042c           mov ax, 0x2c04                           
  0c6e  8ec0             mov es, ax                               
  0c70  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0c75  8bde             mov bx, si                               
  0c77  d1e3             shl bx, 1                                
  0c79  0387540e         add ax, word ptr [bx + 0xe54]            
  0c7d  c45e0a           les bx, ptr [bp + 0xa]                   
  0c80  268907           mov word ptr es:[bx], ax                 
  0c83  8bdf             mov bx, di                               
  0c85  6bdb41           imul bx, bx, 0x41                        
  0c88  b8042c           mov ax, 0x2c04                           
  0c8b  8ec0             mov es, ax                               
  0c8d  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0c92  8bde             mov bx, si                               
  0c94  d1e3             shl bx, 1                                
  0c96  03875c0e         add ax, word ptr [bx + 0xe5c]            
  0c9a  c45e0e           les bx, ptr [bp + 0xe]                   
  0c9d  268907           mov word ptr es:[bx], ax                 
  0ca0  b80100           mov ax, 1                                
  0ca3  e9a500           jmp 0xd4b                                
  0ca6  46               inc si                                   
  0ca7  83fe04           cmp si, 4                                
  0caa  7d03             jge 0xcaf                                
  0cac  e965ff           jmp 0xc14                                
  0caf  837e0800         cmp word ptr [bp + 8], 0                 
  0cb3  7503             jne 0xcb8                                
  0cb5  e99000           jmp 0xd48                                
  0cb8  c746f60000       mov word ptr [bp - 0xa], 0               
  0cbd  eb7a             jmp 0xd39                                
  0cbf  66680300feff     push 0xfffe0003                          
  0cc5  6a01             push 1                                   
  0cc7  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0ccc  83c406           add sp, 6                                
  0ccf  8bdf             mov bx, di                               
  0cd1  6bdb41           imul bx, bx, 0x41                        
  0cd4  ba042c           mov dx, 0x2c04                           
  0cd7  8ec2             mov es, dx                               
  0cd9  268b977d15       mov dx, word ptr es:[bx + 0x157d]        
  0cde  03d0             add dx, ax                               
  0ce0  c45e0a           les bx, ptr [bp + 0xa]                   
  0ce3  268917           mov word ptr es:[bx], dx                 
  0ce6  66680300feff     push 0xfffe0003                          
  0cec  6a01             push 1                                   
  0cee  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0cf3  83c406           add sp, 6                                
  0cf6  8bdf             mov bx, di                               
  0cf8  6bdb41           imul bx, bx, 0x41                        
  0cfb  ba042c           mov dx, 0x2c04                           
  0cfe  8ec2             mov es, dx                               
  0d00  268b977f15       mov dx, word ptr es:[bx + 0x157f]        
  0d05  03d0             add dx, ax                               
  0d07  c45e0e           les bx, ptr [bp + 0xe]                   
  0d0a  268917           mov word ptr es:[bx], dx                 
  0d0d  268b1f           mov bx, word ptr es:[bx]                 
  0d10  69dbe000         imul bx, bx, 0xe0                        
  0d14  c4760a           les si, ptr [bp + 0xa]                   
  0d17  268b04           mov ax, word ptr es:[si]                 
  0d1a  d1e0             shl ax, 1                                
  0d1c  03d8             add bx, ax                               
  0d1e  b81d1e           mov ax, 0x1e1d                           
  0d21  8ec0             mov es, ax                               
  0d23  268a870100       mov al, byte ptr es:[bx + 1]             
  0d28  c1e804           shr ax, 4                                
  0d2b  250100           and ax, 1                                
  0d2e  f7d8             neg ax                                   
  0d30  1bc0             sbb ax, ax                               
  0d32  40               inc ax                                   
  0d33  8946f4           mov word ptr [bp - 0xc], ax              
  0d36  ff46f6           inc word ptr [bp - 0xa]                  
  0d39  837ef400         cmp word ptr [bp - 0xc], 0               
  0d3d  7509             jne 0xd48                                
  0d3f  837ef614         cmp word ptr [bp - 0xa], 0x14            
  0d43  7d03             jge 0xd48                                
  0d45  e977ff           jmp 0xcbf                                
  0d48  8b46f4           mov ax, word ptr [bp - 0xc]              
  0d4b  5f               pop di                                   
  0d4c  5e               pop si                                   
  0d4d  c9               leave                                    
  0d4e  cb               retf                                     

ovl43_0d4f:  ; ENTRY
  0d4f  55               push bp                                  
  0d50  8bec             mov bp, sp                               
  0d52  56               push si                                  
  0d53  57               push di                                  
  0d54  8b7608           mov si, word ptr [bp + 8]                
  0d57  8b7e0a           mov di, word ptr [bp + 0xa]              
  0d5a  57               push di                                  
  0d5b  56               push si                                  
  0d5c  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0d61  83c404           add sp, 4                                
  0d64  8bd0             mov dx, ax                               
  0d66  0bd2             or dx, dx                                
  0d68  7c20             jl 0xd8a                                 
  0d6a  8bda             mov bx, dx                               
  0d6c  6bdb41           imul bx, bx, 0x41                        
  0d6f  b8042c           mov ax, 0x2c04                           
  0d72  8ec0             mov es, ax                               
  0d74  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0d79  98               cwde                                     
  0d7a  ba042c           mov dx, 0x2c04                           
  0d7d  8ec2             mov es, dx                               
  0d7f  263b061001       cmp ax, word ptr es:[0x110]              
  0d84  7404             je 0xd8a                                 
  0d86  33c0             xor ax, ax                               
  0d88  eb49             jmp 0xdd3                                
  0d8a  8b5e06           mov bx, word ptr [bp + 6]                
  0d8d  6bdb06           imul bx, bx, 6                           
  0d90  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0d95  7405             je 0xd9c                                 
  0d97  b80100           mov ax, 1                                
  0d9a  eb37             jmp 0xdd3                                
  0d9c  8bdf             mov bx, di                               
  0d9e  69dbe000         imul bx, bx, 0xe0                        
  0da2  8bc6             mov ax, si                               
  0da4  d1e0             shl ax, 1                                
  0da6  03d8             add bx, ax                               
  0da8  b81d1e           mov ax, 0x1e1d                           
  0dab  8ec0             mov es, ax                               
  0dad  268a9f0000       mov bl, byte ptr es:[bx]                 
  0db2  81e3ff00         and bx, 0xff                             
  0db6  b8042c           mov ax, 0x2c04                           
  0db9  8ec0             mov es, ax                               
  0dbb  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0dc0  98               cwde                                     
  0dc1  d1e0             shl ax, 1                                
  0dc3  8bd8             mov bx, ax                               
  0dc5  83bf741200       cmp word ptr [bx + 0x1274], 0            
  0dca  7e05             jle 0xdd1                                
  0dcc  b80100           mov ax, 1                                
  0dcf  eb02             jmp 0xdd3                                
  0dd1  33c0             xor ax, ax                               
  0dd3  5f               pop di                                   
  0dd4  5e               pop si                                   
  0dd5  5d               pop bp                                   
  0dd6  cb               retf                                     

ovl43_0dd7:  ; ENTRY
  0dd7  55               push bp                                  
  0dd8  8bec             mov bp, sp                               
  0dda  83ec06           sub sp, 6                                
  0ddd  56               push si                                  
  0dde  57               push di                                  
  0ddf  8b7e0c           mov di, word ptr [bp + 0xc]              
  0de2  8b5e06           mov bx, word ptr [bp + 6]                
  0de5  6bdb41           imul bx, bx, 0x41                        
  0de8  b8042c           mov ax, 0x2c04                           
  0deb  8ec0             mov es, ax                               
  0ded  268a87a915       mov al, byte ptr es:[bx + 0x15a9]        
  0df2  98               cwde                                     
  0df3  8946fe           mov word ptr [bp - 2], ax                
  0df6  50               push ax                                  
  0df7  ff7606           push word ptr [bp + 6]                   
  0dfa  9a52005830       lcall 0x3058, 0x52                       -> ovl44:0000
  0dff  83c404           add sp, 4                                
  0e02  8bf0             mov si, ax                               
  0e04  9a0903620b       lcall 0xb62, 0x309                       -> 0b62:0309
  0e09  8956fc           mov word ptr [bp - 4], dx                
  0e0c  8946fa           mov word ptr [bp - 6], ax                
  0e0f  0bc2             or ax, dx                                
  0e11  7503             jne 0xe16                                
  0e13  e97701           jmp 0xf8d                                
  0e16  83ffff           cmp di, -1                               
  0e19  7510             jne 0xe2b                                
  0e1b  c45efa           les bx, ptr [bp - 6]                     
  0e1e  8b4608           mov ax, word ptr [bp + 8]                
  0e21  268907           mov word ptr es:[bx], ax                 
  0e24  8b460a           mov ax, word ptr [bp + 0xa]              
  0e27  26894702         mov word ptr es:[bx + 2], ax             
  0e2b  c45efa           les bx, ptr [bp - 6]                     
  0e2e  8a46fe           mov al, byte ptr [bp - 2]                
  0e31  26884704         mov byte ptr es:[bx + 4], al             
  0e35  8b5e06           mov bx, word ptr [bp + 6]                
  0e38  6bdb41           imul bx, bx, 0x41                        
  0e3b  b8042c           mov ax, 0x2c04                           
  0e3e  8ec0             mov es, ax                               
  0e40  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0e45  c45efa           les bx, ptr [bp - 6]                     
  0e48  26884705         mov byte ptr es:[bx + 5], al             
  0e4c  8b5e06           mov bx, word ptr [bp + 6]                
  0e4f  6bdb41           imul bx, bx, 0x41                        
  0e52  03de             add bx, si                               
  0e54  b8042c           mov ax, 0x2c04                           
  0e57  8ec0             mov es, ax                               
  0e59  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  0e5e  c45efa           les bx, ptr [bp - 6]                     
  0e61  26884706         mov byte ptr es:[bx + 6], al             
  0e65  8b5e06           mov bx, word ptr [bp + 6]                
  0e68  6bdb41           imul bx, bx, 0x41                        
  0e6b  03de             add bx, si                               
  0e6d  b8042c           mov ax, 0x2c04                           
  0e70  8ec0             mov es, ax                               
  0e72  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  0e77  c45efa           les bx, ptr [bp - 6]                     
  0e7a  26884707         mov byte ptr es:[bx + 7], al             
  0e7e  b8042c           mov ax, 0x2c04                           
  0e81  8ec0             mov es, ax                               
  0e83  268b1e1001       mov bx, word ptr es:[0x110]              
  0e88  d1e3             shl bx, 1                                
  0e8a  b8042c           mov ax, 0x2c04                           
  0e8d  8ec0             mov es, ax                               
  0e8f  2683bff00000     cmp word ptr es:[bx + 0xf0], 0           
  0e95  743c             je 0xed3                                 
  0e97  8b5e06           mov bx, word ptr [bp + 6]                
  0e9a  6bdb41           imul bx, bx, 0x41                        
  0e9d  03de             add bx, si                               
  0e9f  b8042c           mov ax, 0x2c04                           
  0ea2  8ec0             mov es, ax                               
  0ea4  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  0ea9  98               cwde                                     
  0eaa  050200           add ax, 2                                
  0ead  3d0900           cmp ax, 9                                
  0eb0  7e04             jle 0xeb6                                
  0eb2  b009             mov al, 9                                
  0eb4  eb14             jmp 0xeca                                
  0eb6  8b5e06           mov bx, word ptr [bp + 6]                
  0eb9  6bdb41           imul bx, bx, 0x41                        
  0ebc  03de             add bx, si                               
  0ebe  b8042c           mov ax, 0x2c04                           
  0ec1  8ec0             mov es, ax                               
  0ec3  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  0ec8  0402             add al, 2                                
  0eca  c45efa           les bx, ptr [bp - 6]                     
  0ecd  26884708         mov byte ptr es:[bx + 8], al             
  0ed1  eb19             jmp 0xeec                                
  0ed3  8b5e06           mov bx, word ptr [bp + 6]                
  0ed6  6bdb41           imul bx, bx, 0x41                        
  0ed9  03de             add bx, si                               
  0edb  b8042c           mov ax, 0x2c04                           
  0ede  8ec0             mov es, ax                               
  0ee0  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  0ee5  c45efa           les bx, ptr [bp - 6]                     
  0ee8  26884708         mov byte ptr es:[bx + 8], al             
  0eec  c45efa           les bx, ptr [bp - 6]                     
  0eef  8a4606           mov al, byte ptr [bp + 6]                
  0ef2  26884709         mov byte ptr es:[bx + 9], al             
  0ef6  26c6470a00       mov byte ptr es:[bx + 0xa], 0            
  0efb  8b5e06           mov bx, word ptr [bp + 6]                
  0efe  6bdb41           imul bx, bx, 0x41                        
  0f01  03de             add bx, si                               
  0f03  b8042c           mov ax, 0x2c04                           
  0f06  8ec0             mov es, ax                               
  0f08  268a87a315       mov al, byte ptr es:[bx + 0x15a3]        
  0f0d  98               cwde                                     
  0f0e  99               cdq                                      
  0f0f  2bc2             sub ax, dx                               
  0f11  d1f8             sar ax, 1                                
  0f13  c45efa           les bx, ptr [bp - 6]                     
  0f16  2688470b         mov byte ptr es:[bx + 0xb], al           
  0f1a  8b5e06           mov bx, word ptr [bp + 6]                
  0f1d  6bdb41           imul bx, bx, 0x41                        
  0f20  b8042c           mov ax, 0x2c04                           
  0f23  8ec0             mov es, ax                               
  0f25  26c687aa1500     mov byte ptr es:[bx + 0x15aa], 0         
  0f2b  83ffff           cmp di, -1                               
  0f2e  743a             je 0xf6a                                 
  0f30  83ff64           cmp di, 0x64                             
  0f33  7c0a             jl 0xf3f                                 
  0f35  c45efa           les bx, ptr [bp - 6]                     
  0f38  26c707feff       mov word ptr es:[bx], 0xfffe             
  0f3d  eb08             jmp 0xf47                                
  0f3f  c45efa           les bx, ptr [bp - 6]                     
  0f42  26c707ffff       mov word ptr es:[bx], 0xffff             
  0f47  c45efa           les bx, ptr [bp - 6]                     
  0f4a  26c74702ffff     mov word ptr es:[bx + 2], 0xffff         
  0f50  8bc7             mov ax, di                               
  0f52  257f00           and ax, 0x7f                             
  0f55  c45efa           les bx, ptr [bp - 6]                     
  0f58  2680670f01       and byte ptr es:[bx + 0xf], 1            
  0f5d  d0e0             shl al, 1                                
  0f5f  2608470f         or byte ptr es:[bx + 0xf], al            
  0f63  26c6471065       mov byte ptr es:[bx + 0x10], 0x65        
  0f68  eb23             jmp 0xf8d                                
  0f6a  c45efa           les bx, ptr [bp - 6]                     
  0f6d  2680670f01       and byte ptr es:[bx + 0xf], 1            
  0f72  2680670ef0       and byte ptr es:[bx + 0xe], 0xf0         
  0f77  26804f0e00       or byte ptr es:[bx + 0xe], 0             
  0f7c  26c64710ff       mov byte ptr es:[bx + 0x10], 0xff        
  0f81  ff76fc           push word ptr [bp - 4]                   
  0f84  53               push bx                                  
  0f85  9ae202620b       lcall 0xb62, 0x2e2                       -> 0b62:02e2
  0f8a  83c404           add sp, 4                                
  0f8d  8b56fc           mov dx, word ptr [bp - 4]                
  0f90  8b46fa           mov ax, word ptr [bp - 6]                
  0f93  5f               pop di                                   
  0f94  5e               pop si                                   
  0f95  c9               leave                                    
  0f96  cb               retf                                     
