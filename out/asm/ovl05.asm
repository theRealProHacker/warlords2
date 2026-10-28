; ovl05 stub 2f75 file_off 0x40be0 size 0x6e1

ovl05_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  90               nop                                      
  0004  0e               push cs                                  
  0005  e81700           call 0x1f                                
  0008  eb0a             jmp 0x14                                 
  000a  90               nop                                      
  000b  0e               push cs                                  
  000c  e8a600           call 0xb5                                
  000f  90               nop                                      
  0010  0e               push cs                                  
  0011  e8c503           call 0x3d9                               
  0014  90               nop                                      
  0015  0e               push cs                                  
  0016  e88000           call 0x99                                
  0019  0bc0             or ax, ax                                
  001b  74ed             je 0xa                                   
  001d  5d               pop bp                                   
  001e  cb               retf                                     

ovl05_001f:  ; ENTRY
  001f  55               push bp                                  
  0020  8bec             mov bp, sp                               
  0022  56               push si                                  
  0023  33f6             xor si, si                               
  0025  33d2             xor dx, dx                               
  0027  eb4c             jmp 0x75                                 
  0029  33c9             xor cx, cx                               
  002b  eb41             jmp 0x6e                                 
  002d  8bc1             mov ax, cx                               
  002f  6bc070           imul ax, ax, 0x70                        
  0032  c41e8a3f         les bx, ptr [0x3f8a]                     
  0036  03d8             add bx, ax                               
  0038  03da             add bx, dx                               
  003a  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0040  742a             je 0x6c                                  
  0042  8bc1             mov ax, cx                               
  0044  6bc070           imul ax, ax, 0x70                        
  0047  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  004b  03d8             add bx, ax                               
  004d  03da             add bx, dx                               
  004f  2680bf206105     cmp byte ptr es:[bx + 0x6120], 5         
  0055  7415             je 0x6c                                  
  0057  8bc1             mov ax, cx                               
  0059  6bc070           imul ax, ax, 0x70                        
  005c  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0060  03d8             add bx, ax                               
  0062  03da             add bx, dx                               
  0064  2680bf206106     cmp byte ptr es:[bx + 0x6120], 6         
  006a  7501             jne 0x6d                                 
  006c  46               inc si                                   
  006d  41               inc cx                                   
  006e  81f99c00         cmp cx, 0x9c                             
  0072  7cb9             jl 0x2d                                  
  0074  42               inc dx                                   
  0075  83fa70           cmp dx, 0x70                             
  0078  7caf             jl 0x29                                  
  007a  8bc6             mov ax, si                               
  007c  bb6400           mov bx, 0x64                             
  007f  99               cdq                                      
  0080  f7fb             idiv bx                                  
  0082  c41e8a3f         les bx, ptr [0x3f8a]                     
  0086  26f76f3c         imul word ptr es:[bx + 0x3c]             
  008a  268987541f       mov word ptr es:[bx + 0x1f54], ax        
  008f  26c787521f0000   mov word ptr es:[bx + 0x1f52], 0         
  0096  5e               pop si                                   
  0097  5d               pop bp                                   
  0098  cb               retf                                     

ovl05_0099:  ; ENTRY
  0099  55               push bp                                  
  009a  8bec             mov bp, sp                               
  009c  c41e8a3f         les bx, ptr [0x3f8a]                     
  00a0  268b87521f       mov ax, word ptr es:[bx + 0x1f52]        
  00a5  263b87541f       cmp ax, word ptr es:[bx + 0x1f54]        
  00aa  7c05             jl 0xb1                                  
  00ac  b80100           mov ax, 1                                
  00af  eb02             jmp 0xb3                                 
  00b1  33c0             xor ax, ax                               
  00b3  5d               pop bp                                   
  00b4  cb               retf                                     

