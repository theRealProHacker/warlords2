; seg 0551  img 0x5510..0x5790  file off 0x6110
  0551:0000  5e               pop si                                   
  0551:0001  c9               leave                                    
  0551:0002  cb               retf                                     
  0551:0003  c8620000         enter 0x62, 0                            
  0551:0007  56               push si                                  
  0551:0008  8b4606           mov ax, word ptr [bp + 6]                
  0551:000b  0bc0             or ax, ax                                
  0551:000d  741f             je 0x2e                                  
  0551:000f  3d0100           cmp ax, 1                                
  0551:0012  742f             je 0x43                                  
  0551:0014  3d0200           cmp ax, 2                                
  0551:0017  7545             jne 0x5e                                 
  0551:0019  16               push ss                                  
  0551:001a  8d469e           lea ax, [bp - 0x62]                      
  0551:001d  50               push ax                                  
  0551:001e  16               push ss                                  
  0551:001f  8d46be           lea ax, [bp - 0x42]                      
  0551:0022  50               push ax                                  
  0551:0023  16               push ss                                  
  0551:0024  8d46de           lea ax, [bp - 0x22]                      
  0551:0027  50               push ax                                  
  0551:0028  1e               push ds                                  
  0551:0029  68da02           push 0x2da                                ; "black.pal"
  0551:002c  eb28             jmp 0x56                                 
  0551:002e  16               push ss                                  
  0551:002f  8d469e           lea ax, [bp - 0x62]                      
  0551:0032  50               push ax                                  
  0551:0033  16               push ss                                  
  0551:0034  8d46be           lea ax, [bp - 0x42]                      
  0551:0037  50               push ax                                  
  0551:0038  16               push ss                                  
  0551:0039  8d46de           lea ax, [bp - 0x22]                      
  0551:003c  50               push ax                                  
  0551:003d  1e               push ds                                  
  0551:003e  68e402           push 0x2e4                                ; "start\logo.pal"
  0551:0041  eb13             jmp 0x56                                 
  0551:0043  16               push ss                                  
  0551:0044  8d469e           lea ax, [bp - 0x62]                      
  0551:0047  50               push ax                                  
  0551:0048  16               push ss                                  
  0551:0049  8d46be           lea ax, [bp - 0x42]                      
  0551:004c  50               push ax                                  
  0551:004d  16               push ss                                  
  0551:004e  8d46de           lea ax, [bp - 0x22]                      
  0551:0051  50               push ax                                  
  0551:0052  1e               push ds                                  
  0551:0053  68f302           push 0x2f3                                ; "start\screen0.pal"
  0551:0056  90               nop                                      
  0551:0057  0e               push cs                                  
  0551:0058  e8a801           call 0x203                               -> 0551:0203
  0551:005b  83c410           add sp, 0x10                             
  0551:005e  be1000           mov si, 0x10                             
  0551:0061  e95e01           jmp 0x1c2                                
  0551:0064  83fe06           cmp si, 6                                
  0551:0067  7572             jne 0xdb                                 
  0551:0069  8bde             mov bx, si                               
  0551:006b  d1e3             shl bx, 1                                
  0551:006d  8d469e           lea ax, [bp - 0x62]                      
  0551:0070  03d8             add bx, ax                               
  0551:0072  368b07           mov ax, word ptr ss:[bx]                 
  0551:0075  8946fe           mov word ptr [bp - 2], ax                
  0551:0078  cd3b46fe         f-fild word ptr [bp - 2]                 ; emu int 3b
  0551:007c  cd34060503       f-fadd dword ptr [0x305]                 ; emu int 34
  0551:0081  cd380e0903       f-fmul qword ptr [0x309]                 ; emu int 38
  0551:0086  9a221b0000       lcall 0, 0x1b22                          -> 0000:1b22 [reloc]
  0551:008b  50               push ax                                  
  0551:008c  8bde             mov bx, si                               
  0551:008e  d1e3             shl bx, 1                                
  0551:0090  8d46be           lea ax, [bp - 0x42]                      
  0551:0093  03d8             add bx, ax                               
  0551:0095  368b07           mov ax, word ptr ss:[bx]                 
  0551:0098  8946fe           mov word ptr [bp - 2], ax                
  0551:009b  cd3b46fe         f-fild word ptr [bp - 2]                 ; emu int 3b
  0551:009f  cd34060503       f-fadd dword ptr [0x305]                 ; emu int 34
  0551:00a4  cd380e0903       f-fmul qword ptr [0x309]                 ; emu int 38
  0551:00a9  9a221b0000       lcall 0, 0x1b22                          -> 0000:1b22 [reloc]
  0551:00ae  50               push ax                                  
  0551:00af  8bde             mov bx, si                               
  0551:00b1  d1e3             shl bx, 1                                
  0551:00b3  8d46de           lea ax, [bp - 0x22]                      
  0551:00b6  03d8             add bx, ax                               
  0551:00b8  368b07           mov ax, word ptr ss:[bx]                 
  0551:00bb  8946fe           mov word ptr [bp - 2], ax                
  0551:00be  cd3b46fe         f-fild word ptr [bp - 2]                 ; emu int 3b
  0551:00c2  cd34060503       f-fadd dword ptr [0x305]                 ; emu int 34
  0551:00c7  cd380e0903       f-fmul qword ptr [0x309]                 ; emu int 38
  0551:00cc  9a221b0000       lcall 0, 0x1b22                          -> 0000:1b22 [reloc]
  0551:00d1  50               push ax                                  
  0551:00d2  8bc6             mov ax, si                               
  0551:00d4  050e00           add ax, 0xe                              
  0551:00d7  50               push ax                                  
  0551:00d8  e9df00           jmp 0x1ba                                
  0551:00db  83fe07           cmp si, 7                                
  0551:00de  7e70             jle 0x150                                
  0551:00e0  8bde             mov bx, si                               
  0551:00e2  d1e3             shl bx, 1                                
  0551:00e4  8d469e           lea ax, [bp - 0x62]                      
  0551:00e7  03d8             add bx, ax                               
  0551:00e9  368b07           mov ax, word ptr ss:[bx]                 
  0551:00ec  8946fe           mov word ptr [bp - 2], ax                
  0551:00ef  cd3b46fe         f-fild word ptr [bp - 2]                 ; emu int 3b
  0551:00f3  cd34060503       f-fadd dword ptr [0x305]                 ; emu int 34
  0551:00f8  cd380e0903       f-fmul qword ptr [0x309]                 ; emu int 38
  0551:00fd  9a221b0000       lcall 0, 0x1b22                          -> 0000:1b22 [reloc]
  0551:0102  50               push ax                                  
  0551:0103  8bde             mov bx, si                               
  0551:0105  d1e3             shl bx, 1                                
  0551:0107  8d46be           lea ax, [bp - 0x42]                      
  0551:010a  03d8             add bx, ax                               
  0551:010c  368b07           mov ax, word ptr ss:[bx]                 
  0551:010f  8946fe           mov word ptr [bp - 2], ax                
  0551:0112  cd3b46fe         f-fild word ptr [bp - 2]                 ; emu int 3b
  0551:0116  cd34060503       f-fadd dword ptr [0x305]                 ; emu int 34
  0551:011b  cd380e0903       f-fmul qword ptr [0x309]                 ; emu int 38
  0551:0120  9a221b0000       lcall 0, 0x1b22                          -> 0000:1b22 [reloc]
  0551:0125  50               push ax                                  
  0551:0126  8bde             mov bx, si                               
  0551:0128  d1e3             shl bx, 1                                
  0551:012a  8d46de           lea ax, [bp - 0x22]                      
  0551:012d  03d8             add bx, ax                               
  0551:012f  368b07           mov ax, word ptr ss:[bx]                 
  0551:0132  8946fe           mov word ptr [bp - 2], ax                
  0551:0135  cd3b46fe         f-fild word ptr [bp - 2]                 ; emu int 3b
  0551:0139  cd34060503       f-fadd dword ptr [0x305]                 ; emu int 34
  0551:013e  cd380e0903       f-fmul qword ptr [0x309]                 ; emu int 38
  0551:0143  9a221b0000       lcall 0, 0x1b22                          -> 0000:1b22 [reloc]
  0551:0148  50               push ax                                  
  0551:0149  8bc6             mov ax, si                               
  0551:014b  053000           add ax, 0x30                             
  0551:014e  eb87             jmp 0xd7                                 
  0551:0150  8bde             mov bx, si                               
  0551:0152  d1e3             shl bx, 1                                
  0551:0154  8d469e           lea ax, [bp - 0x62]                      
  0551:0157  03d8             add bx, ax                               
  0551:0159  368b07           mov ax, word ptr ss:[bx]                 
  0551:015c  8946fe           mov word ptr [bp - 2], ax                
  0551:015f  cd3b46fe         f-fild word ptr [bp - 2]                 ; emu int 3b
  0551:0163  cd34060503       f-fadd dword ptr [0x305]                 ; emu int 34
  0551:0168  cd380e0903       f-fmul qword ptr [0x309]                 ; emu int 38
  0551:016d  9a221b0000       lcall 0, 0x1b22                          -> 0000:1b22 [reloc]
  0551:0172  50               push ax                                  
  0551:0173  8bde             mov bx, si                               
  0551:0175  d1e3             shl bx, 1                                
  0551:0177  8d46be           lea ax, [bp - 0x42]                      
  0551:017a  03d8             add bx, ax                               
  0551:017c  368b07           mov ax, word ptr ss:[bx]                 
  0551:017f  8946fe           mov word ptr [bp - 2], ax                
  0551:0182  cd3b46fe         f-fild word ptr [bp - 2]                 ; emu int 3b
  0551:0186  cd34060503       f-fadd dword ptr [0x305]                 ; emu int 34
  0551:018b  cd380e0903       f-fmul qword ptr [0x309]                 ; emu int 38
  0551:0190  9a221b0000       lcall 0, 0x1b22                          -> 0000:1b22 [reloc]
  0551:0195  50               push ax                                  
  0551:0196  8bde             mov bx, si                               
  0551:0198  d1e3             shl bx, 1                                
  0551:019a  8d46de           lea ax, [bp - 0x22]                      
  0551:019d  03d8             add bx, ax                               
  0551:019f  368b07           mov ax, word ptr ss:[bx]                 
  0551:01a2  8946fe           mov word ptr [bp - 2], ax                
  0551:01a5  cd3b46fe         f-fild word ptr [bp - 2]                 ; emu int 3b
  0551:01a9  cd34060503       f-fadd dword ptr [0x305]                 ; emu int 34
  0551:01ae  cd380e0903       f-fmul qword ptr [0x309]                 ; emu int 38
  0551:01b3  9a221b0000       lcall 0, 0x1b22                          -> 0000:1b22 [reloc]
  0551:01b8  50               push ax                                  
  0551:01b9  56               push si                                  
  0551:01ba  90               nop                                      
  0551:01bb  0e               push cs                                  
  0551:01bc  e81000           call 0x1cf                               -> 0551:01cf
  0551:01bf  83c408           add sp, 8                                
  0551:01c2  8bc6             mov ax, si                               
  0551:01c4  4e               dec si                                   
  0551:01c5  0bc0             or ax, ax                                
  0551:01c7  7403             je 0x1cc                                 
  0551:01c9  e998fe           jmp 0x64                                 
  0551:01cc  5e               pop si                                   
  0551:01cd  c9               leave                                    
  0551:01ce  cb               retf                                     
  0551:01cf  c8100000         enter 0x10, 0                            
  0551:01d3  c746f01010       mov word ptr [bp - 0x10], 0x1010         
  0551:01d8  8b4606           mov ax, word ptr [bp + 6]                
  0551:01db  8946f2           mov word ptr [bp - 0xe], ax              
  0551:01de  8a460a           mov al, byte ptr [bp + 0xa]              
  0551:01e1  8846f5           mov byte ptr [bp - 0xb], al              
  0551:01e4  8a460c           mov al, byte ptr [bp + 0xc]              
  0551:01e7  8846f4           mov byte ptr [bp - 0xc], al              
  0551:01ea  8a4608           mov al, byte ptr [bp + 8]                
  0551:01ed  8846f7           mov byte ptr [bp - 9], al                
  0551:01f0  16               push ss                                  
  0551:01f1  8d46f0           lea ax, [bp - 0x10]                      
  0551:01f4  50               push ax                                  
  0551:01f5  16               push ss                                  
  0551:01f6  50               push ax                                  
  0551:01f7  6a10             push 0x10                                
  0551:01f9  9aff350000       lcall 0, 0x35ff                          -> 0000:35ff [reloc]
  0551:01fe  83c40a           add sp, 0xa                              
  0551:0201  c9               leave                                    
  0551:0202  cb               retf                                     
  0551:0203  c8100000         enter 0x10, 0                            
  0551:0207  56               push si                                  
  0551:0208  57               push di                                  
  0551:0209  6a02             push 2                                   
  0551:020b  ff7608           push word ptr [bp + 8]                   
  0551:020e  ff7606           push word ptr [bp + 6]                   
  0551:0211  9a0e004a06       lcall 0x64a, 0xe                         -> 064a:000e [reloc]
  0551:0216  83c406           add sp, 6                                
  0551:0219  8bf8             mov di, ax                               
  0551:021b  0bff             or di, di                                
  0551:021d  7c5d             jl 0x27c                                 
  0551:021f  33f6             xor si, si                               
  0551:0221  eb4d             jmp 0x270                                
  0551:0223  6a0a             push 0xa                                 
  0551:0225  16               push ss                                  
  0551:0226  8d46f0           lea ax, [bp - 0x10]                      
  0551:0229  50               push ax                                  
  0551:022a  57               push di                                  
  0551:022b  9a75004a06       lcall 0x64a, 0x75                        -> 064a:0075 [reloc]
  0551:0230  83c408           add sp, 8                                
  0551:0233  c646fa00         mov byte ptr [bp - 6], 0                 
  0551:0237  8bc6             mov ax, si                               
  0551:0239  d1e0             shl ax, 1                                
  0551:023b  8b5612           mov dx, word ptr [bp + 0x12]             
  0551:023e  03d0             add dx, ax                               
  0551:0240  ff7614           push word ptr [bp + 0x14]                
  0551:0243  52               push dx                                  
  0551:0244  8bc6             mov ax, si                               
  0551:0246  d1e0             shl ax, 1                                
  0551:0248  8b560e           mov dx, word ptr [bp + 0xe]              
  0551:024b  03d0             add dx, ax                               
  0551:024d  ff7610           push word ptr [bp + 0x10]                
  0551:0250  52               push dx                                  
  0551:0251  8bc6             mov ax, si                               
  0551:0253  d1e0             shl ax, 1                                
  0551:0255  8b560a           mov dx, word ptr [bp + 0xa]              
  0551:0258  03d0             add dx, ax                               
  0551:025a  ff760c           push word ptr [bp + 0xc]                 
  0551:025d  52               push dx                                  
  0551:025e  1e               push ds                                  
  0551:025f  681103           push 0x311                               
  0551:0262  16               push ss                                  
  0551:0263  8d46f0           lea ax, [bp - 0x10]                      
  0551:0266  50               push ax                                  
  0551:0267  9a16460000       lcall 0, 0x4616                          -> 0000:4616 [reloc]
  0551:026c  83c414           add sp, 0x14                             
  0551:026f  46               inc si                                   
  0551:0270  83fe10           cmp si, 0x10                             
  0551:0273  7cae             jl 0x223                                 
  0551:0275  57               push di                                  
  0551:0276  9a42004a06       lcall 0x64a, 0x42                        -> 064a:0042 [reloc]
  0551:027b  59               pop cx                                   
  0551:027c  5f               pop di                                   
  0551:027d  5e               pop si                                   
  0551:027e  c9               leave                                    
  0551:027f  cb               retf                                     