ovl05_00b5:  ; ENTRY
  00b5  55               push bp                                  
  00b6  8bec             mov bp, sp                               
  00b8  83ec32           sub sp, 0x32                             
  00bb  56               push si                                  
  00bc  57               push di                                  
  00bd  33f6             xor si, si                               
  00bf  eb3d             jmp 0xfe                                 
  00c1  66687000ffff     push 0xffff0070                          
  00c7  6a01             push 1                                   
  00c9  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  00ce  83c406           add sp, 6                                
  00d1  8946fe           mov word ptr [bp - 2], ax                
  00d4  66689c00ffff     push 0xffff009c                          
  00da  6a01             push 1                                   
  00dc  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  00e1  83c406           add sp, 6                                
  00e4  8946fc           mov word ptr [bp - 4], ax                
  00e7  6bc070           imul ax, ax, 0x70                        
  00ea  c41e8a3f         les bx, ptr [0x3f8a]                     
  00ee  03d8             add bx, ax                               
  00f0  035efe           add bx, word ptr [bp - 2]                
  00f3  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  00f9  7503             jne 0xfe                                 
  00fb  be0100           mov si, 1                                
  00fe  0bf6             or si, si                                
  0100  74bf             je 0xc1                                  
  0102  666a64           push 0x64                                
  0105  6a01             push 1                                   
  0107  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  010c  83c406           add sp, 6                                
  010f  3d4100           cmp ax, 0x41                             
  0112  7d32             jge 0x146                                
  0114  33f6             xor si, si                               
  0116  eb27             jmp 0x13f                                
  0118  666808000200     push 0x20008                             
  011e  6a01             push 1                                   
  0120  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0125  83c406           add sp, 6                                
  0128  8bde             mov bx, si                               
  012a  d1e3             shl bx, 1                                
  012c  8d56ce           lea dx, [bp - 0x32]                      
  012f  03da             add bx, dx                               
  0131  368907           mov word ptr ss:[bx], ax                 
  0134  c746e20400       mov word ptr [bp - 0x1e], 4              
  0139  c746e00200       mov word ptr [bp - 0x20], 2              
  013e  46               inc si                                   
  013f  83fe08           cmp si, 8                                
  0142  7cd4             jl 0x118                                 
  0144  eb30             jmp 0x176                                
  0146  33f6             xor si, si                               
  0148  eb27             jmp 0x171                                
  014a  66680a000500     push 0x5000a                             
  0150  6a01             push 1                                   
  0152  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0157  83c406           add sp, 6                                
  015a  8bde             mov bx, si                               
  015c  d1e3             shl bx, 1                                
  015e  8d56ce           lea dx, [bp - 0x32]                      
  0161  03da             add bx, dx                               
  0163  368907           mov word ptr ss:[bx], ax                 
  0166  c746e20600       mov word ptr [bp - 0x1e], 6              
  016b  c746e00400       mov word ptr [bp - 0x20], 4              
  0170  46               inc si                                   
  0171  83fe08           cmp si, 8                                
  0174  7cd4             jl 0x14a                                 
  0176  8b46fc           mov ax, word ptr [bp - 4]                
  0179  6bc070           imul ax, ax, 0x70                        
  017c  c41e8a3f         les bx, ptr [0x3f8a]                     
  0180  03d8             add bx, ax                               
  0182  035efe           add bx, word ptr [bp - 2]                
  0185  26c687206104     mov byte ptr es:[bx + 0x6120], 4         
  018b  ff76fc           push word ptr [bp - 4]                   
  018e  ff76fe           push word ptr [bp - 2]                   
  0191  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0196  83c404           add sp, 4                                
  0199  c41e8a3f         les bx, ptr [0x3f8a]                     
  019d  26ff87521f       inc word ptr es:[bx + 0x1f52]            
  01a2  33f6             xor si, si                               
  01a4  e92602           jmp 0x3cd                                
  01a7  8b46fc           mov ax, word ptr [bp - 4]                
  01aa  8946f4           mov word ptr [bp - 0xc], ax              
  01ad  8b46fe           mov ax, word ptr [bp - 2]                
  01b0  8946f6           mov word ptr [bp - 0xa], ax              
  01b3  8976f8           mov word ptr [bp - 8], si                
  01b6  c746de0000       mov word ptr [bp - 0x22], 0              
  01bb  c746fa0000       mov word ptr [bp - 6], 0                 
  01c0  e9f401           jmp 0x3b7                                
  01c3  8b46f8           mov ax, word ptr [bp - 8]                
  01c6  c1e002           shl ax, 2                                
  01c9  c41e8a3f         les bx, ptr [0x3f8a]                     
  01cd  03d8             add bx, ax                               
  01cf  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  01d4  0146f6           add word ptr [bp - 0xa], ax              
  01d7  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  01dc  0146f4           add word ptr [bp - 0xc], ax              
  01df  16               push ss                                  
  01e0  8d46f4           lea ax, [bp - 0xc]                       
  01e3  50               push ax                                  
  01e4  16               push ss                                  
  01e5  8d46f6           lea ax, [bp - 0xa]                       
  01e8  50               push ax                                  
  01e9  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  01ee  83c408           add sp, 8                                
  01f1  8b46f4           mov ax, word ptr [bp - 0xc]              
  01f4  6bc070           imul ax, ax, 0x70                        
  01f7  c41e8a3f         les bx, ptr [0x3f8a]                     
  01fb  03d8             add bx, ax                               
  01fd  035ef6           add bx, word ptr [bp - 0xa]              
  0200  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0206  752c             jne 0x234                                
  0208  8b46f4           mov ax, word ptr [bp - 0xc]              
  020b  6bc070           imul ax, ax, 0x70                        
  020e  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0212  03d8             add bx, ax                               
  0214  035ef6           add bx, word ptr [bp - 0xa]              
  0217  26c687206104     mov byte ptr es:[bx + 0x6120], 4         
  021d  ff76f4           push word ptr [bp - 0xc]                 
  0220  ff76f6           push word ptr [bp - 0xa]                 
  0223  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0228  83c404           add sp, 4                                
  022b  c41e8a3f         les bx, ptr [0x3f8a]                     
  022f  26ff87521f       inc word ptr es:[bx + 0x1f52]            
  0234  8b46f8           mov ax, word ptr [bp - 8]                
  0237  050200           add ax, 2                                
  023a  bb0800           mov bx, 8                                
  023d  99               cdq                                      
  023e  f7fb             idiv bx                                  
  0240  8956ea           mov word ptr [bp - 0x16], dx             
  0243  8b46f8           mov ax, word ptr [bp - 8]                
  0246  050600           add ax, 6                                
  0249  99               cdq                                      
  024a  f7fb             idiv bx                                  
  024c  8956e8           mov word ptr [bp - 0x18], dx             
  024f  ff46de           inc word ptr [bp - 0x22]                 
  0252  8b46de           mov ax, word ptr [bp - 0x22]             
  0255  bb0400           mov bx, 4                                
  0258  99               cdq                                      
  0259  f7fb             idiv bx                                  
  025b  8b56e0           mov dx, word ptr [bp - 0x20]             
  025e  2bd0             sub dx, ax                               
  0260  52               push dx                                  
  0261  8b46de           mov ax, word ptr [bp - 0x22]             
  0264  99               cdq                                      
  0265  2bc2             sub ax, dx                               
  0267  d1f8             sar ax, 1                                
  0269  8b56e2           mov dx, word ptr [bp - 0x1e]             
  026c  2bd0             sub dx, ax                               
  026e  52               push dx                                  
  026f  6a01             push 1                                   
  0271  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0276  83c406           add sp, 6                                
  0279  8946e6           mov word ptr [bp - 0x1a], ax             
  027c  8b46de           mov ax, word ptr [bp - 0x22]             
  027f  bb0300           mov bx, 3                                
  0282  99               cdq                                      
  0283  f7fb             idiv bx                                  
  0285  8b56e0           mov dx, word ptr [bp - 0x20]             
  0288  2bd0             sub dx, ax                               
  028a  52               push dx                                  
  028b  8b46de           mov ax, word ptr [bp - 0x22]             
  028e  99               cdq                                      
  028f  2bc2             sub ax, dx                               
  0291  d1f8             sar ax, 1                                
  0293  8b56e2           mov dx, word ptr [bp - 0x1e]             
  0296  2bd0             sub dx, ax                               
  0298  52               push dx                                  
  0299  6a01             push 1                                   
  029b  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  02a0  83c406           add sp, 6                                
  02a3  8946e4           mov word ptr [bp - 0x1c], ax             
  02a6  8b46f6           mov ax, word ptr [bp - 0xa]              
  02a9  8946f2           mov word ptr [bp - 0xe], ax              
  02ac  8b46f4           mov ax, word ptr [bp - 0xc]              
  02af  8946f0           mov word ptr [bp - 0x10], ax             
  02b2  33ff             xor di, di                               
  02b4  eb72             jmp 0x328                                
  02b6  8b46ea           mov ax, word ptr [bp - 0x16]             
  02b9  c1e002           shl ax, 2                                
  02bc  c41e8a3f         les bx, ptr [0x3f8a]                     
  02c0  03d8             add bx, ax                               
  02c2  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  02c7  0146f2           add word ptr [bp - 0xe], ax              
  02ca  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  02cf  0146f0           add word ptr [bp - 0x10], ax             
  02d2  16               push ss                                  
  02d3  8d46f0           lea ax, [bp - 0x10]                      
  02d6  50               push ax                                  
  02d7  16               push ss                                  
  02d8  8d46f2           lea ax, [bp - 0xe]                       
  02db  50               push ax                                  
  02dc  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  02e1  83c408           add sp, 8                                
  02e4  8b46f0           mov ax, word ptr [bp - 0x10]             
  02e7  6bc070           imul ax, ax, 0x70                        
  02ea  c41e8a3f         les bx, ptr [0x3f8a]                     
  02ee  03d8             add bx, ax                               
  02f0  035ef2           add bx, word ptr [bp - 0xe]              
  02f3  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  02f9  752c             jne 0x327                                
  02fb  8b46f0           mov ax, word ptr [bp - 0x10]             
  02fe  6bc070           imul ax, ax, 0x70                        
  0301  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0305  03d8             add bx, ax                               
  0307  035ef2           add bx, word ptr [bp - 0xe]              
  030a  26c687206104     mov byte ptr es:[bx + 0x6120], 4         
  0310  ff76f0           push word ptr [bp - 0x10]                
  0313  ff76f2           push word ptr [bp - 0xe]                 
  0316  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  031b  83c404           add sp, 4                                
  031e  c41e8a3f         les bx, ptr [0x3f8a]                     
  0322  26ff87521f       inc word ptr es:[bx + 0x1f52]            
  0327  47               inc di                                   
  0328  3b7ee6           cmp di, word ptr [bp - 0x1a]             
  032b  7c89             jl 0x2b6                                 
  032d  8b46f6           mov ax, word ptr [bp - 0xa]              
  0330  8946ee           mov word ptr [bp - 0x12], ax             
  0333  8b46f4           mov ax, word ptr [bp - 0xc]              
  0336  8946ec           mov word ptr [bp - 0x14], ax             
  0339  33ff             xor di, di                               
  033b  eb72             jmp 0x3af                                
  033d  8b46e8           mov ax, word ptr [bp - 0x18]             
  0340  c1e002           shl ax, 2                                
  0343  c41e8a3f         les bx, ptr [0x3f8a]                     
  0347  03d8             add bx, ax                               
  0349  268b87bc00       mov ax, word ptr es:[bx + 0xbc]          
  034e  0146ee           add word ptr [bp - 0x12], ax             
  0351  268b87be00       mov ax, word ptr es:[bx + 0xbe]          
  0356  0146ec           add word ptr [bp - 0x14], ax             
  0359  16               push ss                                  
  035a  8d46ec           lea ax, [bp - 0x14]                      
  035d  50               push ax                                  
  035e  16               push ss                                  
  035f  8d46ee           lea ax, [bp - 0x12]                      
  0362  50               push ax                                  
  0363  9a3900622f       lcall 0x2f62, 0x39                       -> ovl02:0470
  0368  83c408           add sp, 8                                
  036b  8b46ec           mov ax, word ptr [bp - 0x14]             
  036e  6bc070           imul ax, ax, 0x70                        
  0371  c41e8a3f         les bx, ptr [0x3f8a]                     
  0375  03d8             add bx, ax                               
  0377  035eee           add bx, word ptr [bp - 0x12]             
  037a  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  0380  752c             jne 0x3ae                                
  0382  8b46ec           mov ax, word ptr [bp - 0x14]             
  0385  6bc070           imul ax, ax, 0x70                        
  0388  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  038c  03d8             add bx, ax                               
  038e  035eee           add bx, word ptr [bp - 0x12]             
  0391  26c687206104     mov byte ptr es:[bx + 0x6120], 4         
  0397  ff76ec           push word ptr [bp - 0x14]                
  039a  ff76ee           push word ptr [bp - 0x12]                
  039d  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  03a2  83c404           add sp, 4                                
  03a5  c41e8a3f         les bx, ptr [0x3f8a]                     
  03a9  26ff87521f       inc word ptr es:[bx + 0x1f52]            
  03ae  47               inc di                                   
  03af  3b7ee4           cmp di, word ptr [bp - 0x1c]             
  03b2  7c89             jl 0x33d                                 
  03b4  ff46fa           inc word ptr [bp - 6]                    
  03b7  8b5ef8           mov bx, word ptr [bp - 8]                
  03ba  d1e3             shl bx, 1                                
  03bc  8d46ce           lea ax, [bp - 0x32]                      
  03bf  03d8             add bx, ax                               
  03c1  368b07           mov ax, word ptr ss:[bx]                 
  03c4  3b46fa           cmp ax, word ptr [bp - 6]                
  03c7  7e03             jle 0x3cc                                
  03c9  e9f7fd           jmp 0x1c3                                
  03cc  46               inc si                                   
  03cd  83fe08           cmp si, 8                                
  03d0  7d03             jge 0x3d5                                
  03d2  e9d2fd           jmp 0x1a7                                
  03d5  5f               pop di                                   
  03d6  5e               pop si                                   
  03d7  c9               leave                                    
  03d8  cb               retf                                     

ovl05_03d9:  ; ENTRY
  03d9  55               push bp                                  
  03da  8bec             mov bp, sp                               
  03dc  56               push si                                  
  03dd  57               push di                                  
  03de  33f6             xor si, si                               
  03e0  e9af00           jmp 0x492                                
  03e3  33ff             xor di, di                               
  03e5  e9a000           jmp 0x488                                
  03e8  33d2             xor dx, dx                               
  03ea  8bc7             mov ax, di                               
  03ec  6bc070           imul ax, ax, 0x70                        
  03ef  c41e8a3f         les bx, ptr [0x3f8a]                     
  03f3  03d8             add bx, ax                               
  03f5  03de             add bx, si                               
  03f7  2680bf206107     cmp byte ptr es:[bx + 0x6120], 7         
  03fd  7403             je 0x402                                 
  03ff  e98500           jmp 0x487                                
  0402  8bc7             mov ax, di                               
  0404  40               inc ax                                   
  0405  6bc070           imul ax, ax, 0x70                        
  0408  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  040c  03d8             add bx, ax                               
  040e  03de             add bx, si                               
  0410  2680bf206104     cmp byte ptr es:[bx + 0x6120], 4         
  0416  7501             jne 0x419                                
  0418  42               inc dx                                   
  0419  8bc7             mov ax, di                               
  041b  48               dec ax                                   
  041c  6bc070           imul ax, ax, 0x70                        
  041f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0423  03d8             add bx, ax                               
  0425  03de             add bx, si                               
  0427  2680bf206104     cmp byte ptr es:[bx + 0x6120], 4         
  042d  7501             jne 0x430                                
  042f  42               inc dx                                   
  0430  8bc7             mov ax, di                               
  0432  6bc070           imul ax, ax, 0x70                        
  0435  c41e8a3f         les bx, ptr [0x3f8a]                     
  0439  03d8             add bx, ax                               
  043b  03de             add bx, si                               
  043d  2680bf216104     cmp byte ptr es:[bx + 0x6121], 4         
  0443  7501             jne 0x446                                
  0445  42               inc dx                                   
  0446  8bc7             mov ax, di                               
  0448  6bc070           imul ax, ax, 0x70                        
  044b  c41e8a3f         les bx, ptr [0x3f8a]                     
  044f  03d8             add bx, ax                               
  0451  03de             add bx, si                               
  0453  2680bf1f6104     cmp byte ptr es:[bx + 0x611f], 4         
  0459  7501             jne 0x45c                                
  045b  42               inc dx                                   
  045c  83fa03           cmp dx, 3                                
  045f  7c26             jl 0x487                                 
  0461  8bc7             mov ax, di                               
  0463  6bc070           imul ax, ax, 0x70                        
  0466  c41e8a3f         les bx, ptr [0x3f8a]                     
  046a  03d8             add bx, ax                               
  046c  03de             add bx, si                               
  046e  26c687206104     mov byte ptr es:[bx + 0x6120], 4         
  0474  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0478  26ff87521f       inc word ptr es:[bx + 0x1f52]            
  047d  57               push di                                  
  047e  56               push si                                  
  047f  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  0484  83c404           add sp, 4                                
  0487  47               inc di                                   
  0488  81ff9c00         cmp di, 0x9c                             
  048c  7d03             jge 0x491                                
  048e  e957ff           jmp 0x3e8                                
  0491  46               inc si                                   
  0492  83fe70           cmp si, 0x70                             
  0495  7d03             jge 0x49a                                
  0497  e949ff           jmp 0x3e3                                
  049a  be0100           mov si, 1                                
  049d  e93502           jmp 0x6d5                                
  04a0  bf0100           mov di, 1                                
  04a3  e92502           jmp 0x6cb                                
  04a6  8bc7             mov ax, di                               
  04a8  6bc070           imul ax, ax, 0x70                        
  04ab  c41e8a3f         les bx, ptr [0x3f8a]                     
  04af  03d8             add bx, ax                               
  04b1  03de             add bx, si                               
  04b3  2680bf206104     cmp byte ptr es:[bx + 0x6120], 4         
  04b9  7403             je 0x4be                                 
  04bb  e90c02           jmp 0x6ca                                
  04be  8bc7             mov ax, di                               
  04c0  40               inc ax                                   
  04c1  6bc070           imul ax, ax, 0x70                        
  04c4  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  04c8  03d8             add bx, ax                               
  04ca  03de             add bx, si                               
  04cc  2680bf216104     cmp byte ptr es:[bx + 0x6121], 4         
  04d2  7403             je 0x4d7                                 
  04d4  e9ea00           jmp 0x5c1                                
  04d7  8bc7             mov ax, di                               
  04d9  48               dec ax                                   
  04da  6bc070           imul ax, ax, 0x70                        
  04dd  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  04e1  03d8             add bx, ax                               
  04e3  03de             add bx, si                               
  04e5  2680bf1f6104     cmp byte ptr es:[bx + 0x611f], 4         
  04eb  7403             je 0x4f0                                 
  04ed  e9d100           jmp 0x5c1                                
  04f0  8bc7             mov ax, di                               
  04f2  48               dec ax                                   
  04f3  6bc070           imul ax, ax, 0x70                        
  04f6  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  04fa  03d8             add bx, ax                               
  04fc  03de             add bx, si                               
  04fe  2680bf216105     cmp byte ptr es:[bx + 0x6121], 5         
  0504  742f             je 0x535                                 
  0506  8bc7             mov ax, di                               
  0508  48               dec ax                                   
  0509  6bc070           imul ax, ax, 0x70                        
  050c  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0510  03d8             add bx, ax                               
  0512  03de             add bx, si                               
  0514  2680bf216103     cmp byte ptr es:[bx + 0x6121], 3         
  051a  7419             je 0x535                                 
  051c  8bc7             mov ax, di                               
  051e  48               dec ax                                   
  051f  6bc070           imul ax, ax, 0x70                        
  0522  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0526  03d8             add bx, ax                               
  0528  03de             add bx, si                               
  052a  2680bf216107     cmp byte ptr es:[bx + 0x6121], 7         
  0530  7403             je 0x535                                 
  0532  e98c00           jmp 0x5c1                                
  0535  8bc7             mov ax, di                               
  0537  40               inc ax                                   
  0538  6bc070           imul ax, ax, 0x70                        
  053b  c41e8a3f         les bx, ptr [0x3f8a]                     
  053f  03d8             add bx, ax                               
  0541  03de             add bx, si                               
  0543  2680bf1f6105     cmp byte ptr es:[bx + 0x611f], 5         
  0549  742c             je 0x577                                 
  054b  8bc7             mov ax, di                               
  054d  40               inc ax                                   
  054e  6bc070           imul ax, ax, 0x70                        
  0551  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0555  03d8             add bx, ax                               
  0557  03de             add bx, si                               
  0559  2680bf1f6103     cmp byte ptr es:[bx + 0x611f], 3         
  055f  7416             je 0x577                                 
  0561  8bc7             mov ax, di                               
  0563  40               inc ax                                   
  0564  6bc070           imul ax, ax, 0x70                        
  0567  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  056b  03d8             add bx, ax                               
  056d  03de             add bx, si                               
  056f  2680bf1f6107     cmp byte ptr es:[bx + 0x611f], 7         
  0575  754a             jne 0x5c1                                
  0577  666a0a           push 0xa                                 
  057a  6a01             push 1                                   
  057c  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0581  83c406           add sp, 6                                
  0584  3d0500           cmp ax, 5                                
  0587  7d1a             jge 0x5a3                                
  0589  8bc7             mov ax, di                               
  058b  48               dec ax                                   
  058c  6bc070           imul ax, ax, 0x70                        
  058f  c41e8a3f         les bx, ptr [0x3f8a]                     
  0593  03d8             add bx, ax                               
  0595  03de             add bx, si                               
  0597  26c687216104     mov byte ptr es:[bx + 0x6121], 4         
  059d  8bc7             mov ax, di                               
  059f  48               dec ax                                   
  05a0  e91a01           jmp 0x6bd                                
  05a3  8bc7             mov ax, di                               
  05a5  40               inc ax                                   
  05a6  6bc070           imul ax, ax, 0x70                        
  05a9  c41e8a3f         les bx, ptr [0x3f8a]                     
  05ad  03d8             add bx, ax                               
  05af  03de             add bx, si                               
  05b1  26c6871f6104     mov byte ptr es:[bx + 0x611f], 4         
  05b7  8bc7             mov ax, di                               
  05b9  40               inc ax                                   
  05ba  50               push ax                                  
  05bb  8bc6             mov ax, si                               
  05bd  48               dec ax                                   
  05be  e90001           jmp 0x6c1                                
  05c1  8bc7             mov ax, di                               
  05c3  40               inc ax                                   
  05c4  6bc070           imul ax, ax, 0x70                        
  05c7  c41e8a3f         les bx, ptr [0x3f8a]                     
  05cb  03d8             add bx, ax                               
  05cd  03de             add bx, si                               
  05cf  2680bf1f6104     cmp byte ptr es:[bx + 0x611f], 4         
  05d5  7403             je 0x5da                                 
  05d7  e9f000           jmp 0x6ca                                
  05da  8bc7             mov ax, di                               
  05dc  48               dec ax                                   
  05dd  6bc070           imul ax, ax, 0x70                        
  05e0  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  05e4  03d8             add bx, ax                               
  05e6  03de             add bx, si                               
  05e8  2680bf216104     cmp byte ptr es:[bx + 0x6121], 4         
  05ee  7403             je 0x5f3                                 
  05f0  e9d700           jmp 0x6ca                                
  05f3  8bc7             mov ax, di                               
  05f5  48               dec ax                                   
  05f6  6bc070           imul ax, ax, 0x70                        
  05f9  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  05fd  03d8             add bx, ax                               
  05ff  03de             add bx, si                               
  0601  2680bf1f6105     cmp byte ptr es:[bx + 0x611f], 5         
  0607  742f             je 0x638                                 
  0609  8bc7             mov ax, di                               
  060b  48               dec ax                                   
  060c  6bc070           imul ax, ax, 0x70                        
  060f  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0613  03d8             add bx, ax                               
  0615  03de             add bx, si                               
  0617  2680bf1f6103     cmp byte ptr es:[bx + 0x611f], 3         
  061d  7419             je 0x638                                 
  061f  8bc7             mov ax, di                               
  0621  48               dec ax                                   
  0622  6bc070           imul ax, ax, 0x70                        
  0625  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0629  03d8             add bx, ax                               
  062b  03de             add bx, si                               
  062d  2680bf1f6107     cmp byte ptr es:[bx + 0x611f], 7         
  0633  7403             je 0x638                                 
  0635  e99200           jmp 0x6ca                                
  0638  8bc7             mov ax, di                               
  063a  40               inc ax                                   
  063b  6bc070           imul ax, ax, 0x70                        
  063e  c41e8a3f         les bx, ptr [0x3f8a]                     
  0642  03d8             add bx, ax                               
  0644  03de             add bx, si                               
  0646  2680bf216105     cmp byte ptr es:[bx + 0x6121], 5         
  064c  742c             je 0x67a                                 
  064e  8bc7             mov ax, di                               
  0650  40               inc ax                                   
  0651  6bc070           imul ax, ax, 0x70                        
  0654  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  0658  03d8             add bx, ax                               
  065a  03de             add bx, si                               
  065c  2680bf216103     cmp byte ptr es:[bx + 0x6121], 3         
  0662  7416             je 0x67a                                 
  0664  8bc7             mov ax, di                               
  0666  40               inc ax                                   
  0667  6bc070           imul ax, ax, 0x70                        
  066a  8b1e8a3f         mov bx, word ptr [0x3f8a]                
  066e  03d8             add bx, ax                               
  0670  03de             add bx, si                               
  0672  2680bf216107     cmp byte ptr es:[bx + 0x6121], 7         
  0678  7550             jne 0x6ca                                
  067a  666a0a           push 0xa                                 
  067d  6a01             push 1                                   
  067f  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0684  83c406           add sp, 6                                
  0687  3d0500           cmp ax, 5                                
  068a  7d1a             jge 0x6a6                                
  068c  8bc7             mov ax, di                               
  068e  48               dec ax                                   
  068f  6bc070           imul ax, ax, 0x70                        
  0692  c41e8a3f         les bx, ptr [0x3f8a]                     
  0696  03d8             add bx, ax                               
  0698  03de             add bx, si                               
  069a  26c6871f6104     mov byte ptr es:[bx + 0x611f], 4         
  06a0  8bc7             mov ax, di                               
  06a2  48               dec ax                                   
  06a3  e914ff           jmp 0x5ba                                
  06a6  8bc7             mov ax, di                               
  06a8  40               inc ax                                   
  06a9  6bc070           imul ax, ax, 0x70                        
  06ac  c41e8a3f         les bx, ptr [0x3f8a]                     
  06b0  03d8             add bx, ax                               
  06b2  03de             add bx, si                               
  06b4  26c687216104     mov byte ptr es:[bx + 0x6121], 4         
  06ba  8bc7             mov ax, di                               
  06bc  40               inc ax                                   
  06bd  50               push ax                                  
  06be  8bc6             mov ax, si                               
  06c0  40               inc ax                                   
  06c1  50               push ax                                  
  06c2  9a3400622f       lcall 0x2f62, 0x34                       -> ovl02:03aa
  06c7  83c404           add sp, 4                                
  06ca  47               inc di                                   
  06cb  81ff9b00         cmp di, 0x9b                             
  06cf  7d03             jge 0x6d4                                
  06d1  e9d2fd           jmp 0x4a6                                
  06d4  46               inc si                                   
  06d5  83fe6f           cmp si, 0x6f                             
  06d8  7d03             jge 0x6dd                                
  06da  e9c3fd           jmp 0x4a0                                
  06dd  5f               pop di                                   
  06de  5e               pop si                                   
  06df  5d               pop bp                                   
  06e0  cb               retf                                     
