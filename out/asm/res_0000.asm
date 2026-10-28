; res_0000 file_off 0x2000
  0000  ba2531           mov dx, 0x3125                           
  0003  2e89169102       mov word ptr cs:[0x291], dx              
  0008  b430             mov ah, 0x30                             
  000a  cd21             int 0x21                                 
  000c  8b2e0200         mov bp, word ptr [2]                     
  0010  8b1e2c00         mov bx, word ptr [0x2c]                  
  0014  8eda             mov ds, dx                               
  0016  a37d00           mov word ptr [0x7d], ax                  
  0019  8c067b00         mov word ptr [0x7b], es                  
  001d  891e7700         mov word ptr [0x77], bx                  
  0021  892e9100         mov word ptr [0x91], bp                  
  0025  e85501           call 0x17d                               
  0028  a17700           mov ax, word ptr [0x77]                  
  002b  8ec0             mov es, ax                               
  002d  33c0             xor ax, ax                               
  002f  8bd8             mov bx, ax                               
  0031  8bf8             mov di, ax                               
  0033  b9ff7f           mov cx, 0x7fff                           
  0036  fc               cld                                      
  0037  f2ae             repne scasb al, byte ptr es:[di]         
  0039  e343             jcxz 0x7e                                
  003b  43               inc bx                                   
  003c  263805           cmp byte ptr es:[di], al                 
  003f  75f6             jne 0x37                                 
  0041  80cd80           or ch, 0x80                              
  0044  f7d9             neg cx                                   
  0046  890e7500         mov word ptr [0x75], cx                  
  004a  b90200           mov cx, 2                                
  004d  d3e3             shl bx, cl                               
  004f  83c310           add bx, 0x10                             
  0052  83e3f0           and bx, 0xfff0                           
  0055  891e7900         mov word ptr [0x79], bx                  
  0059  8cd2             mov dx, ss                               
  005b  2bea             sub bp, dx                               
  005d  bf2531           mov di, 0x3125                           
  0060  8ec7             mov es, di                               
  0062  268b3eca26       mov di, word ptr es:[0x26ca]             
  0067  81ff0002         cmp di, 0x200                            
  006b  7308             jae 0x75                                 
  006d  bf0002           mov di, 0x200                            
  0070  26893eca26       mov word ptr es:[0x26ca], di             
  0075  b104             mov cl, 4                                
  0077  d3ef             shr di, cl                               
  0079  47               inc di                                   
  007a  3bef             cmp bp, di                               
  007c  7303             jae 0x81                                 
  007e  e9f901           jmp 0x27a                                
  0081  8bdf             mov bx, di                               
  0083  03da             add bx, dx                               
  0085  891e8900         mov word ptr [0x89], bx                  
  0089  891e8d00         mov word ptr [0x8d], bx                  
  008d  a17b00           mov ax, word ptr [0x7b]                  
  0090  2bd8             sub bx, ax                               
  0092  8ec0             mov es, ax                               
  0094  b44a             mov ah, 0x4a                             
  0096  57               push di                                  
  0097  cd21             int 0x21                                 
  0099  5f               pop di                                   
  009a  d3e7             shl di, cl                               
  009c  fa               cli                                      
  009d  8ed2             mov ss, dx                               
  009f  8be7             mov sp, di                               
  00a1  fb               sti                                      
  00a2  b82531           mov ax, 0x3125                           
  00a5  8ec0             mov es, ax                               
  00a7  26893eca26       mov word ptr es:[0x26ca], di             
  00ac  33c0             xor ax, ax                               
  00ae  2e8e069102       mov es, word ptr cs:[0x291]              
  00b3  bf603f           mov di, 0x3f60                           
  00b6  b96671           mov cx, 0x7166                           
  00b9  2bcf             sub cx, di                               
  00bb  fc               cld                                      
  00bc  f3aa             rep stosb byte ptr es:[di], al           
  00be  833efc3c14       cmp word ptr [0x3cfc], 0x14              
  00c3  7647             jbe 0x10c                                
  00c5  803e7d0003       cmp byte ptr [0x7d], 3                   
  00ca  7240             jb 0x10c                                 
  00cc  7707             ja 0xd5                                  
  00ce  803e7e001e       cmp byte ptr [0x7e], 0x1e                
  00d3  7237             jb 0x10c                                 
  00d5  b80158           mov ax, 0x5801                           
  00d8  bb0200           mov bx, 2                                
  00db  cd21             int 0x21                                 
  00dd  722a             jb 0x109                                 
  00df  b467             mov ah, 0x67                             
  00e1  8b1efc3c         mov bx, word ptr [0x3cfc]                
  00e5  cd21             int 0x21                                 
  00e7  7220             jb 0x109                                 
  00e9  b448             mov ah, 0x48                             
  00eb  bb0100           mov bx, 1                                
  00ee  cd21             int 0x21                                 
  00f0  7217             jb 0x109                                 
  00f2  40               inc ax                                   
  00f3  a39100           mov word ptr [0x91], ax                  
  00f6  48               dec ax                                   
  00f7  8ec0             mov es, ax                               
  00f9  b449             mov ah, 0x49                             
  00fb  cd21             int 0x21                                 
  00fd  720a             jb 0x109                                 
  00ff  b80158           mov ax, 0x5801                           
  0102  bb0000           mov bx, 0                                
  0105  cd21             int 0x21                                 
  0107  7303             jae 0x10c                                
  0109  e96e01           jmp 0x27a                                
  010c  b400             mov ah, 0                                
  010e  cd1a             int 0x1a                                 
  0110  89168100         mov word ptr [0x81], dx                  
  0114  890e8300         mov word ptr [0x83], cx                  
  0118  0ac0             or al, al                                
  011a  740c             je 0x128                                 
  011c  b84000           mov ax, 0x40                             
  011f  8ec0             mov es, ax                               
  0121  bb7000           mov bx, 0x70                             
  0124  26c60701         mov byte ptr es:[bx], 1                  
  0128  33ed             xor bp, bp                               
  012a  2e8e069102       mov es, word ptr cs:[0x291]              
  012f  be2a3f           mov si, 0x3f2a                           
  0132  bf543f           mov di, 0x3f54                           
  0135  e8b500           call 0x1ed                               
  0138  ff367300         push word ptr [0x73]                     
  013c  ff367100         push word ptr [0x71]                     
  0140  ff366f00         push word ptr [0x6f]                     
  0144  ff366d00         push word ptr [0x6d]                     
  0148  ff366b00         push word ptr [0x6b]                     
  014c  9a0b004c0a       lcall 0xa4c, 0xb                         -> 0a4c:000b
  0151  50               push ax                                  
  0152  90               nop                                      
  0153  0e               push cs                                  
  0154  e8701b           call 0x1cc7                              

res_0000_0157:  ; ENTRY
  0157  2e8e069102       mov es, word ptr cs:[0x291]              
  015c  56               push si                                  
  015d  57               push di                                  
  015e  be543f           mov si, 0x3f54                           
  0161  bf603f           mov di, 0x3f60                           
  0164  e8ca00           call 0x231                               
  0167  5f               pop di                                   
  0168  5e               pop si                                   
  0169  cb               retf                                     

res_0000_016a:  ; ENTRY
  016a  cb               retf                                     

res_0000_016b:  ; ENTRY
  016b  8bec             mov bp, sp                               
  016d  b44c             mov ah, 0x4c                             
  016f  8a4604           mov al, byte ptr [bp + 4]                
  0172  cd21             int 0x21                                 
  0174  b90e00           mov cx, 0xe                              
  0177  ba2f00           mov dx, 0x2f                             
  017a  e90301           jmp 0x280                                

res_0000_017d:  ; ENTRY
  017d  1e               push ds                                  
  017e  b80035           mov ax, 0x3500                           
  0181  cd21             int 0x21                                 
  0183  891e5b00         mov word ptr [0x5b], bx                  
  0187  8c065d00         mov word ptr [0x5d], es                  
  018b  b80435           mov ax, 0x3504                           
  018e  cd21             int 0x21                                 
  0190  891e5f00         mov word ptr [0x5f], bx                  
  0194  8c066100         mov word ptr [0x61], es                  
  0198  b80535           mov ax, 0x3505                           
  019b  cd21             int 0x21                                 
  019d  891e6300         mov word ptr [0x63], bx                  
  01a1  8c066500         mov word ptr [0x65], es                  
  01a5  b80635           mov ax, 0x3506                           
  01a8  cd21             int 0x21                                 
  01aa  891e6700         mov word ptr [0x67], bx                  
  01ae  8c066900         mov word ptr [0x69], es                  
  01b2  b80025           mov ax, 0x2500                           
  01b5  8cca             mov dx, cs                               
  01b7  8eda             mov ds, dx                               
  01b9  ba7401           mov dx, 0x174                            
  01bc  cd21             int 0x21                                 
  01be  1f               pop ds                                   
  01bf  c3               ret                                      

res_0000_01c0:  ; ENTRY
  01c0  1e               push ds                                  
  01c1  b80025           mov ax, 0x2500                           
  01c4  c5165b00         lds dx, ptr [0x5b]                       
  01c8  cd21             int 0x21                                 
  01ca  1f               pop ds                                   
  01cb  1e               push ds                                  
  01cc  b80425           mov ax, 0x2504                           
  01cf  c5165f00         lds dx, ptr [0x5f]                       
  01d3  cd21             int 0x21                                 
  01d5  1f               pop ds                                   
  01d6  1e               push ds                                  
  01d7  b80525           mov ax, 0x2505                           
  01da  c5166300         lds dx, ptr [0x63]                       
  01de  cd21             int 0x21                                 
  01e0  1f               pop ds                                   
  01e1  1e               push ds                                  
  01e2  b80625           mov ax, 0x2506                           
  01e5  c5166700         lds dx, ptr [0x67]                       
  01e9  cd21             int 0x21                                 
  01eb  1f               pop ds                                   
  01ec  cb               retf                                     

res_0000_01ed:  ; ENTRY
  01ed  b80001           mov ax, 0x100                            
  01f0  8bd7             mov dx, di                               
  01f2  8bde             mov bx, si                               
  01f4  3bdf             cmp bx, di                               
  01f6  7419             je 0x211                                 
  01f8  26803fff         cmp byte ptr es:[bx], 0xff               
  01fc  740e             je 0x20c                                 
  01fe  268a4f01         mov cl, byte ptr es:[bx + 1]             
  0202  32ed             xor ch, ch                               
  0204  3bc8             cmp cx, ax                               
  0206  7304             jae 0x20c                                
  0208  8bc1             mov ax, cx                               
  020a  8bd3             mov dx, bx                               
  020c  83c306           add bx, 6                                
  020f  ebe3             jmp 0x1f4                                
  0211  3bd7             cmp dx, di                               
  0213  741b             je 0x230                                 
  0215  8bda             mov bx, dx                               
  0217  26803f00         cmp byte ptr es:[bx], 0                  
  021b  26c607ff         mov byte ptr es:[bx], 0xff               
  021f  06               push es                                  
  0220  7407             je 0x229                                 
  0222  26ff5f02         lcall es:[bx + 2]                        
  0226  07               pop es                                   
  0227  ebc4             jmp 0x1ed                                
  0229  26ff5702         call word ptr es:[bx + 2]                
  022d  07               pop es                                   
  022e  ebbd             jmp 0x1ed                                
  0230  c3               ret                                      

res_0000_0231:  ; ENTRY
  0231  b400             mov ah, 0                                
  0233  8bd7             mov dx, di                               
  0235  8bde             mov bx, si                               
  0237  3bdf             cmp bx, di                               
  0239  7417             je 0x252                                 
  023b  26803fff         cmp byte ptr es:[bx], 0xff               
  023f  740c             je 0x24d                                 
  0241  26386701         cmp byte ptr es:[bx + 1], ah             
  0245  7206             jb 0x24d                                 
  0247  268a6701         mov ah, byte ptr es:[bx + 1]             
  024b  8bd3             mov dx, bx                               
  024d  83c306           add bx, 6                                
  0250  ebe5             jmp 0x237                                
  0252  3bd7             cmp dx, di                               
  0254  741b             je 0x271                                 
  0256  8bda             mov bx, dx                               
  0258  26803f00         cmp byte ptr es:[bx], 0                  
  025c  26c607ff         mov byte ptr es:[bx], 0xff               
  0260  06               push es                                  
  0261  7407             je 0x26a                                 
  0263  26ff5f02         lcall es:[bx + 2]                        
  0267  07               pop es                                   
  0268  ebc7             jmp 0x231                                
  026a  26ff5702         call word ptr es:[bx + 2]                
  026e  07               pop es                                   
  026f  ebc0             jmp 0x231                                
  0271  c3               ret                                      

res_0000_0272:  ; ENTRY
  0272  b440             mov ah, 0x40                             
  0274  bb0200           mov bx, 2                                
  0277  cd21             int 0x21                                 
  0279  c3               ret                                      

res_0000_027a:  ; ENTRY
  027a  b91e00           mov cx, 0x1e                             
  027d  ba               db ba                                    resync

res_0000_027e:  ; ENTRY
  027e  3d002e           cmp ax, 0x2e00                           
  0281  8e1e9102         mov ds, word ptr [0x291]                 
  0285  e8eaff           call 0x272                               
  0288  b80300           mov ax, 3                                
  028b  50               push ax                                  
  028c  90               nop                                      
  028d  0e               push cs                                  
  028e  e8451a           call 0x1cd6                              
  0291  0000             add byte ptr [bx + si], al               
  0293  04c0             add al, 0xc0                             
  0295  55               push bp                                  
  0296  8bec             mov bp, sp                               
  0298  1e               push ds                                  
  0299  56               push si                                  
  029a  e8f400           call 0x391                               
  029d  0bc0             or ax, ax                                
  029f  740e             je 0x2af                                 
  02a1  90               nop                                      
  02a2  90               nop                                      
  02a3  90               nop                                      
  02a4  b88806           mov ax, 0x688                            
  02a7  c57606           lds si, ptr [bp + 6]                     
  02aa  cd66             int 0x66                                 
  02ac  b80100           mov ax, 1                                
  02af  5e               pop si                                   
  02b0  1f               pop ds                                   
  02b1  8be5             mov sp, bp                               
  02b3  5d               pop bp                                   
  02b4  cb               retf                                     

res_0000_02b5:  ; ENTRY
  02b5  b88906           mov ax, 0x689                            
  02b8  cd66             int 0x66                                 
  02ba  cb               retf                                     

res_0000_02bb:  ; ENTRY
  02bb  55               push bp                                  
  02bc  8bec             mov bp, sp                               
  02be  1e               push ds                                  
  02bf  56               push si                                  
  02c0  b88a06           mov ax, 0x68a                            
  02c3  c57606           lds si, ptr [bp + 6]                     
  02c6  cd66             int 0x66                                 
  02c8  5e               pop si                                   
  02c9  1f               pop ds                                   
  02ca  8be5             mov sp, bp                               
  02cc  5d               pop bp                                   
  02cd  cb               retf                                     

res_0000_02ce:  ; ENTRY
  02ce  55               push bp                                  
  02cf  8bec             mov bp, sp                               
  02d1  1e               push ds                                  
  02d2  56               push si                                  
  02d3  b88b06           mov ax, 0x68b                            
  02d6  c57606           lds si, ptr [bp + 6]                     
  02d9  cd66             int 0x66                                 
  02db  5e               pop si                                   
  02dc  1f               pop ds                                   
  02dd  8be5             mov sp, bp                               
  02df  5d               pop bp                                   
  02e0  cb               retf                                     
  02e1  55               push bp                                  
  02e2  8bec             mov bp, sp                               
  02e4  1e               push ds                                  
  02e5  56               push si                                  
  02e6  b89406           mov ax, 0x694                            
  02e9  c57606           lds si, ptr [bp + 6]                     
  02ec  cd66             int 0x66                                 
  02ee  5e               pop si                                   
  02ef  1f               pop ds                                   
  02f0  8be5             mov sp, bp                               
  02f2  5d               pop bp                                   
  02f3  cb               retf                                     
  02f4  b88c06           mov ax, 0x68c                            
  02f7  cd66             int 0x66                                 
  02f9  cb               retf                                     
  02fa  55               push bp                                  
  02fb  8bec             mov bp, sp                               
  02fd  06               push es                                  
  02fe  1e               push ds                                  
  02ff  56               push si                                  
  0300  57               push di                                  
  0301  fc               cld                                      
  0302  b88c06           mov ax, 0x68c                            
  0305  cd66             int 0x66                                 
  0307  c47e06           les di, ptr [bp + 6]                     
  030a  8edb             mov ds, bx                               
  030c  8bf1             mov si, cx                               
  030e  b9ffff           mov cx, 0xffff                           
  0311  ac               lodsb al, byte ptr [si]                  
  0312  aa               stosb byte ptr es:[di], al               
  0313  41               inc cx                                   
  0314  0ac0             or al, al                                
  0316  75f9             jne 0x311                                
  0318  8bc1             mov ax, cx                               
  031a  5f               pop di                                   
  031b  5e               pop si                                   
  031c  1f               pop ds                                   
  031d  07               pop es                                   
  031e  8be5             mov sp, bp                               
  0320  5d               pop bp                                   
  0321  cb               retf                                     
  0322  b88d06           mov ax, 0x68d                            
  0325  cd66             int 0x66                                 
  0327  cb               retf                                     
  0328  55               push bp                                  
  0329  8bec             mov bp, sp                               
  032b  8b5e06           mov bx, word ptr [bp + 6]                
  032e  8b5608           mov dx, word ptr [bp + 8]                
  0331  b88e06           mov ax, 0x68e                            
  0334  cd66             int 0x66                                 
  0336  8be5             mov sp, bp                               
  0338  5d               pop bp                                   
  0339  cb               retf                                     
  033a  b88f06           mov ax, 0x68f                            
  033d  cd66             int 0x66                                 
  033f  cb               retf                                     
  0340  55               push bp                                  
  0341  8bec             mov bp, sp                               
  0343  b89006           mov ax, 0x690                            
  0346  8b5e06           mov bx, word ptr [bp + 6]                
  0349  8b4e08           mov cx, word ptr [bp + 8]                
  034c  8b560a           mov dx, word ptr [bp + 0xa]              
  034f  cd66             int 0x66                                 
  0351  8be5             mov sp, bp                               
  0353  5d               pop bp                                   
  0354  cb               retf                                     
  0355  b89106           mov ax, 0x691                            
  0358  cd66             int 0x66                                 
  035a  cb               retf                                     
  035b  b88906           mov ax, 0x689                            
  035e  cd66             int 0x66                                 
  0360  0bc0             or ax, ax                                
  0362  75f7             jne 0x35b                                
  0364  cb               retf                                     
  0365  55               push bp                                  
  0366  8bec             mov bp, sp                               
  0368  1e               push ds                                  
  0369  56               push si                                  
  036a  c57606           lds si, ptr [bp + 6]                     
  036d  b89506           mov ax, 0x695                            
  0370  cd66             int 0x66                                 
  0372  5e               pop si                                   
  0373  1f               pop ds                                   
  0374  8be5             mov sp, bp                               
  0376  5d               pop bp                                   
  0377  cb               retf                                     
  0378  b89606           mov ax, 0x696                            
  037b  cd66             int 0x66                                 
  037d  cb               retf                                     
  037e  55               push bp                                  
  037f  8bec             mov bp, sp                               
  0381  8b5606           mov dx, word ptr [bp + 6]                
  0384  b89706           mov ax, 0x697                            
  0387  cd66             int 0x66                                 
  0389  8be5             mov sp, bp                               
  038b  5d               pop bp                                   
  038c  cb               retf                                     
  038d  e80100           call 0x391                               
  0390  cb               retf                                     

res_0000_0391:  ; ENTRY
  0391  1e               push ds                                  
  0392  56               push si                                  
  0393  be9801           mov si, 0x198                            
  0396  33c0             xor ax, ax                               
  0398  8ed8             mov ds, ax                               
  039a  c534             lds si, ptr [si]                         
  039c  0bf6             or si, si                                
  039e  7443             je 0x3e3                                 
  03a0  90               nop                                      
  03a1  90               nop                                      
  03a2  90               nop                                      
  03a3  83ee06           sub si, 6                                
  03a6  813c4d49         cmp word ptr [si], 0x494d                
  03aa  751e             jne 0x3ca                                
  03ac  90               nop                                      
  03ad  90               nop                                      
  03ae  90               nop                                      
  03af  817c024449       cmp word ptr [si + 2], 0x4944            
  03b4  7514             jne 0x3ca                                
  03b6  90               nop                                      
  03b7  90               nop                                      
  03b8  90               nop                                      
  03b9  b80107           mov ax, 0x701                            
  03bc  cd66             int 0x66                                 
  03be  0bc0             or ax, ax                                
  03c0  751b             jne 0x3dd                                
  03c2  90               nop                                      
  03c3  90               nop                                      
  03c4  90               nop                                      
  03c5  741c             je 0x3e3                                 
  03c7  90               nop                                      
  03c8  90               nop                                      
  03c9  90               nop                                      
  03ca  813c4b45         cmp word ptr [si], 0x454b                
  03ce  7513             jne 0x3e3                                
  03d0  90               nop                                      
  03d1  90               nop                                      
  03d2  90               nop                                      
  03d3  817c02524e       cmp word ptr [si + 2], 0x4e52            
  03d8  7509             jne 0x3e3                                
  03da  90               nop                                      
  03db  90               nop                                      
  03dc  90               nop                                      
  03dd  b80100           mov ax, 1                                
  03e0  5e               pop si                                   
  03e1  1f               pop ds                                   
  03e2  c3               ret                                      
  03e3  33c0             xor ax, ax                               
  03e5  ebf9             jmp 0x3e0                                
  03e7  0000             add byte ptr [bx + si], al               
  03e9  0000             add byte ptr [bx + si], al               
  03eb  0000             add byte ptr [bx + si], al               
  03ed  0002             add byte ptr [bp + si], al               
  03ef  0000             add byte ptr [bx + si], al               
  03f1  0302             add ax, word ptr [bp + si]               
  03f3  0000             add byte ptr [bx + si], al               

res_0000_03f5:  ; ENTRY
  03f5  55               push bp                                  
  03f6  8bec             mov bp, sp                               
  03f8  06               push es                                  
  03f9  1e               push ds                                  
  03fa  56               push si                                  
  03fb  57               push di                                  
  03fc  fc               cld                                      
  03fd  0e               push cs                                  
  03fe  b8eb03           mov ax, 0x3eb                             ; "A Signpost!"
  0401  50               push ax                                  
  0402  33c0             xor ax, ax                               
  0404  50               push ax                                  
  0405  50               push ax                                  
  0406  c45606           les dx, ptr [bp + 6]                     
  0409  06               push es                                  
  040a  52               push dx                                  
  040b  90               nop                                      
  040c  0e               push cs                                  
  040d  e8e702           call 0x6f7                               
  0410  83c40c           add sp, 0xc                              
  0413  0bd2             or dx, dx                                
  0415  7503             jne 0x41a                                
  0417  e98300           jmp 0x49d                                
  041a  2ea3e703         mov word ptr cs:[0x3e7], ax              
  041e  2e8916e903       mov word ptr cs:[0x3e9], dx              
  0423  2ea1eb03         mov ax, word ptr cs:[0x3eb]               ; "A Signpost!"
  0427  8ec0             mov es, ax                               
  0429  2d1000           sub ax, 0x10                             
  042c  26803e030044     cmp byte ptr es:[3], 0x44                
  0432  754e             jne 0x482                                
  0434  90               nop                                      
  0435  90               nop                                      
  0436  90               nop                                      
  0437  26803e040049     cmp byte ptr es:[4], 0x49                
  043d  7543             jne 0x482                                
  043f  90               nop                                      
  0440  90               nop                                      
  0441  90               nop                                      
  0442  26803e050047     cmp byte ptr es:[5], 0x47                
  0448  7538             jne 0x482                                
  044a  90               nop                                      
  044b  90               nop                                      
  044c  90               nop                                      
  044d  26803e060050     cmp byte ptr es:[6], 0x50                
  0453  752d             jne 0x482                                
  0455  90               nop                                      
  0456  90               nop                                      
  0457  90               nop                                      
  0458  26803e070041     cmp byte ptr es:[7], 0x41                
  045e  7522             jne 0x482                                
  0460  90               nop                                      
  0461  90               nop                                      
  0462  90               nop                                      
  0463  26803e08004b     cmp byte ptr es:[8], 0x4b                
  0469  7517             jne 0x482                                
  046b  90               nop                                      
  046c  90               nop                                      
  046d  90               nop                                      
  046e  2ea3ef03         mov word ptr cs:[0x3ef], ax              
  0472  2ea3f303         mov word ptr cs:[0x3f3], ax              
  0476  2eff1eed03       lcall cs:[0x3ed]                         
  047b  0bc0             or ax, ax                                
  047d  741b             je 0x49a                                 
  047f  90               nop                                      
  0480  90               nop                                      
  0481  90               nop                                      
  0482  2eff36eb03       push word ptr cs:[0x3eb]                  ; "A Signpost!"
  0487  33c0             xor ax, ax                               
  0489  50               push ax                                  
  048a  9aea075e15       lcall 0x155e, 0x7ea                      -> 155e:07ea
  048f  83c404           add sp, 4                                
  0492  33c0             xor ax, ax                               
  0494  2ea3eb03         mov word ptr cs:[0x3eb], ax               ; "A Signpost!"
  0498  eb03             jmp 0x49d                                
  049a  b80100           mov ax, 1                                
  049d  5f               pop di                                   
  049e  5e               pop si                                   
  049f  1f               pop ds                                   
  04a0  07               pop es                                   
  04a1  8be5             mov sp, bp                               
  04a3  5d               pop bp                                   
  04a4  cb               retf                                     

res_0000_04a5:  ; ENTRY
  04a5  2e833eeb0300     cmp word ptr cs:[0x3eb], 0                ; "A Signpost!"
  04ab  7421             je 0x4ce                                 
  04ad  90               nop                                      
  04ae  90               nop                                      
  04af  90               nop                                      
  04b0  2eff1ef103       lcall cs:[0x3f1]                         
  04b5  2eff36e903       push word ptr cs:[0x3e9]                 
  04ba  2eff36e703       push word ptr cs:[0x3e7]                 
  04bf  9aea075e15       lcall 0x155e, 0x7ea                      -> 155e:07ea
  04c4  83c404           add sp, 4                                
  04c7  2ec706eb030000   mov word ptr cs:[0x3eb], 0                ; "A Signpost!"
  04ce  cb               retf                                     
  04cf  55               push bp                                  
  04d0  8bec             mov bp, sp                               
  04d2  1e               push ds                                  
  04d3  56               push si                                  
  04d4  57               push di                                  
  04d5  c55606           lds dx, ptr [bp + 6]                     
  04d8  8b460e           mov ax, word ptr [bp + 0xe]              
  04db  0ac0             or al, al                                
  04dd  7513             jne 0x4f2                                
  04df  90               nop                                      
  04e0  90               nop                                      
  04e1  90               nop                                      
  04e2  33c9             xor cx, cx                               
  04e4  b43c             mov ah, 0x3c                             
  04e6  cd21             int 0x21                                 
  04e8  7252             jb 0x53c                                 
  04ea  90               nop                                      
  04eb  90               nop                                      
  04ec  90               nop                                      
  04ed  730e             jae 0x4fd                                
  04ef  90               nop                                      
  04f0  90               nop                                      
  04f1  90               nop                                      
  04f2  b002             mov al, 2                                
  04f4  b43d             mov ah, 0x3d                             
  04f6  cd21             int 0x21                                 
  04f8  7242             jb 0x53c                                 
  04fa  90               nop                                      
  04fb  90               nop                                      
  04fc  90               nop                                      
  04fd  8bd8             mov bx, ax                               
  04ff  b442             mov ah, 0x42                             
  0501  b002             mov al, 2                                
  0503  33c9             xor cx, cx                               
  0505  33d2             xor dx, dx                               
  0507  cd21             int 0x21                                 
  0509  7231             jb 0x53c                                 
  050b  90               nop                                      
  050c  90               nop                                      
  050d  90               nop                                      
  050e  c57e0a           lds di, ptr [bp + 0xa]                   
  0511  0bff             or di, di                                
  0513  750c             jne 0x521                                
  0515  90               nop                                      
  0516  90               nop                                      
  0517  90               nop                                      
  0518  8cd9             mov cx, ds                               
  051a  e30a             jcxz 0x526                               
  051c  90               nop                                      
  051d  90               nop                                      
  051e  90               nop                                      
  051f  90               nop                                      
  0520  90               nop                                      
  0521  8905             mov word ptr [di], ax                    
  0523  895502           mov word ptr [di + 2], dx                
  0526  b442             mov ah, 0x42                             
  0528  32c0             xor al, al                               
  052a  33c9             xor cx, cx                               
  052c  33d2             xor dx, dx                               
  052e  cd21             int 0x21                                 
  0530  720a             jb 0x53c                                 
  0532  90               nop                                      
  0533  90               nop                                      
  0534  90               nop                                      
  0535  8bc3             mov ax, bx                               
  0537  5f               pop di                                   
  0538  5e               pop si                                   
  0539  1f               pop ds                                   
  053a  5d               pop bp                                   
  053b  cb               retf                                     
  053c  33c0             xor ax, ax                               
  053e  5f               pop di                                   
  053f  5e               pop si                                   
  0540  1f               pop ds                                   
  0541  5d               pop bp                                   
  0542  cb               retf                                     
  0543  55               push bp                                  
  0544  8bec             mov bp, sp                               
  0546  b43e             mov ah, 0x3e                             
  0548  8b5e06           mov bx, word ptr [bp + 6]                
  054b  cd21             int 0x21                                 
  054d  7208             jb 0x557                                 
  054f  90               nop                                      
  0550  90               nop                                      
  0551  90               nop                                      
  0552  b80100           mov ax, 1                                
  0555  5d               pop bp                                   
  0556  cb               retf                                     
  0557  33c0             xor ax, ax                               
  0559  5d               pop bp                                   
  055a  cb               retf                                     
  055b  55               push bp                                  
  055c  8bec             mov bp, sp                               
  055e  8b5e06           mov bx, word ptr [bp + 6]                
  0561  b442             mov ah, 0x42                             
  0563  b001             mov al, 1                                
  0565  33c9             xor cx, cx                               
  0567  33d2             xor dx, dx                               
  0569  cd21             int 0x21                                 
  056b  5d               pop bp                                   
  056c  cb               retf                                     
  056d  55               push bp                                  
  056e  8bec             mov bp, sp                               
  0570  8b5e06           mov bx, word ptr [bp + 6]                
  0573  b442             mov ah, 0x42                             
  0575  b000             mov al, 0                                
  0577  8b5608           mov dx, word ptr [bp + 8]                
  057a  8b4e0a           mov cx, word ptr [bp + 0xa]              
  057d  cd21             int 0x21                                 
  057f  7205             jb 0x586                                 
  0581  90               nop                                      
  0582  90               nop                                      
  0583  90               nop                                      
  0584  5d               pop bp                                   
  0585  cb               retf                                     
  0586  33c0             xor ax, ax                               
  0588  33d2             xor dx, dx                               
  058a  5d               pop bp                                   
  058b  cb               retf                                     
  058c  55               push bp                                  
  058d  8bec             mov bp, sp                               
  058f  56               push si                                  
  0590  57               push di                                  
  0591  8b5e0e           mov bx, word ptr [bp + 0xe]              
  0594  1e               push ds                                  
  0595  c55606           lds dx, ptr [bp + 6]                     
  0598  b90080           mov cx, 0x8000                           
  059b  837e0c00         cmp word ptr [bp + 0xc], 0               
  059f  750e             jne 0x5af                                
  05a1  90               nop                                      
  05a2  90               nop                                      
  05a3  90               nop                                      
  05a4  3b4e0a           cmp cx, word ptr [bp + 0xa]              
  05a7  7606             jbe 0x5af                                
  05a9  90               nop                                      
  05aa  90               nop                                      
  05ab  90               nop                                      
  05ac  8b4e0a           mov cx, word ptr [bp + 0xa]              
  05af  b43f             mov ah, 0x3f                             
  05b1  cd21             int 0x21                                 
  05b3  723a             jb 0x5ef                                 
  05b5  90               nop                                      
  05b6  90               nop                                      
  05b7  90               nop                                      
  05b8  3bc8             cmp cx, ax                               
  05ba  7533             jne 0x5ef                                
  05bc  90               nop                                      
  05bd  90               nop                                      
  05be  90               nop                                      
  05bf  294e0a           sub word ptr [bp + 0xa], cx              
  05c2  835e0c00         sbb word ptr [bp + 0xc], 0               
  05c6  8bc1             mov ax, cx                               
  05c8  250f00           and ax, 0xf                              
  05cb  03d0             add dx, ax                               
  05cd  d1e9             shr cx, 1                                
  05cf  d1e9             shr cx, 1                                
  05d1  d1e9             shr cx, 1                                
  05d3  d1e9             shr cx, 1                                
  05d5  8cd8             mov ax, ds                               
  05d7  03c1             add ax, cx                               
  05d9  8ed8             mov ds, ax                               
  05db  837e0a00         cmp word ptr [bp + 0xa], 0               
  05df  75b7             jne 0x598                                
  05e1  837e0c00         cmp word ptr [bp + 0xc], 0               
  05e5  75b1             jne 0x598                                
  05e7  b80100           mov ax, 1                                
  05ea  1f               pop ds                                   
  05eb  5f               pop di                                   
  05ec  5e               pop si                                   
  05ed  5d               pop bp                                   
  05ee  cb               retf                                     
  05ef  33c0             xor ax, ax                               
  05f1  1f               pop ds                                   
  05f2  5f               pop di                                   
  05f3  5e               pop si                                   
  05f4  5d               pop bp                                   
  05f5  cb               retf                                     
  05f6  55               push bp                                  
  05f7  8bec             mov bp, sp                               
  05f9  56               push si                                  
  05fa  57               push di                                  
  05fb  8b5e0e           mov bx, word ptr [bp + 0xe]              
  05fe  1e               push ds                                  
  05ff  c55606           lds dx, ptr [bp + 6]                     
  0602  b90080           mov cx, 0x8000                           
  0605  837e0c00         cmp word ptr [bp + 0xc], 0               
  0609  750e             jne 0x619                                
  060b  90               nop                                      
  060c  90               nop                                      
  060d  90               nop                                      
  060e  3b4e0a           cmp cx, word ptr [bp + 0xa]              
  0611  7606             jbe 0x619                                
  0613  90               nop                                      
  0614  90               nop                                      
  0615  90               nop                                      
  0616  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0619  b440             mov ah, 0x40                             
  061b  cd21             int 0x21                                 
  061d  723a             jb 0x659                                 
  061f  90               nop                                      
  0620  90               nop                                      
  0621  90               nop                                      
  0622  3bc8             cmp cx, ax                               
  0624  7533             jne 0x659                                
  0626  90               nop                                      
  0627  90               nop                                      
  0628  90               nop                                      
  0629  294e0a           sub word ptr [bp + 0xa], cx              
  062c  835e0c00         sbb word ptr [bp + 0xc], 0               
  0630  8bc1             mov ax, cx                               
  0632  250f00           and ax, 0xf                              
  0635  03d0             add dx, ax                               
  0637  d1e9             shr cx, 1                                
  0639  d1e9             shr cx, 1                                
  063b  d1e9             shr cx, 1                                
  063d  d1e9             shr cx, 1                                
  063f  8cd8             mov ax, ds                               
  0641  03c1             add ax, cx                               
  0643  8ed8             mov ds, ax                               
  0645  837e0a00         cmp word ptr [bp + 0xa], 0               
  0649  75b7             jne 0x602                                
  064b  837e0c00         cmp word ptr [bp + 0xc], 0               
  064f  75b1             jne 0x602                                
  0651  b80100           mov ax, 1                                
  0654  1f               pop ds                                   
  0655  5f               pop di                                   
  0656  5e               pop si                                   
  0657  5d               pop bp                                   
  0658  cb               retf                                     
  0659  33c0             xor ax, ax                               
  065b  1f               pop ds                                   
  065c  5f               pop di                                   
  065d  5e               pop si                                   
  065e  5d               pop bp                                   
  065f  cb               retf                                     

res_0000_0660:  ; ENTRY
  0660  55               push bp                                  
  0661  8bec             mov bp, sp                               
  0663  57               push di                                  
  0664  56               push si                                  
  0665  1e               push ds                                  
  0666  8cde             mov si, ds                               
  0668  c55606           lds dx, ptr [bp + 6]                     
  066b  32c0             xor al, al                               
  066d  b43d             mov ah, 0x3d                             
  066f  cd21             int 0x21                                 
  0671  727b             jb 0x6ee                                 
  0673  90               nop                                      
  0674  90               nop                                      
  0675  90               nop                                      
  0676  8bd8             mov bx, ax                               
  0678  b442             mov ah, 0x42                             
  067a  b002             mov al, 2                                
  067c  33c9             xor cx, cx                               
  067e  33d2             xor dx, dx                               
  0680  cd21             int 0x21                                 
  0682  7266             jb 0x6ea                                 
  0684  90               nop                                      
  0685  90               nop                                      
  0686  90               nop                                      
  0687  c57e0a           lds di, ptr [bp + 0xa]                   
  068a  0bff             or di, di                                
  068c  7408             je 0x696                                 
  068e  90               nop                                      
  068f  90               nop                                      
  0690  90               nop                                      
  0691  8905             mov word ptr [di], ax                    
  0693  895502           mov word ptr [di + 2], dx                
  0696  8ede             mov ds, si                               
  0698  8bf3             mov si, bx                               
  069a  52               push dx                                  
  069b  50               push ax                                  
  069c  9ac1075e15       lcall 0x155e, 0x7c1                      -> 155e:07c1
  06a1  83c404           add sp, 4                                
  06a4  8bde             mov bx, si                               
  06a6  0bc0             or ax, ax                                
  06a8  750a             jne 0x6b4                                
  06aa  90               nop                                      
  06ab  90               nop                                      
  06ac  90               nop                                      
  06ad  0bd2             or dx, dx                                
  06af  7439             je 0x6ea                                 
  06b1  90               nop                                      
  06b2  90               nop                                      
  06b3  90               nop                                      
  06b4  8bf8             mov di, ax                               
  06b6  8bf2             mov si, dx                               
  06b8  b442             mov ah, 0x42                             
  06ba  32c0             xor al, al                               
  06bc  33c9             xor cx, cx                               
  06be  33d2             xor dx, dx                               
  06c0  cd21             int 0x21                                 
  06c2  8ede             mov ds, si                               
  06c4  b90080           mov cx, 0x8000                           
  06c7  8bd7             mov dx, di                               
  06c9  b43f             mov ah, 0x3f                             
  06cb  cd21             int 0x21                                 
  06cd  3bc1             cmp ax, cx                               
  06cf  750c             jne 0x6dd                                
  06d1  90               nop                                      
  06d2  90               nop                                      
  06d3  90               nop                                      
  06d4  8cd8             mov ax, ds                               
  06d6  050008           add ax, 0x800                            
  06d9  8ed8             mov ds, ax                               
  06db  ebec             jmp 0x6c9                                
  06dd  b43e             mov ah, 0x3e                             
  06df  cd21             int 0x21                                 
  06e1  8bd6             mov dx, si                               
  06e3  8bc7             mov ax, di                               
  06e5  1f               pop ds                                   
  06e6  5e               pop si                                   
  06e7  5f               pop di                                   
  06e8  5d               pop bp                                   
  06e9  cb               retf                                     
  06ea  b43e             mov ah, 0x3e                             
  06ec  cd21             int 0x21                                 
  06ee  33c0             xor ax, ax                               
  06f0  33d2             xor dx, dx                               
  06f2  1f               pop ds                                   
  06f3  5e               pop si                                   
  06f4  5f               pop di                                   
  06f5  5d               pop bp                                   
  06f6  cb               retf                                     

res_0000_06f7:  ; ENTRY
  06f7  55               push bp                                  
  06f8  8bec             mov bp, sp                               
  06fa  57               push di                                  
  06fb  56               push si                                  
  06fc  1e               push ds                                  
  06fd  8cde             mov si, ds                               
  06ff  c55606           lds dx, ptr [bp + 6]                     
  0702  32c0             xor al, al                               
  0704  b43d             mov ah, 0x3d                             
  0706  cd21             int 0x21                                 
  0708  7303             jae 0x70d                                
  070a  e99a00           jmp 0x7a7                                
  070d  8bd8             mov bx, ax                               
  070f  b442             mov ah, 0x42                             
  0711  b002             mov al, 2                                
  0713  33c9             xor cx, cx                               
  0715  33d2             xor dx, dx                               
  0717  cd21             int 0x21                                 
  0719  7303             jae 0x71e                                
  071b  e98500           jmp 0x7a3                                
  071e  c57e0a           lds di, ptr [bp + 0xa]                   
  0721  0bff             or di, di                                
  0723  7408             je 0x72d                                 
  0725  90               nop                                      
  0726  90               nop                                      
  0727  90               nop                                      
  0728  8905             mov word ptr [di], ax                    
  072a  895502           mov word ptr [di + 2], dx                
  072d  8ede             mov ds, si                               
  072f  8bf3             mov si, bx                               
  0731  051000           add ax, 0x10                             
  0734  83d200           adc dx, 0                                
  0737  52               push dx                                  
  0738  50               push ax                                  
  0739  9ac1075e15       lcall 0x155e, 0x7c1                      -> 155e:07c1
  073e  83c404           add sp, 4                                
  0741  8bde             mov bx, si                               
  0743  0bc0             or ax, ax                                
  0745  750a             jne 0x751                                
  0747  90               nop                                      
  0748  90               nop                                      
  0749  90               nop                                      
  074a  0bd2             or dx, dx                                
  074c  7455             je 0x7a3                                 
  074e  90               nop                                      
  074f  90               nop                                      
  0750  90               nop                                      
  0751  8bf8             mov di, ax                               
  0753  8bf2             mov si, dx                               
  0755  b442             mov ah, 0x42                             
  0757  32c0             xor al, al                               
  0759  33c9             xor cx, cx                               
  075b  33d2             xor dx, dx                               
  075d  cd21             int 0x21                                 
  075f  8ede             mov ds, si                               
  0761  b90080           mov cx, 0x8000                           
  0764  8bd7             mov dx, di                               
  0766  83c20f           add dx, 0xf                              
  0769  83e2f0           and dx, 0xfff0                           
  076c  b43f             mov ah, 0x3f                             
  076e  cd21             int 0x21                                 
  0770  3bc1             cmp ax, cx                               
  0772  750c             jne 0x780                                
  0774  90               nop                                      
  0775  90               nop                                      
  0776  90               nop                                      
  0777  8cd8             mov ax, ds                               
  0779  050008           add ax, 0x800                            
  077c  8ed8             mov ds, ax                               
  077e  ebec             jmp 0x76c                                
  0780  b43e             mov ah, 0x3e                             
  0782  cd21             int 0x21                                 
  0784  8bd6             mov dx, si                               
  0786  8bc7             mov ax, di                               
  0788  050f00           add ax, 0xf                              
  078b  d1e8             shr ax, 1                                
  078d  d1e8             shr ax, 1                                
  078f  d1e8             shr ax, 1                                
  0791  d1e8             shr ax, 1                                
  0793  03c2             add ax, dx                               
  0795  c55e0e           lds bx, ptr [bp + 0xe]                   
  0798  8907             mov word ptr [bx], ax                    
  079a  8bd6             mov dx, si                               
  079c  8bc7             mov ax, di                               
  079e  1f               pop ds                                   
  079f  5e               pop si                                   
  07a0  5f               pop di                                   
  07a1  5d               pop bp                                   
  07a2  cb               retf                                     
  07a3  b43e             mov ah, 0x3e                             
  07a5  cd21             int 0x21                                 
  07a7  33c0             xor ax, ax                               
  07a9  33d2             xor dx, dx                               
  07ab  1f               pop ds                                   
  07ac  5e               pop si                                   
  07ad  5f               pop di                                   
  07ae  5d               pop bp                                   
  07af  cb               retf                                     
  07b0  b401             mov ah, 1                                
  07b2  cd16             int 0x16                                 
  07b4  7506             jne 0x7bc                                
  07b6  90               nop                                      
  07b7  90               nop                                      
  07b8  90               nop                                      
  07b9  33c0             xor ax, ax                               
  07bb  cb               retf                                     
  07bc  b80100           mov ax, 1                                
  07bf  cb               retf                                     
  07c0  b407             mov ah, 7                                
  07c2  cd21             int 0x21                                 
  07c4  32e4             xor ah, ah                               
  07c6  0ac0             or al, al                                
  07c8  750c             jne 0x7d6                                
  07ca  90               nop                                      
  07cb  90               nop                                      
  07cc  90               nop                                      
  07cd  b407             mov ah, 7                                
  07cf  cd21             int 0x21                                 
  07d1  32e4             xor ah, ah                               
  07d3  050001           add ax, 0x100                            
  07d6  cb               retf                                     
  07d7  55               push bp                                  
  07d8  8bec             mov bp, sp                               
  07da  06               push es                                  
  07db  1e               push ds                                  
  07dc  56               push si                                  
  07dd  57               push di                                  
  07de  c47e06           les di, ptr [bp + 6]                     
  07e1  c5760a           lds si, ptr [bp + 0xa]                   
  07e4  ac               lodsb al, byte ptr [si]                  
  07e5  aa               stosb byte ptr es:[di], al               
  07e6  0ac0             or al, al                                
  07e8  75fa             jne 0x7e4                                
  07ea  5f               pop di                                   
  07eb  5e               pop si                                   
  07ec  1f               pop ds                                   
  07ed  07               pop es                                   
  07ee  5d               pop bp                                   
  07ef  cb               retf                                     
  07f0  55               push bp                                  
  07f1  8bec             mov bp, sp                               
  07f3  06               push es                                  
  07f4  1e               push ds                                  
  07f5  56               push si                                  
  07f6  57               push di                                  
  07f7  c47e06           les di, ptr [bp + 6]                     
  07fa  33c0             xor ax, ax                               
  07fc  b9ffff           mov cx, 0xffff                           
  07ff  f2ae             repne scasb al, byte ptr es:[di]         
  0801  4f               dec di                                   
  0802  c5760a           lds si, ptr [bp + 0xa]                   
  0805  ac               lodsb al, byte ptr [si]                  
  0806  aa               stosb byte ptr es:[di], al               
  0807  0ac0             or al, al                                
  0809  75fa             jne 0x805                                
  080b  5f               pop di                                   
  080c  5e               pop si                                   
  080d  1f               pop ds                                   
  080e  07               pop es                                   
  080f  5d               pop bp                                   
  0810  cb               retf                                     
  0811  55               push bp                                  
  0812  8bec             mov bp, sp                               
  0814  8b4606           mov ax, word ptr [bp + 6]                
  0817  8b5608           mov dx, word ptr [bp + 8]                
  081a  d1fa             sar dx, 1                                
  081c  d1d8             rcr ax, 1                                
  081e  d1fa             sar dx, 1                                
  0820  d1d8             rcr ax, 1                                
  0822  d1fa             sar dx, 1                                
  0824  d1d8             rcr ax, 1                                
  0826  d1fa             sar dx, 1                                
  0828  d1d8             rcr ax, 1                                
  082a  0bd2             or dx, dx                                
  082c  750f             jne 0x83d                                
  082e  90               nop                                      
  082f  90               nop                                      
  0830  90               nop                                      
  0831  8bd8             mov bx, ax                               
  0833  43               inc bx                                   
  0834  b448             mov ah, 0x48                             
  0836  cd21             int 0x21                                 
  0838  7305             jae 0x83f                                
  083a  90               nop                                      
  083b  90               nop                                      
  083c  90               nop                                      
  083d  33c0             xor ax, ax                               
  083f  8bd0             mov dx, ax                               
  0841  33c0             xor ax, ax                               
  0843  5d               pop bp                                   
  0844  cb               retf                                     
  0845  55               push bp                                  
  0846  8bec             mov bp, sp                               
  0848  06               push es                                  
  0849  8b5e08           mov bx, word ptr [bp + 8]                
  084c  8ec3             mov es, bx                               
  084e  b449             mov ah, 0x49                             
  0850  cd21             int 0x21                                 
  0852  7306             jae 0x85a                                
  0854  90               nop                                      
  0855  90               nop                                      
  0856  90               nop                                      
  0857  b8ffff           mov ax, 0xffff                           
  085a  07               pop es                                   
  085b  5d               pop bp                                   
  085c  cb               retf                                     
  085d  55               push bp                                  
  085e  8bec             mov bp, sp                               
  0860  1e               push ds                                  
  0861  56               push si                                  
  0862  c57606           lds si, ptr [bp + 6]                     
  0865  b30f             mov bl, 0xf                              
  0867  ac               lodsb al, byte ptr [si]                  
  0868  0ac0             or al, al                                
  086a  7416             je 0x882                                 
  086c  90               nop                                      
  086d  90               nop                                      
  086e  90               nop                                      
  086f  3c0a             cmp al, 0xa                              
  0871  7509             jne 0x87c                                
  0873  90               nop                                      
  0874  90               nop                                      
  0875  90               nop                                      
  0876  b40e             mov ah, 0xe                              
  0878  cd10             int 0x10                                 
  087a  b00d             mov al, 0xd                              
  087c  b40e             mov ah, 0xe                              
  087e  cd10             int 0x10                                 
  0880  ebe5             jmp 0x867                                
  0882  5e               pop si                                   
  0883  1f               pop ds                                   
  0884  5d               pop bp                                   
  0885  cb               retf                                     
  0886  1e               push ds                                  
  0887  33c0             xor ax, ax                               
  0889  8ed8             mov ds, ax                               
  088b  a12000           mov ax, word ptr [0x20]                  
  088e  8b162200         mov dx, word ptr [0x22]                  
  0892  1f               pop ds                                   
  0893  cb               retf                                     
  0894  55               push bp                                  
  0895  8bec             mov bp, sp                               
  0897  fa               cli                                      
  0898  1e               push ds                                  
  0899  33c0             xor ax, ax                               
  089b  8ed8             mov ds, ax                               
  089d  8b4606           mov ax, word ptr [bp + 6]                
  08a0  a32000           mov word ptr [0x20], ax                  
  08a3  8b4608           mov ax, word ptr [bp + 8]                
  08a6  a32200           mov word ptr [0x22], ax                  
  08a9  8b560a           mov dx, word ptr [bp + 0xa]              
  08ac  b036             mov al, 0x36                             
  08ae  e643             out 0x43, al                             
  08b0  eb00             jmp 0x8b2                                
  08b2  8bc2             mov ax, dx                               
  08b4  e640             out 0x40, al                             
  08b6  eb00             jmp 0x8b8                                
  08b8  8ac4             mov al, ah                               
  08ba  e640             out 0x40, al                             
  08bc  fb               sti                                      
  08bd  1f               pop ds                                   
  08be  8be5             mov sp, bp                               
  08c0  5d               pop bp                                   
  08c1  cb               retf                                     
  08c2  55               push bp                                  
  08c3  8bec             mov bp, sp                               
  08c5  1e               push ds                                  
  08c6  c55606           lds dx, ptr [bp + 6]                     
  08c9  b441             mov ah, 0x41                             
  08cb  cd21             int 0x21                                 
  08cd  7307             jae 0x8d6                                
  08cf  90               nop                                      
  08d0  90               nop                                      
  08d1  90               nop                                      
  08d2  33c0             xor ax, ax                               
  08d4  eb03             jmp 0x8d9                                
  08d6  b80100           mov ax, 1                                
  08d9  1f               pop ds                                   
  08da  8be5             mov sp, bp                               
  08dc  5d               pop bp                                   
  08dd  cb               retf                                     
  08de  55               push bp                                  
  08df  8bec             mov bp, sp                               
  08e1  06               push es                                  
  08e2  57               push di                                  
  08e3  c47e06           les di, ptr [bp + 6]                     
  08e6  33c0             xor ax, ax                               
  08e8  b9ffff           mov cx, 0xffff                           
  08eb  f2ae             repne scasb al, byte ptr es:[di]         
  08ed  f7d1             not cx                                   
  08ef  8bc1             mov ax, cx                               
  08f1  48               dec ax                                   
  08f2  5f               pop di                                   
  08f3  07               pop es                                   
  08f4  8be5             mov sp, bp                               
  08f6  5d               pop bp                                   
  08f7  cb               retf                                     
  08f8  55               push bp                                  
  08f9  8bec             mov bp, sp                               
  08fb  06               push es                                  
  08fc  1e               push ds                                  
  08fd  56               push si                                  
  08fe  57               push di                                  
  08ff  fc               cld                                      
  0900  33c0             xor ax, ax                               
  0902  c57606           lds si, ptr [bp + 6]                     
  0905  1e               push ds                                  
  0906  07               pop es                                   
  0907  8bfe             mov di, si                               
  0909  b9ffff           mov cx, 0xffff                           
  090c  33c0             xor ax, ax                               
  090e  f2ae             repne scasb al, byte ptr es:[di]         
  0910  f7d1             not cx                                   
  0912  8bfe             mov di, si                               
  0914  ac               lodsb al, byte ptr [si]                  
  0915  3c61             cmp al, 0x61                             
  0917  7c0c             jl 0x925                                 
  0919  90               nop                                      
  091a  90               nop                                      
  091b  90               nop                                      
  091c  3c7a             cmp al, 0x7a                             
  091e  7f05             jg 0x925                                 
  0920  90               nop                                      
  0921  90               nop                                      
  0922  90               nop                                      
  0923  2c20             sub al, 0x20                             
  0925  aa               stosb byte ptr es:[di], al               
  0926  e2ec             loop 0x914                               
  0928  5f               pop di                                   
  0929  5e               pop si                                   
  092a  1f               pop ds                                   
  092b  07               pop es                                   
  092c  8be5             mov sp, bp                               
  092e  5d               pop bp                                   
  092f  cb               retf                                     
  0930  55               push bp                                  
  0931  8bec             mov bp, sp                               
  0933  06               push es                                  
  0934  1e               push ds                                  
  0935  56               push si                                  
  0936  57               push di                                  
  0937  fc               cld                                      
  0938  c57606           lds si, ptr [bp + 6]                     
  093b  c47e0a           les di, ptr [bp + 0xa]                   
  093e  57               push di                                  
  093f  b9ffff           mov cx, 0xffff                           
  0942  33c0             xor ax, ax                               
  0944  f2ae             repne scasb al, byte ptr es:[di]         
  0946  f7d1             not cx                                   
  0948  5f               pop di                                   
  0949  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  094b  33db             xor bx, bx                               
  094d  8a44ff           mov al, byte ptr [si - 1]                
  0950  268a5dff         mov bl, byte ptr es:[di - 1]             
  0954  2bc3             sub ax, bx                               
  0956  5f               pop di                                   
  0957  5e               pop si                                   
  0958  1f               pop ds                                   
  0959  07               pop es                                   
  095a  8be5             mov sp, bp                               
  095c  5d               pop bp                                   
  095d  cb               retf                                     
  095e  55               push bp                                  
  095f  8bec             mov bp, sp                               
  0961  1e               push ds                                  
  0962  c55606           lds dx, ptr [bp + 6]                     
  0965  32c0             xor al, al                               
  0967  b43d             mov ah, 0x3d                             
  0969  cd21             int 0x21                                 
  096b  7211             jb 0x97e                                 
  096d  90               nop                                      
  096e  90               nop                                      
  096f  90               nop                                      
  0970  8bd8             mov bx, ax                               
  0972  b43e             mov ah, 0x3e                             
  0974  cd21             int 0x21                                 
  0976  b80100           mov ax, 1                                
  0979  1f               pop ds                                   
  097a  8be5             mov sp, bp                               
  097c  5d               pop bp                                   
  097d  cb               retf                                     
  097e  33c0             xor ax, ax                               
  0980  ebf7             jmp 0x979                                
  0982  55               push bp                                  
  0983  8bec             mov bp, sp                               
  0985  06               push es                                  
  0986  1e               push ds                                  
  0987  56               push si                                  
  0988  57               push di                                  
  0989  fc               cld                                      
  098a  c5760c           lds si, ptr [bp + 0xc]                   
  098d  837e0a00         cmp word ptr [bp + 0xa], 0               
  0991  751b             jne 0x9ae                                
  0993  90               nop                                      
  0994  90               nop                                      
  0995  90               nop                                      
  0996  0bf6             or si, si                                
  0998  7503             jne 0x99d                                
  099a  e99e00           jmp 0xa3b                                
  099d  8bfe             mov di, si                               
  099f  1e               push ds                                  
  09a0  07               pop es                                   
  09a1  33c0             xor ax, ax                               
  09a3  b9ffff           mov cx, 0xffff                           
  09a6  f2ae             repne scasb al, byte ptr es:[di]         
  09a8  f7d9             neg cx                                   
  09aa  49               dec cx                                   
  09ab  894e0a           mov word ptr [bp + 0xa], cx              
  09ae  8b4608           mov ax, word ptr [bp + 8]                
  09b1  0bc0             or ax, ax                                
  09b3  7903             jns 0x9b8                                
  09b5  e98300           jmp 0xa3b                                
  09b8  3d1900           cmp ax, 0x19                             
  09bb  7f7e             jg 0xa3b                                 
  09bd  90               nop                                      
  09be  90               nop                                      
  09bf  90               nop                                      
  09c0  8b4606           mov ax, word ptr [bp + 6]                
  09c3  3d4f00           cmp ax, 0x4f                             
  09c6  7f73             jg 0xa3b                                 
  09c8  90               nop                                      
  09c9  90               nop                                      
  09ca  90               nop                                      
  09cb  0bc0             or ax, ax                                
  09cd  7920             jns 0x9ef                                
  09cf  90               nop                                      
  09d0  90               nop                                      
  09d1  90               nop                                      
  09d2  f7d8             neg ax                                   
  09d4  0bf6             or si, si                                
  09d6  7405             je 0x9dd                                 
  09d8  90               nop                                      
  09d9  90               nop                                      
  09da  90               nop                                      
  09db  03f0             add si, ax                               
  09dd  29460a           sub word ptr [bp + 0xa], ax              
  09e0  7859             js 0xa3b                                 
  09e2  90               nop                                      
  09e3  90               nop                                      
  09e4  90               nop                                      
  09e5  7454             je 0xa3b                                 
  09e7  90               nop                                      
  09e8  90               nop                                      
  09e9  90               nop                                      
  09ea  c746060000       mov word ptr [bp + 6], 0                 
  09ef  03460a           add ax, word ptr [bp + 0xa]              
  09f2  48               dec ax                                   
  09f3  3d4f00           cmp ax, 0x4f                             
  09f6  7e0e             jle 0xa06                                
  09f8  90               nop                                      
  09f9  90               nop                                      
  09fa  90               nop                                      
  09fb  2d4f00           sub ax, 0x4f                             
  09fe  29460a           sub word ptr [bp + 0xa], ax              
  0a01  7838             js 0xa3b                                 
  0a03  90               nop                                      
  0a04  90               nop                                      
  0a05  90               nop                                      
  0a06  b800b8           mov ax, 0xb800                           
  0a09  8ec0             mov es, ax                               
  0a0b  b8a000           mov ax, 0xa0                             
  0a0e  f76608           mul word ptr [bp + 8]                    
  0a11  8bf8             mov di, ax                               
  0a13  8b4606           mov ax, word ptr [bp + 6]                
  0a16  d1e0             shl ax, 1                                
  0a18  03f8             add di, ax                               
  0a1a  8b4610           mov ax, word ptr [bp + 0x10]             
  0a1d  8ae0             mov ah, al                               
  0a1f  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0a22  0bf6             or si, si                                
  0a24  7411             je 0xa37                                 
  0a26  90               nop                                      
  0a27  90               nop                                      
  0a28  90               nop                                      
  0a29  ac               lodsb al, byte ptr [si]                  
  0a2a  0ac0             or al, al                                
  0a2c  7409             je 0xa37                                 
  0a2e  90               nop                                      
  0a2f  90               nop                                      
  0a30  90               nop                                      
  0a31  ab               stosw word ptr es:[di], ax               
  0a32  e2f5             loop 0xa29                               
  0a34  eb05             jmp 0xa3b                                
  0a36  90               nop                                      
  0a37  b020             mov al, 0x20                             
  0a39  f3ab             rep stosw word ptr es:[di], ax           
  0a3b  5f               pop di                                   
  0a3c  5e               pop si                                   
  0a3d  1f               pop ds                                   
  0a3e  07               pop es                                   
  0a3f  8be5             mov sp, bp                               
  0a41  5d               pop bp                                   
  0a42  cb               retf                                     
  0a43  55               push bp                                  
  0a44  8bec             mov bp, sp                               
  0a46  06               push es                                  
  0a47  1e               push ds                                  
  0a48  56               push si                                  
  0a49  57               push di                                  
  0a4a  fc               cld                                      
  0a4b  b8a000           mov ax, 0xa0                             
  0a4e  f76608           mul word ptr [bp + 8]                    
  0a51  8bf8             mov di, ax                               
  0a53  8b4606           mov ax, word ptr [bp + 6]                
  0a56  d1e0             shl ax, 1                                
  0a58  03f8             add di, ax                               
  0a5a  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0a5d  b800b8           mov ax, 0xb800                           
  0a60  8ec0             mov es, ax                               
  0a62  8b460c           mov ax, word ptr [bp + 0xc]              
  0a65  47               inc di                                   
  0a66  aa               stosb byte ptr es:[di], al               
  0a67  47               inc di                                   
  0a68  e2fc             loop 0xa66                                ; "%d gp"
  0a6a  5f               pop di                                   
  0a6b  5e               pop si                                   
  0a6c  1f               pop ds                                   
  0a6d  07               pop es                                   
  0a6e  8be5             mov sp, bp                               
  0a70  5d               pop bp                                   
  0a71  cb               retf                                     
  0a72  55               push bp                                  
  0a73  8bec             mov bp, sp                               
  0a75  8b4608           mov ax, word ptr [bp + 8]                
  0a78  8b5606           mov dx, word ptr [bp + 6]                
  0a7b  8af0             mov dh, al                               
  0a7d  b402             mov ah, 2                                
  0a7f  b700             mov bh, 0                                
  0a81  cd10             int 0x10                                 
  0a83  8be5             mov sp, bp                               
  0a85  5d               pop bp                                   
  0a86  cb               retf                                     
  0a87  55               push bp                                  
  0a88  8bec             mov bp, sp                               
  0a8a  06               push es                                  
  0a8b  1e               push ds                                  
  0a8c  56               push si                                  
  0a8d  57               push di                                  
  0a8e  c47e06           les di, ptr [bp + 6]                     
  0a91  c5760a           lds si, ptr [bp + 0xa]                   
  0a94  8b4e0e           mov cx, word ptr [bp + 0xe]              
  0a97  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0a99  5f               pop di                                   
  0a9a  5e               pop si                                   
  0a9b  1f               pop ds                                   
  0a9c  07               pop es                                   
  0a9d  5d               pop bp                                   
  0a9e  cb               retf                                     
  0a9f  55               push bp                                  
  0aa0  8bec             mov bp, sp                               
  0aa2  8b4608           mov ax, word ptr [bp + 8]                
  0aa5  33d2             xor dx, dx                               
  0aa7  d1e0             shl ax, 1                                
  0aa9  d1d2             rcl dx, 1                                
  0aab  d1e0             shl ax, 1                                
  0aad  d1d2             rcl dx, 1                                
  0aaf  d1e0             shl ax, 1                                
  0ab1  d1d2             rcl dx, 1                                
  0ab3  d1e0             shl ax, 1                                
  0ab5  d1d2             rcl dx, 1                                
  0ab7  034606           add ax, word ptr [bp + 6]                
  0aba  83d200           adc dx, 0                                
  0abd  03460a           add ax, word ptr [bp + 0xa]              
  0ac0  13560c           adc dx, word ptr [bp + 0xc]              
  0ac3  50               push ax                                  
  0ac4  d1fa             sar dx, 1                                
  0ac6  d1d8             rcr ax, 1                                
  0ac8  d1fa             sar dx, 1                                
  0aca  d1d8             rcr ax, 1                                
  0acc  d1fa             sar dx, 1                                
  0ace  d1d8             rcr ax, 1                                
  0ad0  d1fa             sar dx, 1                                
  0ad2  d1d8             rcr ax, 1                                
  0ad4  8bd0             mov dx, ax                               
  0ad6  58               pop ax                                   
  0ad7  250f00           and ax, 0xf                              
  0ada  8be5             mov sp, bp                               
  0adc  5d               pop bp                                   
  0add  cb               retf                                     

res_0000_0ade:  ; ENTRY
  0ade  55               push bp                                  
  0adf  8bec             mov bp, sp                               
  0ae1  06               push es                                  
  0ae2  1e               push ds                                  
  0ae3  56               push si                                  
  0ae4  57               push di                                  
  0ae5  fc               cld                                      
  0ae6  c47e06           les di, ptr [bp + 6]                     
  0ae9  57               push di                                  
  0aea  06               push es                                  
  0aeb  1f               pop ds                                   
  0aec  b419             mov ah, 0x19                             
  0aee  cd21             int 0x21                                 
  0af0  0441             add al, 0x41                             
  0af2  aa               stosb byte ptr es:[di], al               
  0af3  b03a             mov al, 0x3a                             
  0af5  aa               stosb byte ptr es:[di], al               
  0af6  b05c             mov al, 0x5c                             
  0af8  aa               stosb byte ptr es:[di], al               
  0af9  32d2             xor dl, dl                               
  0afb  8bf7             mov si, di                               
  0afd  b447             mov ah, 0x47                             
  0aff  cd21             int 0x21                                 
  0b01  5f               pop di                                   
  0b02  b9ffff           mov cx, 0xffff                           
  0b05  33c0             xor ax, ax                               
  0b07  f2ae             repne scasb al, byte ptr es:[di]         
  0b09  f7d1             not cx                                   
  0b0b  49               dec cx                                   
  0b0c  8bc1             mov ax, cx                               
  0b0e  5f               pop di                                   
  0b0f  5e               pop si                                   
  0b10  1f               pop ds                                   
  0b11  07               pop es                                   
  0b12  8be5             mov sp, bp                               
  0b14  5d               pop bp                                   
  0b15  cb               retf                                     
  0b16  55               push bp                                  
  0b17  8bec             mov bp, sp                               
  0b19  06               push es                                  
  0b1a  1e               push ds                                  
  0b1b  56               push si                                  
  0b1c  57               push di                                  
  0b1d  fc               cld                                      
  0b1e  8cc8             mov ax, cs                               
  0b20  2d1000           sub ax, 0x10                             
  0b23  8ed8             mov ds, ax                               
  0b25  8e062c00         mov es, word ptr [0x2c]                  
  0b29  8e1e2c00         mov ds, word ptr [0x2c]                  
  0b2d  33ff             xor di, di                               
  0b2f  b9ffff           mov cx, 0xffff                           
  0b32  b80001           mov ax, 0x100                            
  0b35  81ff0004         cmp di, 0x400                            
  0b39  7d3c             jge 0xb77                                
  0b3b  90               nop                                      
  0b3c  90               nop                                      
  0b3d  90               nop                                      
  0b3e  f2ae             repne scasb al, byte ptr es:[di]         
  0b40  ae               scasb al, byte ptr es:[di]               
  0b41  75f2             jne 0xb35                                
  0b43  86c4             xchg ah, al                              
  0b45  ae               scasb al, byte ptr es:[di]               
  0b46  86c4             xchg ah, al                              
  0b48  75eb             jne 0xb35                                
  0b4a  ae               scasb al, byte ptr es:[di]               
  0b4b  752a             jne 0xb77                                
  0b4d  90               nop                                      
  0b4e  90               nop                                      
  0b4f  90               nop                                      
  0b50  8bf7             mov si, di                               
  0b52  8cc8             mov ax, cs                               
  0b54  8ec0             mov es, ax                               
  0b56  c47e06           les di, ptr [bp + 6]                     
  0b59  57               push di                                  
  0b5a  b94300           mov cx, 0x43                             
  0b5d  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0b5f  33c0             xor ax, ax                               
  0b61  aa               stosb byte ptr es:[di], al               
  0b62  5f               pop di                                   
  0b63  b9ffff           mov cx, 0xffff                           
  0b66  f2ae             repne scasb al, byte ptr es:[di]         
  0b68  f7d1             not cx                                   
  0b6a  06               push es                                  
  0b6b  1f               pop ds                                   
  0b6c  fd               std                                      
  0b6d  b05c             mov al, 0x5c                             
  0b6f  f2ae             repne scasb al, byte ptr es:[di]         
  0b71  fc               cld                                      
  0b72  7411             je 0xb85                                 
  0b74  90               nop                                      
  0b75  90               nop                                      
  0b76  90               nop                                      
  0b77  c44606           les ax, ptr [bp + 6]                     
  0b7a  06               push es                                  
  0b7b  50               push ax                                  
  0b7c  0e               push cs                                  
  0b7d  e85eff           call 0xade                               
  0b80  83c404           add sp, 4                                
  0b83  eb07             jmp 0xb8c                                
  0b85  47               inc di                                   
  0b86  32c0             xor al, al                               
  0b88  aa               stosb byte ptr es:[di], al               
  0b89  41               inc cx                                   
  0b8a  8bc1             mov ax, cx                               
  0b8c  5f               pop di                                   
  0b8d  5e               pop si                                   
  0b8e  1f               pop ds                                   
  0b8f  07               pop es                                   
  0b90  8be5             mov sp, bp                               
  0b92  5d               pop bp                                   
  0b93  cb               retf                                     
  0b94  55               push bp                                  
  0b95  8bec             mov bp, sp                               
  0b97  1e               push ds                                  
  0b98  c57606           lds si, ptr [bp + 6]                     
  0b9b  807c013a         cmp byte ptr [si + 1], 0x3a              
  0b9f  7532             jne 0xbd3                                
  0ba1  90               nop                                      
  0ba2  90               nop                                      
  0ba3  90               nop                                      
  0ba4  ac               lodsb al, byte ptr [si]                  
  0ba5  3c61             cmp al, 0x61                             
  0ba7  720c             jb 0xbb5                                 
  0ba9  90               nop                                      
  0baa  90               nop                                      
  0bab  90               nop                                      
  0bac  3c7a             cmp al, 0x7a                             
  0bae  7705             ja 0xbb5                                 
  0bb0  90               nop                                      
  0bb1  90               nop                                      
  0bb2  90               nop                                      
  0bb3  2c20             sub al, 0x20                             
  0bb5  3c41             cmp al, 0x41                             
  0bb7  722d             jb 0xbe6                                 
  0bb9  90               nop                                      
  0bba  90               nop                                      
  0bbb  90               nop                                      
  0bbc  3c5a             cmp al, 0x5a                             
  0bbe  7726             ja 0xbe6                                 
  0bc0  90               nop                                      
  0bc1  90               nop                                      
  0bc2  90               nop                                      
  0bc3  2c41             sub al, 0x41                             
  0bc5  32e4             xor ah, ah                               
  0bc7  8bd0             mov dx, ax                               
  0bc9  b40e             mov ah, 0xe                              
  0bcb  cd21             int 0x21                                 
  0bcd  7217             jb 0xbe6                                 
  0bcf  90               nop                                      
  0bd0  90               nop                                      
  0bd1  90               nop                                      
  0bd2  46               inc si                                   
  0bd3  8bd6             mov dx, si                               
  0bd5  b43b             mov ah, 0x3b                             
  0bd7  cd21             int 0x21                                 
  0bd9  720b             jb 0xbe6                                 
  0bdb  90               nop                                      
  0bdc  90               nop                                      
  0bdd  90               nop                                      
  0bde  b80100           mov ax, 1                                
  0be1  1f               pop ds                                   
  0be2  8be5             mov sp, bp                               
  0be4  5d               pop bp                                   
  0be5  cb               retf                                     
  0be6  33c0             xor ax, ax                               
  0be8  ebf7             jmp 0xbe1                                
  0bea  55               push bp                                  
  0beb  8bec             mov bp, sp                               
  0bed  06               push es                                  
  0bee  1e               push ds                                  
  0bef  56               push si                                  
  0bf0  57               push di                                  
  0bf1  fc               cld                                      
  0bf2  8cc8             mov ax, cs                               
  0bf4  2d1000           sub ax, 0x10                             
  0bf7  8ed8             mov ds, ax                               
  0bf9  ba8000           mov dx, 0x80                             
  0bfc  b41a             mov ah, 0x1a                             
  0bfe  cd21             int 0x21                                 
  0c00  c55606           lds dx, ptr [bp + 6]                     
  0c03  0bd2             or dx, dx                                
  0c05  750c             jne 0xc13                                
  0c07  90               nop                                      
  0c08  90               nop                                      
  0c09  90               nop                                      
  0c0a  8cd8             mov ax, ds                               
  0c0c  0bc0             or ax, ax                                
  0c0e  7434             je 0xc44                                 
  0c10  90               nop                                      
  0c11  90               nop                                      
  0c12  90               nop                                      
  0c13  33c9             xor cx, cx                               
  0c15  b44e             mov ah, 0x4e                             
  0c17  cd21             int 0x21                                 
  0c19  7307             jae 0xc22                                
  0c1b  90               nop                                      
  0c1c  90               nop                                      
  0c1d  90               nop                                      
  0c1e  33c0             xor ax, ax                               
  0c20  eb03             jmp 0xc25                                
  0c22  b80100           mov ax, 1                                
  0c25  50               push ax                                  
  0c26  8cc8             mov ax, cs                               
  0c28  2d1000           sub ax, 0x10                             
  0c2b  8ed8             mov ds, ax                               
  0c2d  be8000           mov si, 0x80                             
  0c30  8d741e           lea si, [si + 0x1e]                      
  0c33  b90d00           mov cx, 0xd                              
  0c36  c47e0a           les di, ptr [bp + 0xa]                   
  0c39  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0c3b  58               pop ax                                   
  0c3c  5f               pop di                                   
  0c3d  5e               pop si                                   
  0c3e  1f               pop ds                                   
  0c3f  07               pop es                                   
  0c40  8be5             mov sp, bp                               
  0c42  5d               pop bp                                   
  0c43  cb               retf                                     
  0c44  b44f             mov ah, 0x4f                             
  0c46  cd21             int 0x21                                 
  0c48  73d8             jae 0xc22                                
  0c4a  33c0             xor ax, ax                               
  0c4c  ebd7             jmp 0xc25                                

res_0000_0c4e:  ; ENTRY
  0c4e  55               push bp                                  
  0c4f  8bec             mov bp, sp                               
  0c51  b80207           mov ax, 0x702                            
  0c54  8b5e06           mov bx, word ptr [bp + 6]                
  0c57  cd66             int 0x66                                 
  0c59  8be5             mov sp, bp                               
  0c5b  5d               pop bp                                   
  0c5c  cb               retf                                     
  0c5d  55               push bp                                  
  0c5e  8bec             mov bp, sp                               
  0c60  b80307           mov ax, 0x703                            
  0c63  8b5e06           mov bx, word ptr [bp + 6]                
  0c66  8b4e08           mov cx, word ptr [bp + 8]                
  0c69  cd66             int 0x66                                 
  0c6b  8be5             mov sp, bp                               
  0c6d  5d               pop bp                                   
  0c6e  cb               retf                                     

res_0000_0c6f:  ; ENTRY
  0c6f  55               push bp                                  
  0c70  8bec             mov bp, sp                               
  0c72  57               push di                                  
  0c73  56               push si                                  
  0c74  b80407           mov ax, 0x704                            
  0c77  8b5e06           mov bx, word ptr [bp + 6]                
  0c7a  8b4e08           mov cx, word ptr [bp + 8]                
  0c7d  8b760a           mov si, word ptr [bp + 0xa]              
  0c80  8b7e0c           mov di, word ptr [bp + 0xc]              
  0c83  cd66             int 0x66                                 
  0c85  5e               pop si                                   
  0c86  5f               pop di                                   
  0c87  8be5             mov sp, bp                               
  0c89  5d               pop bp                                   
  0c8a  cb               retf                                     

res_0000_0c8b:  ; ENTRY
  0c8b  b80507           mov ax, 0x705                            
  0c8e  cd66             int 0x66                                 
  0c90  cb               retf                                     
  0c91  55               push bp                                  
  0c92  8bec             mov bp, sp                               
  0c94  b80607           mov ax, 0x706                            
  0c97  8b5e06           mov bx, word ptr [bp + 6]                
  0c9a  8b4e08           mov cx, word ptr [bp + 8]                
  0c9d  cd66             int 0x66                                 
  0c9f  8be5             mov sp, bp                               
  0ca1  5d               pop bp                                   
  0ca2  cb               retf                                     
  0ca3  e80100           call 0xca7                               
  0ca6  cb               retf                                     

res_0000_0ca7:  ; ENTRY
  0ca7  1e               push ds                                  
  0ca8  56               push si                                  
  0ca9  be9801           mov si, 0x198                            
  0cac  33c0             xor ax, ax                               
  0cae  8ed8             mov ds, ax                               
  0cb0  c534             lds si, ptr [si]                         
  0cb2  0bf6             or si, si                                
  0cb4  741f             je 0xcd5                                 
  0cb6  90               nop                                      
  0cb7  90               nop                                      
  0cb8  90               nop                                      
  0cb9  83ee06           sub si, 6                                
  0cbc  813c4d49         cmp word ptr [si], 0x494d                
  0cc0  7513             jne 0xcd5                                
  0cc2  90               nop                                      
  0cc3  90               nop                                      
  0cc4  90               nop                                      
  0cc5  817c024449       cmp word ptr [si + 2], 0x4944            
  0cca  7509             jne 0xcd5                                
  0ccc  90               nop                                      
  0ccd  90               nop                                      
  0cce  90               nop                                      
  0ccf  b80100           mov ax, 1                                
  0cd2  5e               pop si                                   
  0cd3  1f               pop ds                                   
  0cd4  c3               ret                                      
  0cd5  33c0             xor ax, ax                               
  0cd7  ebf9             jmp 0xcd2                                
  0cd9  b80107           mov ax, 0x701                            
  0cdc  cd66             int 0x66                                 
  0cde  cb               retf                                     
  0cdf  b80707           mov ax, 0x707                            
  0ce2  cd66             int 0x66                                 
  0ce4  cb               retf                                     
  0ce5  b80807           mov ax, 0x708                            
  0ce8  cd66             int 0x66                                 
  0cea  cb               retf                                     
  0ceb  b80907           mov ax, 0x709                            
  0cee  cd66             int 0x66                                 
  0cf0  cb               retf                                     
  0cf1  b80a07           mov ax, 0x70a                            
  0cf4  cd66             int 0x66                                 
  0cf6  cb               retf                                     

res_0000_0cf7:  ; ENTRY
  0cf7  b80b07           mov ax, 0x70b                            
  0cfa  cd66             int 0x66                                 
  0cfc  cb               retf                                     

res_0000_0cfd:  ; ENTRY
  0cfd  b80c07           mov ax, 0x70c                            
  0d00  cd66             int 0x66                                 
  0d02  cb               retf                                     
  0d03  b80e07           mov ax, 0x70e                            
  0d06  cd66             int 0x66                                 
  0d08  cb               retf                                     

res_0000_0d09:  ; ENTRY
  0d09  55               push bp                                  
  0d0a  8bec             mov bp, sp                               
  0d0c  b80f07           mov ax, 0x70f                            
  0d0f  8b5e06           mov bx, word ptr [bp + 6]                
  0d12  8b4e08           mov cx, word ptr [bp + 8]                
  0d15  cd66             int 0x66                                 
  0d17  8be5             mov sp, bp                               
  0d19  5d               pop bp                                   
  0d1a  cb               retf                                     
  0d1b  55               push bp                                  
  0d1c  8bec             mov bp, sp                               
  0d1e  b80d07           mov ax, 0x70d                            
  0d21  8b5e06           mov bx, word ptr [bp + 6]                
  0d24  8b4e08           mov cx, word ptr [bp + 8]                
  0d27  cd66             int 0x66                                 
  0d29  8be5             mov sp, bp                               
  0d2b  5d               pop bp                                   
  0d2c  cb               retf                                     
  0d2d  0000             add byte ptr [bx + si], al               
  0d2f  0000             add byte ptr [bx + si], al               
  0d31  0000             add byte ptr [bx + si], al               
  0d33  0002             add byte ptr [bp + si], al               
  0d35  0000             add byte ptr [bx + si], al               
  0d37  0302             add ax, word ptr [bp + si]               
  0d39  0000             add byte ptr [bx + si], al               

res_0000_0d3b:  ; ENTRY
  0d3b  55               push bp                                  
  0d3c  8bec             mov bp, sp                               
  0d3e  06               push es                                  
  0d3f  1e               push ds                                  
  0d40  56               push si                                  
  0d41  57               push di                                  
  0d42  fc               cld                                      
  0d43  0e               push cs                                  
  0d44  b8310d           mov ax, 0xd31                            
  0d47  50               push ax                                  
  0d48  33c0             xor ax, ax                               
  0d4a  50               push ax                                  
  0d4b  50               push ax                                  
  0d4c  c45606           les dx, ptr [bp + 6]                     
  0d4f  06               push es                                  
  0d50  52               push dx                                  
  0d51  90               nop                                      
  0d52  0e               push cs                                  
  0d53  e8a1f9           call 0x6f7                               
  0d56  83c40c           add sp, 0xc                              
  0d59  0bd2             or dx, dx                                
  0d5b  7503             jne 0xd60                                
  0d5d  e98300           jmp 0xde3                                
  0d60  2ea32d0d         mov word ptr cs:[0xd2d], ax              
  0d64  2e89162f0d       mov word ptr cs:[0xd2f], dx              
  0d69  2ea1310d         mov ax, word ptr cs:[0xd31]              
  0d6d  8ec0             mov es, ax                               
  0d6f  2d1000           sub ax, 0x10                             
  0d72  26803e03004d     cmp byte ptr es:[3], 0x4d                
  0d78  754e             jne 0xdc8                                
  0d7a  90               nop                                      
  0d7b  90               nop                                      
  0d7c  90               nop                                      
  0d7d  26803e040049     cmp byte ptr es:[4], 0x49                
  0d83  7543             jne 0xdc8                                
  0d85  90               nop                                      
  0d86  90               nop                                      
  0d87  90               nop                                      
  0d88  26803e050044     cmp byte ptr es:[5], 0x44                
  0d8e  7538             jne 0xdc8                                
  0d90  90               nop                                      
  0d91  90               nop                                      
  0d92  90               nop                                      
  0d93  26803e060050     cmp byte ptr es:[6], 0x50                
  0d99  752d             jne 0xdc8                                
  0d9b  90               nop                                      
  0d9c  90               nop                                      
  0d9d  90               nop                                      
  0d9e  26803e070041     cmp byte ptr es:[7], 0x41                
  0da4  7522             jne 0xdc8                                
  0da6  90               nop                                      
  0da7  90               nop                                      
  0da8  90               nop                                      
  0da9  26803e08004b     cmp byte ptr es:[8], 0x4b                
  0daf  7517             jne 0xdc8                                
  0db1  90               nop                                      
  0db2  90               nop                                      
  0db3  90               nop                                      
  0db4  2ea3350d         mov word ptr cs:[0xd35], ax              
  0db8  2ea3390d         mov word ptr cs:[0xd39], ax              
  0dbc  2eff1e330d       lcall cs:[0xd33]                         
  0dc1  0bc0             or ax, ax                                
  0dc3  741b             je 0xde0                                 
  0dc5  90               nop                                      
  0dc6  90               nop                                      
  0dc7  90               nop                                      
  0dc8  2eff36310d       push word ptr cs:[0xd31]                 
  0dcd  33c0             xor ax, ax                               
  0dcf  50               push ax                                  
  0dd0  9aea075e15       lcall 0x155e, 0x7ea                      -> 155e:07ea
  0dd5  83c404           add sp, 4                                
  0dd8  33c0             xor ax, ax                               
  0dda  2ea3310d         mov word ptr cs:[0xd31], ax              
  0dde  eb03             jmp 0xde3                                
  0de0  b80100           mov ax, 1                                
  0de3  5f               pop di                                   
  0de4  5e               pop si                                   
  0de5  1f               pop ds                                   
  0de6  07               pop es                                   
  0de7  8be5             mov sp, bp                               
  0de9  5d               pop bp                                   
  0dea  cb               retf                                     

res_0000_0deb:  ; ENTRY
  0deb  2e833e310d00     cmp word ptr cs:[0xd31], 0               
  0df1  7421             je 0xe14                                 
  0df3  90               nop                                      
  0df4  90               nop                                      
  0df5  90               nop                                      
  0df6  2eff1e370d       lcall cs:[0xd37]                         
  0dfb  2eff362f0d       push word ptr cs:[0xd2f]                 
  0e00  2eff362d0d       push word ptr cs:[0xd2d]                 
  0e05  9aea075e15       lcall 0x155e, 0x7ea                      -> 155e:07ea
  0e0a  83c404           add sp, 4                                
  0e0d  2ec706310d0000   mov word ptr cs:[0xd31], 0               
  0e14  cb               retf                                     

res_0000_0e15:  ; ENTRY
  0e15  55               push bp                                  
  0e16  8bec             mov bp, sp                               
  0e18  06               push es                                  
  0e19  1e               push ds                                  
  0e1a  56               push si                                  
  0e1b  57               push di                                  
  0e1c  fc               cld                                      
  0e1d  8b5e08           mov bx, word ptr [bp + 8]                
  0e20  8b4e06           mov cx, word ptr [bp + 6]                
  0e23  8b560c           mov dx, word ptr [bp + 0xc]              
  0e26  8b760a           mov si, word ptr [bp + 0xa]              
  0e29  b81007           mov ax, 0x710                            
  0e2c  cd66             int 0x66                                 
  0e2e  5f               pop di                                   
  0e2f  5e               pop si                                   
  0e30  1f               pop ds                                   
  0e31  07               pop es                                   
  0e32  8be5             mov sp, bp                               
  0e34  5d               pop bp                                   
  0e35  cb               retf                                     
  0e36  52               push dx                                  
  0e37  756e             jne 0xea7                                
  0e39  7469             je 0xea4                                 
  0e3b  6d               insw word ptr es:[di], dx                
  0e3c  65206f76         and byte ptr gs:[bx + 0x76], ch          
  0e40  65726c           jb 0xeaf                                 
  0e43  61               popaw                                    
  0e44  7920             jns 0xe66                                
  0e46  657272           jb 0xebb                                 
  0e49  6f               outsw dx, word ptr [si]                  
  0e4a  720d             jb 0xe59                                 
  0e4c  0ab91700         or bh, byte ptr [bx + di + 0x17]         
  0e50  ba360e           mov dx, 0xe36                            
  0e53  0e               push cs                                  
  0e54  1f               pop ds                                   
  0e55  b440             mov ah, 0x40                             
  0e57  bb0200           mov bx, 2                                
  0e5a  cd21             int 0x21                                 
  0e5c  b80400           mov ax, 4                                
  0e5f  50               push ax                                  
  0e60  b82531           mov ax, 0x3125                           
  0e63  8ed8             mov ds, ax                               
  0e65  90               nop                                      
  0e66  0e               push cs                                  
  0e67  e86c0e           call 0x1cd6                              
  0e6a  cb               retf                                     
  0e6b  0000             add byte ptr [bx + si], al               
  0e6d  0000             add byte ptr [bx + si], al               
  0e6f  0000             add byte ptr [bx + si], al               
  0e71  0000             add byte ptr [bx + si], al               
  0e73  0000             add byte ptr [bx + si], al               
  0e75  0000             add byte ptr [bx + si], al               
  0e77  0000             add byte ptr [bx + si], al               
  0e79  0000             add byte ptr [bx + si], al               
  0e7b  0000             add byte ptr [bx + si], al               
  0e7d  0000             add byte ptr [bx + si], al               
  0e7f  0000             add byte ptr [bx + si], al               
  0e81  0000             add byte ptr [bx + si], al               
  0e83  0000             add byte ptr [bx + si], al               
  0e85  0000             add byte ptr [bx + si], al               
  0e87  0000             add byte ptr [bx + si], al               
  0e89  0000             add byte ptr [bx + si], al               
  0e8b  0000             add byte ptr [bx + si], al               
  0e8d  0000             add byte ptr [bx + si], al               
  0e8f  0000             add byte ptr [bx + si], al               
  0e91  0000             add byte ptr [bx + si], al               
  0e93  0000             add byte ptr [bx + si], al               
  0e95  0000             add byte ptr [bx + si], al               
  0e97  0000             add byte ptr [bx + si], al               
  0e99  0000             add byte ptr [bx + si], al               
  0e9b  0000             add byte ptr [bx + si], al               
  0e9d  0000             add byte ptr [bx + si], al               
  0e9f  0000             add byte ptr [bx + si], al               
  0ea1  807f5032         cmp byte ptr [bx + 0x50], 0x32           
  0ea5  c0e6f0           shl dh, 0xf0                             
  0ea8  b020             mov al, 0x20                             
  0eaa  e6a0             out 0xa0, al                             
  0eac  e620             out 0x20, al                             
  0eae  58               pop ax                                   
  0eaf  cd02             int 2                                    
  0eb1  cf               iret                                     
  0eb2  50               push ax                                  
  0eb3  b83c38           mov ax, 0x383c                           
  0eb6  9a30047c19       lcall 0x197c, 0x430                      -> 197c:0430
  0ebb  7206             jb 0xec3                                 
  0ebd  58               pop ax                                   
  0ebe  ea00000000       ljmp 0:0                                 
  0ec3  93               xchg bx, ax                              
  0ec4  b82531           mov ax, 0x3125                           
  0ec7  8ed8             mov ds, ax                               
  0ec9  e8ef09           call 0x18bb                              
  0ecc  58               pop ax                                   
  0ecd  cf               iret                                     
  0ece  1e               push ds                                  
  0ecf  56               push si                                  
  0ed0  57               push di                                  
  0ed1  b84400           mov ax, 0x44                             
  0ed4  36a30e00         mov word ptr ss:[0xe], ax                
  0ed8  05c000           add ax, 0xc0                             
  0edb  36a31000         mov word ptr ss:[0x10], ax               
  0edf  a1a138           mov ax, word ptr [0x38a1]                
  0ee2  36a30a00         mov word ptr ss:[0xa], ax                
  0ee6  a0a038           mov al, byte ptr [0x38a0]                
  0ee9  36a20700         mov byte ptr ss:[7], al                  
  0eed  8cc9             mov cx, cs                               
  0eef  32c8             xor cl, al                               
  0ef1  8ed9             mov ds, cx                               
  0ef3  b83435           mov ax, 0x3534                           
  0ef6  b90b00           mov cx, 0xb                              
  0ef9  bf6b0e           mov di, 0xe6b                            
  0efc  cd21             int 0x21                                 
  0efe  891d             mov word ptr [di], bx                    
  0f00  8c4502           mov word ptr [di + 2], es                
  0f03  83c704           add di, 4                                
  0f06  40               inc ax                                   
  0f07  e2f3             loop 0xefc                               
  0f09  b87535           mov ax, 0x3575                           
  0f0c  cd21             int 0x21                                 
  0f0e  891d             mov word ptr [di], bx                    
  0f10  8c4502           mov word ptr [di + 2], es                
  0f13  83c704           add di, 4                                
  0f16  b80235           mov ax, 0x3502                           
  0f19  cd21             int 0x21                                 
  0f1b  891d             mov word ptr [di], bx                    
  0f1d  8c4502           mov word ptr [di + 2], es                
  0f20  891ebf0e         mov word ptr [0xebf], bx                 
  0f24  8c06c10e         mov word ptr [0xec1], es                 
  0f28  b82531           mov ax, 0x3125                           
  0f2b  8ed8             mov ds, ax                               
  0f2d  bbffff           mov bx, 0xffff                           
  0f30  8e067b00         mov es, word ptr [0x7b]                  
  0f34  268e062c00       mov es, word ptr es:[0x2c]               
  0f39  2bff             sub di, di                               
  0f3b  b9ff7f           mov cx, 0x7fff                           
  0f3e  b000             mov al, 0                                
  0f40  fc               cld                                      
  0f41  f2ae             repne scasb al, byte ptr es:[di]         
  0f43  e31f             jcxz 0xf64                               
  0f45  263a05           cmp al, byte ptr es:[di]                 
  0f48  741a             je 0xf64                                 
  0f4a  26813d3837       cmp word ptr es:[di], 0x3738             
  0f4f  75f0             jne 0xf41                                
  0f51  268b5502         mov dx, word ptr es:[di + 2]             
  0f55  80fa3d           cmp dl, 0x3d                             
  0f58  75e7             jne 0xf41                                
  0f5a  43               inc bx                                   
  0f5b  80e6df           and dh, 0xdf                             
  0f5e  80fe59           cmp dh, 0x59                             
  0f61  7501             jne 0xf64                                
  0f63  43               inc bx                                   
  0f64  5f               pop di                                   
  0f65  5e               pop si                                   
  0f66  0bdb             or bx, bx                                
  0f68  7464             je 0xfce                                 
  0f6a  54               push sp                                  
  0f6b  59               pop cx                                   
  0f6c  3bcc             cmp cx, sp                               
  0f6e  7524             jne 0xf94                                
  0f70  0bdb             or bx, bx                                
  0f72  7f06             jg 0xf7a                                 
  0f74  cd11             int 0x11                                 
  0f76  2402             and al, 2                                
  0f78  7452             je 0xfcc                                 
  0f7a  dbe3             fninit                                   
  0f7c  2ed9069f0e       fld dword ptr cs:[0xe9f]                 
  0f81  d9e0             fchs                                     
  0f83  2ed81e9f0e       fcomp dword ptr cs:[0xe9f]               
  0f88  9b               wait                                     
  0f89  dfe0             fnstsw ax                                
  0f8b  9e               sahf                                     
  0f8c  b002             mov al, 2                                
  0f8e  743c             je 0xfcc                                 
  0f90  fec0             inc al                                   
  0f92  eb38             jmp 0xfcc                                
  0f94  dbe3             fninit                                   
  0f96  c70690380000     mov word ptr [0x3890], 0                 
  0f9c  d93e9038         fnstcw word ptr [0x3890]                 
  0fa0  b91400           mov cx, 0x14                             
  0fa3  e2fe             loop 0xfa3                               
  0fa5  8b0e9038         mov cx, word ptr [0x3890]                
  0fa9  81e13f0f         and cx, 0xf3f                            
  0fad  81f93f03         cmp cx, 0x33f                            
  0fb1  7519             jne 0xfcc                                
  0fb3  c7069038ffff     mov word ptr [0x3890], 0xffff            
  0fb9  dd3e9038         fnstsw word ptr [0x3890]                 
  0fbd  b91400           mov cx, 0x14                             
  0fc0  e2fe             loop 0xfc0                               
  0fc2  f7069038bfb8     test word ptr [0x3890], 0xb8bf           
  0fc8  7502             jne 0xfcc                                
  0fca  fec0             inc al                                   
  0fcc  98               cwde                                     
  0fcd  93               xchg bx, ax                              
  0fce  891e9038         mov word ptr [0x3890], bx                
  0fd2  36881e0600       mov byte ptr ss:[6], bl                  
  0fd7  1f               pop ds                                   
  0fd8  1e               push ds                                  
  0fd9  55               push bp                                  
  0fda  8bec             mov bp, sp                               
  0fdc  83ec08           sub sp, 8                                
  0fdf  bb2531           mov bx, 0x3125                           
  0fe2  8edb             mov ds, bx                               
  0fe4  833e903800       cmp word ptr [0x3890], 0                 
  0fe9  c746f80603       mov word ptr [bp - 8], 0x306             
  0fee  c746fa7c19       mov word ptr [bp - 6], 0x197c            
  0ff3  c746fcc603       mov word ptr [bp - 4], 0x3c6             
  0ff8  c746fe7c19       mov word ptr [bp - 2], 0x197c            
  0ffd  7514             jne 0x1013                               
  0fff  c746f85221       mov word ptr [bp - 8], 0x2152            
  1004  c746fa0417       mov word ptr [bp - 6], 0x1704            
  1009  c746fce026       mov word ptr [bp - 4], 0x26e0            
  100e  c746fe0417       mov word ptr [bp - 2], 0x1704            
  1013  b83425           mov ax, 0x2534                           
  1016  b90a00           mov cx, 0xa                              
  1019  c556f8           lds dx, ptr [bp - 8]                     
  101c  cd21             int 0x21                                 
  101e  40               inc ax                                   
  101f  e2fb             loop 0x101c                              
  1021  b83e25           mov ax, 0x253e                           
  1024  c556fc           lds dx, ptr [bp - 4]                     
  1027  cd21             int 0x21                                 
  1029  b80225           mov ax, 0x2502                           
  102c  0e               push cs                                  
  102d  1f               pop ds                                   
  102e  bab20e           mov dx, 0xeb2                            
  1031  cd21             int 0x21                                 
  1033  8edb             mov ds, bx                               
  1035  833e903800       cmp word ptr [0x3890], 0                 
  103a  7414             je 0x1050                                
  103c  a17d00           mov ax, word ptr [0x7d]                  
  103f  86e0             xchg al, ah                              
  1041  3d0314           cmp ax, 0x1403                           
  1044  750a             jne 0x1050                               
  1046  b87525           mov ax, 0x2575                           
  1049  0e               push cs                                  
  104a  1f               pop ds                                   
  104b  baa30e           mov dx, 0xea3                            
  104e  cd21             int 0x21                                 
  1050  cd37             int 0x37                                 
  1052  e336             jcxz 0x108a                              
  1054  c70620000000     mov word ptr [0x20], 0                   
  105a  36c70622000000   mov word ptr ss:[0x22], 0                
  1061  8edb             mov ds, bx                               
  1063  a1a438           mov ax, word ptr [0x38a4]                
  1066  8946f8           mov word ptr [bp - 8], ax                
  1069  833e903803       cmp word ptr [0x3890], 3                 
  106e  7c04             jl 0x1074                                
  1070  834ef802         or word ptr [bp - 8], 2                  
  1074  cd35             int 0x35                                 
  1076  6e               outsb dx, byte ptr [si]                  
  1077  f8               clc                                      
  1078  8b46f8           mov ax, word ptr [bp - 8]                
  107b  3621060200       and word ptr ss:[2], ax                  
  1080  33c0             xor ax, ax                               
  1082  99               cdq                                      
  1083  8be5             mov sp, bp                               
  1085  5d               pop bp                                   
  1086  1f               pop ds                                   
  1087  c3               ret                                      
  1088  1e               push ds                                  
  1089  b82531           mov ax, 0x3125                           
  108c  8ed8             mov ds, ax                               
  108e  833e903800       cmp word ptr [0x3890], 0                 
  1093  7c28             jl 0x10bd                                
  1095  cd37             int 0x37                                 
  1097  e3b8             jcxz 0x1051                              
  1099  3425             xor al, 0x25                             
  109b  bb6b0e           mov bx, 0xe6b                            
  109e  b90b00           mov cx, 0xb                              
  10a1  2ec517           lds dx, ptr cs:[bx]                      
  10a4  cd21             int 0x21                                 
  10a6  83c304           add bx, 4                                
  10a9  40               inc ax                                   
  10aa  e2f5             loop 0x10a1                              
  10ac  b87525           mov ax, 0x2575                           
  10af  2ec517           lds dx, ptr cs:[bx]                      
  10b2  cd21             int 0x21                                 
  10b4  b80225           mov ax, 0x2502                           
  10b7  2ec55704         lds dx, ptr cs:[bx + 4]                  
  10bb  cd21             int 0x21                                 
  10bd  1f               pop ds                                   
  10be  c3               ret                                      

res_0000_10bf:  ; ENTRY
  10bf  b80200           mov ax, 2                                
  10c2  cb               retf                                     
  10c3  55               push bp                                  
  10c4  8bec             mov bp, sp                               
  10c6  83ec04           sub sp, 4                                
  10c9  33c9             xor cx, cx                               
  10cb  b8fe43           mov ax, 0x43fe                           
  10ce  bbcd3b           mov bx, 0x3bcd                           
  10d1  837e1600         cmp word ptr [bp + 0x16], 0              
  10d5  7506             jne 0x10dd                               
  10d7  b87e40           mov ax, 0x407e                           
  10da  bb6a3f           mov bx, 0x3f6a                           
  10dd  8b5614           mov dx, word ptr [bp + 0x14]             
  10e0  d1e2             shl dx, 1                                
  10e2  d1d1             rcl cx, 1                                
  10e4  d1ea             shr dx, 1                                
  10e6  81faff7f         cmp dx, 0x7fff                           
  10ea  7467             je 0x1153                                
  10ec  3bd0             cmp dx, ax                               
  10ee  7408             je 0x10f8                                
  10f0  7e3b             jle 0x112d                               
  10f2  cd39             int 0x39                                 
  10f4  46               inc si                                   
  10f5  04eb             add al, 0xeb                             
  10f7  4c               dec sp                                   
  10f8  cd35             int 0x35                                 
  10fa  7efe             jle 0x10fa                               
  10fc  b8000c           mov ax, 0xc00                            
  10ff  cd3d             int 0x3d                                 
  1101  0b46fe           or ax, word ptr [bp - 2]                 
  1104  8946fc           mov word ptr [bp - 4], ax                
  1107  cd35             int 0x35                                 
  1109  6e               outsb dx, byte ptr [si]                  
  110a  fc               cld                                      
  110b  cd37             int 0x37                                 
  110d  6e               outsb dx, byte ptr [si]                  
  110e  0c83             or al, 0x83                              
  1110  7e16             jle 0x1128                               
  1112  00750a           add byte ptr [di + 0xa], dh              
  1115  cd35             int 0x35                                 
  1117  5e               pop si                                   
  1118  04cd             add al, 0xcd                             
  111a  354604           xor ax, 0x446                            
  111d  eb08             jmp 0x1127                               
  111f  cd39             int 0x39                                 
  1121  5e               pop si                                   
  1122  04cd             add al, 0xcd                             
  1124  394604           cmp word ptr [bp + 4], ax                
  1127  cd35             int 0x35                                 
  1129  6e               outsb dx, byte ptr [si]                  
  112a  fe               db fe                                    
  112b  eb2a             jmp 0x1157                               
  112d  8bc2             mov ax, dx                               
  112f  0b4612           or ax, word ptr [bp + 0x12]              
  1132  0b4610           or ax, word ptr [bp + 0x10]              
  1135  0b460e           or ax, word ptr [bp + 0xe]               
  1138  0b460c           or ax, word ptr [bp + 0xc]               
  113b  7416             je 0x1153                                
  113d  3bd3             cmp dx, bx                               
  113f  7d12             jge 0x1153                               
  1141  cd35             int 0x35                                 
  1143  ee               out dx, al                               
  1144  0bc9             or cx, cx                                
  1146  7403             je 0x114b                                
  1148  cd35             int 0x35                                 
  114a  e0c7             loopne 0x1113                            
  114c  06               push es                                  
  114d  7f00             jg 0x114f                                
  114f  2200             and al, byte ptr [bx + si]               
  1151  eb04             jmp 0x1157                               
  1153  cd37             int 0x37                                 
  1155  6e               outsb dx, byte ptr [si]                  
  1156  0c8b             or al, 0x8b                              
  1158  e55d             in ax, 0x5d                              
  115a  c21400           ret 0x14                                 

res_0000_115d:  ; ENTRY
  115d  55               push bp                                  
  115e  8bec             mov bp, sp                               
  1160  b05f             mov al, 0x5f                             
  1162  22c2             and al, dl                               
  1164  3c47             cmp al, 0x47                             
  1166  750e             jne 0x1176                               
  1168  26807fff30       cmp byte ptr es:[bx - 1], 0x30           
  116d  7507             jne 0x1176                               
  116f  4b               dec bx                                   
  1170  3bd9             cmp bx, cx                               
  1172  77f4             ja 0x1168                                
  1174  eb08             jmp 0x117e                               
  1176  26807fff2e       cmp byte ptr es:[bx - 1], 0x2e           
  117b  7501             jne 0x117e                               
  117d  4b               dec bx                                   
  117e  5d               pop bp                                   
  117f  c3               ret                                      
  1180  55               push bp                                  
  1181  8bec             mov bp, sp                               
  1183  83ec30           sub sp, 0x30                             
  1186  56               push si                                  
  1187  57               push di                                  
  1188  06               push es                                  
  1189  8b460e           mov ax, word ptr [bp + 0xe]              
  118c  3d2800           cmp ax, 0x28                             
  118f  7606             jbe 0x1197                               
  1191  b82800           mov ax, 0x28                             
  1194  89460e           mov word ptr [bp + 0xe], ax              
  1197  8946fc           mov word ptr [bp - 4], ax                
  119a  8a5608           mov dl, byte ptr [bp + 8]                
  119d  80e2df           and dl, 0xdf                             
  11a0  80fa46           cmp dl, 0x46                             
  11a3  750b             jne 0x11b0                               
  11a5  f7d8             neg ax                                   
  11a7  7e10             jle 0x11b9                               
  11a9  2bc0             sub ax, ax                               
  11ab  89460e           mov word ptr [bp + 0xe], ax              
  11ae  eb09             jmp 0x11b9                               
  11b0  0bc0             or ax, ax                                
  11b2  7f05             jg 0x11b9                                
  11b4  b80100           mov ax, 1                                
  11b7  eb09             jmp 0x11c2                               
  11b9  80fa45           cmp dl, 0x45                             
  11bc  7504             jne 0x11c2                               
  11be  40               inc ax                                   
  11bf  ff460e           inc word ptr [bp + 0xe]                  
  11c2  ff7612           push word ptr [bp + 0x12]                
  11c5  ff7610           push word ptr [bp + 0x10]                
  11c8  50               push ax                                  
  11c9  16               push ss                                  
  11ca  8d5efe           lea bx, [bp - 2]                         
  11cd  53               push bx                                  
  11ce  16               push ss                                  
  11cf  8d76d0           lea si, [bp - 0x30]                      
  11d2  56               push si                                  
  11d3  8b4604           mov ax, word ptr [bp + 4]                
  11d6  50               push ax                                  
  11d7  e8d504           call 0x16af                              
  11da  93               xchg bx, ax                              
  11db  c47e0a           les di, ptr [bp + 0xa]                   
  11de  fc               cld                                      
  11df  81fbff7f         cmp bx, 0x7fff                           
  11e3  7408             je 0x11ed                                
  11e5  81fbfe7f         cmp bx, 0x7ffe                           
  11e9  7415             je 0x1200                                
  11eb  eb25             jmp 0x1212                               
  11ed  b82b49           mov ax, 0x492b                           
  11f0  837efe00         cmp word ptr [bp - 2], 0                 
  11f4  7402             je 0x11f8                                
  11f6  40               inc ax                                   
  11f7  40               inc ax                                   
  11f8  ab               stosw word ptr es:[di], ax               
  11f9  b84e46           mov ax, 0x464e                           
  11fc  ab               stosw word ptr es:[di], ax               
  11fd  e90901           jmp 0x1309                               
  1200  b82b4e           mov ax, 0x4e2b                           
  1203  837efe00         cmp word ptr [bp - 2], 0                 
  1207  7402             je 0x120b                                
  1209  40               inc ax                                   
  120a  40               inc ax                                   
  120b  ab               stosw word ptr es:[di], ax               
  120c  b041             mov al, 0x41                             
  120e  ab               stosw word ptr es:[di], ax               
  120f  e9f700           jmp 0x1309                               
  1212  807efe00         cmp byte ptr [bp - 2], 0                 
  1216  7403             je 0x121b                                
  1218  b02d             mov al, 0x2d                             
  121a  aa               stosb byte ptr es:[di], al               
  121b  8a5608           mov dl, byte ptr [bp + 8]                
  121e  80e25f           and dl, 0x5f                             
  1221  80fa46           cmp dl, 0x46                             
  1224  7416             je 0x123c                                
  1226  80fa45           cmp dl, 0x45                             
  1229  7473             je 0x129e                                
  122b  83fbfd           cmp bx, -3                               
  122e  7c6e             jl 0x129e                                
  1230  8b460e           mov ax, word ptr [bp + 0xe]              
  1233  0bc0             or ax, ax                                
  1235  7501             jne 0x1238                               
  1237  40               inc ax                                   
  1238  3bd8             cmp bx, ax                               
  123a  7f62             jg 0x129e                                
  123c  83fb28           cmp bx, 0x28                             
  123f  7f5d             jg 0x129e                                
  1241  0bdb             or bx, bx                                
  1243  7f0f             jg 0x1254                                
  1245  b8302e           mov ax, 0x2e30                           
  1248  ab               stosw word ptr es:[di], ax               
  1249  b90100           mov cx, 1                                
  124c  7409             je 0x1257                                
  124e  b030             mov al, 0x30                             
  1250  aa               stosb byte ptr es:[di], al               
  1251  43               inc bx                                   
  1252  75fc             jne 0x1250                               
  1254  b90000           mov cx, 0                                
  1257  36ac             lodsb al, byte ptr ss:[si]               
  1259  0ac0             or al, al                                
  125b  740a             je 0x1267                                
  125d  aa               stosb byte ptr es:[di], al               
  125e  4b               dec bx                                   
  125f  75f6             jne 0x1257                               
  1261  b02e             mov al, 0x2e                             
  1263  aa               stosb byte ptr es:[di], al               
  1264  41               inc cx                                   
  1265  ebf0             jmp 0x1257                               
  1267  8b460e           mov ax, word ptr [bp + 0xe]              
  126a  034efc           add cx, word ptr [bp - 4]                
  126d  3bc1             cmp ax, cx                               
  126f  760d             jbe 0x127e                               
  1271  2bc1             sub ax, cx                               
  1273  8bc8             mov cx, ax                               
  1275  03d8             add bx, ax                               
  1277  b030             mov al, 0x30                             
  1279  f3aa             rep stosb byte ptr es:[di], al           
  127b  4b               dec bx                                   
  127c  7416             je 0x1294                                
  127e  4b               dec bx                                   
  127f  7413             je 0x1294                                
  1281  807e0600         cmp byte ptr [bp + 6], 0                 
  1285  750d             jne 0x1294                               
  1287  8a5608           mov dl, byte ptr [bp + 8]                
  128a  8b4e0a           mov cx, word ptr [bp + 0xa]              
  128d  87df             xchg di, bx                              
  128f  e8cbfe           call 0x115d                              
  1292  87fb             xchg bx, di                              
  1294  3b7e0a           cmp di, word ptr [bp + 0xa]              
  1297  7503             jne 0x129c                               
  1299  b030             mov al, 0x30                             
  129b  aa               stosb byte ptr es:[di], al               
  129c  eb6b             jmp 0x1309                               
  129e  36ad             lodsw ax, word ptr ss:[si]               
  12a0  aa               stosb byte ptr es:[di], al               
  12a1  b02e             mov al, 0x2e                             
  12a3  0ae4             or ah, ah                                
  12a5  7509             jne 0x12b0                               
  12a7  807e0600         cmp byte ptr [bp + 6], 0                 
  12ab  7420             je 0x12cd                                
  12ad  aa               stosb byte ptr es:[di], al               
  12ae  eb1d             jmp 0x12cd                               
  12b0  aa               stosb byte ptr es:[di], al               
  12b1  8ac4             mov al, ah                               
  12b3  aa               stosb byte ptr es:[di], al               
  12b4  36ac             lodsb al, byte ptr ss:[si]               
  12b6  0ac0             or al, al                                
  12b8  75f9             jne 0x12b3                               
  12ba  807e0600         cmp byte ptr [bp + 6], 0                 
  12be  750d             jne 0x12cd                               
  12c0  8a5608           mov dl, byte ptr [bp + 8]                
  12c3  8b4e0a           mov cx, word ptr [bp + 0xa]              
  12c6  87df             xchg di, bx                              
  12c8  e892fe           call 0x115d                              
  12cb  87fb             xchg bx, di                              
  12cd  b020             mov al, 0x20                             
  12cf  224608           and al, byte ptr [bp + 8]                
  12d2  0c45             or al, 0x45                              
  12d4  aa               stosb byte ptr es:[di], al               
  12d5  b82b2d           mov ax, 0x2d2b                           
  12d8  4b               dec bx                                   
  12d9  7d04             jge 0x12df                               
  12db  86c4             xchg ah, al                              
  12dd  f7db             neg bx                                   
  12df  aa               stosb byte ptr es:[di], al               
  12e0  93               xchg bx, ax                              
  12e1  b93030           mov cx, 0x3030                           
  12e4  3d6300           cmp ax, 0x63                             
  12e7  7619             jbe 0x1302                               
  12e9  3de703           cmp ax, 0x3e7                            
  12ec  760a             jbe 0x12f8                               
  12ee  99               cdq                                      
  12ef  bbe803           mov bx, 0x3e8                            
  12f2  f7f3             div bx                                   
  12f4  02c1             add al, cl                               
  12f6  aa               stosb byte ptr es:[di], al               
  12f7  92               xchg dx, ax                              
  12f8  b364             mov bl, 0x64                             
  12fa  f6f3             div bl                                   
  12fc  02c1             add al, cl                               
  12fe  aa               stosb byte ptr es:[di], al               
  12ff  86c4             xchg ah, al                              
  1301  98               cwde                                     
  1302  b30a             mov bl, 0xa                              
  1304  f6f3             div bl                                   
  1306  03c1             add ax, cx                               
  1308  ab               stosw word ptr es:[di], ax               
  1309  32c0             xor al, al                               
  130b  aa               stosb byte ptr es:[di], al               
  130c  07               pop es                                   
  130d  5f               pop di                                   
  130e  5e               pop si                                   
  130f  8be5             mov sp, bp                               
  1311  5d               pop bp                                   
  1312  c21000           ret 0x10                                 
  1315  55               push bp                                  
  1316  8bec             mov bp, sp                               
  1318  5d               pop bp                                   
  1319  c3               ret                                      
  131a  55               push bp                                  
  131b  8bec             mov bp, sp                               
  131d  83ec18           sub sp, 0x18                             
  1320  56               push si                                  
  1321  57               push di                                  
  1322  c646fb00         mov byte ptr [bp - 5], 0                 
  1326  c646fa01         mov byte ptr [bp - 6], 1                 
  132a  c646f900         mov byte ptr [bp - 7], 0                 
  132e  c646f800         mov byte ptr [bp - 8], 0                 
  1332  c646f700         mov byte ptr [bp - 9], 0                 
  1336  c746f40000       mov word ptr [bp - 0xc], 0               
  133b  c746f20100       mov word ptr [bp - 0xe], 1               
  1340  cd35             int 0x35                                 
  1342  ee               out dx, al                               
  1343  cd37             int 0x37                                 
  1345  7ee8             jle 0x132f                               
  1347  cd3d             int 0x3d                                 
  1349  be0080           mov si, 0x8000                           
  134c  bffeff           mov di, 0xfffe                           
  134f  ff46f4           inc word ptr [bp - 0xc]                  
  1352  ff760a           push word ptr [bp + 0xa]                 
  1355  ff7608           push word ptr [bp + 8]                   
  1358  ff5604           call word ptr [bp + 4]                   
  135b  59               pop cx                                   
  135c  59               pop cx                                   
  135d  0bc0             or ax, ax                                
  135f  7d03             jge 0x1364                               
  1361  e98100           jmp 0x13e5                               
  1364  98               cwde                                     
  1365  93               xchg bx, ax                              
  1366  f6c380           test bl, 0x80                            
  1369  7507             jne 0x1372                               
  136b  f6875f3a01       test byte ptr [bx + 0x3a5f], 1           
  1370  75dd             jne 0x134f                               
  1372  93               xchg bx, ax                              
  1373  ff4e0c           dec word ptr [bp + 0xc]                  
  1376  7c68             jl 0x13e0                                
  1378  3c2b             cmp al, 0x2b                             
  137a  7407             je 0x1383                                
  137c  3c2d             cmp al, 0x2d                             
  137e  7535             jne 0x13b5                               
  1380  fe46fb           inc byte ptr [bp - 5]                    
  1383  fe46f9           inc byte ptr [bp - 7]                    
  1386  ff4e0c           dec word ptr [bp + 0xc]                  
  1389  7c55             jl 0x13e0                                
  138b  ff46f4           inc word ptr [bp - 0xc]                  
  138e  ff760a           push word ptr [bp + 0xa]                 
  1391  ff7608           push word ptr [bp + 8]                   
  1394  ff5604           call word ptr [bp + 4]                   
  1397  59               pop cx                                   
  1398  59               pop cx                                   
  1399  807efa01         cmp byte ptr [bp - 6], 1                 
  139d  7516             jne 0x13b5                               
  139f  807ef900         cmp byte ptr [bp - 7], 0                 
  13a3  7410             je 0x13b5                                
  13a5  3c49             cmp al, 0x49                             
  13a7  7406             je 0x13af                                
  13a9  3c4e             cmp al, 0x4e                             
  13ab  7405             je 0x13b2                                
  13ad  eb06             jmp 0x13b5                               
  13af  e9df01           jmp 0x1591                               
  13b2  e91e02           jmp 0x15d3                               
  13b5  c646fa00         mov byte ptr [bp - 6], 0                 
  13b9  3c2e             cmp al, 0x2e                             
  13bb  7432             je 0x13ef                                
  13bd  3c39             cmp al, 0x39                             
  13bf  772b             ja 0x13ec                                
  13c1  3c30             cmp al, 0x30                             
  13c3  7227             jb 0x13ec                                
  13c5  2c30             sub al, 0x30                             
  13c7  98               cwde                                     
  13c8  47               inc di                                   
  13c9  7f34             jg 0x13ff                                
  13cb  8846e8           mov byte ptr [bp - 0x18], al             
  13ce  bf0100           mov di, 1                                
  13d1  0ac0             or al, al                                
  13d3  75b1             jne 0x1386                               
  13d5  f7df             neg di                                   
  13d7  81fe0080         cmp si, 0x8000                           
  13db  74a9             je 0x1386                                
  13dd  4e               dec si                                   
  13de  eba6             jmp 0x1386                               
  13e0  b065             mov al, 0x65                             
  13e2  e99000           jmp 0x1475                               
  13e5  c746f2ffff       mov word ptr [bp - 0xe], 0xffff          
  13ea  eb6d             jmp 0x1459                               
  13ec  e98600           jmp 0x1475                               
  13ef  81fe0080         cmp si, 0x8000                           
  13f3  75ed             jne 0x13e2                               
  13f5  2bf6             sub si, si                               
  13f7  0bff             or di, di                                
  13f9  7e8b             jle 0x1386                               
  13fb  8bf7             mov si, di                               
  13fd  eb87             jmp 0x1386                               
  13ff  83ff05           cmp di, 5                                
  1402  7714             ja 0x1418                                
  1404  93               xchg bx, ax                              
  1405  b80a00           mov ax, 0xa                              
  1408  f766e8           mul word ptr [bp - 0x18]                 
  140b  03c3             add ax, bx                               
  140d  12d6             adc dl, dh                               
  140f  8946e8           mov word ptr [bp - 0x18], ax             
  1412  8956ea           mov word ptr [bp - 0x16], dx             
  1415  e96eff           jmp 0x1386                               
  1418  83ff12           cmp di, 0x12                             
  141b  7734             ja 0x1451                                
  141d  93               xchg bx, ax                              
  141e  b80a00           mov ax, 0xa                              
  1421  f766ee           mul word ptr [bp - 0x12]                 
  1424  8946ee           mov word ptr [bp - 0x12], ax             
  1427  b80a00           mov ax, 0xa                              
  142a  f766ec           mul word ptr [bp - 0x14]                 
  142d  8946ec           mov word ptr [bp - 0x14], ax             
  1430  52               push dx                                  
  1431  b80a00           mov ax, 0xa                              
  1434  f766ea           mul word ptr [bp - 0x16]                 
  1437  8946ea           mov word ptr [bp - 0x16], ax             
  143a  52               push dx                                  
  143b  b80a00           mov ax, 0xa                              
  143e  f766e8           mul word ptr [bp - 0x18]                 
  1441  03c3             add ax, bx                               
  1443  8946e8           mov word ptr [bp - 0x18], ax             
  1446  1156ea           adc word ptr [bp - 0x16], dx             
  1449  5a               pop dx                                   
  144a  1156ec           adc word ptr [bp - 0x14], dx             
  144d  5a               pop dx                                   
  144e  1156ee           adc word ptr [bp - 0x12], dx             
  1451  e932ff           jmp 0x1386                               
  1454  c746f20000       mov word ptr [bp - 0xe], 0               
  1459  837e0c00         cmp word ptr [bp + 0xc], 0               
  145d  7c10             jl 0x146f                                
  145f  ff760a           push word ptr [bp + 0xa]                 
  1462  ff7608           push word ptr [bp + 8]                   
  1465  50               push ax                                  
  1466  ff5606           call word ptr [bp + 6]                   
  1469  83c406           add sp, 6                                
  146c  ff4ef4           dec word ptr [bp - 0xc]                  
  146f  cd35             int 0x35                                 
  1471  ee               out dx, al                               
  1472  e9fe00           jmp 0x1573                               
  1475  83fffe           cmp di, -2                               
  1478  74da             je 0x1454                                
  147a  81fe0080         cmp si, 0x8000                           
  147e  7502             jne 0x1482                               
  1480  8bf7             mov si, di                               
  1482  897efc           mov word ptr [bp - 4], di                
  1485  8976fe           mov word ptr [bp - 2], si                
  1488  2bff             sub di, di                               
  148a  3c45             cmp al, 0x45                             
  148c  7404             je 0x1492                                
  148e  3c65             cmp al, 0x65                             
  1490  7552             jne 0x14e4                               
  1492  ff4e0c           dec word ptr [bp + 0xc]                  
  1495  7c5d             jl 0x14f4                                
  1497  ff46f4           inc word ptr [bp - 0xc]                  
  149a  ff760a           push word ptr [bp + 0xa]                 
  149d  ff7608           push word ptr [bp + 8]                   
  14a0  ff5604           call word ptr [bp + 4]                   
  14a3  59               pop cx                                   
  14a4  59               pop cx                                   
  14a5  3c2b             cmp al, 0x2b                             
  14a7  7407             je 0x14b0                                
  14a9  3c2d             cmp al, 0x2d                             
  14ab  7516             jne 0x14c3                               
  14ad  fe46f8           inc byte ptr [bp - 8]                    
  14b0  ff4e0c           dec word ptr [bp + 0xc]                  
  14b3  7c3f             jl 0x14f4                                
  14b5  ff46f4           inc word ptr [bp - 0xc]                  
  14b8  ff760a           push word ptr [bp + 0xa]                 
  14bb  ff7608           push word ptr [bp + 8]                   
  14be  ff5604           call word ptr [bp + 4]                   
  14c1  59               pop cx                                   
  14c2  59               pop cx                                   
  14c3  3c39             cmp al, 0x39                             
  14c5  771d             ja 0x14e4                                
  14c7  2c30             sub al, 0x30                             
  14c9  7217             jb 0x14e2                                
  14cb  98               cwde                                     
  14cc  97               xchg di, ax                              
  14cd  ba0a00           mov dx, 0xa                              
  14d0  f7e2             mul dx                                   
  14d2  03f8             add di, ax                               
  14d4  81ff4413         cmp di, 0x1344                           
  14d8  7ed6             jle 0x14b0                               
  14da  33ff             xor di, di                               
  14dc  c646f701         mov byte ptr [bp - 9], 1                 
  14e0  ebce             jmp 0x14b0                               
  14e2  0430             add al, 0x30                             
  14e4  ff760a           push word ptr [bp + 0xa]                 
  14e7  ff7608           push word ptr [bp + 8]                   
  14ea  50               push ax                                  
  14eb  ff5606           call word ptr [bp + 6]                   
  14ee  83c406           add sp, 6                                
  14f1  ff4ef4           dec word ptr [bp - 0xc]                  
  14f4  f646f8ff         test byte ptr [bp - 8], 0xff             
  14f8  7405             je 0x14ff                                
  14fa  f7df             neg di                                   
  14fc  f65ef7           neg byte ptr [bp - 9]                    
  14ff  8b5efc           mov bx, word ptr [bp - 4]                
  1502  0bdb             or bx, bx                                
  1504  7d05             jge 0x150b                               
  1506  cd35             int 0x35                                 
  1508  ee               out dx, al                               
  1509  eb68             jmp 0x1573                               
  150b  8b4efe           mov cx, word ptr [bp - 2]                
  150e  8bc1             mov ax, cx                               
  1510  03c7             add ax, di                               
  1512  807ef701         cmp byte ptr [bp - 9], 1                 
  1516  740b             je 0x1523                                
  1518  807ef7ff         cmp byte ptr [bp - 9], 0xff              
  151c  7524             jne 0x1542                               
  151e  cd35             int 0x35                                 
  1520  ee               out dx, al                               
  1521  eb18             jmp 0x153b                               
  1523  b8ffff           mov ax, 0xffff                           
  1526  8946e8           mov word ptr [bp - 0x18], ax             
  1529  8946ea           mov word ptr [bp - 0x16], ax             
  152c  8946ec           mov word ptr [bp - 0x14], ax             
  152f  8946ee           mov word ptr [bp - 0x12], ax             
  1532  c746f0fe7f       mov word ptr [bp - 0x10], 0x7ffe         
  1537  cd37             int 0x37                                 
  1539  6e               outsb dx, byte ptr [si]                  
  153a  e8c746           call 0x5c04                              
  153d  f20200           add al, byte ptr [bx + si]               
  1540  eb31             jmp 0x1573                               
  1542  8bc3             mov ax, bx                               
  1544  83fb12           cmp bx, 0x12                             
  1547  7603             jbe 0x154c                               
  1549  bb1200           mov bx, 0x12                             
  154c  03c1             add ax, cx                               
  154e  2bcb             sub cx, bx                               
  1550  03f9             add di, cx                               
  1552  cd3b             int 0x3b                                 
  1554  6e               outsb dx, byte ptr [si]                  
  1555  e88bc7           call 0xffffdce3                          
  1558  0bc0             or ax, ax                                
  155a  7417             je 0x1573                                
  155c  7d02             jge 0x1560                               
  155e  f7d8             neg ax                                   
  1560  50               push ax                                  
  1561  90               nop                                      
  1562  0e               push cs                                  
  1563  e8cf04           call 0x1a35                              
  1566  58               pop ax                                   
  1567  0bff             or di, di                                
  1569  7d05             jge 0x1570                               
  156b  cd3a             int 0x3a                                 
  156d  f9               stc                                      
  156e  eb03             jmp 0x1573                               
  1570  cd3a             int 0x3a                                 
  1572  c9               leave                                    
  1573  807efb00         cmp byte ptr [bp - 5], 0                 
  1577  7403             je 0x157c                                
  1579  cd35             int 0x35                                 
  157b  e0c4             loopne 0x1541                            
  157d  7e0e             jle 0x158d                               
  157f  8b5ef4           mov bx, word ptr [bp - 0xc]              
  1582  26011d           add word ptr es:[di], bx                 
  1585  c47e12           les di, ptr [bp + 0x12]                  
  1588  8b5ef2           mov bx, word ptr [bp - 0xe]              
  158b  26891d           mov word ptr es:[di], bx                 
  158e  e98e00           jmp 0x161f                               
  1591  ff46f4           inc word ptr [bp - 0xc]                  
  1594  ff760a           push word ptr [bp + 0xa]                 
  1597  ff7608           push word ptr [bp + 8]                   
  159a  ff5604           call word ptr [bp + 4]                   
  159d  59               pop cx                                   
  159e  59               pop cx                                   
  159f  ff4e0c           dec word ptr [bp + 0xc]                  
  15a2  7c73             jl 0x1617                                
  15a4  3c4e             cmp al, 0x4e                             
  15a6  756f             jne 0x1617                               
  15a8  ff46f4           inc word ptr [bp - 0xc]                  
  15ab  ff760a           push word ptr [bp + 0xa]                 
  15ae  ff7608           push word ptr [bp + 8]                   
  15b1  ff5604           call word ptr [bp + 4]                   
  15b4  59               pop cx                                   
  15b5  59               pop cx                                   
  15b6  ff4e0c           dec word ptr [bp + 0xc]                  
  15b9  7c5c             jl 0x1617                                
  15bb  3c46             cmp al, 0x46                             
  15bd  7558             jne 0x1617                               
  15bf  807efb00         cmp byte ptr [bp - 5], 0                 
  15c3  7407             je 0x15cc                                
  15c5  cd35             int 0x35                                 
  15c7  06               push es                                  
  15c8  1239             adc bh, byte ptr [bx + di]               
  15ca  ebb0             jmp 0x157c                               
  15cc  cd35             int 0x35                                 
  15ce  06               push es                                  
  15cf  0e               push cs                                  
  15d0  39eb             cmp bx, bp                               
  15d2  a9ff46           test ax, 0x46ff                          
  15d5  f4               hlt                                      
  15d6  ff760a           push word ptr [bp + 0xa]                 
  15d9  ff7608           push word ptr [bp + 8]                   
  15dc  ff5604           call word ptr [bp + 4]                   
  15df  59               pop cx                                   
  15e0  59               pop cx                                   
  15e1  ff4e0c           dec word ptr [bp + 0xc]                  
  15e4  7c31             jl 0x1617                                
  15e6  3c41             cmp al, 0x41                             
  15e8  752d             jne 0x1617                               
  15ea  ff46f4           inc word ptr [bp - 0xc]                  
  15ed  ff760a           push word ptr [bp + 0xa]                 
  15f0  ff7608           push word ptr [bp + 8]                   
  15f3  ff5604           call word ptr [bp + 4]                   
  15f6  59               pop cx                                   
  15f7  59               pop cx                                   
  15f8  ff4e0c           dec word ptr [bp + 0xc]                  
  15fb  7c1a             jl 0x1617                                
  15fd  3c4e             cmp al, 0x4e                             
  15ff  7516             jne 0x1617                               
  1601  807efb00         cmp byte ptr [bp - 5], 0                 
  1605  7408             je 0x160f                                
  1607  cd35             int 0x35                                 
  1609  06               push es                                  
  160a  1a39             sbb bh, byte ptr [bx + di]               
  160c  e96dff           jmp 0x157c                               
  160f  cd35             int 0x35                                 
  1611  06               push es                                  
  1612  16               push ss                                  
  1613  39e9             cmp cx, bp                               
  1615  65ffc7           inc di                                   
  1618  46               inc si                                   
  1619  f20000           add byte ptr [bx + si], al               
  161c  e935fe           jmp 0x1454                               
  161f  5f               pop di                                   
  1620  5e               pop si                                   
  1621  8be5             mov sp, bp                               
  1623  5d               pop bp                                   
  1624  c3               ret                                      
  1625  55               push bp                                  
  1626  8bec             mov bp, sp                               
  1628  cd39             int 0x39                                 
  162a  d85dc3           fcomp dword ptr [di - 0x3d]              
  162d  55               push bp                                  
  162e  8bec             mov bp, sp                               
  1630  83ec0a           sub sp, 0xa                              
  1633  56               push si                                  
  1634  8b7608           mov si, word ptr [bp + 8]                
  1637  cd37             int 0x37                                 
  1639  7ef6             jle 0x1631                               
  163b  f7c60400         test si, 4                               
  163f  7429             je 0x166a                                
  1641  b80100           mov ax, 1                                
  1644  50               push ax                                  
  1645  cd37             int 0x37                                 
  1647  6e               outsb dx, byte ptr [si]                  
  1648  f683ec0acd       test byte ptr [bp + di + 0xaec], 0xcd    
  164d  37               aaa                                      
  164e  7ee8             jle 0x1638                               
  1650  cd39             int 0x39                                 
  1652  06               push es                                  
  1653  aa               stosb byte ptr es:[di], al               
  1654  3883ec08         cmp byte ptr [bp + di + 0x8ec], al       
  1658  cd39             int 0x39                                 
  165a  5e               pop si                                   
  165b  e0cd             loopne 0x162a                            
  165d  3de862           cmp ax, 0x62e8                           
  1660  fa               cli                                      
  1661  c45e04           les bx, ptr [bp + 4]                     
  1664  cd3c             int 0x3c                                 
  1666  dd1f             fstp qword ptr [bx]                      
  1668  eb39             jmp 0x16a3                               
  166a  f7c60800         test si, 8                               
  166e  740d             je 0x167d                                
  1670  c45e04           les bx, ptr [bp + 4]                     
  1673  cd37             int 0x37                                 
  1675  6e               outsb dx, byte ptr [si]                  
  1676  f6cd3c           test ch, 0x3c                            
  1679  db3f             fstp xword ptr [bx]                      
  167b  eb26             jmp 0x16a3                               
  167d  33c0             xor ax, ax                               
  167f  50               push ax                                  
  1680  cd37             int 0x37                                 
  1682  6e               outsb dx, byte ptr [si]                  
  1683  f683ec0acd       test byte ptr [bp + di + 0xaec], 0xcd    
  1688  37               aaa                                      
  1689  7ee8             jle 0x1673                               
  168b  cd39             int 0x39                                 
  168d  06               push es                                  
  168e  1e               push ds                                  
  168f  3983ec08         cmp word ptr [bp + di + 0x8ec], ax       
  1693  cd39             int 0x39                                 
  1695  5e               pop si                                   
  1696  e0cd             loopne 0x1665                            
  1698  3de827           cmp ax, 0x27e8                           
  169b  fa               cli                                      
  169c  c45e04           les bx, ptr [bp + 4]                     
  169f  cd3c             int 0x3c                                 
  16a1  d91f             fstp dword ptr [bx]                      
  16a3  cd3d             int 0x3d                                 
  16a5  5e               pop si                                   
  16a6  8be5             mov sp, bp                               
  16a8  5d               pop bp                                   
  16a9  c3               ret                                      
  16aa  55               push bp                                  
  16ab  8bec             mov bp, sp                               
  16ad  5d               pop bp                                   
  16ae  cb               retf                                     

res_0000_16af:  ; ENTRY
  16af  55               push bp                                  
  16b0  8bec             mov bp, sp                               
  16b2  83ec10           sub sp, 0x10                             
  16b5  56               push si                                  
  16b6  57               push di                                  
  16b7  c746fe0080       mov word ptr [bp - 2], 0x8000            
  16bc  c746fc0a00       mov word ptr [bp - 4], 0xa               
  16c1  06               push es                                  
  16c2  c47e10           les di, ptr [bp + 0x10]                  
  16c5  b8ff7f           mov ax, 0x7fff                           
  16c8  8b5e04           mov bx, word ptr [bp + 4]                
  16cb  268b09           mov cx, word ptr es:[bx + di]            
  16ce  214efe           and word ptr [bp - 2], cx                
  16d1  262101           and word ptr es:[bx + di], ax            
  16d4  d1eb             shr bx, 1                                
  16d6  d1eb             shr bx, 1                                
  16d8  d1e3             shl bx, 1                                
  16da  2effa7df16       jmp word ptr cs:[bx + 0x16df]            
  16df  e516eb16f116     dw 16e5,16eb,16f1                        jump table
res_0000_16e5:  ; case
  16e5  cd3c             int 0x3c                                 
  16e7  d905             fld dword ptr [di]                       
  16e9  eb17             jmp 0x1702                               
res_0000_16eb:  ; case
  16eb  cd3c             int 0x3c                                 
  16ed  dd05             fld qword ptr [di]                       
  16ef  eb11             jmp 0x1702                               
res_0000_16f1:  ; case
  16f1  26234508         and ax, word ptr es:[di + 8]             
  16f5  3dff7f           cmp ax, 0x7fff                           
  16f8  7404             je 0x16fe                                
  16fa  268025f0         and byte ptr es:[di], 0xf0               
  16fe  cd3c             int 0x3c                                 
  1700  db2d             fld xword ptr [di]                       
  1702  33db             xor bx, bx                               
  1704  d1e1             shl cx, 1                                
  1706  d1d3             rcl bx, 1                                
  1708  c47e0a           les di, ptr [bp + 0xa]                   
  170b  26891d           mov word ptr es:[di], bx                 
  170e  cd35             int 0x35                                 
  1710  e5cd             in ax, 0xcd                              
  1712  397efa           cmp word ptr [bp - 6], di                
  1715  cd3d             int 0x3d                                 
  1717  8b46fa           mov ax, word ptr [bp - 6]                
  171a  80e447           and ah, 0x47                             
  171d  80fc40           cmp ah, 0x40                             
  1720  7416             je 0x1738                                
  1722  80fc05           cmp ah, 5                                
  1725  740c             je 0x1733                                
  1727  80fc01           cmp ah, 1                                
  172a  7402             je 0x172e                                
  172c  eb30             jmp 0x175e                               
  172e  bafe7f           mov dx, 0x7ffe                           
  1731  eb25             jmp 0x1758                               
  1733  baff7f           mov dx, 0x7fff                           
  1736  eb20             jmp 0x1758                               
  1738  ba0100           mov dx, 1                                
  173b  b030             mov al, 0x30                             
  173d  8b4e0e           mov cx, word ptr [bp + 0xe]              
  1740  0bc9             or cx, cx                                
  1742  7f03             jg 0x1747                                
  1744  f7d9             neg cx                                   
  1746  41               inc cx                                   
  1747  83f928           cmp cx, 0x28                             
  174a  7603             jbe 0x174f                               
  174c  b92800           mov cx, 0x28                             
  174f  fc               cld                                      
  1750  c47e06           les di, ptr [bp + 6]                     
  1753  f3aa             rep stosb byte ptr es:[di], al           
  1755  32c0             xor al, al                               
  1757  aa               stosb byte ptr es:[di], al               
  1758  cd39             int 0x39                                 
  175a  d8e9             fsubr st(1)                              
  175c  45               inc bp                                   
  175d  01cd             add bp, cx                               
  175f  35c0cd           xor ax, 0xcdc0                           
  1762  37               aaa                                      
  1763  7ef0             jle 0x1755                               
  1765  cd3d             int 0x3d                                 
  1767  8b46f8           mov ax, word ptr [bp - 8]                
  176a  2dff3f           sub ax, 0x3fff                           
  176d  ba104d           mov dx, 0x4d10                           
  1770  f7ea             imul dx                                  
  1772  93               xchg bx, ax                              
  1773  b44d             mov ah, 0x4d                             
  1775  8a46f7           mov al, byte ptr [bp - 9]                
  1778  d0e0             shl al, 1                                
  177a  f6e4             mul ah                                   
  177c  03c3             add ax, bx                               
  177e  83d200           adc dx, 0                                
  1781  f7d8             neg ax                                   
  1783  83d200           adc dx, 0                                
  1786  8b460e           mov ax, word ptr [bp + 0xe]              
  1789  0bc0             or ax, ax                                
  178b  7f06             jg 0x1793                                
  178d  f7d8             neg ax                                   
  178f  03c2             add ax, dx                               
  1791  7ca5             jl 0x1738                                
  1793  3d1200           cmp ax, 0x12                             
  1796  7e03             jle 0x179b                               
  1798  b81200           mov ax, 0x12                             
  179b  8bd8             mov bx, ax                               
  179d  2bc2             sub ax, dx                               
  179f  7428             je 0x17c9                                
  17a1  8bf0             mov si, ax                               
  17a3  7d02             jge 0x17a7                               
  17a5  f7d8             neg ax                                   
  17a7  3d4413           cmp ax, 0x1344                           
  17aa  7e03             jle 0x17af                               
  17ac  b84413           mov ax, 0x1344                           
  17af  50               push ax                                  
  17b0  90               nop                                      
  17b1  0e               push cs                                  
  17b2  e88002           call 0x1a35                              
  17b5  58               pop ax                                   
  17b6  0bf6             or si, si                                
  17b8  7f07             jg 0x17c1                                
  17ba  cd3a             int 0x3a                                 
  17bc  f9               stc                                      
  17bd  03c6             add ax, si                               
  17bf  ebde             jmp 0x179f                               
  17c1  cd3a             int 0x3a                                 
  17c3  c9               leave                                    
  17c4  96               xchg si, ax                              
  17c5  2bc6             sub ax, si                               
  17c7  ebd6             jmp 0x179f                               
  17c9  53               push bx                                  
  17ca  90               nop                                      
  17cb  0e               push cs                                  
  17cc  e86602           call 0x1a35                              
  17cf  58               pop ax                                   
  17d0  cd34             int 0x34                                 
  17d2  d9cd             fxch st(5)                               
  17d4  397efa           cmp word ptr [bp - 6], di                
  17d7  cd3d             int 0x3d                                 
  17d9  f646fb45         test byte ptr [bp - 5], 0x45             
  17dd  7414             je 0x17f3                                
  17df  42               inc dx                                   
  17e0  43               inc bx                                   
  17e1  83fb12           cmp bx, 0x12                             
  17e4  7706             ja 0x17ec                                
  17e6  837e0e00         cmp word ptr [bp + 0xe], 0               
  17ea  7e2d             jle 0x1819                               
  17ec  cd3a             int 0x3a                                 
  17ee  76fc             jbe 0x17ec                               
  17f0  4b               dec bx                                   
  17f1  eb26             jmp 0x1819                               
  17f3  8bc3             mov ax, bx                               
  17f5  48               dec ax                                   
  17f6  50               push ax                                  
  17f7  90               nop                                      
  17f8  0e               push cs                                  
  17f9  e83902           call 0x1a35                              
  17fc  58               pop ax                                   
  17fd  cd34             int 0x34                                 
  17ff  d9cd             fxch st(5)                               
  1801  397efa           cmp word ptr [bp - 6], di                
  1804  cd3d             int 0x3d                                 
  1806  f646fb41         test byte ptr [bp - 5], 0x41             
  180a  750d             jne 0x1819                               
  180c  4a               dec dx                                   
  180d  4b               dec bx                                   
  180e  837e0e00         cmp word ptr [bp + 0xe], 0               
  1812  7e05             jle 0x1819                               
  1814  cd3a             int 0x3a                                 
  1816  4e               dec si                                   
  1817  fc               cld                                      
  1818  43               inc bx                                   
  1819  0bdb             or bx, bx                                
  181b  7c25             jl 0x1842                                
  181d  cd35             int 0x35                                 
  181f  fc               cld                                      
  1820  cd3b             int 0x3b                                 
  1822  76f0             jbe 0x1814                               
  1824  c47e06           les di, ptr [bp + 6]                     
  1827  03fb             add di, bx                               
  1829  57               push di                                  
  182a  32c0             xor al, al                               
  182c  fd               std                                      
  182d  aa               stosb byte ptr es:[di], al               
  182e  8d76f0           lea si, [bp - 0x10]                      
  1831  b90400           mov cx, 4                                
  1834  cd3d             int 0x3d                                 
  1836  0bdb             or bx, bx                                
  1838  750f             jne 0x1849                               
  183a  368a2c           mov ch, byte ptr ss:[si]                 
  183d  80f501           xor ch, 1                                
  1840  7422             je 0x1864                                
  1842  cd35             int 0x35                                 
  1844  ee               out dx, al                               
  1845  5f               pop di                                   
  1846  e9effe           jmp 0x1738                               
  1849  368a04           mov al, byte ptr ss:[si]                 
  184c  46               inc si                                   
  184d  8ae0             mov ah, al                               
  184f  d2ec             shr ah, cl                               
  1851  240f             and al, 0xf                              
  1853  053030           add ax, 0x3030                           
  1856  aa               stosb byte ptr es:[di], al               
  1857  0ae8             or ch, al                                
  1859  4b               dec bx                                   
  185a  7408             je 0x1864                                
  185c  8ac4             mov al, ah                               
  185e  aa               stosb byte ptr es:[di], al               
  185f  0ae8             or ch, al                                
  1861  4b               dec bx                                   
  1862  75e5             jne 0x1849                               
  1864  5b               pop bx                                   
  1865  80e50f           and ch, 0xf                              
  1868  7511             jne 0x187b                               
  186a  42               inc dx                                   
  186b  837e0e00         cmp word ptr [bp + 0xe], 0               
  186f  7f04             jg 0x1875                                
  1871  26c60730         mov byte ptr es:[bx], 0x30               
  1875  43               inc bx                                   
  1876  26c6450131       mov byte ptr es:[di + 1], 0x31           
  187b  8b4e0e           mov cx, word ptr [bp + 0xe]              
  187e  0bc9             or cx, cx                                
  1880  7f04             jg 0x1886                                
  1882  f7d9             neg cx                                   
  1884  03ca             add cx, dx                               
  1886  83f928           cmp cx, 0x28                             
  1889  7603             jbe 0x188e                               
  188b  b92800           mov cx, 0x28                             
  188e  26c60700         mov byte ptr es:[bx], 0                  
  1892  8bc3             mov ax, bx                               
  1894  2b4606           sub ax, word ptr [bp + 6]                
  1897  2bc8             sub cx, ax                               
  1899  7608             jbe 0x18a3                               
  189b  26c7073000       mov word ptr es:[bx], 0x30               
  18a0  43               inc bx                                   
  18a1  e2f8             loop 0x189b                              
  18a3  fc               cld                                      
  18a4  c47e10           les di, ptr [bp + 0x10]                  
  18a7  8b5e04           mov bx, word ptr [bp + 4]                
  18aa  8b4efe           mov cx, word ptr [bp - 2]                
  18ad  260909           or word ptr es:[bx + di], cx             
  18b0  07               pop es                                   
  18b1  8bc2             mov ax, dx                               
  18b3  5f               pop di                                   
  18b4  5e               pop si                                   
  18b5  8be5             mov sp, bp                               
  18b7  5d               pop bp                                   
  18b8  c21000           ret 0x10                                 

res_0000_18bb:  ; ENTRY
  18bb  55               push bp                                  
  18bc  8bec             mov bp, sp                               
  18be  83ec08           sub sp, 8                                
  18c1  8c56fe           mov word ptr [bp - 2], ss                
  18c4  895efc           mov word ptr [bp - 4], bx                
  18c7  a15871           mov ax, word ptr [0x7158]                
  18ca  0b065a71         or ax, word ptr [0x715a]                 
  18ce  7467             je 0x1937                                
  18d0  33c0             xor ax, ax                               
  18d2  33d2             xor dx, dx                               
  18d4  50               push ax                                  
  18d5  52               push dx                                  
  18d6  b80800           mov ax, 8                                
  18d9  50               push ax                                  
  18da  ff1e5871         lcall [0x7158]                           
  18de  83c406           add sp, 6                                
  18e1  8956fa           mov word ptr [bp - 6], dx                
  18e4  8946f8           mov word ptr [bp - 8], ax                
  18e7  52               push dx                                  
  18e8  50               push ax                                  
  18e9  b80800           mov ax, 8                                
  18ec  50               push ax                                  
  18ed  ff1e5871         lcall [0x7158]                           
  18f1  83c406           add sp, 6                                
  18f4  837efa00         cmp word ptr [bp - 6], 0                 
  18f8  7506             jne 0x1900                               
  18fa  837ef801         cmp word ptr [bp - 8], 1                 
  18fe  7468             je 0x1968                                
  1900  8b46f8           mov ax, word ptr [bp - 8]                
  1903  0b46fa           or ax, word ptr [bp - 6]                 
  1906  742f             je 0x1937                                
  1908  33c0             xor ax, ax                               
  190a  33d2             xor dx, dx                               
  190c  50               push ax                                  
  190d  52               push dx                                  
  190e  b80800           mov ax, 8                                
  1911  50               push ax                                  
  1912  ff1e5871         lcall [0x7158]                           
  1916  83c406           add sp, 6                                
  1919  c45efc           les bx, ptr [bp - 4]                     
  191c  268b07           mov ax, word ptr es:[bx]                 
  191f  ba0600           mov dx, 6                                
  1922  f7ea             imul dx                                  
  1924  8bd8             mov bx, ax                               
  1926  ffb72039         push word ptr [bx + 0x3920]              
  192a  b80800           mov ax, 8                                
  192d  50               push ax                                  
  192e  ff5ef8           lcall [bp - 8]                           
  1931  59               pop cx                                   
  1932  59               pop cx                                   
  1933  eb33             jmp 0x1968                               
  1935  eb31             jmp 0x1968                               
  1937  c45efc           les bx, ptr [bp - 4]                     
  193a  268b07           mov ax, word ptr es:[bx]                 
  193d  ba0600           mov dx, 6                                
  1940  f7ea             imul dx                                  
  1942  ba2039           mov dx, 0x3920                           
  1945  83c202           add dx, 2                                
  1948  03c2             add ax, dx                               
  194a  8bd8             mov bx, ax                               
  194c  ff7702           push word ptr [bx + 2]                   
  194f  ff37             push word ptr [bx]                       
  1951  1e               push ds                                  
  1952  b8a539           mov ax, 0x39a5                            ; "Floating point error: %s."
  1955  50               push ax                                  
  1956  1e               push ds                                  
  1957  b8943b           mov ax, 0x3b94                           
  195a  50               push ax                                  
  195b  90               nop                                      
  195c  0e               push cs                                  
  195d  e80727           call 0x4067                              
  1960  83c40c           add sp, 0xc                              
  1963  90               nop                                      
  1964  0e               push cs                                  
  1965  e812e9           call 0x27a                               
  1968  8be5             mov sp, bp                               
  196a  5d               pop bp                                   
  196b  c3               ret                                      

res_0000_196c:  ; ENTRY
  196c  55               push bp                                  
  196d  8bec             mov bp, sp                               
  196f  56               push si                                  
  1970  8b4604           mov ax, word ptr [bp + 4]                
  1973  3dbcec           cmp ax, 0xecbc                           
  1976  7d06             jge 0x197e                               
  1978  cd35             int 0x35                                 
  197a  ee               out dx, al                               
  197b  e9b200           jmp 0x1a30                               
  197e  3d4413           cmp ax, 0x1344                           
  1981  7e08             jle 0x198b                               
  1983  cd35             int 0x35                                 
  1985  06               push es                                  
  1986  3c3a             cmp al, 0x3a                             
  1988  e9a500           jmp 0x1a30                               
  198b  0bc0             or ax, ax                                
  198d  7506             jne 0x1995                               
  198f  cd35             int 0x35                                 
  1991  e8e99b           call 0xffffb57d                          
  1994  000b             add byte ptr [bp + di], cl               
  1996  c07d02f7         sar byte ptr [di + 2], 0xf7              
  199a  d8be0700         fdivr dword ptr [bp + 7]                 
  199e  23f0             and si, ax                               
  19a0  d1e6             shl si, 1                                
  19a2  d1e6             shl si, 1                                
  19a4  cd35             int 0x35                                 
  19a6  84c0             test al, al                              
  19a8  39d1             cmp cx, dx                               
  19aa  e8d1e8           call 0x27e                               
  19ad  d1e8             shr ax, 1                                
  19af  d1e8             shr ax, 1                                
  19b1  7305             jae 0x19b8                               
  19b3  cd34             int 0x34                                 
  19b5  0e               push cs                                  
  19b6  e039             loopne 0x19f1                            
  19b8  7502             jne 0x19bc                               
  19ba  eb69             jmp 0x1a25                               
  19bc  d1e8             shr ax, 1                                
  19be  7305             jae 0x19c5                               
  19c0  cd38             int 0x38                                 
  19c2  0e               push cs                                  
  19c3  e439             in al, 0x39                              
  19c5  d1e8             shr ax, 1                                
  19c7  7308             jae 0x19d1                               
  19c9  cd37             int 0x37                                 
  19cb  2eec             in al, dx                                
  19cd  39cd             cmp bp, cx                               
  19cf  3ac9             cmp cl, cl                               
  19d1  d1e8             shr ax, 1                                
  19d3  7308             jae 0x19dd                               
  19d5  cd37             int 0x37                                 
  19d7  2ef639           idiv byte ptr cs:[bx + di]               
  19da  cd3a             int 0x3a                                 
  19dc  c9               leave                                    
  19dd  d1e8             shr ax, 1                                
  19df  7308             jae 0x19e9                               
  19e1  cd37             int 0x37                                 
  19e3  2e003a           add byte ptr cs:[bp + si], bh            
  19e6  cd3a             int 0x3a                                 
  19e8  c9               leave                                    
  19e9  d1e8             shr ax, 1                                
  19eb  7308             jae 0x19f5                               
  19ed  cd37             int 0x37                                 
  19ef  2e0a3a           or bh, byte ptr cs:[bp + si]             
  19f2  cd3a             int 0x3a                                 
  19f4  c9               leave                                    
  19f5  d1e8             shr ax, 1                                
  19f7  7308             jae 0x1a01                               
  19f9  cd37             int 0x37                                 
  19fb  2e143a           adc al, 0x3a                             
  19fe  cd3a             int 0x3a                                 
  1a00  c9               leave                                    
  1a01  d1e8             shr ax, 1                                
  1a03  7308             jae 0x1a0d                               
  1a05  cd37             int 0x37                                 
  1a07  2e1e             push ds                                  
  1a09  3acd             cmp cl, ch                               
  1a0b  3ac9             cmp cl, cl                               
  1a0d  d1e8             shr ax, 1                                
  1a0f  7308             jae 0x1a19                               
  1a11  cd37             int 0x37                                 
  1a13  2e283a           sub byte ptr cs:[bp + si], bh            
  1a16  cd3a             int 0x3a                                 
  1a18  c9               leave                                    
  1a19  d1e8             shr ax, 1                                
  1a1b  7308             jae 0x1a25                               
  1a1d  cd37             int 0x37                                 
  1a1f  2e323a           xor bh, byte ptr cs:[bp + si]            
  1a22  cd3a             int 0x3a                                 
  1a24  c9               leave                                    
  1a25  f6460580         test byte ptr [bp + 5], 0x80             
  1a29  7405             je 0x1a30                                
  1a2b  cd34             int 0x34                                 
  1a2d  3ec0395e         sar byte ptr ds:[bx + di], 0x5e          
  1a31  5d               pop bp                                   
  1a32  c20200           ret 2                                    

res_0000_1a35:  ; ENTRY
  1a35  55               push bp                                  
  1a36  8bec             mov bp, sp                               
  1a38  ff7606           push word ptr [bp + 6]                   
  1a3b  e82eff           call 0x196c                              
  1a3e  5d               pop bp                                   
  1a3f  cb               retf                                     

res_0000_1a40:  ; ENTRY
  1a40  55               push bp                                  
  1a41  8bec             mov bp, sp                               
  1a43  c45e06           les bx, ptr [bp + 6]                     
  1a46  26833f04         cmp word ptr es:[bx], 4                  
  1a4a  750f             jne 0x1a5b                               
  1a4c  cd35             int 0x35                                 
  1a4e  ee               out dx, al                               
  1a4f  cd3c             int 0x3c                                 
  1a51  dd5f16           fstp qword ptr [bx + 0x16]               
  1a54  cd3d             int 0x3d                                 
  1a56  b80100           mov ax, 1                                
  1a59  eb0d             jmp 0x1a68                               
  1a5b  c45e06           les bx, ptr [bp + 6]                     
  1a5e  26833f05         cmp word ptr es:[bx], 5                  
  1a62  7502             jne 0x1a66                               
  1a64  ebf0             jmp 0x1a56                               
  1a66  33c0             xor ax, ax                               
  1a68  5d               pop bp                                   
  1a69  cb               retf                                     

res_0000_1a6a:  ; ENTRY
  1a6a  55               push bp                                  
  1a6b  8bec             mov bp, sp                               
  1a6d  cd39             int 0x39                                 
  1a6f  46               inc si                                   
  1a70  06               push es                                  
  1a71  8b460c           mov ax, word ptr [bp + 0xc]              
  1a74  d1e0             shl ax, 1                                
  1a76  7405             je 0x1a7d                                
  1a78  7205             jb 0x1a7f                                
  1a7a  cd35             int 0x35                                 
  1a7c  fa               cli                                      
  1a7d  eb2d             jmp 0x1aac                               
  1a7f  cd39             int 0x39                                 
  1a81  d8cd             fmul st(5)                               
  1a83  3906403a         cmp word ptr [0x3a40], ax                
  1a87  83ec08           sub sp, 8                                
  1a8a  cd39             int 0x39                                 
  1a8c  5e               pop si                                   
  1a8d  f8               clc                                      
  1a8e  33c0             xor ax, ax                               
  1a90  33d2             xor dx, dx                               
  1a92  50               push ax                                  
  1a93  52               push dx                                  
  1a94  16               push ss                                  
  1a95  cd3d             int 0x3d                                 
  1a97  8d4606           lea ax, [bp + 6]                         
  1a9a  50               push ax                                  
  1a9b  1e               push ds                                  
  1a9c  b8483a           mov ax, 0x3a48                            ; "sqrt"
  1a9f  50               push ax                                  
  1aa0  b80100           mov ax, 1                                
  1aa3  50               push ax                                  
  1aa4  90               nop                                      
  1aa5  0e               push cs                                  
  1aa6  e80500           call 0x1aae                              
  1aa9  83c416           add sp, 0x16                             
  1aac  5d               pop bp                                   
  1aad  cb               retf                                     

res_0000_1aae:  ; ENTRY
  1aae  55               push bp                                  
  1aaf  8bec             mov bp, sp                               
  1ab1  83ec1e           sub sp, 0x1e                             
  1ab4  56               push si                                  
  1ab5  8b7606           mov si, word ptr [bp + 6]                
  1ab8  8976e2           mov word ptr [bp - 0x1e], si             
  1abb  8b460a           mov ax, word ptr [bp + 0xa]              
  1abe  8b5608           mov dx, word ptr [bp + 8]                
  1ac1  8946e6           mov word ptr [bp - 0x1a], ax             
  1ac4  8956e4           mov word ptr [bp - 0x1c], dx             
  1ac7  8b460c           mov ax, word ptr [bp + 0xc]              
  1aca  0b460e           or ax, word ptr [bp + 0xe]               
  1acd  7505             jne 0x1ad4                               
  1acf  cd35             int 0x35                                 
  1ad1  ee               out dx, al                               
  1ad2  eb07             jmp 0x1adb                               
  1ad4  c45e0c           les bx, ptr [bp + 0xc]                   
  1ad7  cd3c             int 0x3c                                 
  1ad9  dd07             fld qword ptr [bx]                       
  1adb  cd39             int 0x39                                 
  1add  5e               pop si                                   
  1ade  e8cd3d           call 0x58ae                              
  1ae1  8b4610           mov ax, word ptr [bp + 0x10]             
  1ae4  0b4612           or ax, word ptr [bp + 0x12]              
  1ae7  7505             jne 0x1aee                               
  1ae9  cd35             int 0x35                                 
  1aeb  ee               out dx, al                               
  1aec  eb07             jmp 0x1af5                               
  1aee  c45e10           les bx, ptr [bp + 0x10]                  
  1af1  cd3c             int 0x3c                                 
  1af3  dd07             fld qword ptr [bx]                       
  1af5  cd39             int 0x39                                 
  1af7  5e               pop si                                   
  1af8  f0               db f0                                    
  1af9  cd39             int 0x39                                 
  1afb  46               inc si                                   
  1afc  14cd             adc al, 0xcd                             
  1afe  395ef8           cmp word ptr [bp - 8], bx                
  1b01  16               push ss                                  
  1b02  cd3d             int 0x3d                                 
  1b04  8d46e2           lea ax, [bp - 0x1e]                      
  1b07  50               push ax                                  
  1b08  90               nop                                      
  1b09  0e               push cs                                  
  1b0a  e833ff           call 0x1a40                              
  1b0d  59               pop cx                                   
  1b0e  59               pop cx                                   
  1b0f  0bc0             or ax, ax                                
  1b11  753b             jne 0x1b4e                               
  1b13  8bde             mov bx, si                               
  1b15  b102             mov cl, 2                                
  1b17  d3e3             shl bx, cl                               
  1b19  ffb7c838         push word ptr [bx + 0x38c8]              
  1b1d  ffb7c638         push word ptr [bx + 0x38c6]              
  1b21  ff760a           push word ptr [bp + 0xa]                 
  1b24  ff7608           push word ptr [bp + 8]                   
  1b27  1e               push ds                                  
  1b28  b84e3a           mov ax, 0x3a4e                            ; "%s: %s error"
  1b2b  50               push ax                                  
  1b2c  1e               push ds                                  
  1b2d  b8943b           mov ax, 0x3b94                           
  1b30  50               push ax                                  
  1b31  90               nop                                      
  1b32  0e               push cs                                  
  1b33  e83125           call 0x4067                              
  1b36  83c410           add sp, 0x10                             
  1b39  83fe03           cmp si, 3                                
  1b3c  7405             je 0x1b43                                
  1b3e  83fe04           cmp si, 4                                
  1b41  7505             jne 0x1b48                               
  1b43  b82200           mov ax, 0x22                             
  1b46  eb03             jmp 0x1b4b                               
  1b48  b82100           mov ax, 0x21                             
  1b4b  a37f00           mov word ptr [0x7f], ax                  
  1b4e  cd39             int 0x39                                 
  1b50  46               inc si                                   
  1b51  f8               clc                                      
  1b52  5e               pop si                                   
  1b53  8be5             mov sp, bp                               
  1b55  5d               pop bp                                   
  1b56  cb               retf                                     

res_0000_1b57:  ; ENTRY
  1b57  55               push bp                                  
  1b58  8bec             mov bp, sp                               
  1b5a  83ec0a           sub sp, 0xa                              
  1b5d  cd35             int 0x35                                 
  1b5f  7efe             jle 0x1b5f                               
  1b61  cd3d             int 0x3d                                 
  1b63  8a46ff           mov al, byte ptr [bp - 1]                
  1b66  804eff0c         or byte ptr [bp - 1], 0xc                
  1b6a  cd35             int 0x35                                 
  1b6c  6e               outsb dx, byte ptr [si]                  
  1b6d  fecd             dec ch                                   
  1b6f  3b7ef6           cmp di, word ptr [bp - 0xa]              
  1b72  8846ff           mov byte ptr [bp - 1], al                
  1b75  cd35             int 0x35                                 
  1b77  6e               outsb dx, byte ptr [si]                  
  1b78  fe8b46f6         dec byte ptr [bp + di - 0x9ba]           
  1b7c  8b56f8           mov dx, word ptr [bp - 8]                
  1b7f  8be5             mov sp, bp                               
  1b81  5d               pop bp                                   
  1b82  cb               retf                                     
  1b83  55               push bp                                  
  1b84  8bec             mov bp, sp                               
  1b86  833e5c3a20       cmp word ptr [0x3a5c], 0x20              
  1b8b  7505             jne 0x1b92                               
  1b8d  b80100           mov ax, 1                                
  1b90  eb1c             jmp 0x1bae                               
  1b92  8b1e5c3a         mov bx, word ptr [0x3a5c]                
  1b96  b102             mov cl, 2                                
  1b98  d3e3             shl bx, cl                               
  1b9a  8b4608           mov ax, word ptr [bp + 8]                
  1b9d  8b5606           mov dx, word ptr [bp + 6]                
  1ba0  8987d870         mov word ptr [bx + 0x70d8], ax           
  1ba4  8997d670         mov word ptr [bx + 0x70d6], dx           
  1ba8  ff065c3a         inc word ptr [0x3a5c]                    
  1bac  33c0             xor ax, ax                               
  1bae  5d               pop bp                                   
  1baf  cb               retf                                     
  1bb0  cd11             int 0x11                                 
  1bb2  cb               retf                                     
  1bb3  cd12             int 0x12                                 
  1bb5  cb               retf                                     

res_0000_1bb6:  ; ENTRY
  1bb6  55               push bp                                  
  1bb7  8bec             mov bp, sp                               
  1bb9  8a6606           mov ah, byte ptr [bp + 6]                
  1bbc  8b4e0a           mov cx, word ptr [bp + 0xa]              
  1bbf  8b5608           mov dx, word ptr [bp + 8]                
  1bc2  cd1a             int 0x1a                                 
  1bc4  92               xchg dx, ax                              
  1bc5  8bd1             mov dx, cx                               
  1bc7  5d               pop bp                                   
  1bc8  cb               retf                                     
  1bc9  cd11             int 0x11                                 
  1bcb  cb               retf                                     
  1bcc  cd12             int 0x12                                 
  1bce  cb               retf                                     

res_0000_1bcf:  ; ENTRY
  1bcf  55               push bp                                  
  1bd0  8bec             mov bp, sp                               
  1bd2  8a6606           mov ah, byte ptr [bp + 6]                
  1bd5  c45e08           les bx, ptr [bp + 8]                     
  1bd8  268b4f02         mov cx, word ptr es:[bx + 2]             
  1bdc  268b17           mov dx, word ptr es:[bx]                 
  1bdf  cd1a             int 0x1a                                 
  1be1  807e0600         cmp byte ptr [bp + 6], 0                 
  1be5  7507             jne 0x1bee                               
  1be7  268917           mov word ptr es:[bx], dx                 
  1bea  26894f02         mov word ptr es:[bx + 2], cx             
  1bee  5d               pop bp                                   
  1bef  cb               retf                                     

res_0000_1bf0:  ; ENTRY
  1bf0  55               push bp                                  
  1bf1  8bec             mov bp, sp                               
  1bf3  83ec04           sub sp, 4                                
  1bf6  32e4             xor ah, ah                               
  1bf8  cd1a             int 0x1a                                 
  1bfa  00065671         add byte ptr [0x7156], al                
  1bfe  8956fc           mov word ptr [bp - 4], dx                
  1c01  894efe           mov word ptr [bp - 2], cx                
  1c04  0ac0             or al, al                                
  1c06  740f             je 0x1c17                                
  1c08  b84000           mov ax, 0x40                             
  1c0b  8ec0             mov es, ax                               
  1c0d  26c606700001     mov byte ptr es:[0x70], 1                
  1c13  b42a             mov ah, 0x2a                             
  1c15  cd21             int 0x21                                 
  1c17  803e567100       cmp byte ptr [0x7156], 0                 
  1c1c  7409             je 0x1c27                                
  1c1e  8146fcb000       add word ptr [bp - 4], 0xb0              
  1c23  8356fe18         adc word ptr [bp - 2], 0x18              
  1c27  8b56fe           mov dx, word ptr [bp - 2]                
  1c2a  8b46fc           mov ax, word ptr [bp - 4]                
  1c2d  2b068100         sub ax, word ptr [0x81]                  
  1c31  1b168300         sbb dx, word ptr [0x83]                  
  1c35  8be5             mov sp, bp                               
  1c37  5d               pop bp                                   
  1c38  cb               retf                                     
  1c39  55               push bp                                  
  1c3a  8bec             mov bp, sp                               
  1c3c  b42a             mov ah, 0x2a                             
  1c3e  cd21             int 0x21                                 
  1c40  c45e06           les bx, ptr [bp + 6]                     
  1c43  26884704         mov byte ptr es:[bx + 4], al             
  1c47  268817           mov byte ptr es:[bx], dl                 
  1c4a  26887701         mov byte ptr es:[bx + 1], dh             
  1c4e  26894f02         mov word ptr es:[bx + 2], cx             
  1c52  5d               pop bp                                   
  1c53  cb               retf                                     

res_0000_1c54:  ; ENTRY
  1c54  55               push bp                                  
  1c55  8bec             mov bp, sp                               
  1c57  b42c             mov ah, 0x2c                             
  1c59  cd21             int 0x21                                 
  1c5b  c45e06           les bx, ptr [bp + 6]                     
  1c5e  26882f           mov byte ptr es:[bx], ch                 
  1c61  26884f01         mov byte ptr es:[bx + 1], cl             
  1c65  26887702         mov byte ptr es:[bx + 2], dh             
  1c69  26885703         mov byte ptr es:[bx + 3], dl             
  1c6d  5d               pop bp                                   
  1c6e  cb               retf                                     
  1c6f  cb               retf                                     

res_0000_1c70:  ; ENTRY
  1c70  55               push bp                                  
  1c71  8bec             mov bp, sp                               
  1c73  56               push si                                  
  1c74  8b7608           mov si, word ptr [bp + 8]                
  1c77  0bf6             or si, si                                
  1c79  7522             jne 0x1c9d                               
  1c7b  eb10             jmp 0x1c8d                               
  1c7d  ff0e5c3a         dec word ptr [0x3a5c]                    
  1c81  8b1e5c3a         mov bx, word ptr [0x3a5c]                
  1c85  b102             mov cl, 2                                
  1c87  d3e3             shl bx, cl                               
  1c89  ff9fd670         lcall [bx + 0x70d6]                      
  1c8d  833e5c3a00       cmp word ptr [0x3a5c], 0                 
  1c92  75e9             jne 0x1c7d                               
  1c94  90               nop                                      
  1c95  0e               push cs                                  
  1c96  e8bee4           call 0x157                               
  1c99  ff1e603b         lcall [0x3b60]                           
  1c9d  90               nop                                      
  1c9e  0e               push cs                                  
  1c9f  e81ee5           call 0x1c0                               
  1ca2  90               nop                                      
  1ca3  0e               push cs                                  
  1ca4  e8c3e4           call 0x16a                               
  1ca7  837e0600         cmp word ptr [bp + 6], 0                 
  1cab  7515             jne 0x1cc2                               
  1cad  0bf6             or si, si                                
  1caf  7508             jne 0x1cb9                               
  1cb1  ff1e643b         lcall [0x3b64]                           
  1cb5  ff1e683b         lcall [0x3b68]                           
  1cb9  ff7604           push word ptr [bp + 4]                   
  1cbc  90               nop                                      
  1cbd  0e               push cs                                  
  1cbe  e8aae4           call 0x16b                               
  1cc1  59               pop cx                                   
  1cc2  5e               pop si                                   
  1cc3  5d               pop bp                                   
  1cc4  c20600           ret 6                                    

res_0000_1cc7:  ; ENTRY
  1cc7  55               push bp                                  
  1cc8  8bec             mov bp, sp                               
  1cca  33c0             xor ax, ax                               
  1ccc  50               push ax                                  
  1ccd  50               push ax                                  
  1cce  ff7606           push word ptr [bp + 6]                   
  1cd1  e89cff           call 0x1c70                              
  1cd4  5d               pop bp                                   
  1cd5  cb               retf                                     

res_0000_1cd6:  ; ENTRY
  1cd6  55               push bp                                  
  1cd7  8bec             mov bp, sp                               
  1cd9  b80100           mov ax, 1                                
  1cdc  50               push ax                                  
  1cdd  33c0             xor ax, ax                               
  1cdf  50               push ax                                  
  1ce0  ff7606           push word ptr [bp + 6]                   
  1ce3  e88aff           call 0x1c70                              
  1ce6  5d               pop bp                                   
  1ce7  cb               retf                                     
  1ce8  33c0             xor ax, ax                               
  1cea  50               push ax                                  
  1ceb  b80100           mov ax, 1                                
  1cee  50               push ax                                  
  1cef  33c0             xor ax, ax                               
  1cf1  50               push ax                                  
  1cf2  e87bff           call 0x1c70                              
  1cf5  cb               retf                                     
  1cf6  b80100           mov ax, 1                                
  1cf9  50               push ax                                  
  1cfa  50               push ax                                  
  1cfb  33c0             xor ax, ax                               
  1cfd  50               push ax                                  
  1cfe  e86fff           call 0x1c70                              
  1d01  cb               retf                                     

res_0000_1d02:  ; ENTRY
  1d02  55               push bp                                  
  1d03  8bec             mov bp, sp                               
  1d05  56               push si                                  
  1d06  57               push di                                  
  1d07  1e               push ds                                  
  1d08  c57606           lds si, ptr [bp + 6]                     
  1d0b  c47e0a           les di, ptr [bp + 0xa]                   
  1d0e  fc               cld                                      
  1d0f  d1e9             shr cx, 1                                
  1d11  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  1d13  13c9             adc cx, cx                               
  1d15  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  1d17  1f               pop ds                                   
  1d18  5f               pop di                                   
  1d19  5e               pop si                                   
  1d1a  5d               pop bp                                   
  1d1b  ca0800           retf 8                                   

res_0000_1d1e:  ; ENTRY
  1d1e  55               push bp                                  
  1d1f  8bec             mov bp, sp                               
  1d21  b42a             mov ah, 0x2a                             
  1d23  cd21             int 0x21                                 
  1d25  c45e06           les bx, ptr [bp + 6]                     
  1d28  26890f           mov word ptr es:[bx], cx                 
  1d2b  26895702         mov word ptr es:[bx + 2], dx             
  1d2f  5d               pop bp                                   
  1d30  cb               retf                                     

res_0000_1d31:  ; ENTRY
  1d31  55               push bp                                  
  1d32  8bec             mov bp, sp                               
  1d34  b42c             mov ah, 0x2c                             
  1d36  cd21             int 0x21                                 
  1d38  c45e06           les bx, ptr [bp + 6]                     
  1d3b  26890f           mov word ptr es:[bx], cx                 
  1d3e  26895702         mov word ptr es:[bx + 2], dx             
  1d42  5d               pop bp                                   
  1d43  cb               retf                                     

res_0000_1d44:  ; ENTRY
  1d44  59               pop cx                                   
  1d45  0e               push cs                                  
  1d46  51               push cx                                  
  1d47  33c9             xor cx, cx                               
  1d49  eb16             jmp 0x1d61                               
  1d4b  59               pop cx                                   
  1d4c  0e               push cs                                  
  1d4d  51               push cx                                  
  1d4e  b90100           mov cx, 1                                
  1d51  eb0e             jmp 0x1d61                               

res_0000_1d53:  ; ENTRY
  1d53  59               pop cx                                   
  1d54  0e               push cs                                  
  1d55  51               push cx                                  
  1d56  b90200           mov cx, 2                                
  1d59  eb06             jmp 0x1d61                               
  1d5b  59               pop cx                                   
  1d5c  0e               push cs                                  
  1d5d  51               push cx                                  
  1d5e  b90300           mov cx, 3                                
  1d61  55               push bp                                  
  1d62  56               push si                                  
  1d63  57               push di                                  
  1d64  8bec             mov bp, sp                               
  1d66  8bf9             mov di, cx                               
  1d68  8b460a           mov ax, word ptr [bp + 0xa]              
  1d6b  8b560c           mov dx, word ptr [bp + 0xc]              
  1d6e  8b5e0e           mov bx, word ptr [bp + 0xe]              
  1d71  8b4e10           mov cx, word ptr [bp + 0x10]             
  1d74  0bc9             or cx, cx                                
  1d76  7508             jne 0x1d80                               
  1d78  0bd2             or dx, dx                                
  1d7a  7469             je 0x1de5                                
  1d7c  0bdb             or bx, bx                                
  1d7e  7465             je 0x1de5                                
  1d80  f7c70100         test di, 1                               
  1d84  751c             jne 0x1da2                               
  1d86  0bd2             or dx, dx                                
  1d88  790a             jns 0x1d94                               
  1d8a  f7da             neg dx                                   
  1d8c  f7d8             neg ax                                   
  1d8e  83da00           sbb dx, 0                                
  1d91  83cf0c           or di, 0xc                               
  1d94  0bc9             or cx, cx                                
  1d96  790a             jns 0x1da2                               
  1d98  f7d9             neg cx                                   
  1d9a  f7db             neg bx                                   
  1d9c  83d900           sbb cx, 0                                
  1d9f  83f704           xor di, 4                                
  1da2  8be9             mov bp, cx                               
  1da4  b92000           mov cx, 0x20                             
  1da7  57               push di                                  
  1da8  33ff             xor di, di                               
  1daa  33f6             xor si, si                               
  1dac  d1e0             shl ax, 1                                
  1dae  d1d2             rcl dx, 1                                
  1db0  d1d6             rcl si, 1                                
  1db2  d1d7             rcl di, 1                                
  1db4  3bfd             cmp di, bp                               
  1db6  720b             jb 0x1dc3                                
  1db8  7704             ja 0x1dbe                                
  1dba  3bf3             cmp si, bx                               
  1dbc  7205             jb 0x1dc3                                
  1dbe  2bf3             sub si, bx                               
  1dc0  1bfd             sbb di, bp                               
  1dc2  40               inc ax                                   
  1dc3  e2e7             loop 0x1dac                              
  1dc5  5b               pop bx                                   
  1dc6  f7c30200         test bx, 2                               
  1dca  7406             je 0x1dd2                                
  1dcc  8bc6             mov ax, si                               
  1dce  8bd7             mov dx, di                               
  1dd0  d1eb             shr bx, 1                                
  1dd2  f7c30400         test bx, 4                               
  1dd6  7407             je 0x1ddf                                
  1dd8  f7da             neg dx                                   
  1dda  f7d8             neg ax                                   
  1ddc  83da00           sbb dx, 0                                
  1ddf  5f               pop di                                   
  1de0  5e               pop si                                   
  1de1  5d               pop bp                                   
  1de2  ca0800           retf 8                                   
  1de5  f7f3             div bx                                   
  1de7  f7c70200         test di, 2                               
  1deb  7401             je 0x1dee                                
  1ded  92               xchg dx, ax                              
  1dee  33d2             xor dx, dx                               
  1df0  ebed             jmp 0x1ddf                               

res_0000_1df2:  ; ENTRY
  1df2  5b               pop bx                                   
  1df3  0e               push cs                                  
  1df4  53               push bx                                  
  1df5  80f910           cmp cl, 0x10                             
  1df8  7310             jae 0x1e0a                               
  1dfa  8bd8             mov bx, ax                               
  1dfc  d3e0             shl ax, cl                               
  1dfe  d3e2             shl dx, cl                               
  1e00  f6d9             neg cl                                   
  1e02  80c110           add cl, 0x10                             
  1e05  d3eb             shr bx, cl                               
  1e07  0bd3             or dx, bx                                
  1e09  cb               retf                                     
  1e0a  80e910           sub cl, 0x10                             
  1e0d  92               xchg dx, ax                              
  1e0e  33c0             xor ax, ax                               
  1e10  d3e2             shl dx, cl                               
  1e12  cb               retf                                     

res_0000_1e13:  ; ENTRY
  1e13  07               pop es                                   
  1e14  0e               push cs                                  
  1e15  06               push es                                  
  1e16  0bc9             or cx, cx                                
  1e18  7d0c             jge 0x1e26                               
  1e1a  f7d3             not bx                                   
  1e1c  f7d1             not cx                                   
  1e1e  83c301           add bx, 1                                
  1e21  83d100           adc cx, 0                                
  1e24  eb2f             jmp 0x1e55                               
  1e26  03c3             add ax, bx                               
  1e28  7304             jae 0x1e2e                               
  1e2a  81c20010         add dx, 0x1000                           
  1e2e  8ae9             mov ch, cl                               
  1e30  b104             mov cl, 4                                
  1e32  d2e5             shl ch, cl                               
  1e34  02f5             add dh, ch                               
  1e36  8ae8             mov ch, al                               
  1e38  d3e8             shr ax, cl                               
  1e3a  03d0             add dx, ax                               
  1e3c  8ac5             mov al, ch                               
  1e3e  250f00           and ax, 0xf                              
  1e41  cb               retf                                     
  1e42  07               pop es                                   
  1e43  0e               push cs                                  
  1e44  06               push es                                  
  1e45  0bc9             or cx, cx                                
  1e47  7d0c             jge 0x1e55                               
  1e49  f7d3             not bx                                   
  1e4b  f7d1             not cx                                   
  1e4d  83c301           add bx, 1                                
  1e50  83d100           adc cx, 0                                
  1e53  ebd1             jmp 0x1e26                               
  1e55  2bc3             sub ax, bx                               
  1e57  7304             jae 0x1e5d                               
  1e59  81ea0010         sub dx, 0x1000                           
  1e5d  8af9             mov bh, cl                               
  1e5f  b104             mov cl, 4                                
  1e61  d2e7             shl bh, cl                               
  1e63  32db             xor bl, bl                               
  1e65  2bd3             sub dx, bx                               
  1e67  8ae8             mov ch, al                               
  1e69  d3e8             shr ax, cl                               
  1e6b  03d0             add dx, ax                               
  1e6d  8ac5             mov al, ch                               
  1e6f  250f00           and ax, 0xf                              
  1e72  cb               retf                                     
  1e73  5b               pop bx                                   
  1e74  2be1             sub sp, cx                               
  1e76  0e               push cs                                  
  1e77  eb05             jmp 0x1e7e                               

res_0000_1e79:  ; ENTRY
  1e79  5b               pop bx                                   
  1e7a  07               pop es                                   
  1e7b  2be1             sub sp, cx                               
  1e7d  06               push es                                  
  1e7e  53               push bx                                  
  1e7f  57               push di                                  
  1e80  1e               push ds                                  
  1e81  8bfc             mov di, sp                               
  1e83  83c708           add di, 8                                
  1e86  8cd3             mov bx, ss                               
  1e88  8ec3             mov es, bx                               
  1e8a  8eda             mov ds, dx                               
  1e8c  96               xchg si, ax                              
  1e8d  fc               cld                                      
  1e8e  d1e9             shr cx, 1                                
  1e90  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  1e92  13c9             adc cx, cx                               
  1e94  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  1e96  96               xchg si, ax                              
  1e97  1f               pop ds                                   
  1e98  5f               pop di                                   
  1e99  cb               retf                                     

res_0000_1e9a:  ; ENTRY
  1e9a  55               push bp                                  
  1e9b  8bec             mov bp, sp                               
  1e9d  56               push si                                  
  1e9e  8b7604           mov si, word ptr [bp + 4]                
  1ea1  0bf6             or si, si                                
  1ea3  7c15             jl 0x1eba                                
  1ea5  83fe58           cmp si, 0x58                             
  1ea8  7e03             jle 0x1ead                               
  1eaa  be5700           mov si, 0x57                             
  1ead  8936283d         mov word ptr [0x3d28], si                
  1eb1  8a842a3d         mov al, byte ptr [si + 0x3d2a]           
  1eb5  98               cwde                                     
  1eb6  8bf0             mov si, ax                               
  1eb8  eb0d             jmp 0x1ec7                               
  1eba  f7de             neg si                                   
  1ebc  83fe30           cmp si, 0x30                             
  1ebf  7fe9             jg 0x1eaa                                
  1ec1  c706283dffff     mov word ptr [0x3d28], 0xffff            
  1ec7  89367f00         mov word ptr [0x7f], si                  
  1ecb  b8ffff           mov ax, 0xffff                           
  1ece  5e               pop si                                   
  1ecf  5d               pop bp                                   
  1ed0  c20200           ret 2                                    
  1ed3  55               push bp                                  
  1ed4  8bec             mov bp, sp                               
  1ed6  56               push si                                  
  1ed7  8b7604           mov si, word ptr [bp + 4]                
  1eda  56               push si                                  
  1edb  e8bcff           call 0x1e9a                              
  1ede  8bc6             mov ax, si                               
  1ee0  5e               pop si                                   
  1ee1  5d               pop bp                                   
  1ee2  c20200           ret 2                                    

res_0000_1ee5:  ; ENTRY
  1ee5  55               push bp                                  
  1ee6  8bec             mov bp, sp                               
  1ee8  b80044           mov ax, 0x4400                           
  1eeb  8b5e06           mov bx, word ptr [bp + 6]                
  1eee  cd21             int 0x21                                 
  1ef0  92               xchg dx, ax                              
  1ef1  258000           and ax, 0x80                             
  1ef4  5d               pop bp                                   
  1ef5  cb               retf                                     

res_0000_1ef6:  ; ENTRY
  1ef6  55               push bp                                  
  1ef7  8bec             mov bp, sp                               
  1ef9  83ec22           sub sp, 0x22                             
  1efc  56               push si                                  
  1efd  57               push di                                  
  1efe  06               push es                                  
  1eff  c47e0a           les di, ptr [bp + 0xa]                   
  1f02  8b5e08           mov bx, word ptr [bp + 8]                
  1f05  83fb24           cmp bx, 0x24                             
  1f08  775c             ja 0x1f66                                
  1f0a  80fb02           cmp bl, 2                                
  1f0d  7257             jb 0x1f66                                
  1f0f  8b460e           mov ax, word ptr [bp + 0xe]              
  1f12  8b4e10           mov cx, word ptr [bp + 0x10]             
  1f15  0bc9             or cx, cx                                
  1f17  7d12             jge 0x1f2b                               
  1f19  807e0600         cmp byte ptr [bp + 6], 0                 
  1f1d  740c             je 0x1f2b                                
  1f1f  26c6052d         mov byte ptr es:[di], 0x2d               
  1f23  47               inc di                                   
  1f24  f7d9             neg cx                                   
  1f26  f7d8             neg ax                                   
  1f28  83d900           sbb cx, 0                                
  1f2b  8d76de           lea si, [bp - 0x22]                      
  1f2e  e310             jcxz 0x1f40                              
  1f30  91               xchg cx, ax                              
  1f31  2bd2             sub dx, dx                               
  1f33  f7f3             div bx                                   
  1f35  91               xchg cx, ax                              
  1f36  f7f3             div bx                                   
  1f38  368814           mov byte ptr ss:[si], dl                 
  1f3b  46               inc si                                   
  1f3c  e30a             jcxz 0x1f48                              
  1f3e  ebf0             jmp 0x1f30                               
  1f40  2bd2             sub dx, dx                               
  1f42  f7f3             div bx                                   
  1f44  368814           mov byte ptr ss:[si], dl                 
  1f47  46               inc si                                   
  1f48  0bc0             or ax, ax                                
  1f4a  75f4             jne 0x1f40                               
  1f4c  8d4ede           lea cx, [bp - 0x22]                      
  1f4f  f7d9             neg cx                                   
  1f51  03ce             add cx, si                               
  1f53  fc               cld                                      
  1f54  4e               dec si                                   
  1f55  368a04           mov al, byte ptr ss:[si]                 
  1f58  2c0a             sub al, 0xa                              
  1f5a  7304             jae 0x1f60                               
  1f5c  043a             add al, 0x3a                             
  1f5e  eb03             jmp 0x1f63                               
  1f60  024604           add al, byte ptr [bp + 4]                
  1f63  aa               stosb byte ptr es:[di], al               
  1f64  e2ee             loop 0x1f54                              
  1f66  b000             mov al, 0                                
  1f68  aa               stosb byte ptr es:[di], al               
  1f69  07               pop es                                   
  1f6a  8b560c           mov dx, word ptr [bp + 0xc]              
  1f6d  8b460a           mov ax, word ptr [bp + 0xa]              
  1f70  5f               pop di                                   
  1f71  5e               pop si                                   
  1f72  8be5             mov sp, bp                               
  1f74  5d               pop bp                                   
  1f75  c20e00           ret 0xe                                  
  1f78  55               push bp                                  
  1f79  8bec             mov bp, sp                               
  1f7b  33c0             xor ax, ax                               
  1f7d  50               push ax                                  
  1f7e  ff7608           push word ptr [bp + 8]                   
  1f81  ff7606           push word ptr [bp + 6]                   
  1f84  ff7604           push word ptr [bp + 4]                   
  1f87  b80a00           mov ax, 0xa                              
  1f8a  50               push ax                                  
  1f8b  b000             mov al, 0                                
  1f8d  50               push ax                                  
  1f8e  b061             mov al, 0x61                             
  1f90  50               push ax                                  
  1f91  e862ff           call 0x1ef6                              
  1f94  5d               pop bp                                   
  1f95  c20600           ret 6                                    

res_0000_1f98:  ; ENTRY
  1f98  55               push bp                                  
  1f99  8bec             mov bp, sp                               
  1f9b  8b5e06           mov bx, word ptr [bp + 6]                
  1f9e  d1e3             shl bx, 1                                
  1fa0  81a7fe3cfffd     and word ptr [bx + 0x3cfe], 0xfdff       
  1fa6  b442             mov ah, 0x42                             
  1fa8  8a460c           mov al, byte ptr [bp + 0xc]              
  1fab  8b5e06           mov bx, word ptr [bp + 6]                
  1fae  8b4e0a           mov cx, word ptr [bp + 0xa]              
  1fb1  8b5608           mov dx, word ptr [bp + 8]                
  1fb4  cd21             int 0x21                                 
  1fb6  7202             jb 0x1fba                                
  1fb8  eb05             jmp 0x1fbf                               
  1fba  50               push ax                                  
  1fbb  e8dcfe           call 0x1e9a                              
  1fbe  99               cdq                                      
  1fbf  5d               pop bp                                   
  1fc0  cb               retf                                     

res_0000_1fc1:  ; ENTRY
  1fc1  56               push si                                  
  1fc2  96               xchg si, ax                              
  1fc3  92               xchg dx, ax                              
  1fc4  85c0             test ax, ax                              
  1fc6  7402             je 0x1fca                                
  1fc8  f7e3             mul bx                                   
  1fca  e305             jcxz 0x1fd1                              
  1fcc  91               xchg cx, ax                              
  1fcd  f7e6             mul si                                   
  1fcf  03c1             add ax, cx                               
  1fd1  96               xchg si, ax                              
  1fd2  f7e3             mul bx                                   
  1fd4  03d6             add dx, si                               
  1fd6  5e               pop si                                   
  1fd7  c3               ret                                      

res_0000_1fd8:  ; ENTRY
  1fd8  51               push cx                                  
  1fd9  8ae8             mov ch, al                               
  1fdb  b104             mov cl, 4                                
  1fdd  d3e8             shr ax, cl                               
  1fdf  03d0             add dx, ax                               
  1fe1  8ac5             mov al, ch                               
  1fe3  8ae3             mov ah, bl                               
  1fe5  d3eb             shr bx, cl                               
  1fe7  59               pop cx                                   
  1fe8  03cb             add cx, bx                               
  1fea  8adc             mov bl, ah                               
  1fec  250f00           and ax, 0xf                              
  1fef  83e30f           and bx, 0xf                              
  1ff2  3bd1             cmp dx, cx                               
  1ff4  7502             jne 0x1ff8                               
  1ff6  3bc3             cmp ax, bx                               
  1ff8  c3               ret                                      

res_0000_1ff9:  ; ENTRY
  1ff9  55               push bp                                  
  1ffa  8bec             mov bp, sp                               
  1ffc  8b4606           mov ax, word ptr [bp + 6]                
  1fff  c706863d0000     mov word ptr [0x3d86], 0                 
  2005  a3843d           mov word ptr [0x3d84], ax                
  2008  5d               pop bp                                   
  2009  cb               retf                                     

res_0000_200a:  ; ENTRY
  200a  8b0e863d         mov cx, word ptr [0x3d86]                
  200e  8b1e843d         mov bx, word ptr [0x3d84]                
  2012  ba5a01           mov dx, 0x15a                            
  2015  b8354e           mov ax, 0x4e35                           
  2018  e8a6ff           call 0x1fc1                              
  201b  050100           add ax, 1                                
  201e  83d200           adc dx, 0                                
  2021  8916863d         mov word ptr [0x3d86], dx                
  2025  a3843d           mov word ptr [0x3d84], ax                
  2028  a1863d           mov ax, word ptr [0x3d86]                
  202b  99               cdq                                      
  202c  25ff7f           and ax, 0x7fff                           
  202f  cb               retf                                     

res_0000_2030:  ; ENTRY
  2030  55               push bp                                  
  2031  8bec             mov bp, sp                               
  2033  83ec2a           sub sp, 0x2a                             
  2036  56               push si                                  
  2037  57               push di                                  
  2038  c746fc0000       mov word ptr [bp - 4], 0                 
  203d  c746fa0000       mov word ptr [bp - 6], 0                 
  2042  eb1b             jmp 0x205f                               

res_0000_2044:  ; ENTRY
  2044  c47e10           les di, ptr [bp + 0x10]                  
  2047  f646ff20         test byte ptr [bp - 1], 0x20             
  204b  7408             je 0x2055                                
  204d  26c43d           les di, ptr es:[di]                      
  2050  83461004         add word ptr [bp + 0x10], 4              
  2054  c3               ret                                      
  2055  268b3d           mov di, word ptr es:[di]                 
  2058  1e               push ds                                  
  2059  07               pop es                                   
  205a  83461002         add word ptr [bp + 0x10], 2              
  205e  c3               ret                                      
  205f  06               push es                                  
  2060  fc               cld                                      
  2061  8b760c           mov si, word ptr [bp + 0xc]              
  2064  8e460e           mov es, word ptr [bp + 0xe]              
  2067  26ac             lodsb al, byte ptr es:[si]               
  2069  0ac0             or al, al                                
  206b  746e             je 0x20db                                
  206d  3c25             cmp al, 0x25                             
  206f  746d             je 0x20de                                
  2071  98               cwde                                     
  2072  97               xchg di, ax                              
  2073  ff46fa           inc word ptr [bp - 6]                    
  2076  ff760a           push word ptr [bp + 0xa]                 
  2079  ff7608           push word ptr [bp + 8]                   
  207c  ff5604           call word ptr [bp + 4]                   
  207f  59               pop cx                                   
  2080  59               pop cx                                   
  2081  0bc0             or ax, ax                                
  2083  7c2a             jl 0x20af                                
  2085  98               cwde                                     
  2086  0bff             or di, di                                
  2088  783a             js 0x20c4                                
  208a  80bd883d01       cmp byte ptr [di + 0x3d88], 1            
  208f  7533             jne 0x20c4                               
  2091  93               xchg bx, ax                              
  2092  0adb             or bl, bl                                
  2094  781c             js 0x20b2                                
  2096  80bf883d01       cmp byte ptr [bx + 0x3d88], 1            
  209b  7515             jne 0x20b2                               
  209d  ff46fa           inc word ptr [bp - 6]                    
  20a0  ff760a           push word ptr [bp + 0xa]                 
  20a3  ff7608           push word ptr [bp + 8]                   
  20a6  ff5604           call word ptr [bp + 4]                   
  20a9  59               pop cx                                   
  20aa  59               pop cx                                   
  20ab  0bc0             or ax, ax                                
  20ad  7fe2             jg 0x2091                                
  20af  e99303           jmp 0x2445                               
  20b2  ff760a           push word ptr [bp + 0xa]                 
  20b5  ff7608           push word ptr [bp + 8]                   
  20b8  53               push bx                                  
  20b9  ff5606           call word ptr [bp + 6]                   
  20bc  83c406           add sp, 6                                
  20bf  ff4efa           dec word ptr [bp - 6]                    
  20c2  eba0             jmp 0x2064                               
  20c4  3bc7             cmp ax, di                               
  20c6  749c             je 0x2064                                
  20c8  ff760a           push word ptr [bp + 0xa]                 
  20cb  ff7608           push word ptr [bp + 8]                   
  20ce  50               push ax                                  
  20cf  ff5606           call word ptr [bp + 6]                   
  20d2  83c406           add sp, 6                                
  20d5  ff4efa           dec word ptr [bp - 6]                    
  20d8  e98203           jmp 0x245d                               
  20db  e97f03           jmp 0x245d                               
  20de  c746f6ffff       mov word ptr [bp - 0xa], 0xffff          
  20e3  8e460e           mov es, word ptr [bp + 0xe]              
  20e6  c646ff20         mov byte ptr [bp - 1], 0x20              
  20ea  26ac             lodsb al, byte ptr es:[si]               
  20ec  98               cwde                                     
  20ed  89760c           mov word ptr [bp + 0xc], si              
  20f0  97               xchg di, ax                              
  20f1  0bff             or di, di                                
  20f3  7c19             jl 0x210e                                
  20f5  8a9d883d         mov bl, byte ptr [di + 0x3d88]           
  20f9  32ff             xor bh, bh                               
  20fb  83fb15           cmp bx, 0x15                             
  20fe  7603             jbe 0x2103                               
  2100  e94203           jmp 0x2445                               
  2103  d1e3             shl bx, 1                                
  2105  2effa7f824       jmp word ptr cs:[bx + 0x24f8]            
res_0000_210a:  ; case
  210a  97               xchg di, ax                              
  210b  e963ff           jmp 0x2071                               
  210e  e94c03           jmp 0x245d                               
res_0000_2111:  ; case
  2111  804eff01         or byte ptr [bp - 1], 1                  
  2115  ebd3             jmp 0x20ea                               
res_0000_2117:  ; case
  2117  83ef30           sub di, 0x30                             
  211a  877ef6           xchg word ptr [bp - 0xa], di             
  211d  0bff             or di, di                                
  211f  7cc9             jl 0x20ea                                
  2121  b80a00           mov ax, 0xa                              
  2124  f7e7             mul di                                   
  2126  0146f6           add word ptr [bp - 0xa], ax              
  2129  ebbf             jmp 0x20ea                               
res_0000_212b:  ; case
  212b  804eff08         or byte ptr [bp - 1], 8                  
  212f  ebb9             jmp 0x20ea                               
res_0000_2131:  ; case
  2131  804eff04         or byte ptr [bp - 1], 4                  
  2135  ebb3             jmp 0x20ea                               
res_0000_2137:  ; case
  2137  804eff02         or byte ptr [bp - 1], 2                  
  213b  ebad             jmp 0x20ea                               
res_0000_213d:  ; case
  213d  8066ffdf         and byte ptr [bp - 1], 0xdf              
  2141  eba7             jmp 0x20ea                               
res_0000_2143:  ; case
  2143  804eff20         or byte ptr [bp - 1], 0x20               
  2147  eba1             jmp 0x20ea                               
res_0000_2149:  ; case
  2149  8b46fa           mov ax, word ptr [bp - 6]                
  214c  2bd2             sub dx, dx                               
  214e  f646ff01         test byte ptr [bp - 1], 1                
  2152  7455             je 0x21a9                                
  2154  eb94             jmp 0x20ea                               
res_0000_2156:  ; case
  2156  be0800           mov si, 8                                
  2159  eb0c             jmp 0x2167                               
res_0000_215b:  ; case
  215b  be0a00           mov si, 0xa                              
  215e  eb07             jmp 0x2167                               
res_0000_2160:  ; case
  2160  be1000           mov si, 0x10                             
  2163  eb02             jmp 0x2167                               
res_0000_2165:  ; case
  2165  33f6             xor si, si                               
  2167  f7c72000         test di, 0x20                            
  216b  7509             jne 0x2176                               
  216d  83ff58           cmp di, 0x58                             
  2170  7404             je 0x2176                                
  2172  804eff04         or byte ptr [bp - 1], 4                  
  2176  16               push ss                                  
  2177  8d46f8           lea ax, [bp - 8]                         
  217a  50               push ax                                  
  217b  16               push ss                                  
  217c  8d46fa           lea ax, [bp - 6]                         
  217f  50               push ax                                  
  2180  8b46f6           mov ax, word ptr [bp - 0xa]              
  2183  25ff7f           and ax, 0x7fff                           
  2186  50               push ax                                  
  2187  56               push si                                  
  2188  ff760a           push word ptr [bp + 0xa]                 
  218b  ff7608           push word ptr [bp + 8]                   
  218e  ff7606           push word ptr [bp + 6]                   
  2191  ff7604           push word ptr [bp + 4]                   
  2194  e8b803           call 0x254f                              
  2197  83c414           add sp, 0x14                             
  219a  837ef800         cmp word ptr [bp - 8], 0                 
  219e  7e18             jle 0x21b8                               
  21a0  f646ff01         test byte ptr [bp - 1], 1                
  21a4  750f             jne 0x21b5                               
  21a6  ff46fc           inc word ptr [bp - 4]                    
  21a9  e898fe           call 0x2044                              
  21ac  ab               stosw word ptr es:[di], ax               
  21ad  f646ff04         test byte ptr [bp - 1], 4                
  21b1  7402             je 0x21b5                                
  21b3  92               xchg dx, ax                              
  21b4  ab               stosw word ptr es:[di], ax               
  21b5  e9a9fe           jmp 0x2061                               
  21b8  7c03             jl 0x21bd                                
  21ba  e9a002           jmp 0x245d                               
  21bd  e98502           jmp 0x2445                               
res_0000_21c0:  ; case
  21c0  e80000           call 0x21c3                              

res_0000_21c3:  ; ENTRY
  21c3  e99e02           jmp 0x2464                               
  21c6  ff760a           push word ptr [bp + 0xa]                 
  21c9  ff7608           push word ptr [bp + 8]                   
  21cc  50               push ax                                  
  21cd  ff5606           call word ptr [bp + 6]                   
  21d0  83c406           add sp, 6                                
  21d3  ff4efa           dec word ptr [bp - 6]                    
  21d6  8166f6ff7f       and word ptr [bp - 0xa], 0x7fff          
  21db  e80000           call 0x21de                              

res_0000_21de:  ; ENTRY
  21de  e9ad02           jmp 0x248e                               
  21e1  52               push dx                                  
  21e2  3c3a             cmp al, 0x3a                             
  21e4  7419             je 0x21ff                                
  21e6  0bc0             or ax, ax                                
  21e8  7e10             jle 0x21fa                               
  21ea  ff760a           push word ptr [bp + 0xa]                 
  21ed  ff7608           push word ptr [bp + 8]                   
  21f0  50               push ax                                  
  21f1  ff5606           call word ptr [bp + 6]                   
  21f4  83c406           add sp, 6                                
  21f7  ff4efa           dec word ptr [bp - 6]                    
  21fa  5a               pop dx                                   
  21fb  8cdb             mov bx, ds                               
  21fd  eb1f             jmp 0x221e                               
  21ff  e80000           call 0x2202                              

res_0000_2202:  ; ENTRY
  2202  e98902           jmp 0x248e                               
  2205  5b               pop bx                                   
  2206  0bc0             or ax, ax                                
  2208  7e14             jle 0x221e                               
  220a  52               push dx                                  
  220b  53               push bx                                  
  220c  ff760a           push word ptr [bp + 0xa]                 
  220f  ff7608           push word ptr [bp + 8]                   
  2212  50               push ax                                  
  2213  ff5606           call word ptr [bp + 6]                   
  2216  83c406           add sp, 6                                
  2219  ff4efa           dec word ptr [bp - 6]                    
  221c  5b               pop bx                                   
  221d  5a               pop dx                                   
  221e  f646ff01         test byte ptr [bp - 1], 1                
  2222  7510             jne 0x2234                               
  2224  e81dfe           call 0x2044                              
  2227  ff46fc           inc word ptr [bp - 4]                    
  222a  92               xchg dx, ax                              
  222b  ab               stosw word ptr es:[di], ax               
  222c  f646ff20         test byte ptr [bp - 1], 0x20             
  2230  7402             je 0x2234                                
  2232  93               xchg bx, ax                              
  2233  ab               stosw word ptr es:[di], ax               
  2234  e92afe           jmp 0x2061                               
  2237  e90b02           jmp 0x2445                               
res_0000_223a:  ; case
  223a  16               push ss                                  
  223b  8d46f8           lea ax, [bp - 8]                         
  223e  50               push ax                                  
  223f  16               push ss                                  
  2240  8d46fa           lea ax, [bp - 6]                         
  2243  50               push ax                                  
  2244  b8ff7f           mov ax, 0x7fff                           
  2247  2346f6           and ax, word ptr [bp - 0xa]              
  224a  50               push ax                                  
  224b  ff760a           push word ptr [bp + 0xa]                 
  224e  ff7608           push word ptr [bp + 8]                   
  2251  ff7606           push word ptr [bp + 6]                   
  2254  ff7604           push word ptr [bp + 4]                   
  2257  e84c17           call 0x39a6                              
  225a  83c412           add sp, 0x12                             
  225d  837ef800         cmp word ptr [bp - 8], 0                 
  2261  7e39             jle 0x229c                               
  2263  8a46ff           mov al, byte ptr [bp - 1]                
  2266  98               cwde                                     
  2267  a90100           test ax, 1                               
  226a  752a             jne 0x2296                               
  226c  e8d5fd           call 0x2044                              
  226f  ff46fc           inc word ptr [bp - 4]                    
  2272  f646ff04         test byte ptr [bp - 1], 4                
  2276  7405             je 0x227d                                
  2278  b80400           mov ax, 4                                
  227b  eb0d             jmp 0x228a                               
  227d  f646ff08         test byte ptr [bp - 1], 8                
  2281  7405             je 0x2288                                
  2283  b80800           mov ax, 8                                
  2286  eb02             jmp 0x228a                               
  2288  33c0             xor ax, ax                               
  228a  50               push ax                                  
  228b  06               push es                                  
  228c  57               push di                                  
  228d  e81a17           call 0x39aa                              
  2290  83c406           add sp, 6                                
  2293  e9cbfd           jmp 0x2061                               
  2296  e81517           call 0x39ae                              
  2299  e9c5fd           jmp 0x2061                               
  229c  e80f17           call 0x39ae                              
  229f  7c96             jl 0x2237                                
  22a1  e9b901           jmp 0x245d                               
res_0000_22a4:  ; case
  22a4  e80000           call 0x22a7                              

res_0000_22a7:  ; ENTRY
  22a7  e9ba01           jmp 0x2464                               
  22aa  f646ff01         test byte ptr [bp - 1], 1                
  22ae  7506             jne 0x22b6                               
  22b0  e891fd           call 0x2044                              
  22b3  ff46fc           inc word ptr [bp - 4]                    
  22b6  8166f6ff7f       and word ptr [bp - 0xa], 0x7fff          
  22bb  742d             je 0x22ea                                
  22bd  f646ff01         test byte ptr [bp - 1], 1                
  22c1  7501             jne 0x22c4                               
  22c3  aa               stosb byte ptr es:[di], al               
  22c4  ff46fa           inc word ptr [bp - 6]                    
  22c7  06               push es                                  
  22c8  ff760a           push word ptr [bp + 0xa]                 
  22cb  ff7608           push word ptr [bp + 8]                   
  22ce  ff5604           call word ptr [bp + 4]                   
  22d1  59               pop cx                                   
  22d2  59               pop cx                                   
  22d3  07               pop es                                   
  22d4  0bc0             or ax, ax                                
  22d6  7e12             jle 0x22ea                               
  22d8  0ac0             or al, al                                
  22da  7809             js 0x22e5                                
  22dc  93               xchg bx, ax                              
  22dd  80bf883d01       cmp byte ptr [bx + 0x3d88], 1            
  22e2  93               xchg bx, ax                              
  22e3  7e05             jle 0x22ea                               
  22e5  ff4ef6           dec word ptr [bp - 0xa]                  
  22e8  7fd3             jg 0x22bd                                
  22ea  06               push es                                  
  22eb  ff760a           push word ptr [bp + 0xa]                 
  22ee  ff7608           push word ptr [bp + 8]                   
  22f1  50               push ax                                  
  22f2  ff5606           call word ptr [bp + 6]                   
  22f5  83c406           add sp, 6                                
  22f8  07               pop es                                   
  22f9  ff4efa           dec word ptr [bp - 6]                    
  22fc  f646ff01         test byte ptr [bp - 1], 1                
  2300  7503             jne 0x2305                               
  2302  b000             mov al, 0                                
  2304  aa               stosb byte ptr es:[di], al               
  2305  e959fd           jmp 0x2061                               
res_0000_2308:  ; case
  2308  f646ff01         test byte ptr [bp - 1], 1                
  230c  7503             jne 0x2311                               
  230e  e833fd           call 0x2044                              
  2311  8b76f6           mov si, word ptr [bp - 0xa]              
  2314  0bf6             or si, si                                
  2316  7d03             jge 0x231b                               
  2318  be0100           mov si, 1                                
  231b  741e             je 0x233b                                
  231d  ff46fa           inc word ptr [bp - 6]                    
  2320  06               push es                                  
  2321  ff760a           push word ptr [bp + 0xa]                 
  2324  ff7608           push word ptr [bp + 8]                   
  2327  ff5604           call word ptr [bp + 4]                   
  232a  59               pop cx                                   
  232b  59               pop cx                                   
  232c  07               pop es                                   
  232d  0bc0             or ax, ax                                
  232f  7c16             jl 0x2347                                
  2331  f646ff01         test byte ptr [bp - 1], 1                
  2335  7501             jne 0x2338                               
  2337  aa               stosb byte ptr es:[di], al               
  2338  4e               dec si                                   
  2339  7fe2             jg 0x231d                                
  233b  f646ff01         test byte ptr [bp - 1], 1                
  233f  7503             jne 0x2344                               
  2341  ff46fc           inc word ptr [bp - 4]                    
  2344  e91afd           jmp 0x2061                               
  2347  e9fb00           jmp 0x2445                               
res_0000_234a:  ; case
  234a  06               push es                                  
  234b  2bc0             sub ax, ax                               
  234d  fc               cld                                      
  234e  16               push ss                                  
  234f  07               pop es                                   
  2350  8d7ed6           lea di, [bp - 0x2a]                      
  2353  b91000           mov cx, 0x10                             
  2356  f3ab             rep stosw word ptr es:[di], ax           
  2358  07               pop es                                   
  2359  26ac             lodsb al, byte ptr es:[si]               
  235b  8066ffef         and byte ptr [bp - 1], 0xef              
  235f  3c5e             cmp al, 0x5e                             
  2361  7506             jne 0x2369                               
  2363  804eff10         or byte ptr [bp - 1], 0x10               
  2367  26ac             lodsb al, byte ptr es:[si]               
  2369  b400             mov ah, 0                                
  236b  8ad0             mov dl, al                               
  236d  8bf8             mov di, ax                               
  236f  b103             mov cl, 3                                
  2371  d3ef             shr di, cl                               
  2373  b90701           mov cx, 0x107                            
  2376  22ca             and cl, dl                               
  2378  d2e5             shl ch, cl                               
  237a  086bd6           or byte ptr [bp + di - 0x2a], ch         
  237d  26ac             lodsb al, byte ptr es:[si]               
  237f  3c00             cmp al, 0                                
  2381  7429             je 0x23ac                                
  2383  3c5d             cmp al, 0x5d                             
  2385  7428             je 0x23af                                
  2387  3c2d             cmp al, 0x2d                             
  2389  75e0             jne 0x236b                               
  238b  263a14           cmp dl, byte ptr es:[si]                 
  238e  77db             ja 0x236b                                
  2390  26803c5d         cmp byte ptr es:[si], 0x5d               
  2394  74d5             je 0x236b                                
  2396  26ac             lodsb al, byte ptr es:[si]               
  2398  2ac2             sub al, dl                               
  239a  74e1             je 0x237d                                
  239c  02d0             add dl, al                               
  239e  d0c5             rol ch, 1                                
  23a0  83d700           adc di, 0                                
  23a3  086bd6           or byte ptr [bp + di - 0x2a], ch         
  23a6  fec8             dec al                                   
  23a8  75f4             jne 0x239e                               
  23aa  ebd1             jmp 0x237d                               
  23ac  e9ae00           jmp 0x245d                               
  23af  89760c           mov word ptr [bp + 0xc], si              
  23b2  8166f6ff7f       and word ptr [bp - 0xa], 0x7fff          
  23b7  8b76f6           mov si, word ptr [bp - 0xa]              
  23ba  f646ff01         test byte ptr [bp - 1], 1                
  23be  7503             jne 0x23c3                               
  23c0  e881fc           call 0x2044                              
  23c3  4e               dec si                                   
  23c4  7c58             jl 0x241e                                
  23c6  ff46fa           inc word ptr [bp - 6]                    
  23c9  06               push es                                  
  23ca  ff760a           push word ptr [bp + 0xa]                 
  23cd  ff7608           push word ptr [bp + 8]                   
  23d0  ff5604           call word ptr [bp + 4]                   
  23d3  59               pop cx                                   
  23d4  59               pop cx                                   
  23d5  07               pop es                                   
  23d6  0bc0             or ax, ax                                
  23d8  7c59             jl 0x2433                                
  23da  96               xchg si, ax                              
  23db  8bde             mov bx, si                               
  23dd  b103             mov cl, 3                                
  23df  d3ee             shr si, cl                               
  23e1  b90701           mov cx, 0x107                            
  23e4  22cb             and cl, bl                               
  23e6  d2e5             shl ch, cl                               
  23e8  846ad6           test byte ptr [bp + si - 0x2a], ch       
  23eb  96               xchg si, ax                              
  23ec  93               xchg bx, ax                              
  23ed  7408             je 0x23f7                                
  23ef  f646ff10         test byte ptr [bp - 1], 0x10             
  23f3  7408             je 0x23fd                                
  23f5  eb0f             jmp 0x2406                               
  23f7  f646ff10         test byte ptr [bp - 1], 0x10             
  23fb  7409             je 0x2406                                
  23fd  f646ff01         test byte ptr [bp - 1], 1                
  2401  75c0             jne 0x23c3                               
  2403  aa               stosb byte ptr es:[di], al               
  2404  ebbd             jmp 0x23c3                               
  2406  06               push es                                  
  2407  ff760a           push word ptr [bp + 0xa]                 
  240a  ff7608           push word ptr [bp + 8]                   
  240d  50               push ax                                  
  240e  ff5606           call word ptr [bp + 6]                   
  2411  83c406           add sp, 6                                
  2414  07               pop es                                   
  2415  ff4efa           dec word ptr [bp - 6]                    
  2418  46               inc si                                   
  2419  3b76f6           cmp si, word ptr [bp - 0xa]              
  241c  7d09             jge 0x2427                               
  241e  f646ff01         test byte ptr [bp - 1], 1                
  2422  750c             jne 0x2430                               
  2424  ff46fc           inc word ptr [bp - 4]                    
  2427  f646ff01         test byte ptr [bp - 1], 1                
  242b  7503             jne 0x2430                               
  242d  b000             mov al, 0                                
  242f  aa               stosb byte ptr es:[di], al               
  2430  e92efc           jmp 0x2061                               
  2433  46               inc si                                   
  2434  3b76f6           cmp si, word ptr [bp - 0xa]              
  2437  7d0c             jge 0x2445                               
  2439  f646ff01         test byte ptr [bp - 1], 1                
  243d  7506             jne 0x2445                               
  243f  b000             mov al, 0                                
  2441  aa               stosb byte ptr es:[di], al               
  2442  ff46fc           inc word ptr [bp - 4]                    
  2445  ff760a           push word ptr [bp + 0xa]                 
  2448  ff7608           push word ptr [bp + 8]                   
  244b  b8ffff           mov ax, 0xffff                           
  244e  50               push ax                                  
  244f  ff5606           call word ptr [bp + 6]                   
  2452  83c406           add sp, 6                                
  2455  837efc01         cmp word ptr [bp - 4], 1                 
  2459  835efc00         sbb word ptr [bp - 4], 0                 
res_0000_245d:  ; case
  245d  07               pop es                                   
  245e  8b46fc           mov ax, word ptr [bp - 4]                
  2461  e98e00           jmp 0x24f2                               
  2464  ff46fa           inc word ptr [bp - 6]                    
  2467  ff760a           push word ptr [bp + 0xa]                 
  246a  ff7608           push word ptr [bp + 8]                   
  246d  ff5604           call word ptr [bp + 4]                   
  2470  59               pop cx                                   
  2471  59               pop cx                                   
  2472  0bc0             or ax, ax                                
  2474  7e13             jle 0x2489                               
  2476  0ac0             or al, al                                
  2478  7809             js 0x2483                                
  247a  93               xchg bx, ax                              
  247b  80bf883d01       cmp byte ptr [bx + 0x3d88], 1            
  2480  93               xchg bx, ax                              
  2481  74e1             je 0x2464                                
  2483  59               pop cx                                   
  2484  83c103           add cx, 3                                
  2487  ffe1             jmp cx                                   
  2489  74f8             je 0x2483                                
  248b  59               pop cx                                   
  248c  ebb7             jmp 0x2445                               
  248e  2bd2             sub dx, dx                               
  2490  b90400           mov cx, 4                                
  2493  ff4ef6           dec word ptr [bp - 0xa]                  
  2496  7c49             jl 0x24e1                                
  2498  52               push dx                                  
  2499  51               push cx                                  
  249a  ff46fa           inc word ptr [bp - 6]                    
  249d  ff760a           push word ptr [bp + 0xa]                 
  24a0  ff7608           push word ptr [bp + 8]                   
  24a3  ff5604           call word ptr [bp + 4]                   
  24a6  59               pop cx                                   
  24a7  59               pop cx                                   
  24a8  59               pop cx                                   
  24a9  5a               pop dx                                   
  24aa  0bc0             or ax, ax                                
  24ac  7e35             jle 0x24e3                               
  24ae  fec9             dec cl                                   
  24b0  7c31             jl 0x24e3                                
  24b2  8ae8             mov ch, al                               
  24b4  80ed30           sub ch, 0x30                             
  24b7  722a             jb 0x24e3                                
  24b9  80fd0a           cmp ch, 0xa                              
  24bc  7217             jb 0x24d5                                
  24be  80ed11           sub ch, 0x11                             
  24c1  7220             jb 0x24e3                                
  24c3  80fd06           cmp ch, 6                                
  24c6  720a             jb 0x24d2                                
  24c8  80ed20           sub ch, 0x20                             
  24cb  7216             jb 0x24e3                                
  24cd  80fd06           cmp ch, 6                                
  24d0  7311             jae 0x24e3                               
  24d2  80c50a           add ch, 0xa                              
  24d5  d1e2             shl dx, 1                                
  24d7  d1e2             shl dx, 1                                
  24d9  d1e2             shl dx, 1                                
  24db  d1e2             shl dx, 1                                
  24dd  02d5             add dl, ch                               
  24df  ebb2             jmp 0x2493                               
  24e1  2bc0             sub ax, ax                               
  24e3  80f904           cmp cl, 4                                
  24e6  7406             je 0x24ee                                
  24e8  59               pop cx                                   
  24e9  83c103           add cx, 3                                
  24ec  ffe1             jmp cx                                   
  24ee  59               pop cx                                   
  24ef  e953ff           jmp 0x2445                               
  24f2  5f               pop di                                   
  24f3  5e               pop si                                   
  24f4  8be5             mov sp, bp                               
  24f6  5d               pop bp                                   
  24f7  c3               ret                                      
  24f8  5d245d245d240a21 dw 245d,245d,245d,210a,2111,2117,2308,215b,215b,2165,223a,212b,2137,2131,2156,22a4,234a,2149,2160,21c0,213d,2143 jump table

res_0000_2524:  ; ENTRY
  2524  53               push bx                                  
  2525  80eb30           sub bl, 0x30                             
  2528  7222             jb 0x254c                                
  252a  80fb09           cmp bl, 9                                
  252d  7612             jbe 0x2541                               
  252f  80fb2a           cmp bl, 0x2a                             
  2532  7705             ja 0x2539                                
  2534  80eb07           sub bl, 7                                
  2537  eb03             jmp 0x253c                               
  2539  80eb27           sub bl, 0x27                             
  253c  80fb09           cmp bl, 9                                
  253f  760b             jbe 0x254c                               
  2541  3ad9             cmp bl, cl                               
  2543  7307             jae 0x254c                               
  2545  44               inc sp                                   
  2546  44               inc sp                                   
  2547  f8               clc                                      
  2548  b700             mov bh, 0                                
  254a  eb02             jmp 0x254e                               
  254c  5b               pop bx                                   
  254d  f9               stc                                      
  254e  c3               ret                                      

res_0000_254f:  ; ENTRY
  254f  55               push bp                                  
  2550  8bec             mov bp, sp                               
  2552  83ec06           sub sp, 6                                
  2555  56               push si                                  
  2556  57               push di                                  
  2557  c646ff00         mov byte ptr [bp - 1], 0                 
  255b  c746fc0000       mov word ptr [bp - 4], 0                 
  2560  c746fa0100       mov word ptr [bp - 6], 1                 
  2565  ff46fc           inc word ptr [bp - 4]                    
  2568  ff760a           push word ptr [bp + 0xa]                 
  256b  ff7608           push word ptr [bp + 8]                   
  256e  ff5604           call word ptr [bp + 4]                   
  2571  59               pop cx                                   
  2572  59               pop cx                                   
  2573  0bc0             or ax, ax                                
  2575  7c71             jl 0x25e8                                
  2577  98               cwde                                     
  2578  93               xchg bx, ax                              
  2579  f6c380           test bl, 0x80                            
  257c  7508             jne 0x2586                               
  257e  bf5f3a           mov di, 0x3a5f                           
  2581  f60101           test byte ptr [bx + di], 1               
  2584  75df             jne 0x2565                               
  2586  93               xchg bx, ax                              
  2587  ff4e0e           dec word ptr [bp + 0xe]                  
  258a  7c63             jl 0x25ef                                
  258c  3c2b             cmp al, 0x2b                             
  258e  7407             je 0x2597                                
  2590  3c2d             cmp al, 0x2d                             
  2592  751a             jne 0x25ae                               
  2594  fe46ff           inc byte ptr [bp - 1]                    
  2597  ff4e0e           dec word ptr [bp + 0xe]                  
  259a  7c53             jl 0x25ef                                
  259c  ff46fc           inc word ptr [bp - 4]                    
  259f  ff760a           push word ptr [bp + 0xa]                 
  25a2  ff7608           push word ptr [bp + 8]                   
  25a5  ff5604           call word ptr [bp + 4]                   
  25a8  59               pop cx                                   
  25a9  59               pop cx                                   
  25aa  0bc0             or ax, ax                                
  25ac  7c3a             jl 0x25e8                                
  25ae  2bf6             sub si, si                               
  25b0  8bfe             mov di, si                               
  25b2  8b4e0c           mov cx, word ptr [bp + 0xc]              
  25b5  e356             jcxz 0x260d                              
  25b7  83f924           cmp cx, 0x24                             
  25ba  7733             ja 0x25ef                                
  25bc  80f902           cmp cl, 2                                
  25bf  722e             jb 0x25ef                                
  25c1  3c30             cmp al, 0x30                             
  25c3  7578             jne 0x263d                               
  25c5  80f910           cmp cl, 0x10                             
  25c8  7571             jne 0x263b                               
  25ca  ff4e0e           dec word ptr [bp + 0xe]                  
  25cd  7c3b             jl 0x260a                                
  25cf  ff46fc           inc word ptr [bp - 4]                    
  25d2  ff760a           push word ptr [bp + 0xa]                 
  25d5  ff7608           push word ptr [bp + 8]                   
  25d8  ff5604           call word ptr [bp + 4]                   
  25db  59               pop cx                                   
  25dc  59               pop cx                                   
  25dd  3c78             cmp al, 0x78                             
  25df  745a             je 0x263b                                
  25e1  3c58             cmp al, 0x58                             
  25e3  7456             je 0x263b                                
  25e5  e97f00           jmp 0x2667                               
  25e8  c746faffff       mov word ptr [bp - 6], 0xffff            
  25ed  eb05             jmp 0x25f4                               
  25ef  c746fa0000       mov word ptr [bp - 6], 0                 
  25f4  ff760a           push word ptr [bp + 0xa]                 
  25f7  ff7608           push word ptr [bp + 8]                   
  25fa  50               push ax                                  
  25fb  ff5606           call word ptr [bp + 6]                   
  25fe  83c406           add sp, 6                                
  2601  ff4efc           dec word ptr [bp - 4]                    
  2604  2bc0             sub ax, ax                               
  2606  99               cdq                                      
  2607  e9b700           jmp 0x26c1                               
  260a  e9a400           jmp 0x26b1                               
  260d  3c30             cmp al, 0x30                             
  260f  c7460c0a00       mov word ptr [bp + 0xc], 0xa             
  2614  7527             jne 0x263d                               
  2616  ff4e0e           dec word ptr [bp + 0xe]                  
  2619  7cef             jl 0x260a                                
  261b  ff46fc           inc word ptr [bp - 4]                    
  261e  ff760a           push word ptr [bp + 0xa]                 
  2621  ff7608           push word ptr [bp + 8]                   
  2624  ff5604           call word ptr [bp + 4]                   
  2627  59               pop cx                                   
  2628  59               pop cx                                   
  2629  c7460c0800       mov word ptr [bp + 0xc], 8               
  262e  3c78             cmp al, 0x78                             
  2630  7404             je 0x2636                                
  2632  3c58             cmp al, 0x58                             
  2634  7531             jne 0x2667                               
  2636  c7460c1000       mov word ptr [bp + 0xc], 0x10            
  263b  eb17             jmp 0x2654                               
  263d  8b4e0c           mov cx, word ptr [bp + 0xc]              
  2640  93               xchg bx, ax                              
  2641  e8e0fe           call 0x2524                              
  2644  93               xchg bx, ax                              
  2645  72a8             jb 0x25ef                                
  2647  96               xchg si, ax                              
  2648  eb0a             jmp 0x2654                               
  264a  96               xchg si, ax                              
  264b  f7660c           mul word ptr [bp + 0xc]                  
  264e  03f0             add si, ax                               
  2650  13fa             adc di, dx                               
  2652  7530             jne 0x2684                               
  2654  ff4e0e           dec word ptr [bp + 0xe]                  
  2657  7c58             jl 0x26b1                                
  2659  ff46fc           inc word ptr [bp - 4]                    
  265c  ff760a           push word ptr [bp + 0xa]                 
  265f  ff7608           push word ptr [bp + 8]                   
  2662  ff5604           call word ptr [bp + 4]                   
  2665  59               pop cx                                   
  2666  59               pop cx                                   
  2667  8b4e0c           mov cx, word ptr [bp + 0xc]              
  266a  93               xchg bx, ax                              
  266b  e8b6fe           call 0x2524                              
  266e  93               xchg bx, ax                              
  266f  73d9             jae 0x264a                               
  2671  eb2e             jmp 0x26a1                               
  2673  96               xchg si, ax                              
  2674  f7e1             mul cx                                   
  2676  97               xchg di, ax                              
  2677  87ca             xchg dx, cx                              
  2679  f7e2             mul dx                                   
  267b  03f7             add si, di                               
  267d  13c1             adc ax, cx                               
  267f  97               xchg di, ax                              
  2680  12d6             adc dl, dh                               
  2682  7551             jne 0x26d5                               
  2684  ff4e0e           dec word ptr [bp + 0xe]                  
  2687  7c28             jl 0x26b1                                
  2689  ff46fc           inc word ptr [bp - 4]                    
  268c  ff760a           push word ptr [bp + 0xa]                 
  268f  ff7608           push word ptr [bp + 8]                   
  2692  ff5604           call word ptr [bp + 4]                   
  2695  59               pop cx                                   
  2696  59               pop cx                                   
  2697  8b4e0c           mov cx, word ptr [bp + 0xc]              
  269a  93               xchg bx, ax                              
  269b  e886fe           call 0x2524                              
  269e  93               xchg bx, ax                              
  269f  73d2             jae 0x2673                               
  26a1  ff760a           push word ptr [bp + 0xa]                 
  26a4  ff7608           push word ptr [bp + 8]                   
  26a7  50               push ax                                  
  26a8  ff5606           call word ptr [bp + 6]                   
  26ab  83c406           add sp, 6                                
  26ae  ff4efc           dec word ptr [bp - 4]                    
  26b1  8bd7             mov dx, di                               
  26b3  96               xchg si, ax                              
  26b4  807eff00         cmp byte ptr [bp - 1], 0                 
  26b8  7407             je 0x26c1                                
  26ba  f7da             neg dx                                   
  26bc  f7d8             neg ax                                   
  26be  83da00           sbb dx, 0                                
  26c1  c47e10           les di, ptr [bp + 0x10]                  
  26c4  8b5efc           mov bx, word ptr [bp - 4]                
  26c7  26011d           add word ptr es:[di], bx                 
  26ca  c47e14           les di, ptr [bp + 0x14]                  
  26cd  8b5efa           mov bx, word ptr [bp - 6]                
  26d0  26891d           mov word ptr es:[di], bx                 
  26d3  eb16             jmp 0x26eb                               
  26d5  b8ffff           mov ax, 0xffff                           
  26d8  baff7f           mov dx, 0x7fff                           
  26db  0246ff           add al, byte ptr [bp - 1]                
  26de  80d400           adc ah, 0                                
  26e1  83d200           adc dx, 0                                
  26e4  c746fa0200       mov word ptr [bp - 6], 2                 
  26e9  ebd6             jmp 0x26c1                               
  26eb  5f               pop di                                   
  26ec  5e               pop si                                   
  26ed  8be5             mov sp, bp                               
  26ef  5d               pop bp                                   
  26f0  c3               ret                                      

res_0000_26f1:  ; ENTRY
  26f1  55               push bp                                  
  26f2  8bec             mov bp, sp                               
  26f4  56               push si                                  
  26f5  8cc3             mov bx, es                               
  26f7  c47606           les si, ptr [bp + 6]                     
  26fa  26891c           mov word ptr es:[si], bx                 
  26fd  8b4604           mov ax, word ptr [bp + 4]                
  2700  26894402         mov word ptr es:[si + 2], ax             
  2704  268c5404         mov word ptr es:[si + 4], ss             
  2708  268c5c06         mov word ptr es:[si + 6], ds             
  270c  8ec3             mov es, bx                               
  270e  5e               pop si                                   
  270f  5d               pop bp                                   
  2710  cb               retf                                     

res_0000_2711:  ; ENTRY
  2711  55               push bp                                  
  2712  8bec             mov bp, sp                               
  2714  56               push si                                  
  2715  b42b             mov ah, 0x2b                             
  2717  c47606           les si, ptr [bp + 6]                     
  271a  268b0c           mov cx, word ptr es:[si]                 
  271d  268b5402         mov dx, word ptr es:[si + 2]             
  2721  cd21             int 0x21                                 
  2723  5e               pop si                                   
  2724  5d               pop bp                                   
  2725  cb               retf                                     

res_0000_2726:  ; ENTRY
  2726  55               push bp                                  
  2727  8bec             mov bp, sp                               
  2729  56               push si                                  
  272a  b42d             mov ah, 0x2d                             
  272c  c47606           les si, ptr [bp + 6]                     
  272f  268b0c           mov cx, word ptr es:[si]                 
  2732  268b5402         mov dx, word ptr es:[si + 2]             
  2736  cd21             int 0x21                                 
  2738  5e               pop si                                   
  2739  5d               pop bp                                   
  273a  cb               retf                                     
  273b  b90500           mov cx, 5                                
  273e  3b0efc3c         cmp cx, word ptr [0x3cfc]                
  2742  7338             jae 0x277c                               
  2744  8bd9             mov bx, cx                               
  2746  d1e3             shl bx, 1                                
  2748  c787fe3c0000     mov word ptr [bx + 0x3cfe], 0            
  274e  8bc1             mov ax, cx                               
  2750  ba1400           mov dx, 0x14                             
  2753  f7ea             imul dx                                  
  2755  8bd8             mov bx, ax                               
  2757  c687703bff       mov byte ptr [bx + 0x3b70], 0xff         
  275c  8bc1             mov ax, cx                               
  275e  ba1400           mov dx, 0x14                             
  2761  f7ea             imul dx                                  
  2763  056c3b           add ax, 0x3b6c                           
  2766  50               push ax                                  
  2767  8bc1             mov ax, cx                               
  2769  ba1400           mov dx, 0x14                             
  276c  f7ea             imul dx                                  
  276e  8bd8             mov bx, ax                               
  2770  58               pop ax                                   
  2771  89877e3b         mov word ptr [bx + 0x3b7e], ax           
  2775  41               inc cx                                   
  2776  3b0efc3c         cmp cx, word ptr [0x3cfc]                
  277a  72c8             jb 0x2744                                
  277c  a0703b           mov al, byte ptr [0x3b70]                
  277f  98               cwde                                     
  2780  50               push ax                                  
  2781  90               nop                                      
  2782  0e               push cs                                  
  2783  e85ff7           call 0x1ee5                              
  2786  59               pop cx                                   
  2787  0bc0             or ax, ax                                
  2789  7506             jne 0x2791                               
  278b  81266e3bfffd     and word ptr [0x3b6e], 0xfdff            
  2791  b80002           mov ax, 0x200                            
  2794  50               push ax                                  
  2795  f7066e3b0002     test word ptr [0x3b6e], 0x200            
  279b  7405             je 0x27a2                                
  279d  b80100           mov ax, 1                                
  27a0  eb02             jmp 0x27a4                               
  27a2  33c0             xor ax, ax                               
  27a4  50               push ax                                  
  27a5  33c0             xor ax, ax                               
  27a7  33d2             xor dx, dx                               
  27a9  50               push ax                                  
  27aa  52               push dx                                  
  27ab  1e               push ds                                  
  27ac  b86c3b           mov ax, 0x3b6c                           
  27af  50               push ax                                  
  27b0  90               nop                                      
  27b1  0e               push cs                                  
  27b2  e83220           call 0x47e7                              
  27b5  83c40c           add sp, 0xc                              
  27b8  a0843b           mov al, byte ptr [0x3b84]                
  27bb  98               cwde                                     
  27bc  50               push ax                                  
  27bd  90               nop                                      
  27be  0e               push cs                                  
  27bf  e823f7           call 0x1ee5                              
  27c2  59               pop cx                                   
  27c3  0bc0             or ax, ax                                
  27c5  7506             jne 0x27cd                               
  27c7  8126823bfffd     and word ptr [0x3b82], 0xfdff            
  27cd  b80002           mov ax, 0x200                            
  27d0  50               push ax                                  
  27d1  f706823b0002     test word ptr [0x3b82], 0x200            
  27d7  7405             je 0x27de                                
  27d9  b80200           mov ax, 2                                
  27dc  eb02             jmp 0x27e0                               
  27de  33c0             xor ax, ax                               
  27e0  50               push ax                                  
  27e1  33c0             xor ax, ax                               
  27e3  33d2             xor dx, dx                               
  27e5  50               push ax                                  
  27e6  52               push dx                                  
  27e7  1e               push ds                                  
  27e8  b8803b           mov ax, 0x3b80                           
  27eb  50               push ax                                  
  27ec  90               nop                                      
  27ed  0e               push cs                                  
  27ee  e8f61f           call 0x47e7                              
  27f1  83c40c           add sp, 0xc                              
  27f4  c3               ret                                      
  27f5  55               push bp                                  
  27f6  8bec             mov bp, sp                               
  27f8  83ec08           sub sp, 8                                
  27fb  16               push ss                                  
  27fc  8d46f8           lea ax, [bp - 8]                         
  27ff  50               push ax                                  
  2800  16               push ss                                  
  2801  8d46fc           lea ax, [bp - 4]                         
  2804  50               push ax                                  
  2805  c45e06           les bx, ptr [bp + 6]                     
  2808  26ff7702         push word ptr es:[bx + 2]                
  280c  26ff37           push word ptr es:[bx]                    
  280f  90               nop                                      
  2810  0e               push cs                                  
  2811  e8ff23           call 0x4c13                              
  2814  83c40c           add sp, 0xc                              
  2817  16               push ss                                  
  2818  8d46fc           lea ax, [bp - 4]                         
  281b  50               push ax                                  
  281c  90               nop                                      
  281d  0e               push cs                                  
  281e  e8f0fe           call 0x2711                              
  2821  59               pop cx                                   
  2822  59               pop cx                                   
  2823  16               push ss                                  
  2824  8d46f8           lea ax, [bp - 8]                         
  2827  50               push ax                                  
  2828  90               nop                                      
  2829  0e               push cs                                  
  282a  e8f9fe           call 0x2726                              
  282d  59               pop cx                                   
  282e  59               pop cx                                   
  282f  33c0             xor ax, ax                               
  2831  8be5             mov sp, bp                               
  2833  5d               pop bp                                   
  2834  cb               retf                                     

res_0000_2835:  ; ENTRY
  2835  55               push bp                                  
  2836  8bec             mov bp, sp                               
  2838  83ec0c           sub sp, 0xc                              
  283b  16               push ss                                  
  283c  8d46fc           lea ax, [bp - 4]                         
  283f  50               push ax                                  
  2840  90               nop                                      
  2841  0e               push cs                                  
  2842  e8d9f4           call 0x1d1e                              
  2845  59               pop cx                                   
  2846  59               pop cx                                   
  2847  16               push ss                                  
  2848  8d46f8           lea ax, [bp - 8]                         
  284b  50               push ax                                  
  284c  90               nop                                      
  284d  0e               push cs                                  
  284e  e8e0f4           call 0x1d31                              
  2851  59               pop cx                                   
  2852  59               pop cx                                   
  2853  16               push ss                                  
  2854  8d46f8           lea ax, [bp - 8]                         
  2857  50               push ax                                  
  2858  16               push ss                                  
  2859  8d46fc           lea ax, [bp - 4]                         
  285c  50               push ax                                  
  285d  90               nop                                      
  285e  0e               push cs                                  
  285f  e88722           call 0x4ae9                              
  2862  83c408           add sp, 8                                
  2865  8956f6           mov word ptr [bp - 0xa], dx              
  2868  8946f4           mov word ptr [bp - 0xc], ax              
  286b  8b4606           mov ax, word ptr [bp + 6]                
  286e  0b4608           or ax, word ptr [bp + 8]                 
  2871  7410             je 0x2883                                
  2873  c45e06           les bx, ptr [bp + 6]                     
  2876  8b46f6           mov ax, word ptr [bp - 0xa]              
  2879  8b56f4           mov dx, word ptr [bp - 0xc]              
  287c  26894702         mov word ptr es:[bx + 2], ax             
  2880  268917           mov word ptr es:[bx], dx                 
  2883  8b56f6           mov dx, word ptr [bp - 0xa]              
  2886  8b46f4           mov ax, word ptr [bp - 0xc]              
  2889  8be5             mov sp, bp                               
  288b  5d               pop bp                                   
  288c  cb               retf                                     

res_0000_288d:  ; ENTRY
  288d  55               push bp                                  
  288e  8bec             mov bp, sp                               
  2890  8b5606           mov dx, word ptr [bp + 6]                
  2893  83faff           cmp dx, -1                               
  2896  7505             jne 0x289d                               
  2898  b8ffff           mov ax, 0xffff                           
  289b  eb1a             jmp 0x28b7                               
  289d  8ac2             mov al, dl                               
  289f  b400             mov ah, 0                                
  28a1  8bd8             mov bx, ax                               
  28a3  f6875f3a04       test byte ptr [bx + 0x3a5f], 4           
  28a8  7409             je 0x28b3                                
  28aa  8ac2             mov al, dl                               
  28ac  b400             mov ah, 0                                
  28ae  052000           add ax, 0x20                             
  28b1  eb04             jmp 0x28b7                               
  28b3  8ac2             mov al, dl                               
  28b5  b400             mov ah, 0                                
  28b7  5d               pop bp                                   
  28b8  cb               retf                                     

res_0000_28b9:  ; ENTRY
  28b9  55               push bp                                  
  28ba  8bec             mov bp, sp                               
  28bc  8b5606           mov dx, word ptr [bp + 6]                
  28bf  83faff           cmp dx, -1                               
  28c2  7505             jne 0x28c9                               
  28c4  b8ffff           mov ax, 0xffff                           
  28c7  eb1a             jmp 0x28e3                               
  28c9  8ac2             mov al, dl                               
  28cb  b400             mov ah, 0                                
  28cd  8bd8             mov bx, ax                               
  28cf  f6875f3a08       test byte ptr [bx + 0x3a5f], 8           
  28d4  7409             je 0x28df                                
  28d6  8ac2             mov al, dl                               
  28d8  b400             mov ah, 0                                
  28da  05e0ff           add ax, 0xffe0                           
  28dd  eb04             jmp 0x28e3                               
  28df  8ac2             mov al, dl                               
  28e1  b400             mov ah, 0                                
  28e3  5d               pop bp                                   
  28e4  cb               retf                                     

res_0000_28e5:  ; ENTRY
  28e5  8ac6             mov al, dh                               
  28e7  e80200           call 0x28ec                              
  28ea  8ac2             mov al, dl                               

res_0000_28ec:  ; ENTRY
  28ec  d410             aam 0x10                                 
  28ee  86e0             xchg al, ah                              
  28f0  e80200           call 0x28f5                              
  28f3  86e0             xchg al, ah                              

res_0000_28f5:  ; ENTRY
  28f5  0490             add al, 0x90                             
  28f7  27               daa                                      
  28f8  1440             adc al, 0x40                             
  28fa  27               daa                                      
  28fb  aa               stosb byte ptr es:[di], al               
  28fc  c3               ret                                      

res_0000_28fd:  ; ENTRY
  28fd  55               push bp                                  
  28fe  8bec             mov bp, sp                               
  2900  81ec9600         sub sp, 0x96                             
  2904  56               push si                                  
  2905  57               push di                                  
  2906  c746ee0000       mov word ptr [bp - 0x12], 0              
  290b  c746ec5000       mov word ptr [bp - 0x14], 0x50           
  2910  c746ea0000       mov word ptr [bp - 0x16], 0              
  2915  eb4a             jmp 0x2961                               

res_0000_2917:  ; ENTRY
  2917  57               push di                                  
  2918  b9ffff           mov cx, 0xffff                           
  291b  32c0             xor al, al                               
  291d  f2ae             repne scasb al, byte ptr es:[di]         
  291f  f7d1             not cx                                   
  2921  49               dec cx                                   
  2922  5f               pop di                                   
  2923  c3               ret                                      

res_0000_2924:  ; ENTRY
  2924  368805           mov byte ptr ss:[di], al                 
  2927  47               inc di                                   
  2928  fe4eec           dec byte ptr [bp - 0x14]                 
  292b  7533             jne 0x2960                               

res_0000_292d:  ; ENTRY
  292d  53               push bx                                  
  292e  51               push cx                                  
  292f  52               push dx                                  
  2930  06               push es                                  
  2931  8d866aff         lea ax, [bp - 0x96]                      
  2935  2bf8             sub di, ax                               
  2937  16               push ss                                  
  2938  8d866aff         lea ax, [bp - 0x96]                      
  293c  50               push ax                                  
  293d  57               push di                                  
  293e  ff760c           push word ptr [bp + 0xc]                 
  2941  ff760a           push word ptr [bp + 0xa]                 
  2944  ff560e           call word ptr [bp + 0xe]                 
  2947  0bc0             or ax, ax                                
  2949  7505             jne 0x2950                               
  294b  c746ea0100       mov word ptr [bp - 0x16], 1              
  2950  c746ec5000       mov word ptr [bp - 0x14], 0x50           
  2955  017eee           add word ptr [bp - 0x12], di             
  2958  8dbe6aff         lea di, [bp - 0x96]                      
  295c  07               pop es                                   
  295d  5a               pop dx                                   
  295e  59               pop cx                                   
  295f  5b               pop bx                                   
  2960  c3               ret                                      
  2961  06               push es                                  
  2962  fc               cld                                      
  2963  8dbe6aff         lea di, [bp - 0x96]                      
  2967  897efc           mov word ptr [bp - 4], di                
  296a  8b7efc           mov di, word ptr [bp - 4]                
  296d  c47606           les si, ptr [bp + 6]                     
  2970  26ac             lodsb al, byte ptr es:[si]               
  2972  0ac0             or al, al                                
  2974  7412             je 0x2988                                
  2976  3c25             cmp al, 0x25                             
  2978  7411             je 0x298b                                
  297a  368805           mov byte ptr ss:[di], al                 
  297d  47               inc di                                   
  297e  fe4eec           dec byte ptr [bp - 0x14]                 
  2981  7fed             jg 0x2970                                
  2983  e8a7ff           call 0x292d                              
  2986  ebe8             jmp 0x2970                               
  2988  e9e503           jmp 0x2d70                               
  298b  8976f0           mov word ptr [bp - 0x10], si             
  298e  26ac             lodsb al, byte ptr es:[si]               
  2990  3c25             cmp al, 0x25                             
  2992  74e6             je 0x297a                                
  2994  897efc           mov word ptr [bp - 4], di                
  2997  33c9             xor cx, cx                               
  2999  894ef2           mov word ptr [bp - 0xe], cx              
  299c  c746fe2000       mov word ptr [bp - 2], 0x20              
  29a1  884ef5           mov byte ptr [bp - 0xb], cl              
  29a4  c746f8ffff       mov word ptr [bp - 8], 0xffff            
  29a9  c746f6ffff       mov word ptr [bp - 0xa], 0xffff          
  29ae  eb02             jmp 0x29b2                               
  29b0  26ac             lodsb al, byte ptr es:[si]               
  29b2  32e4             xor ah, ah                               
  29b4  8bd0             mov dx, ax                               
  29b6  8bd8             mov bx, ax                               
  29b8  80eb20           sub bl, 0x20                             
  29bb  80fb60           cmp bl, 0x60                             
  29be  7313             jae 0x29d3                               
  29c0  8a9f0f3e         mov bl, byte ptr [bx + 0x3e0f]           
  29c4  83fb17           cmp bx, 0x17                             
  29c7  7603             jbe 0x29cc                               
  29c9  e99003           jmp 0x2d5c                               
  29cc  d1e3             shl bx, 1                                
  29ce  2effa7902d       jmp word ptr cs:[bx + 0x2d90]            
  29d3  e98603           jmp 0x2d5c                               
res_0000_29d6:  ; case
  29d6  80fd00           cmp ch, 0                                
  29d9  77f8             ja 0x29d3                                
  29db  834efe01         or word ptr [bp - 2], 1                  
  29df  ebcf             jmp 0x29b0                               
res_0000_29e1:  ; case
  29e1  80fd00           cmp ch, 0                                
  29e4  77ed             ja 0x29d3                                
  29e6  834efe02         or word ptr [bp - 2], 2                  
  29ea  ebc4             jmp 0x29b0                               
res_0000_29ec:  ; case
  29ec  80fd00           cmp ch, 0                                
  29ef  77e2             ja 0x29d3                                
  29f1  807ef52b         cmp byte ptr [bp - 0xb], 0x2b            
  29f5  7403             je 0x29fa                                
  29f7  8856f5           mov byte ptr [bp - 0xb], dl              
  29fa  ebb4             jmp 0x29b0                               
res_0000_29fc:  ; case
  29fc  8366fedf         and word ptr [bp - 2], 0xffdf            
  2a00  eb04             jmp 0x2a06                               
res_0000_2a02:  ; case
  2a02  834efe20         or word ptr [bp - 2], 0x20               
  2a06  b505             mov ch, 5                                
  2a08  eba6             jmp 0x29b0                               
res_0000_2a0a:  ; case
  2a0a  80fd00           cmp ch, 0                                
  2a0d  774d             ja 0x2a5c                                
  2a0f  f746fe0200       test word ptr [bp - 2], 2                
  2a14  7529             jne 0x2a3f                               
  2a16  834efe08         or word ptr [bp - 2], 8                  
  2a1a  b501             mov ch, 1                                
  2a1c  eb92             jmp 0x29b0                               
  2a1e  e93b03           jmp 0x2d5c                               
res_0000_2a21:  ; case
  2a21  8b7e04           mov di, word ptr [bp + 4]                
  2a24  368b05           mov ax, word ptr ss:[di]                 
  2a27  83460402         add word ptr [bp + 4], 2                 
  2a2b  80fd02           cmp ch, 2                                
  2a2e  7312             jae 0x2a42                               
  2a30  0bc0             or ax, ax                                
  2a32  7906             jns 0x2a3a                               
  2a34  f7d8             neg ax                                   
  2a36  834efe02         or word ptr [bp - 2], 2                  
  2a3a  8946f8           mov word ptr [bp - 8], ax                
  2a3d  b503             mov ch, 3                                
  2a3f  e96eff           jmp 0x29b0                               
  2a42  80fd04           cmp ch, 4                                
  2a45  75d7             jne 0x2a1e                               
  2a47  8946f6           mov word ptr [bp - 0xa], ax              
  2a4a  fec5             inc ch                                   
  2a4c  e961ff           jmp 0x29b0                               
res_0000_2a4f:  ; case
  2a4f  80fd04           cmp ch, 4                                
  2a52  73ca             jae 0x2a1e                               
  2a54  b504             mov ch, 4                                
  2a56  ff46f6           inc word ptr [bp - 0xa]                  
  2a59  e954ff           jmp 0x29b0                               
res_0000_2a5c:  ; case
  2a5c  92               xchg dx, ax                              
  2a5d  2c30             sub al, 0x30                             
  2a5f  98               cwde                                     
  2a60  80fd02           cmp ch, 2                                
  2a63  7719             ja 0x2a7e                                
  2a65  b502             mov ch, 2                                
  2a67  8746f8           xchg word ptr [bp - 8], ax               
  2a6a  0bc0             or ax, ax                                
  2a6c  7cd1             jl 0x2a3f                                
  2a6e  d1e0             shl ax, 1                                
  2a70  8bd0             mov dx, ax                               
  2a72  d1e0             shl ax, 1                                
  2a74  d1e0             shl ax, 1                                
  2a76  03c2             add ax, dx                               
  2a78  0146f8           add word ptr [bp - 8], ax                
  2a7b  e932ff           jmp 0x29b0                               
  2a7e  80fd04           cmp ch, 4                                
  2a81  759b             jne 0x2a1e                               
  2a83  8746f6           xchg word ptr [bp - 0xa], ax             
  2a86  0bc0             or ax, ax                                
  2a88  74b5             je 0x2a3f                                
  2a8a  d1e0             shl ax, 1                                
  2a8c  8bd0             mov dx, ax                               
  2a8e  d1e0             shl ax, 1                                
  2a90  d1e0             shl ax, 1                                
  2a92  03c2             add ax, dx                               
  2a94  0146f6           add word ptr [bp - 0xa], ax              
  2a97  e916ff           jmp 0x29b0                               
res_0000_2a9a:  ; case
  2a9a  834efe10         or word ptr [bp - 2], 0x10               
  2a9e  e965ff           jmp 0x2a06                               
res_0000_2aa1:  ; case
  2aa1  814efe0001       or word ptr [bp - 2], 0x100              
res_0000_2aa6:  ; case
  2aa6  8366feef         and word ptr [bp - 2], 0xffef            
  2aaa  e959ff           jmp 0x2a06                               
res_0000_2aad:  ; case
  2aad  b708             mov bh, 8                                
  2aaf  eb0a             jmp 0x2abb                               
res_0000_2ab1:  ; case
  2ab1  b70a             mov bh, 0xa                              
  2ab3  eb0a             jmp 0x2abf                               
res_0000_2ab5:  ; case
  2ab5  b710             mov bh, 0x10                             
  2ab7  b3e9             mov bl, 0xe9                             
  2ab9  02da             add bl, dl                               
  2abb  c646f500         mov byte ptr [bp - 0xb], 0               
  2abf  8856fb           mov byte ptr [bp - 5], dl                
  2ac2  33d2             xor dx, dx                               
  2ac4  8856fa           mov byte ptr [bp - 6], dl                
  2ac7  8b7e04           mov di, word ptr [bp + 4]                
  2aca  368b05           mov ax, word ptr ss:[di]                 
  2acd  eb10             jmp 0x2adf                               
res_0000_2acf:  ; case
  2acf  b70a             mov bh, 0xa                              
  2ad1  c646fa01         mov byte ptr [bp - 6], 1                 
  2ad5  8856fb           mov byte ptr [bp - 5], dl                
  2ad8  8b7e04           mov di, word ptr [bp + 4]                
  2adb  368b05           mov ax, word ptr ss:[di]                 
  2ade  99               cdq                                      
  2adf  47               inc di                                   
  2ae0  47               inc di                                   
  2ae1  897606           mov word ptr [bp + 6], si                
  2ae4  f746fe1000       test word ptr [bp - 2], 0x10             
  2ae9  7405             je 0x2af0                                
  2aeb  368b15           mov dx, word ptr ss:[di]                 
  2aee  47               inc di                                   
  2aef  47               inc di                                   
  2af0  897e04           mov word ptr [bp + 4], di                
  2af3  8d7ebb           lea di, [bp - 0x45]                      
  2af6  0bc0             or ax, ax                                
  2af8  7512             jne 0x2b0c                               
  2afa  0bd2             or dx, dx                                
  2afc  750e             jne 0x2b0c                               
  2afe  837ef600         cmp word ptr [bp - 0xa], 0               
  2b02  750c             jne 0x2b10                               
  2b04  36c60500         mov byte ptr ss:[di], 0                  
  2b08  8bc7             mov ax, di                               
  2b0a  eb14             jmp 0x2b20                               
  2b0c  834efe04         or word ptr [bp - 2], 4                  
  2b10  52               push dx                                  
  2b11  50               push ax                                  
  2b12  16               push ss                                  
  2b13  57               push di                                  
  2b14  8ac7             mov al, bh                               
  2b16  98               cwde                                     
  2b17  50               push ax                                  
  2b18  8a46fa           mov al, byte ptr [bp - 6]                
  2b1b  50               push ax                                  
  2b1c  53               push bx                                  
  2b1d  e8d6f3           call 0x1ef6                              
  2b20  16               push ss                                  
  2b21  07               pop es                                   
  2b22  8b56f6           mov dx, word ptr [bp - 0xa]              
  2b25  0bd2             or dx, dx                                
  2b27  7d03             jge 0x2b2c                               
  2b29  e9f400           jmp 0x2c20                               
  2b2c  e9ff00           jmp 0x2c2e                               
res_0000_2b2f:  ; case
  2b2f  8856fb           mov byte ptr [bp - 5], dl                
  2b32  897606           mov word ptr [bp + 6], si                
  2b35  8d7eba           lea di, [bp - 0x46]                      
  2b38  8b5e04           mov bx, word ptr [bp + 4]                
  2b3b  36ff37           push word ptr ss:[bx]                    
  2b3e  43               inc bx                                   
  2b3f  43               inc bx                                   
  2b40  895e04           mov word ptr [bp + 4], bx                
  2b43  f746fe2000       test word ptr [bp - 2], 0x20             
  2b48  7410             je 0x2b5a                                
  2b4a  368b17           mov dx, word ptr ss:[bx]                 
  2b4d  43               inc bx                                   
  2b4e  43               inc bx                                   
  2b4f  895e04           mov word ptr [bp + 4], bx                
  2b52  16               push ss                                  
  2b53  07               pop es                                   
  2b54  e88efd           call 0x28e5                              
  2b57  b03a             mov al, 0x3a                             
  2b59  aa               stosb byte ptr es:[di], al               
  2b5a  16               push ss                                  
  2b5b  07               pop es                                   
  2b5c  5a               pop dx                                   
  2b5d  e885fd           call 0x28e5                              
  2b60  36c60500         mov byte ptr ss:[di], 0                  
  2b64  c646fa00         mov byte ptr [bp - 6], 0                 
  2b68  8366fefb         and word ptr [bp - 2], 0xfffb            
  2b6c  8d4eba           lea cx, [bp - 0x46]                      
  2b6f  2bf9             sub di, cx                               
  2b71  87cf             xchg di, cx                              
  2b73  8b56f6           mov dx, word ptr [bp - 0xa]              
  2b76  3bd1             cmp dx, cx                               
  2b78  7f02             jg 0x2b7c                                
  2b7a  8bd1             mov dx, cx                               
  2b7c  e9a100           jmp 0x2c20                               
res_0000_2b7f:  ; case
  2b7f  897606           mov word ptr [bp + 6], si                
  2b82  8856fb           mov byte ptr [bp - 5], dl                
  2b85  8b7e04           mov di, word ptr [bp + 4]                
  2b88  368b05           mov ax, word ptr ss:[di]                 
  2b8b  83460402         add word ptr [bp + 4], 2                 
  2b8f  16               push ss                                  
  2b90  07               pop es                                   
  2b91  8d7ebb           lea di, [bp - 0x45]                      
  2b94  32e4             xor ah, ah                               
  2b96  368905           mov word ptr ss:[di], ax                 
  2b99  b90100           mov cx, 1                                
  2b9c  e9c400           jmp 0x2c63                               
res_0000_2b9f:  ; case
  2b9f  897606           mov word ptr [bp + 6], si                
  2ba2  8856fb           mov byte ptr [bp - 5], dl                
  2ba5  8b7e04           mov di, word ptr [bp + 4]                
  2ba8  f746fe2000       test word ptr [bp - 2], 0x20             
  2bad  750d             jne 0x2bbc                               
  2baf  368b3d           mov di, word ptr ss:[di]                 
  2bb2  83460402         add word ptr [bp + 4], 2                 
  2bb6  1e               push ds                                  
  2bb7  07               pop es                                   
  2bb8  0bff             or di, di                                
  2bba  eb0b             jmp 0x2bc7                               
  2bbc  36c43d           les di, ptr ss:[di]                      
  2bbf  83460404         add word ptr [bp + 4], 4                 
  2bc3  8cc0             mov ax, es                               
  2bc5  0bc7             or ax, di                                
  2bc7  7505             jne 0x2bce                               
  2bc9  1e               push ds                                  
  2bca  07               pop es                                   
  2bcb  bf083e           mov di, 0x3e08                            ; "(null)"
  2bce  e846fd           call 0x2917                              
  2bd1  3b4ef6           cmp cx, word ptr [bp - 0xa]              
  2bd4  7603             jbe 0x2bd9                               
  2bd6  8b4ef6           mov cx, word ptr [bp - 0xa]              
  2bd9  e98700           jmp 0x2c63                               
res_0000_2bdc:  ; case
  2bdc  897606           mov word ptr [bp + 6], si                
  2bdf  8856fb           mov byte ptr [bp - 5], dl                
  2be2  8b7e04           mov di, word ptr [bp + 4]                
  2be5  8b4ef6           mov cx, word ptr [bp - 0xa]              
  2be8  0bc9             or cx, cx                                
  2bea  7d03             jge 0x2bef                               
  2bec  b90600           mov cx, 6                                
  2bef  16               push ss                                  
  2bf0  57               push di                                  
  2bf1  51               push cx                                  
  2bf2  16               push ss                                  
  2bf3  8d5ebb           lea bx, [bp - 0x45]                      
  2bf6  53               push bx                                  
  2bf7  52               push dx                                  
  2bf8  b80100           mov ax, 1                                
  2bfb  2346fe           and ax, word ptr [bp - 2]                
  2bfe  50               push ax                                  
  2bff  8b46fe           mov ax, word ptr [bp - 2]                
  2c02  a90001           test ax, 0x100                           
  2c05  7409             je 0x2c10                                
  2c07  b80800           mov ax, 8                                
  2c0a  8346040a         add word ptr [bp + 4], 0xa               
  2c0e  eb07             jmp 0x2c17                               
  2c10  83460408         add word ptr [bp + 4], 8                 
  2c14  b80600           mov ax, 6                                
  2c17  50               push ax                                  
  2c18  e8870d           call 0x39a2                              
  2c1b  16               push ss                                  
  2c1c  07               pop es                                   
  2c1d  8d7ebb           lea di, [bp - 0x45]                      
  2c20  f746fe0800       test word ptr [bp - 2], 8                
  2c25  7418             je 0x2c3f                                
  2c27  8b56f8           mov dx, word ptr [bp - 8]                
  2c2a  0bd2             or dx, dx                                
  2c2c  7e11             jle 0x2c3f                               
  2c2e  e8e6fc           call 0x2917                              
  2c31  26803d2d         cmp byte ptr es:[di], 0x2d               
  2c35  7501             jne 0x2c38                               
  2c37  49               dec cx                                   
  2c38  2bd1             sub dx, cx                               
  2c3a  7e03             jle 0x2c3f                               
  2c3c  8956f2           mov word ptr [bp - 0xe], dx              
  2c3f  26803d2d         cmp byte ptr es:[di], 0x2d               
  2c43  740b             je 0x2c50                                
  2c45  8a46f5           mov al, byte ptr [bp - 0xb]              
  2c48  0ac0             or al, al                                
  2c4a  7414             je 0x2c60                                
  2c4c  4f               dec di                                   
  2c4d  268805           mov byte ptr es:[di], al                 
  2c50  837ef200         cmp word ptr [bp - 0xe], 0               
  2c54  7e0a             jle 0x2c60                               
  2c56  8b4ef6           mov cx, word ptr [bp - 0xa]              
  2c59  0bc9             or cx, cx                                
  2c5b  7d03             jge 0x2c60                               
  2c5d  ff4ef2           dec word ptr [bp - 0xe]                  
  2c60  e8b4fc           call 0x2917                              
  2c63  8bf7             mov si, di                               
  2c65  8b7efc           mov di, word ptr [bp - 4]                
  2c68  8b5ef8           mov bx, word ptr [bp - 8]                
  2c6b  b80500           mov ax, 5                                
  2c6e  2346fe           and ax, word ptr [bp - 2]                
  2c71  3d0500           cmp ax, 5                                
  2c74  7513             jne 0x2c89                               
  2c76  8a66fb           mov ah, byte ptr [bp - 5]                
  2c79  80fc6f           cmp ah, 0x6f                             
  2c7c  750d             jne 0x2c8b                               
  2c7e  837ef200         cmp word ptr [bp - 0xe], 0               
  2c82  7f05             jg 0x2c89                                
  2c84  c746f20100       mov word ptr [bp - 0xe], 1               
  2c89  eb1b             jmp 0x2ca6                               
  2c8b  80fc78           cmp ah, 0x78                             
  2c8e  7405             je 0x2c95                                
  2c90  80fc58           cmp ah, 0x58                             
  2c93  7511             jne 0x2ca6                               
  2c95  834efe40         or word ptr [bp - 2], 0x40               
  2c99  4b               dec bx                                   
  2c9a  4b               dec bx                                   
  2c9b  836ef202         sub word ptr [bp - 0xe], 2               
  2c9f  7d05             jge 0x2ca6                               
  2ca1  c746f20000       mov word ptr [bp - 0xe], 0               
  2ca6  034ef2           add cx, word ptr [bp - 0xe]              
  2ca9  f746fe0200       test word ptr [bp - 2], 2                
  2cae  750c             jne 0x2cbc                               
  2cb0  eb06             jmp 0x2cb8                               
  2cb2  b020             mov al, 0x20                             
  2cb4  e86dfc           call 0x2924                              
  2cb7  4b               dec bx                                   
  2cb8  3bd9             cmp bx, cx                               
  2cba  7ff6             jg 0x2cb2                                
  2cbc  f746fe4000       test word ptr [bp - 2], 0x40             
  2cc1  740b             je 0x2cce                                
  2cc3  b030             mov al, 0x30                             
  2cc5  e85cfc           call 0x2924                              
  2cc8  8a46fb           mov al, byte ptr [bp - 5]                
  2ccb  e856fc           call 0x2924                              
  2cce  8b56f2           mov dx, word ptr [bp - 0xe]              
  2cd1  0bd2             or dx, dx                                
  2cd3  7e27             jle 0x2cfc                               
  2cd5  2bca             sub cx, dx                               
  2cd7  2bda             sub bx, dx                               
  2cd9  268a04           mov al, byte ptr es:[si]                 
  2cdc  3c2d             cmp al, 0x2d                             
  2cde  7408             je 0x2ce8                                
  2ce0  3c20             cmp al, 0x20                             
  2ce2  7404             je 0x2ce8                                
  2ce4  3c2b             cmp al, 0x2b                             
  2ce6  7507             jne 0x2cef                               
  2ce8  26ac             lodsb al, byte ptr es:[si]               
  2cea  e837fc           call 0x2924                              
  2ced  49               dec cx                                   
  2cee  4b               dec bx                                   
  2cef  87ca             xchg dx, cx                              
  2cf1  e307             jcxz 0x2cfa                              
  2cf3  b030             mov al, 0x30                             
  2cf5  e82cfc           call 0x2924                              
  2cf8  e2f9             loop 0x2cf3                              
  2cfa  87ca             xchg dx, cx                              
  2cfc  e312             jcxz 0x2d10                              
  2cfe  2bd9             sub bx, cx                               
  2d00  26ac             lodsb al, byte ptr es:[si]               
  2d02  368805           mov byte ptr ss:[di], al                 
  2d05  47               inc di                                   
  2d06  fe4eec           dec byte ptr [bp - 0x14]                 
  2d09  7f03             jg 0x2d0e                                
  2d0b  e81ffc           call 0x292d                              
  2d0e  e2f0             loop 0x2d00                              
  2d10  0bdb             or bx, bx                                
  2d12  7e09             jle 0x2d1d                               
  2d14  8bcb             mov cx, bx                               
  2d16  b020             mov al, 0x20                             
  2d18  e809fc           call 0x2924                              
  2d1b  e2f9             loop 0x2d16                              
  2d1d  e94dfc           jmp 0x296d                               
res_0000_2d20:  ; case
  2d20  897606           mov word ptr [bp + 6], si                
  2d23  8b7e04           mov di, word ptr [bp + 4]                
  2d26  f746fe2000       test word ptr [bp - 2], 0x20             
  2d2b  750b             jne 0x2d38                               
  2d2d  368b3d           mov di, word ptr ss:[di]                 
  2d30  83460402         add word ptr [bp + 4], 2                 
  2d34  1e               push ds                                  
  2d35  07               pop es                                   
  2d36  eb07             jmp 0x2d3f                               
  2d38  36c43d           les di, ptr ss:[di]                      
  2d3b  83460404         add word ptr [bp + 4], 4                 
  2d3f  b85000           mov ax, 0x50                             
  2d42  2a46ec           sub al, byte ptr [bp - 0x14]             
  2d45  0346ee           add ax, word ptr [bp - 0x12]             
  2d48  268905           mov word ptr es:[di], ax                 
  2d4b  f746fe1000       test word ptr [bp - 2], 0x10             
  2d50  7407             je 0x2d59                                
  2d52  47               inc di                                   
  2d53  47               inc di                                   
  2d54  26c7050000       mov word ptr es:[di], 0                  
  2d59  e90efc           jmp 0x296a                               
res_0000_2d5c:  ; case
  2d5c  8b76f0           mov si, word ptr [bp - 0x10]             
  2d5f  8e4608           mov es, word ptr [bp + 8]                
  2d62  8b7efc           mov di, word ptr [bp - 4]                
  2d65  b025             mov al, 0x25                             
  2d67  e8bafb           call 0x2924                              
  2d6a  26ac             lodsb al, byte ptr es:[si]               
  2d6c  0ac0             or al, al                                
  2d6e  75f7             jne 0x2d67                               
  2d70  807eec50         cmp byte ptr [bp - 0x14], 0x50           
  2d74  7d03             jge 0x2d79                               
  2d76  e8b4fb           call 0x292d                              
  2d79  07               pop es                                   
  2d7a  837eea00         cmp word ptr [bp - 0x16], 0              
  2d7e  7405             je 0x2d85                                
  2d80  b8ffff           mov ax, 0xffff                           
  2d83  eb03             jmp 0x2d88                               
  2d85  8b46ee           mov ax, word ptr [bp - 0x12]             
  2d88  5f               pop di                                   
  2d89  5e               pop si                                   
  2d8a  8be5             mov sp, bp                               
  2d8c  5d               pop bp                                   
  2d8d  c20c00           ret 0xc                                  
  2d90  ec29d629212ae129 dw 29ec,29d6,2a21,29e1,2a4f,2a5c,2a9a,2aa1,2aa6,2a0a,2acf,2aad,2ab1,2ab5,2b2f,2bdc,2b7f,2b9f,2d20,2d5c,2d5c,2d5c,29fc,2a02 jump table

res_0000_2dc0:  ; ENTRY
  2dc0  55               push bp                                  
  2dc1  8bec             mov bp, sp                               
  2dc3  a07a3e           mov al, byte ptr [0x3e7a]                
  2dc6  b400             mov ah, 0                                
  2dc8  8b5604           mov dx, word ptr [bp + 4]                
  2dcb  4a               dec dx                                   
  2dcc  f7ea             imul dx                                  
  2dce  50               push ax                                  
  2dcf  a17d3e           mov ax, word ptr [0x3e7d]                
  2dd2  5a               pop dx                                   
  2dd3  03c2             add ax, dx                               
  2dd5  8b5606           mov dx, word ptr [bp + 6]                
  2dd8  4a               dec dx                                   
  2dd9  03c2             add ax, dx                               
  2ddb  d1e0             shl ax, 1                                
  2ddd  8b167f3e         mov dx, word ptr [0x3e7f]                
  2de1  5d               pop bp                                   
  2de2  c20400           ret 4                                    

res_0000_2de5:  ; ENTRY
  2de5  55               push bp                                  
  2de6  8bec             mov bp, sp                               
  2de8  83ec02           sub sp, 2                                
  2deb  56               push si                                  
  2dec  57               push di                                  
  2ded  a07c3e           mov al, byte ptr [0x3e7c]                
  2df0  b400             mov ah, 0                                
  2df2  8946fe           mov word ptr [bp - 2], ax                
  2df5  1e               push ds                                  
  2df6  8b4e04           mov cx, word ptr [bp + 4]                
  2df9  e35a             jcxz 0x2e55                              
  2dfb  c47e0a           les di, ptr [bp + 0xa]                   
  2dfe  c57606           lds si, ptr [bp + 6]                     
  2e01  fc               cld                                      
  2e02  3bf7             cmp si, di                               
  2e04  730a             jae 0x2e10                               
  2e06  8bc1             mov ax, cx                               
  2e08  48               dec ax                                   
  2e09  d1e0             shl ax, 1                                
  2e0b  03f0             add si, ax                               
  2e0d  03f8             add di, ax                               
  2e0f  fd               std                                      
  2e10  837efe00         cmp word ptr [bp - 2], 0                 
  2e14  7504             jne 0x2e1a                               
  2e16  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  2e18  eb3b             jmp 0x2e55                               
  2e1a  bada03           mov dx, 0x3da                            
  2e1d  8cc0             mov ax, es                               
  2e1f  8cdb             mov bx, ds                               
  2e21  3bc3             cmp ax, bx                               
  2e23  7411             je 0x2e36                                
  2e25  fa               cli                                      
  2e26  ec               in al, dx                                
  2e27  d0c8             ror al, 1                                
  2e29  72fb             jb 0x2e26                                
  2e2b  ec               in al, dx                                
  2e2c  d0c8             ror al, 1                                
  2e2e  73fb             jae 0x2e2b                               
  2e30  a5               movsw word ptr es:[di], word ptr [si]    
  2e31  fb               sti                                      
  2e32  e2f1             loop 0x2e25                              
  2e34  eb1f             jmp 0x2e55                               
  2e36  fa               cli                                      
  2e37  ec               in al, dx                                
  2e38  d0c8             ror al, 1                                
  2e3a  72fb             jb 0x2e37                                
  2e3c  ec               in al, dx                                
  2e3d  d0c8             ror al, 1                                
  2e3f  73fb             jae 0x2e3c                               
  2e41  ad               lodsw ax, word ptr [si]                  
  2e42  fb               sti                                      
  2e43  8bd8             mov bx, ax                               
  2e45  ec               in al, dx                                
  2e46  d0c8             ror al, 1                                
  2e48  72fb             jb 0x2e45                                
  2e4a  ec               in al, dx                                
  2e4b  d0c8             ror al, 1                                
  2e4d  73fb             jae 0x2e4a                               
  2e4f  8bc3             mov ax, bx                               
  2e51  ab               stosw word ptr es:[di], ax               
  2e52  fb               sti                                      
  2e53  e2e1             loop 0x2e36                              
  2e55  fc               cld                                      
  2e56  1f               pop ds                                   
  2e57  5f               pop di                                   
  2e58  5e               pop si                                   
  2e59  8be5             mov sp, bp                               
  2e5b  5d               pop bp                                   
  2e5c  c20a00           ret 0xa                                  

res_0000_2e5f:  ; ENTRY
  2e5f  55               push bp                                  
  2e60  8bec             mov bp, sp                               
  2e62  32c0             xor al, al                               
  2e64  8a6606           mov ah, byte ptr [bp + 6]                
  2e67  cd16             int 0x16                                 
  2e69  740f             je 0x2e7a                                
  2e6b  f6460601         test byte ptr [bp + 6], 1                
  2e6f  7511             jne 0x2e82                               
  2e71  0bc0             or ax, ax                                
  2e73  750d             jne 0x2e82                               
  2e75  b8ffff           mov ax, 0xffff                           
  2e78  eb08             jmp 0x2e82                               
  2e7a  f6460601         test byte ptr [bp + 6], 1                
  2e7e  7402             je 0x2e82                                
  2e80  33c0             xor ax, ax                               
  2e82  5d               pop bp                                   
  2e83  cb               retf                                     

res_0000_2e84:  ; ENTRY
  2e84  55               push bp                                  
  2e85  8bec             mov bp, sp                               
  2e87  83ec08           sub sp, 8                                
  2e8a  56               push si                                  
  2e8b  8b7608           mov si, word ptr [bp + 8]                
  2e8e  c646fb00         mov byte ptr [bp - 5], 0                 
  2e92  e81110           call 0x3ea6                              
  2e95  b400             mov ah, 0                                
  2e97  8946fe           mov word ptr [bp - 2], ax                
  2e9a  e80910           call 0x3ea6                              
  2e9d  b108             mov cl, 8                                
  2e9f  d3e8             shr ax, cl                               
  2ea1  b400             mov ah, 0                                
  2ea3  8946fc           mov word ptr [bp - 4], ax                
  2ea6  e9dc00           jmp 0x2f85                               
  2ea9  c45e0a           les bx, ptr [bp + 0xa]                   
  2eac  ff460a           inc word ptr [bp + 0xa]                  
  2eaf  268a07           mov al, byte ptr es:[bx]                 
  2eb2  8846fb           mov byte ptr [bp - 5], al                
  2eb5  b400             mov ah, 0                                
  2eb7  2d0700           sub ax, 7                                
  2eba  8bd8             mov bx, ax                               
  2ebc  83fb06           cmp bx, 6                                
  2ebf  772e             ja 0x2eef                                
  2ec1  d1e3             shl bx, 1                                
  2ec3  2effa7a82f       jmp word ptr cs:[bx + 0x2fa8]            
res_0000_2ec8:  ; case
  2ec8  b40e             mov ah, 0xe                              
  2eca  b007             mov al, 7                                
  2ecc  e83e01           call 0x300d                              
  2ecf  eb76             jmp 0x2f47                               
res_0000_2ed1:  ; case
  2ed1  a0723e           mov al, byte ptr [0x3e72]                
  2ed4  b400             mov ah, 0                                
  2ed6  3b46fe           cmp ax, word ptr [bp - 2]                
  2ed9  7d6c             jge 0x2f47                               
  2edb  ff4efe           dec word ptr [bp - 2]                    
  2ede  eb67             jmp 0x2f47                               
res_0000_2ee0:  ; case
  2ee0  a0723e           mov al, byte ptr [0x3e72]                
  2ee3  b400             mov ah, 0                                
  2ee5  8946fe           mov word ptr [bp - 2], ax                
  2ee8  eb5d             jmp 0x2f47                               
res_0000_2eea:  ; case
  2eea  ff46fc           inc word ptr [bp - 4]                    
  2eed  eb58             jmp 0x2f47                               
res_0000_2eef:  ; case
  2eef  a07b3e           mov al, byte ptr [0x3e7b]                
  2ef2  b400             mov ah, 0                                
  2ef4  0bc0             or ax, ax                                
  2ef6  752e             jne 0x2f26                               
  2ef8  833e813e00       cmp word ptr [0x3e81], 0                 
  2efd  7427             je 0x2f26                                
  2eff  8a26763e         mov ah, byte ptr [0x3e76]                
  2f03  8a46fb           mov al, byte ptr [bp - 5]                
  2f06  8946f8           mov word ptr [bp - 8], ax                
  2f09  8b46fe           mov ax, word ptr [bp - 2]                
  2f0c  40               inc ax                                   
  2f0d  50               push ax                                  
  2f0e  8b46fc           mov ax, word ptr [bp - 4]                
  2f11  40               inc ax                                   
  2f12  50               push ax                                  
  2f13  e8aafe           call 0x2dc0                              
  2f16  52               push dx                                  
  2f17  50               push ax                                  
  2f18  16               push ss                                  
  2f19  8d46f8           lea ax, [bp - 8]                         
  2f1c  50               push ax                                  
  2f1d  b80100           mov ax, 1                                
  2f20  50               push ax                                  
  2f21  e8c1fe           call 0x2de5                              
  2f24  eb1e             jmp 0x2f44                               
  2f26  8a56fe           mov dl, byte ptr [bp - 2]                
  2f29  8a76fc           mov dh, byte ptr [bp - 4]                
  2f2c  b402             mov ah, 2                                
  2f2e  b700             mov bh, 0                                
  2f30  e8da00           call 0x300d                              
  2f33  8a1e763e         mov bl, byte ptr [0x3e76]                
  2f37  8a46fb           mov al, byte ptr [bp - 5]                
  2f3a  b409             mov ah, 9                                
  2f3c  b700             mov bh, 0                                
  2f3e  b90100           mov cx, 1                                
  2f41  e8c900           call 0x300d                              
  2f44  ff46fe           inc word ptr [bp - 2]                    
  2f47  a0743e           mov al, byte ptr [0x3e74]                
  2f4a  b400             mov ah, 0                                
  2f4c  3b46fe           cmp ax, word ptr [bp - 2]                
  2f4f  7d0e             jge 0x2f5f                               
  2f51  a0723e           mov al, byte ptr [0x3e72]                
  2f54  b400             mov ah, 0                                
  2f56  8946fe           mov word ptr [bp - 2], ax                
  2f59  a1703e           mov ax, word ptr [0x3e70]                
  2f5c  0146fc           add word ptr [bp - 4], ax                
  2f5f  a0753e           mov al, byte ptr [0x3e75]                
  2f62  b400             mov ah, 0                                
  2f64  3b46fc           cmp ax, word ptr [bp - 4]                
  2f67  7d1c             jge 0x2f85                               
  2f69  b006             mov al, 6                                
  2f6b  50               push ax                                  
  2f6c  a0723e           mov al, byte ptr [0x3e72]                
  2f6f  50               push ax                                  
  2f70  a0733e           mov al, byte ptr [0x3e73]                
  2f73  50               push ax                                  
  2f74  a0743e           mov al, byte ptr [0x3e74]                
  2f77  50               push ax                                  
  2f78  a0753e           mov al, byte ptr [0x3e75]                
  2f7b  50               push ax                                  
  2f7c  b001             mov al, 1                                
  2f7e  50               push ax                                  
  2f7f  e8190c           call 0x3b9b                              
  2f82  ff4efc           dec word ptr [bp - 4]                    
  2f85  8bc6             mov ax, si                               
  2f87  4e               dec si                                   
  2f88  0bc0             or ax, ax                                
  2f8a  7403             je 0x2f8f                                
  2f8c  e91aff           jmp 0x2ea9                               
  2f8f  8a56fe           mov dl, byte ptr [bp - 2]                
  2f92  8a76fc           mov dh, byte ptr [bp - 4]                
  2f95  b402             mov ah, 2                                
  2f97  b700             mov bh, 0                                
  2f99  e87100           call 0x300d                              
  2f9c  8a46fb           mov al, byte ptr [bp - 5]                
  2f9f  b400             mov ah, 0                                
  2fa1  5e               pop si                                   
  2fa2  8be5             mov sp, bp                               
  2fa4  5d               pop bp                                   
  2fa5  c20a00           ret 0xa                                  
  2fa8  c82ed12eef2eea2e dw 2ec8,2ed1,2eef,2eea,2eef,2eef,2ee0    jump table
  2fb6  55               push bp                                  
  2fb7  8bec             mov bp, sp                               
  2fb9  b8842e           mov ax, 0x2e84                           
  2fbc  50               push ax                                  
  2fbd  33c0             xor ax, ax                               
  2fbf  33d2             xor dx, dx                               
  2fc1  50               push ax                                  
  2fc2  52               push dx                                  
  2fc3  ff7608           push word ptr [bp + 8]                   
  2fc6  ff7606           push word ptr [bp + 6]                   
  2fc9  8d460a           lea ax, [bp + 0xa]                       
  2fcc  50               push ax                                  
  2fcd  e82df9           call 0x28fd                              
  2fd0  5d               pop bp                                   
  2fd1  cb               retf                                     

res_0000_2fd2:  ; ENTRY
  2fd2  55               push bp                                  
  2fd3  8bec             mov bp, sp                               
  2fd5  eb18             jmp 0x2fef                               
  2fd7  c45e04           les bx, ptr [bp + 4]                     
  2fda  ff4604           inc word ptr [bp + 4]                    
  2fdd  268a07           mov al, byte ptr es:[bx]                 
  2fe0  c45e08           les bx, ptr [bp + 8]                     
  2fe3  ff4608           inc word ptr [bp + 8]                    
  2fe6  263a07           cmp al, byte ptr es:[bx]                 
  2fe9  7404             je 0x2fef                                
  2feb  33c0             xor ax, ax                               
  2fed  eb0c             jmp 0x2ffb                               
  2fef  c45e04           les bx, ptr [bp + 4]                     
  2ff2  26803f00         cmp byte ptr es:[bx], 0                  
  2ff6  75df             jne 0x2fd7                               
  2ff8  b80100           mov ax, 1                                
  2ffb  5d               pop bp                                   
  2ffc  c20800           ret 8                                    

res_0000_2fff:  ; ENTRY
  2fff  b412             mov ah, 0x12                             
  3001  b310             mov bl, 0x10                             
  3003  e80700           call 0x300d                              
  3006  8ac3             mov al, bl                               
  3008  04f0             add al, 0xf0                             
  300a  b400             mov ah, 0                                
  300c  c3               ret                                      

res_0000_300d:  ; ENTRY
  300d  55               push bp                                  
  300e  1e               push ds                                  
  300f  51               push cx                                  
  3010  b94000           mov cx, 0x40                             
  3013  8ed9             mov ds, cx                               
  3015  59               pop cx                                   
  3016  80fc00           cmp ah, 0                                
  3019  7409             je 0x3024                                
  301b  80fc0f           cmp ah, 0xf                              
  301e  7459             je 0x3079                                
  3020  cd10             int 0x10                                 
  3022  eb71             jmp 0x3095                               
  3024  3c02             cmp al, 2                                
  3026  7404             je 0x302c                                
  3028  3c03             cmp al, 3                                
  302a  7519             jne 0x3045                               
  302c  50               push ax                                  
  302d  b8001a           mov ax, 0x1a00                           
  3030  cd10             int 0x10                                 
  3032  3c1a             cmp al, 0x1a                             
  3034  7405             je 0x303b                                
  3036  80268700fe       and byte ptr [0x87], 0xfe                
  303b  b401             mov ah, 1                                
  303d  b90706           mov cx, 0x607                            
  3040  cd10             int 0x10                                 
  3042  58               pop ax                                   
  3043  ebdb             jmp 0x3020                               
  3045  3c40             cmp al, 0x40                             
  3047  75d7             jne 0x3020                               
  3049  b310             mov bl, 0x10                             
  304b  b412             mov ah, 0x12                             
  304d  cd10             int 0x10                                 
  304f  80fb10           cmp bl, 0x10                             
  3052  7441             je 0x3095                                
  3054  b81211           mov ax, 0x1112                           
  3057  32db             xor bl, bl                               
  3059  cd10             int 0x10                                 
  305b  b80012           mov ax, 0x1200                           
  305e  b320             mov bl, 0x20                             
  3060  cd10             int 0x10                                 
  3062  b8001a           mov ax, 0x1a00                           
  3065  cd10             int 0x10                                 
  3067  3c1a             cmp al, 0x1a                             
  3069  742a             je 0x3095                                
  306b  800e870001       or byte ptr [0x87], 1                    
  3070  b401             mov ah, 1                                
  3072  b90006           mov cx, 0x600                            
  3075  cd10             int 0x10                                 
  3077  eb1c             jmp 0x3095                               
  3079  cd10             int 0x10                                 
  307b  3c02             cmp al, 2                                
  307d  7404             je 0x3083                                
  307f  3c03             cmp al, 3                                
  3081  7512             jne 0x3095                               
  3083  50               push ax                                  
  3084  e878ff           call 0x2fff                              
  3087  0ac0             or al, al                                
  3089  58               pop ax                                   
  308a  7409             je 0x3095                                
  308c  803e840018       cmp byte ptr [0x84], 0x18                
  3091  7402             je 0x3095                                
  3093  b040             mov al, 0x40                             
  3095  1f               pop ds                                   
  3096  5d               pop bp                                   
  3097  c3               ret                                      
  3098  b40f             mov ah, 0xf                              
  309a  e870ff           call 0x300d                              
  309d  50               push ax                                  
  309e  e81400           call 0x30b5                              
  30a1  59               pop cx                                   
  30a2  b408             mov ah, 8                                
  30a4  b700             mov bh, 0                                
  30a6  e864ff           call 0x300d                              
  30a9  80e47f           and ah, 0x7f                             
  30ac  8826773e         mov byte ptr [0x3e77], ah                
  30b0  8826763e         mov byte ptr [0x3e76], ah                
  30b4  c3               ret                                      

res_0000_30b5:  ; ENTRY
  30b5  55               push bp                                  
  30b6  8bec             mov bp, sp                               
  30b8  8a4604           mov al, byte ptr [bp + 4]                
  30bb  a2783e           mov byte ptr [0x3e78], al                
  30be  b40f             mov ah, 0xf                              
  30c0  e84aff           call 0x300d                              
  30c3  88267a3e         mov byte ptr [0x3e7a], ah                
  30c7  3a06783e         cmp al, byte ptr [0x3e78]                
  30cb  7414             je 0x30e1                                
  30cd  a0783e           mov al, byte ptr [0x3e78]                
  30d0  b400             mov ah, 0                                
  30d2  e838ff           call 0x300d                              
  30d5  b40f             mov ah, 0xf                              
  30d7  e833ff           call 0x300d                              
  30da  a2783e           mov byte ptr [0x3e78], al                
  30dd  88267a3e         mov byte ptr [0x3e7a], ah                
  30e1  803e783e03       cmp byte ptr [0x3e78], 3                 
  30e6  7613             jbe 0x30fb                               
  30e8  803e783e40       cmp byte ptr [0x3e78], 0x40              
  30ed  730c             jae 0x30fb                               
  30ef  803e783e07       cmp byte ptr [0x3e78], 7                 
  30f4  7405             je 0x30fb                                
  30f6  b80100           mov ax, 1                                
  30f9  eb02             jmp 0x30fd                               
  30fb  33c0             xor ax, ax                               
  30fd  a27b3e           mov byte ptr [0x3e7b], al                
  3100  803e783e40       cmp byte ptr [0x3e78], 0x40              
  3105  7404             je 0x310b                                
  3107  b019             mov al, 0x19                             
  3109  eb0b             jmp 0x3116                               
  310b  b84000           mov ax, 0x40                             
  310e  8ec0             mov es, ax                               
  3110  26a08400         mov al, byte ptr es:[0x84]               
  3114  fec0             inc al                                   
  3116  a2793e           mov byte ptr [0x3e79], al                
  3119  803e783e07       cmp byte ptr [0x3e78], 7                 
  311e  7420             je 0x3140                                
  3120  b800f0           mov ax, 0xf000                           
  3123  baeaff           mov dx, 0xffea                           
  3126  50               push ax                                  
  3127  52               push dx                                  
  3128  1e               push ds                                  
  3129  b8833e           mov ax, 0x3e83                            ; "COMPAQ"
  312c  50               push ax                                  
  312d  e8a2fe           call 0x2fd2                              
  3130  0bc0             or ax, ax                                
  3132  750c             jne 0x3140                               
  3134  e8c8fe           call 0x2fff                              
  3137  0bc0             or ax, ax                                
  3139  7505             jne 0x3140                               
  313b  b80100           mov ax, 1                                
  313e  eb02             jmp 0x3142                               
  3140  33c0             xor ax, ax                               
  3142  a27c3e           mov byte ptr [0x3e7c], al                
  3145  803e783e07       cmp byte ptr [0x3e78], 7                 
  314a  7505             jne 0x3151                               
  314c  b800b0           mov ax, 0xb000                           
  314f  eb03             jmp 0x3154                               
  3151  b800b8           mov ax, 0xb800                           
  3154  a37f3e           mov word ptr [0x3e7f], ax                
  3157  c7067d3e0000     mov word ptr [0x3e7d], 0                 
  315d  b000             mov al, 0                                
  315f  a2733e           mov byte ptr [0x3e73], al                
  3162  a2723e           mov byte ptr [0x3e72], al                
  3165  a07a3e           mov al, byte ptr [0x3e7a]                
  3168  04ff             add al, 0xff                             
  316a  a2743e           mov byte ptr [0x3e74], al                
  316d  a0793e           mov al, byte ptr [0x3e79]                
  3170  04ff             add al, 0xff                             
  3172  a2753e           mov byte ptr [0x3e75], al                
  3175  5d               pop bp                                   
  3176  c3               ret                                      
  3177  ba8a3e           mov dx, 0x3e8a                            ; "print scanf : floating point formats not linked"
  317a  eb03             jmp 0x317f                               
  317c  ba8f3e           mov dx, 0x3e8f                           
  317f  b90500           mov cx, 5                                
  3182  b440             mov ah, 0x40                             
  3184  bb0200           mov bx, 2                                
  3187  cd21             int 0x21                                 
  3189  b92700           mov cx, 0x27                             
  318c  ba943e           mov dx, 0x3e94                           
  318f  b440             mov ah, 0x40                             
  3191  cd21             int 0x21                                 
  3193  e9e4d0           jmp 0x27a                                
  3196  0000             add byte ptr [bx + si], al               
  3198  0000             add byte ptr [bx + si], al               
  319a  0000             add byte ptr [bx + si], al               
  319c  0000             add byte ptr [bx + si], al               
  319e  0000             add byte ptr [bx + si], al               
  31a0  0000             add byte ptr [bx + si], al               

res_0000_31a2:  ; ENTRY
  31a2  2e3b169631       cmp dx, word ptr cs:[0x3196]             
  31a7  7437             je 0x31e0                                
  31a9  8eda             mov ds, dx                               
  31ab  8e1e0200         mov ds, word ptr [2]                     
  31af  833e020000       cmp word ptr [2], 0                      
  31b4  7407             je 0x31bd                                
  31b6  2e8c1e9831       mov word ptr cs:[0x3198], ds             
  31bb  eb38             jmp 0x31f5                               
  31bd  8cd8             mov ax, ds                               
  31bf  2e3b069631       cmp ax, word ptr cs:[0x3196]             
  31c4  7415             je 0x31db                                
  31c6  a10800           mov ax, word ptr [8]                     
  31c9  2ea39831         mov word ptr cs:[0x3198], ax             
  31cd  1e               push ds                                  
  31ce  33c0             xor ax, ax                               
  31d0  50               push ax                                  
  31d1  e8a200           call 0x3276                              
  31d4  2e8e1e9c31       mov ds, word ptr cs:[0x319c]             
  31d9  eb23             jmp 0x31fe                               
  31db  2e8b169631       mov dx, word ptr cs:[0x3196]             
  31e0  2ec70696310000   mov word ptr cs:[0x3196], 0              
  31e7  2ec70698310000   mov word ptr cs:[0x3198], 0              
  31ee  2ec7069a310000   mov word ptr cs:[0x319a], 0              
  31f5  2e8e1e9c31       mov ds, word ptr cs:[0x319c]             
  31fa  52               push dx                                  
  31fb  33c0             xor ax, ax                               
  31fd  50               push ax                                  
  31fe  e83d04           call 0x363e                              
  3201  83c404           add sp, 4                                
  3204  c3               ret                                      

res_0000_3205:  ; ENTRY
  3205  8eda             mov ds, dx                               
  3207  1e               push ds                                  
  3208  8e060200         mov es, word ptr [2]                     
  320c  c70602000000     mov word ptr [2], 0                      
  3212  8c060800         mov word ptr [8], es                     
  3216  2e3b169631       cmp dx, word ptr cs:[0x3196]             
  321b  742e             je 0x324b                                
  321d  26833e020000     cmp word ptr es:[2], 0                   
  3223  7526             jne 0x324b                               
  3225  a10000           mov ax, word ptr [0]                     
  3228  5b               pop bx                                   
  3229  06               push es                                  
  322a  2601060000       add word ptr es:[0], ax                  
  322f  8cc1             mov cx, es                               
  3231  03d0             add dx, ax                               
  3233  8ec2             mov es, dx                               
  3235  26833e020000     cmp word ptr es:[2], 0                   
  323b  7507             jne 0x3244                               
  323d  26890e0800       mov word ptr es:[8], cx                  
  3242  eb0a             jmp 0x324e                               
  3244  26890e0200       mov word ptr es:[2], cx                  
  3249  eb03             jmp 0x324e                               
  324b  e85100           call 0x329f                              
  324e  07               pop es                                   
  324f  8cc0             mov ax, es                               
  3251  2603060000       add ax, word ptr es:[0]                  
  3256  8ed8             mov ds, ax                               
  3258  833e020000       cmp word ptr [2], 0                      
  325d  7401             je 0x3260                                
  325f  c3               ret                                      
  3260  a10000           mov ax, word ptr [0]                     
  3263  2601060000       add word ptr es:[0], ax                  
  3268  8cc0             mov ax, es                               
  326a  8cdb             mov bx, ds                               
  326c  031e0000         add bx, word ptr [0]                     
  3270  8ec3             mov es, bx                               
  3272  26a30200         mov word ptr es:[2], ax                  

res_0000_3276:  ; ENTRY
  3276  8cdb             mov bx, ds                               
  3278  3b1e0600         cmp bx, word ptr [6]                     
  327c  7419             je 0x3297                                
  327e  8e060600         mov es, word ptr [6]                     
  3282  8e1e0400         mov ds, word ptr [4]                     
  3286  8c060600         mov word ptr [6], es                     
  328a  268c1e0400       mov word ptr es:[4], ds                  
  328f  2e8c1e9a31       mov word ptr cs:[0x319a], ds             
  3294  8edb             mov ds, bx                               
  3296  c3               ret                                      
  3297  2ec7069a310000   mov word ptr cs:[0x319a], 0              
  329e  c3               ret                                      

res_0000_329f:  ; ENTRY
  329f  2ea19a31         mov ax, word ptr cs:[0x319a]             
  32a3  0bc0             or ax, ax                                
  32a5  7421             je 0x32c8                                
  32a7  8cd3             mov bx, ss                               
  32a9  9c               pushf                                    
  32aa  fa               cli                                      
  32ab  8ed0             mov ss, ax                               
  32ad  368e060600       mov es, word ptr ss:[6]                  
  32b2  368c1e0600       mov word ptr ss:[6], ds                  
  32b7  8c160400         mov word ptr [4], ss                     
  32bb  8ed3             mov ss, bx                               
  32bd  9d               popf                                     
  32be  268c1e0400       mov word ptr es:[4], ds                  
  32c3  8c060600         mov word ptr [6], es                     
  32c7  c3               ret                                      
  32c8  2e8c1e9a31       mov word ptr cs:[0x319a], ds             
  32cd  8c1e0400         mov word ptr [4], ds                     
  32d1  8c1e0600         mov word ptr [6], ds                     
  32d5  c3               ret                                      

res_0000_32d6:  ; ENTRY
  32d6  55               push bp                                  
  32d7  8bec             mov bp, sp                               
  32d9  56               push si                                  
  32da  57               push di                                  
  32db  2e8c1e9c31       mov word ptr cs:[0x319c], ds             
  32e0  8b5608           mov dx, word ptr [bp + 8]                
  32e3  0bd2             or dx, dx                                
  32e5  740f             je 0x32f6                                
  32e7  2e3b169831       cmp dx, word ptr cs:[0x3198]             
  32ec  7505             jne 0x32f3                               
  32ee  e8b1fe           call 0x31a2                              
  32f1  eb03             jmp 0x32f6                               
  32f3  e80fff           call 0x3205                              
  32f6  2e8e1e9c31       mov ds, word ptr cs:[0x319c]             
  32fb  5f               pop di                                   
  32fc  5e               pop si                                   
  32fd  5d               pop bp                                   
  32fe  cb               retf                                     

res_0000_32ff:  ; ENTRY
  32ff  50               push ax                                  
  3300  2e8e1e9c31       mov ds, word ptr cs:[0x319c]             
  3305  33c0             xor ax, ax                               
  3307  50               push ax                                  
  3308  50               push ax                                  
  3309  e87103           call 0x367d                              
  330c  83c404           add sp, 4                                
  330f  250f00           and ax, 0xf                              
  3312  7414             je 0x3328                                
  3314  ba1000           mov dx, 0x10                             
  3317  2bd0             sub dx, ax                               
  3319  33c0             xor ax, ax                               
  331b  2e8e1e9c31       mov ds, word ptr cs:[0x319c]             
  3320  50               push ax                                  
  3321  52               push dx                                  
  3322  e85803           call 0x367d                              
  3325  83c404           add sp, 4                                
  3328  58               pop ax                                   
  3329  50               push ax                                  
  332a  33db             xor bx, bx                               
  332c  8adc             mov bl, ah                               
  332e  b104             mov cl, 4                                
  3330  d3eb             shr bx, cl                               
  3332  d3e0             shl ax, cl                               
  3334  2e8e1e9c31       mov ds, word ptr cs:[0x319c]             
  3339  53               push bx                                  
  333a  50               push ax                                  
  333b  e83f03           call 0x367d                              
  333e  83c404           add sp, 4                                
  3341  5b               pop bx                                   
  3342  3dffff           cmp ax, 0xffff                           
  3345  7418             je 0x335f                                
  3347  2e89169631       mov word ptr cs:[0x3196], dx             
  334c  2e89169831       mov word ptr cs:[0x3198], dx             
  3351  8eda             mov ds, dx                               
  3353  891e0000         mov word ptr [0], bx                     
  3357  89160200         mov word ptr [2], dx                     
  335b  b80400           mov ax, 4                                
  335e  c3               ret                                      
  335f  33c0             xor ax, ax                               
  3361  99               cdq                                      
  3362  c3               ret                                      

res_0000_3363:  ; ENTRY
  3363  50               push ax                                  
  3364  33db             xor bx, bx                               
  3366  8adc             mov bl, ah                               
  3368  b104             mov cl, 4                                
  336a  d3eb             shr bx, cl                               
  336c  d3e0             shl ax, cl                               
  336e  2e8e1e9c31       mov ds, word ptr cs:[0x319c]             
  3373  53               push bx                                  
  3374  50               push ax                                  
  3375  e80503           call 0x367d                              
  3378  83c404           add sp, 4                                
  337b  5b               pop bx                                   
  337c  3dffff           cmp ax, 0xffff                           
  337f  7438             je 0x33b9                                
  3381  250f00           and ax, 0xf                              
  3384  7518             jne 0x339e                               
  3386  2e8b0e9831       mov cx, word ptr cs:[0x3198]             
  338b  2e89169831       mov word ptr cs:[0x3198], dx             
  3390  8eda             mov ds, dx                               
  3392  891e0000         mov word ptr [0], bx                     
  3396  890e0200         mov word ptr [2], cx                     
  339a  b80400           mov ax, 4                                
  339d  c3               ret                                      
  339e  53               push bx                                  
  339f  52               push dx                                  
  33a0  f7d8             neg ax                                   
  33a2  051000           add ax, 0x10                             
  33a5  33db             xor bx, bx                               
  33a7  53               push bx                                  
  33a8  50               push ax                                  
  33a9  e8d102           call 0x367d                              
  33ac  83c404           add sp, 4                                
  33af  5a               pop dx                                   
  33b0  5b               pop bx                                   
  33b1  3dffff           cmp ax, 0xffff                           
  33b4  7403             je 0x33b9                                
  33b6  42               inc dx                                   
  33b7  ebcd             jmp 0x3386                               
  33b9  33c0             xor ax, ax                               
  33bb  99               cdq                                      
  33bc  c3               ret                                      

res_0000_33bd:  ; ENTRY
  33bd  8bda             mov bx, dx                               
  33bf  29060000         sub word ptr [0], ax                     
  33c3  03160000         add dx, word ptr [0]                     
  33c7  8eda             mov ds, dx                               
  33c9  a30000           mov word ptr [0], ax                     
  33cc  891e0200         mov word ptr [2], bx                     
  33d0  8bda             mov bx, dx                               
  33d2  031e0000         add bx, word ptr [0]                     
  33d6  8edb             mov ds, bx                               
  33d8  89160200         mov word ptr [2], dx                     
  33dc  b80400           mov ax, 4                                
  33df  c3               ret                                      
  33e0  55               push bp                                  
  33e1  8bec             mov bp, sp                               
  33e3  33d2             xor dx, dx                               
  33e5  8b4606           mov ax, word ptr [bp + 6]                
  33e8  eb09             jmp 0x33f3                               

res_0000_33ea:  ; ENTRY
  33ea  55               push bp                                  
  33eb  8bec             mov bp, sp                               
  33ed  8b5608           mov dx, word ptr [bp + 8]                
  33f0  8b4606           mov ax, word ptr [bp + 6]                
  33f3  8bc8             mov cx, ax                               
  33f5  0bca             or cx, dx                                
  33f7  56               push si                                  
  33f8  57               push di                                  
  33f9  2e8c1e9c31       mov word ptr cs:[0x319c], ds             
  33fe  745e             je 0x345e                                
  3400  051300           add ax, 0x13                             
  3403  83d200           adc dx, 0                                
  3406  7241             jb 0x3449                                
  3408  f7c2f0ff         test dx, 0xfff0                          
  340c  753b             jne 0x3449                               
  340e  b104             mov cl, 4                                
  3410  d3e8             shr ax, cl                               
  3412  d3e2             shl dx, cl                               
  3414  0ae2             or ah, dl                                
  3416  2e8b169631       mov dx, word ptr cs:[0x3196]             
  341b  0bd2             or dx, dx                                
  341d  7420             je 0x343f                                
  341f  2e8b169a31       mov dx, word ptr cs:[0x319a]             
  3424  0bd2             or dx, dx                                
  3426  7412             je 0x343a                                
  3428  8bda             mov bx, dx                               
  342a  8eda             mov ds, dx                               
  342c  39060000         cmp word ptr [0], ax                     
  3430  731c             jae 0x344e                               
  3432  8b160600         mov dx, word ptr [6]                     
  3436  3bd3             cmp dx, bx                               
  3438  75f0             jne 0x342a                               
  343a  e826ff           call 0x3363                              
  343d  eb1f             jmp 0x345e                               
  343f  e8bdfe           call 0x32ff                              
  3442  eb1a             jmp 0x345e                               
  3444  e876ff           call 0x33bd                              
  3447  eb15             jmp 0x345e                               
  3449  33c0             xor ax, ax                               
  344b  99               cdq                                      
  344c  eb10             jmp 0x345e                               
  344e  77f4             ja 0x3444                                
  3450  e823fe           call 0x3276                              
  3453  8b1e0800         mov bx, word ptr [8]                     
  3457  891e0200         mov word ptr [2], bx                     
  345b  b80400           mov ax, 4                                
  345e  2e8e1e9c31       mov ds, word ptr cs:[0x319c]             
  3463  5f               pop di                                   
  3464  5e               pop si                                   
  3465  5d               pop bp                                   
  3466  cb               retf                                     

res_0000_3467:  ; ENTRY
  3467  53               push bx                                  
  3468  2e8b369e31       mov si, word ptr cs:[0x319e]             
  346d  56               push si                                  
  346e  2e8b36a031       mov si, word ptr cs:[0x31a0]             
  3473  56               push si                                  
  3474  0e               push cs                                  
  3475  e872ff           call 0x33ea                              
  3478  83c404           add sp, 4                                
  347b  0bd2             or dx, dx                                
  347d  7502             jne 0x3481                               
  347f  5b               pop bx                                   
  3480  c3               ret                                      
  3481  1f               pop ds                                   
  3482  8ec2             mov es, dx                               
  3484  06               push es                                  
  3485  1e               push ds                                  
  3486  53               push bx                                  
  3487  8b160000         mov dx, word ptr [0]                     
  348b  fc               cld                                      
  348c  4a               dec dx                                   
  348d  bf0400           mov di, 4                                
  3490  8bf7             mov si, di                               
  3492  b90600           mov cx, 6                                
  3495  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  3497  0bd2             or dx, dx                                
  3499  7437             je 0x34d2                                
  349b  8cc0             mov ax, es                               
  349d  40               inc ax                                   
  349e  8ec0             mov es, ax                               
  34a0  8cd8             mov ax, ds                               
  34a2  40               inc ax                                   
  34a3  8ed8             mov ds, ax                               
  34a5  33ff             xor di, di                               
  34a7  8bf7             mov si, di                               
  34a9  8bca             mov cx, dx                               
  34ab  81f90010         cmp cx, 0x1000                           
  34af  7603             jbe 0x34b4                               
  34b1  b90010           mov cx, 0x1000                           
  34b4  d1e1             shl cx, 1                                
  34b6  d1e1             shl cx, 1                                
  34b8  d1e1             shl cx, 1                                
  34ba  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  34bc  81ea0010         sub dx, 0x1000                           
  34c0  7610             jbe 0x34d2                               
  34c2  8cc0             mov ax, es                               
  34c4  050010           add ax, 0x1000                           
  34c7  8ec0             mov es, ax                               
  34c9  8cd8             mov ax, ds                               
  34cb  050010           add ax, 0x1000                           
  34ce  8ed8             mov ds, ax                               
  34d0  ebd3             jmp 0x34a5                               
  34d2  2e8e1e9c31       mov ds, word ptr cs:[0x319c]             
  34d7  0e               push cs                                  
  34d8  e8fbfd           call 0x32d6                              
  34db  83c404           add sp, 4                                
  34de  5a               pop dx                                   
  34df  b80400           mov ax, 4                                
  34e2  c3               ret                                      

res_0000_34e3:  ; ENTRY
  34e3  2e3b1e9831       cmp bx, word ptr cs:[0x3198]             
  34e8  7445             je 0x352f                                
  34ea  8bfb             mov di, bx                               
  34ec  03f8             add di, ax                               
  34ee  8ec7             mov es, di                               
  34f0  8bf1             mov si, cx                               
  34f2  2bf0             sub si, ax                               
  34f4  2689360000       mov word ptr es:[0], si                  
  34f9  26891e0200       mov word ptr es:[2], bx                  
  34fe  06               push es                                  
  34ff  50               push ax                                  
  3500  8ec3             mov es, bx                               
  3502  26a30000         mov word ptr es:[0], ax                  
  3506  8bd3             mov dx, bx                               
  3508  03d1             add dx, cx                               
  350a  8ec2             mov es, dx                               
  350c  26833e020000     cmp word ptr es:[2], 0                   
  3512  7407             je 0x351b                                
  3514  26893e0200       mov word ptr es:[2], di                  
  3519  eb05             jmp 0x3520                               
  351b  26893e0800       mov word ptr es:[8], di                  
  3520  8bf3             mov si, bx                               
  3522  0e               push cs                                  
  3523  e8b0fd           call 0x32d6                              
  3526  83c404           add sp, 4                                
  3529  8bd6             mov dx, si                               
  352b  b80400           mov ax, 4                                
  352e  c3               ret                                      
  352f  53               push bx                                  
  3530  8ec3             mov es, bx                               
  3532  26a30000         mov word ptr es:[0], ax                  
  3536  03d8             add bx, ax                               
  3538  53               push bx                                  
  3539  33c0             xor ax, ax                               
  353b  50               push ax                                  
  353c  e8ff00           call 0x363e                              
  353f  83c404           add sp, 4                                
  3542  5a               pop dx                                   
  3543  b80400           mov ax, 4                                
  3546  c3               ret                                      
  3547  55               push bp                                  
  3548  8bec             mov bp, sp                               
  354a  33d2             xor dx, dx                               
  354c  eb06             jmp 0x3554                               
  354e  55               push bp                                  
  354f  8bec             mov bp, sp                               
  3551  8b560c           mov dx, word ptr [bp + 0xc]              
  3554  8b460a           mov ax, word ptr [bp + 0xa]              
  3557  8b5e08           mov bx, word ptr [bp + 8]                
  355a  56               push si                                  
  355b  57               push di                                  
  355c  2e8c1e9c31       mov word ptr cs:[0x319c], ds             
  3561  2e89169e31       mov word ptr cs:[0x319e], dx             
  3566  2ea3a031         mov word ptr cs:[0x31a0], ax             
  356a  0bdb             or bx, bx                                
  356c  743a             je 0x35a8                                
  356e  8bc8             mov cx, ax                               
  3570  0bca             or cx, dx                                
  3572  743f             je 0x35b3                                
  3574  051300           add ax, 0x13                             
  3577  83d200           adc dx, 0                                
  357a  7240             jb 0x35bc                                
  357c  f7c2f0ff         test dx, 0xfff0                          
  3580  753a             jne 0x35bc                               
  3582  b104             mov cl, 4                                
  3584  d3e8             shr ax, cl                               
  3586  d3e2             shl dx, cl                               
  3588  0ae2             or ah, dl                                
  358a  8ec3             mov es, bx                               
  358c  268b0e0000       mov cx, word ptr es:[0]                  
  3591  3bc8             cmp cx, ax                               
  3593  720e             jb 0x35a3                                
  3595  7707             ja 0x359e                                
  3597  8bd3             mov dx, bx                               
  3599  b80400           mov ax, 4                                
  359c  eb21             jmp 0x35bf                               
  359e  e842ff           call 0x34e3                              
  35a1  eb1c             jmp 0x35bf                               
  35a3  e8c1fe           call 0x3467                              
  35a6  eb17             jmp 0x35bf                               
  35a8  52               push dx                                  
  35a9  50               push ax                                  
  35aa  0e               push cs                                  
  35ab  e83cfe           call 0x33ea                              
  35ae  83c404           add sp, 4                                
  35b1  eb0c             jmp 0x35bf                               
  35b3  53               push bx                                  
  35b4  50               push ax                                  
  35b5  0e               push cs                                  
  35b6  e81dfd           call 0x32d6                              
  35b9  83c404           add sp, 4                                
  35bc  33c0             xor ax, ax                               
  35be  99               cdq                                      
  35bf  2e8e1e9c31       mov ds, word ptr cs:[0x319c]             
  35c4  5f               pop di                                   
  35c5  5e               pop si                                   
  35c6  5d               pop bp                                   
  35c7  cb               retf                                     

res_0000_35c8:  ; ENTRY
  35c8  55               push bp                                  
  35c9  8bec             mov bp, sp                               
  35cb  56               push si                                  
  35cc  8b7606           mov si, word ptr [bp + 6]                
  35cf  46               inc si                                   
  35d0  2b367b00         sub si, word ptr [0x7b]                  
  35d4  83c63f           add si, 0x3f                             
  35d7  b106             mov cl, 6                                
  35d9  d3ee             shr si, cl                               
  35db  3b36bc3e         cmp si, word ptr [0x3ebc]                
  35df  7512             jne 0x35f3                               
  35e1  8b4606           mov ax, word ptr [bp + 6]                
  35e4  8b5604           mov dx, word ptr [bp + 4]                
  35e7  a38d00           mov word ptr [0x8d], ax                  
  35ea  89168b00         mov word ptr [0x8b], dx                  
  35ee  b80100           mov ax, 1                                
  35f1  eb46             jmp 0x3639                               
  35f3  b106             mov cl, 6                                
  35f5  d3e6             shl si, cl                               
  35f7  8b169100         mov dx, word ptr [0x91]                  
  35fb  8bc6             mov ax, si                               
  35fd  03067b00         add ax, word ptr [0x7b]                  
  3601  3bc2             cmp ax, dx                               
  3603  7606             jbe 0x360b                               
  3605  8bf2             mov si, dx                               
  3607  2b367b00         sub si, word ptr [0x7b]                  
  360b  56               push si                                  
  360c  ff367b00         push word ptr [0x7b]                     
  3610  90               nop                                      
  3611  0e               push cs                                  
  3612  e81d08           call 0x3e32                              
  3615  59               pop cx                                   
  3616  59               pop cx                                   
  3617  8bd0             mov dx, ax                               
  3619  83faff           cmp dx, -1                               
  361c  750b             jne 0x3629                               
  361e  8bc6             mov ax, si                               
  3620  b106             mov cl, 6                                
  3622  d3e8             shr ax, cl                               
  3624  a3bc3e           mov word ptr [0x3ebc], ax                
  3627  ebb8             jmp 0x35e1                               
  3629  a17b00           mov ax, word ptr [0x7b]                  
  362c  03c2             add ax, dx                               
  362e  a39100           mov word ptr [0x91], ax                  
  3631  c7068f000000     mov word ptr [0x8f], 0                   
  3637  33c0             xor ax, ax                               
  3639  5e               pop si                                   
  363a  5d               pop bp                                   
  363b  c20400           ret 4                                    

res_0000_363e:  ; ENTRY
  363e  55               push bp                                  
  363f  8bec             mov bp, sp                               
  3641  8b0e8900         mov cx, word ptr [0x89]                  
  3645  8b1e8700         mov bx, word ptr [0x87]                  
  3649  8b5606           mov dx, word ptr [bp + 6]                
  364c  8b4604           mov ax, word ptr [bp + 4]                
  364f  e886e9           call 0x1fd8                              
  3652  7220             jb 0x3674                                
  3654  8b0e9100         mov cx, word ptr [0x91]                  
  3658  8b1e8f00         mov bx, word ptr [0x8f]                  
  365c  8b5606           mov dx, word ptr [bp + 6]                
  365f  8b4604           mov ax, word ptr [bp + 4]                
  3662  e873e9           call 0x1fd8                              
  3665  770d             ja 0x3674                                
  3667  ff7606           push word ptr [bp + 6]                   
  366a  ff7604           push word ptr [bp + 4]                   
  366d  e858ff           call 0x35c8                              
  3670  0bc0             or ax, ax                                
  3672  7505             jne 0x3679                               
  3674  b8ffff           mov ax, 0xffff                           
  3677  eb02             jmp 0x367b                               
  3679  33c0             xor ax, ax                               
  367b  5d               pop bp                                   
  367c  c3               ret                                      

res_0000_367d:  ; ENTRY
  367d  55               push bp                                  
  367e  8bec             mov bp, sp                               
  3680  83ec08           sub sp, 8                                
  3683  a18d00           mov ax, word ptr [0x8d]                  
  3686  33d2             xor dx, dx                               
  3688  b104             mov cl, 4                                
  368a  e865e7           call 0x1df2                              
  368d  03068b00         add ax, word ptr [0x8b]                  
  3691  83d200           adc dx, 0                                
  3694  034604           add ax, word ptr [bp + 4]                
  3697  135606           adc dx, word ptr [bp + 6]                
  369a  83fa0f           cmp dx, 0xf                              
  369d  7c0f             jl 0x36ae                                
  369f  7f05             jg 0x36a6                                
  36a1  3dffff           cmp ax, 0xffff                           
  36a4  7608             jbe 0x36ae                               
  36a6  baffff           mov dx, 0xffff                           
  36a9  b8ffff           mov ax, 0xffff                           
  36ac  eb56             jmp 0x3704                               
  36ae  8b168d00         mov dx, word ptr [0x8d]                  
  36b2  a18b00           mov ax, word ptr [0x8b]                  
  36b5  8b4e06           mov cx, word ptr [bp + 6]                
  36b8  8b5e04           mov bx, word ptr [bp + 4]                
  36bb  e855e7           call 0x1e13                              
  36be  8956fe           mov word ptr [bp - 2], dx                
  36c1  8946fc           mov word ptr [bp - 4], ax                
  36c4  8b0e8900         mov cx, word ptr [0x89]                  
  36c8  8b1e8700         mov bx, word ptr [0x87]                  
  36cc  e809e9           call 0x1fd8                              
  36cf  72d5             jb 0x36a6                                
  36d1  8b0e9100         mov cx, word ptr [0x91]                  
  36d5  8b1e8f00         mov bx, word ptr [0x8f]                  
  36d9  8b56fe           mov dx, word ptr [bp - 2]                
  36dc  8b46fc           mov ax, word ptr [bp - 4]                
  36df  e8f6e8           call 0x1fd8                              
  36e2  77c2             ja 0x36a6                                
  36e4  a18d00           mov ax, word ptr [0x8d]                  
  36e7  8b168b00         mov dx, word ptr [0x8b]                  
  36eb  8946fa           mov word ptr [bp - 6], ax                
  36ee  8956f8           mov word ptr [bp - 8], dx                
  36f1  ff76fe           push word ptr [bp - 2]                   
  36f4  ff76fc           push word ptr [bp - 4]                   
  36f7  e8cefe           call 0x35c8                              
  36fa  0bc0             or ax, ax                                
  36fc  74a8             je 0x36a6                                
  36fe  8b56fa           mov dx, word ptr [bp - 6]                
  3701  8b46f8           mov ax, word ptr [bp - 8]                
  3704  8be5             mov sp, bp                               
  3706  5d               pop bp                                   
  3707  c3               ret                                      

res_0000_3708:  ; ENTRY
  3708  803ebe3e00       cmp byte ptr [0x3ebe], 0                 
  370d  740a             je 0x3719                                
  370f  c606be3e00       mov byte ptr [0x3ebe], 0                 
  3714  a0bf3e           mov al, byte ptr [0x3ebf]                
  3717  eb05             jmp 0x371e                               
  3719  b80007           mov ax, 0x700                            
  371c  cd21             int 0x21                                 
  371e  b400             mov ah, 0                                
  3720  cb               retf                                     
  3721  58               pop ax                                   
  3722  0e               push cs                                  
  3723  50               push ax                                  
  3724  56               push si                                  
  3725  803ebe3e00       cmp byte ptr [0x3ebe], 0                 
  372a  7408             je 0x3734                                
  372c  0e               push cs                                  
  372d  e8d8ff           call 0x3708                              
  3730  8bf0             mov si, ax                               
  3732  eb0d             jmp 0x3741                               
  3734  0e               push cs                                  
  3735  e8d0ff           call 0x3708                              
  3738  8bf0             mov si, ax                               
  373a  50               push ax                                  
  373b  90               nop                                      
  373c  0e               push cs                                  
  373d  e84b02           call 0x398b                              
  3740  59               pop cx                                   
  3741  8bc6             mov ax, si                               
  3743  5e               pop si                                   
  3744  cb               retf                                     
  3745  58               pop ax                                   
  3746  0e               push cs                                  
  3747  50               push ax                                  
  3748  55               push bp                                  
  3749  8bec             mov bp, sp                               
  374b  803ebe3e00       cmp byte ptr [0x3ebe], 0                 
  3750  7405             je 0x3757                                
  3752  b8ffff           mov ax, 0xffff                           
  3755  eb0d             jmp 0x3764                               
  3757  c606be3e01       mov byte ptr [0x3ebe], 1                 
  375c  8a4606           mov al, byte ptr [bp + 6]                
  375f  a2bf3e           mov byte ptr [0x3ebf], al                
  3762  b400             mov ah, 0                                
  3764  5d               pop bp                                   
  3765  cb               retf                                     

res_0000_3766:  ; ENTRY
  3766  55               push bp                                  
  3767  8bec             mov bp, sp                               
  3769  83ec02           sub sp, 2                                
  376c  56               push si                                  
  376d  57               push di                                  
  376e  8b7e06           mov di, word ptr [bp + 6]                
  3771  8b7608           mov si, word ptr [bp + 8]                
  3774  57               push di                                  
  3775  56               push si                                  
  3776  ff760a           push word ptr [bp + 0xa]                 
  3779  ff760c           push word ptr [bp + 0xc]                 
  377c  e8a503           call 0x3b24                              
  377f  0bc0             or ax, ax                                
  3781  7504             jne 0x3787                               
  3783  33c0             xor ax, ax                               
  3785  eb2f             jmp 0x37b6                               
  3787  8b460a           mov ax, word ptr [bp + 0xa]              
  378a  2bc7             sub ax, di                               
  378c  40               inc ax                                   
  378d  8946fe           mov word ptr [bp - 2], ax                
  3790  eb1c             jmp 0x37ae                               
  3792  ff7610           push word ptr [bp + 0x10]                
  3795  ff760e           push word ptr [bp + 0xe]                 
  3798  57               push di                                  
  3799  56               push si                                  
  379a  e823f6           call 0x2dc0                              
  379d  52               push dx                                  
  379e  50               push ax                                  
  379f  ff76fe           push word ptr [bp - 2]                   
  37a2  e84303           call 0x3ae8                              
  37a5  8b46fe           mov ax, word ptr [bp - 2]                
  37a8  d1e0             shl ax, 1                                
  37aa  01460e           add word ptr [bp + 0xe], ax              
  37ad  46               inc si                                   
  37ae  3b760c           cmp si, word ptr [bp + 0xc]              
  37b1  7edf             jle 0x3792                               
  37b3  b80100           mov ax, 1                                
  37b6  5f               pop di                                   
  37b7  5e               pop si                                   
  37b8  8be5             mov sp, bp                               
  37ba  5d               pop bp                                   
  37bb  cb               retf                                     

res_0000_37bc:  ; ENTRY
  37bc  55               push bp                                  
  37bd  8bec             mov bp, sp                               
  37bf  83ec02           sub sp, 2                                
  37c2  56               push si                                  
  37c3  57               push di                                  
  37c4  8b7e06           mov di, word ptr [bp + 6]                
  37c7  8b7608           mov si, word ptr [bp + 8]                
  37ca  57               push di                                  
  37cb  56               push si                                  
  37cc  ff760a           push word ptr [bp + 0xa]                 
  37cf  ff760c           push word ptr [bp + 0xc]                 
  37d2  e84f03           call 0x3b24                              
  37d5  0bc0             or ax, ax                                
  37d7  7504             jne 0x37dd                               
  37d9  33c0             xor ax, ax                               
  37db  eb2f             jmp 0x380c                               
  37dd  8b460a           mov ax, word ptr [bp + 0xa]              
  37e0  2bc7             sub ax, di                               
  37e2  40               inc ax                                   
  37e3  8946fe           mov word ptr [bp - 2], ax                
  37e6  eb1c             jmp 0x3804                               
  37e8  57               push di                                  
  37e9  56               push si                                  
  37ea  e8d3f5           call 0x2dc0                              
  37ed  52               push dx                                  
  37ee  50               push ax                                  
  37ef  ff7610           push word ptr [bp + 0x10]                
  37f2  ff760e           push word ptr [bp + 0xe]                 
  37f5  ff76fe           push word ptr [bp - 2]                   
  37f8  e8ed02           call 0x3ae8                              
  37fb  8b46fe           mov ax, word ptr [bp - 2]                
  37fe  d1e0             shl ax, 1                                
  3800  01460e           add word ptr [bp + 0xe], ax              
  3803  46               inc si                                   
  3804  3b760c           cmp si, word ptr [bp + 0xc]              
  3807  7edf             jle 0x37e8                               
  3809  b80100           mov ax, 1                                
  380c  5f               pop di                                   
  380d  5e               pop si                                   
  380e  8be5             mov sp, bp                               
  3810  5d               pop bp                                   
  3811  cb               retf                                     

res_0000_3812:  ; ENTRY
  3812  55               push bp                                  
  3813  8bec             mov bp, sp                               
  3815  83ec08           sub sp, 8                                
  3818  16               push ss                                  
  3819  8d46f8           lea ax, [bp - 8]                         
  381c  50               push ax                                  
  381d  90               nop                                      
  381e  0e               push cs                                  
  381f  e8cfee           call 0x26f1                              
  3822  59               pop cx                                   
  3823  59               pop cx                                   
  3824  16               push ss                                  
  3825  8d46f8           lea ax, [bp - 8]                         
  3828  50               push ax                                  
  3829  ff760e           push word ptr [bp + 0xe]                 
  382c  ff760c           push word ptr [bp + 0xc]                 
  382f  ff760a           push word ptr [bp + 0xa]                 
  3832  ff7608           push word ptr [bp + 8]                   
  3835  ff7606           push word ptr [bp + 6]                   
  3838  0e               push cs                                  
  3839  e80700           call 0x3843                              
  383c  83c40e           add sp, 0xe                              
  383f  8be5             mov sp, bp                               
  3841  5d               pop bp                                   
  3842  cb               retf                                     

res_0000_3843:  ; ENTRY
  3843  55               push bp                                  
  3844  8bec             mov bp, sp                               
  3846  83ec0e           sub sp, 0xe                              
  3849  56               push si                                  
  384a  57               push di                                  
  384b  1e               push ds                                  
  384c  8d4ef2           lea cx, [bp - 0xe]                       
  384f  894efc           mov word ptr [bp - 4], cx                
  3852  8c56fe           mov word ptr [bp - 2], ss                
  3855  c646f255         mov byte ptr [bp - 0xe], 0x55            
  3859  c646f3cd         mov byte ptr [bp - 0xd], 0xcd            
  385d  8b4606           mov ax, word ptr [bp + 6]                
  3860  8846f4           mov byte ptr [bp - 0xc], al              
  3863  c746f55dcb       mov word ptr [bp - 0xb], 0xcb5d          
  3868  3c25             cmp al, 0x25                             
  386a  7215             jb 0x3881                                
  386c  3c26             cmp al, 0x26                             
  386e  7711             ja 0x3881                                
  3870  c646f536         mov byte ptr [bp - 0xb], 0x36            
  3874  c746f68f06       mov word ptr [bp - 0xa], 0x68f           
  3879  894ef8           mov word ptr [bp - 8], cx                
  387c  c746fa5dcb       mov word ptr [bp - 6], 0xcb5d            
  3881  c57610           lds si, ptr [bp + 0x10]                  
  3884  ff34             push word ptr [si]                       
  3886  ff7406           push word ptr [si + 6]                   
  3889  c57608           lds si, ptr [bp + 8]                     
  388c  8b04             mov ax, word ptr [si]                    
  388e  8b5c02           mov bx, word ptr [si + 2]                
  3891  8b4c04           mov cx, word ptr [si + 4]                
  3894  8b5406           mov dx, word ptr [si + 6]                
  3897  8b7c0a           mov di, word ptr [si + 0xa]              
  389a  8b7408           mov si, word ptr [si + 8]                
  389d  1f               pop ds                                   
  389e  07               pop es                                   
  389f  ff5efc           lcall [bp - 4]                           
  38a2  9c               pushf                                    
  38a3  9c               pushf                                    
  38a4  56               push si                                  
  38a5  1e               push ds                                  
  38a6  06               push es                                  
  38a7  c57610           lds si, ptr [bp + 0x10]                  
  38aa  8f04             pop word ptr [si]                        
  38ac  8f4406           pop word ptr [si + 6]                    
  38af  c5760c           lds si, ptr [bp + 0xc]                   
  38b2  8f4408           pop word ptr [si + 8]                    
  38b5  8f440e           pop word ptr [si + 0xe]                  
  38b8  8f440c           pop word ptr [si + 0xc]                  
  38bb  83640c01         and word ptr [si + 0xc], 1               
  38bf  897c0a           mov word ptr [si + 0xa], di              
  38c2  895406           mov word ptr [si + 6], dx                
  38c5  894c04           mov word ptr [si + 4], cx                
  38c8  895c02           mov word ptr [si + 2], bx                
  38cb  8904             mov word ptr [si], ax                    
  38cd  1f               pop ds                                   
  38ce  7406             je 0x38d6                                
  38d0  50               push ax                                  
  38d1  50               push ax                                  
  38d2  e8c5e5           call 0x1e9a                              
  38d5  58               pop ax                                   
  38d6  5f               pop di                                   
  38d7  5e               pop si                                   
  38d8  8be5             mov sp, bp                               
  38da  5d               pop bp                                   
  38db  cb               retf                                     

res_0000_38dc:  ; ENTRY
  38dc  803ebe3e00       cmp byte ptr [0x3ebe], 0                 
  38e1  7405             je 0x38e8                                
  38e3  b80100           mov ax, 1                                
  38e6  eb05             jmp 0x38ed                               
  38e8  b40b             mov ah, 0xb                              
  38ea  cd21             int 0x21                                 
  38ec  98               cwde                                     
  38ed  cb               retf                                     

res_0000_38ee:  ; ENTRY
  38ee  55               push bp                                  
  38ef  8bec             mov bp, sp                               
  38f1  83ec04           sub sp, 4                                
  38f4  56               push si                                  
  38f5  57               push di                                  
  38f6  8b7608           mov si, word ptr [bp + 8]                
  38f9  8b7e0c           mov di, word ptr [bp + 0xc]              
  38fc  ff7606           push word ptr [bp + 6]                   
  38ff  56               push si                                  
  3900  ff760a           push word ptr [bp + 0xa]                 
  3903  57               push di                                  
  3904  e81d02           call 0x3b24                              
  3907  0bc0             or ax, ax                                
  3909  7423             je 0x392e                                
  390b  ff760e           push word ptr [bp + 0xe]                 
  390e  ff7610           push word ptr [bp + 0x10]                
  3911  8b460a           mov ax, word ptr [bp + 0xa]              
  3914  2b4606           sub ax, word ptr [bp + 6]                
  3917  8b560e           mov dx, word ptr [bp + 0xe]              
  391a  03d0             add dx, ax                               
  391c  52               push dx                                  
  391d  8bc7             mov ax, di                               
  391f  2bc6             sub ax, si                               
  3921  8b5610           mov dx, word ptr [bp + 0x10]             
  3924  03d0             add dx, ax                               
  3926  52               push dx                                  
  3927  e8fa01           call 0x3b24                              
  392a  0bc0             or ax, ax                                
  392c  7504             jne 0x3932                               
  392e  33c0             xor ax, ax                               
  3930  eb53             jmp 0x3985                               
  3932  8bd6             mov dx, si                               
  3934  897efe           mov word ptr [bp - 2], di                
  3937  c746fc0100       mov word ptr [bp - 4], 1                 
  393c  3b7610           cmp si, word ptr [bp + 0x10]             
  393f  7d0a             jge 0x394b                               
  3941  8bd7             mov dx, di                               
  3943  8976fe           mov word ptr [bp - 2], si                
  3946  c746fcffff       mov word ptr [bp - 4], 0xffff            
  394b  8bfa             mov di, dx                               
  394d  eb29             jmp 0x3978                               
  394f  ff760e           push word ptr [bp + 0xe]                 
  3952  8bc7             mov ax, di                               
  3954  2bc6             sub ax, si                               
  3956  8b5610           mov dx, word ptr [bp + 0x10]             
  3959  03d0             add dx, ax                               
  395b  52               push dx                                  
  395c  e861f4           call 0x2dc0                              
  395f  52               push dx                                  
  3960  50               push ax                                  
  3961  ff7606           push word ptr [bp + 6]                   
  3964  57               push di                                  
  3965  e858f4           call 0x2dc0                              
  3968  52               push dx                                  
  3969  50               push ax                                  
  396a  8b460a           mov ax, word ptr [bp + 0xa]              
  396d  2b4606           sub ax, word ptr [bp + 6]                
  3970  40               inc ax                                   
  3971  50               push ax                                  
  3972  e87301           call 0x3ae8                              
  3975  037efc           add di, word ptr [bp - 4]                
  3978  8b46fe           mov ax, word ptr [bp - 2]                
  397b  0346fc           add ax, word ptr [bp - 4]                
  397e  3bc7             cmp ax, di                               
  3980  75cd             jne 0x394f                               
  3982  b80100           mov ax, 1                                
  3985  5f               pop di                                   
  3986  5e               pop si                                   
  3987  8be5             mov sp, bp                               
  3989  5d               pop bp                                   
  398a  cb               retf                                     

res_0000_398b:  ; ENTRY
  398b  55               push bp                                  
  398c  8bec             mov bp, sp                               
  398e  16               push ss                                  
  398f  8d4606           lea ax, [bp + 6]                         
  3992  50               push ax                                  
  3993  b80100           mov ax, 1                                
  3996  50               push ax                                  
  3997  33c0             xor ax, ax                               
  3999  33d2             xor dx, dx                               
  399b  50               push ax                                  
  399c  52               push dx                                  
  399d  e8e4f4           call 0x2e84                              
  39a0  5d               pop bp                                   
  39a1  cb               retf                                     

res_0000_39a2:  ; ENTRY
  39a2  ff261a3f         jmp word ptr [0x3f1a]                    

res_0000_39a6:  ; ENTRY
  39a6  ff261e3f         jmp word ptr [0x3f1e]                    

res_0000_39aa:  ; ENTRY
  39aa  ff26203f         jmp word ptr [0x3f20]                    

res_0000_39ae:  ; ENTRY
  39ae  ff26223f         jmp word ptr [0x3f22]                    

res_0000_39b2:  ; ENTRY
  39b2  55               push bp                                  
  39b3  8bec             mov bp, sp                               
  39b5  83ec02           sub sp, 2                                
  39b8  8b4604           mov ax, word ptr [bp + 4]                
  39bb  d1e8             shr ax, 1                                
  39bd  8bc8             mov cx, ax                               
  39bf  a07a3e           mov al, byte ptr [0x3e7a]                
  39c2  b400             mov ah, 0                                
  39c4  50               push ax                                  
  39c5  8bc1             mov ax, cx                               
  39c7  33d2             xor dx, dx                               
  39c9  5b               pop bx                                   
  39ca  f7f3             div bx                                   
  39cc  8ad8             mov bl, al                               
  39ce  b400             mov ah, 0                                
  39d0  8a167a3e         mov dl, byte ptr [0x3e7a]                
  39d4  b600             mov dh, 0                                
  39d6  f7ea             imul dx                                  
  39d8  8ad1             mov dl, cl                               
  39da  2ad0             sub dl, al                               
  39dc  8856ff           mov byte ptr [bp - 1], dl                
  39df  8ae3             mov ah, bl                               
  39e1  8a46ff           mov al, byte ptr [bp - 1]                
  39e4  8be5             mov sp, bp                               
  39e6  5d               pop bp                                   
  39e7  c20400           ret 4                                    

res_0000_39ea:  ; ENTRY
  39ea  55               push bp                                  
  39eb  8bec             mov bp, sp                               
  39ed  c45e08           les bx, ptr [bp + 8]                     
  39f0  268b17           mov dx, word ptr es:[bx]                 
  39f3  c45e04           les bx, ptr [bp + 4]                     
  39f6  263b17           cmp dx, word ptr es:[bx]                 
  39f9  740d             je 0x3a08                                
  39fb  b700             mov bh, 0                                
  39fd  b402             mov ah, 2                                
  39ff  e80bf6           call 0x300d                              
  3a02  c45e04           les bx, ptr [bp + 4]                     
  3a05  268917           mov word ptr es:[bx], dx                 
  3a08  fec2             inc dl                                   
  3a0a  3a167a3e         cmp dl, byte ptr [0x3e7a]                
  3a0e  7204             jb 0x3a14                                
  3a10  fec6             inc dh                                   
  3a12  b200             mov dl, 0                                
  3a14  c45e08           les bx, ptr [bp + 8]                     
  3a17  268917           mov word ptr es:[bx], dx                 
  3a1a  5d               pop bp                                   
  3a1b  c20800           ret 8                                    

res_0000_3a1e:  ; ENTRY
  3a1e  55               push bp                                  
  3a1f  8bec             mov bp, sp                               
  3a21  83ec0c           sub sp, 0xc                              
  3a24  56               push si                                  
  3a25  57               push di                                  
  3a26  8b7e04           mov di, word ptr [bp + 4]                
  3a29  e87a04           call 0x3ea6                              
  3a2c  8946f8           mov word ptr [bp - 8], ax                
  3a2f  8946fa           mov word ptr [bp - 6], ax                
  3a32  8b460c           mov ax, word ptr [bp + 0xc]              
  3a35  3b067f3e         cmp ax, word ptr [0x3e7f]                
  3a39  7505             jne 0x3a40                               
  3a3b  b80100           mov ax, 1                                
  3a3e  eb02             jmp 0x3a42                               
  3a40  33c0             xor ax, ax                               
  3a42  8946f6           mov word ptr [bp - 0xa], ax              
  3a45  0bc0             or ax, ax                                
  3a47  740c             je 0x3a55                                
  3a49  ff760c           push word ptr [bp + 0xc]                 
  3a4c  ff760a           push word ptr [bp + 0xa]                 
  3a4f  e860ff           call 0x39b2                              
  3a52  8946fe           mov word ptr [bp - 2], ax                
  3a55  8b4608           mov ax, word ptr [bp + 8]                
  3a58  3b067f3e         cmp ax, word ptr [0x3e7f]                
  3a5c  7505             jne 0x3a63                               
  3a5e  b80100           mov ax, 1                                
  3a61  eb02             jmp 0x3a65                               
  3a63  33c0             xor ax, ax                               
  3a65  8946f4           mov word ptr [bp - 0xc], ax              
  3a68  0bc0             or ax, ax                                
  3a6a  7463             je 0x3acf                                
  3a6c  ff7608           push word ptr [bp + 8]                   
  3a6f  ff7606           push word ptr [bp + 6]                   
  3a72  e83dff           call 0x39b2                              
  3a75  8946fc           mov word ptr [bp - 4], ax                
  3a78  eb55             jmp 0x3acf                               
  3a7a  837ef400         cmp word ptr [bp - 0xc], 0               
  3a7e  7418             je 0x3a98                                
  3a80  16               push ss                                  
  3a81  8d46fc           lea ax, [bp - 4]                         
  3a84  50               push ax                                  
  3a85  16               push ss                                  
  3a86  8d46fa           lea ax, [bp - 6]                         
  3a89  50               push ax                                  
  3a8a  e85dff           call 0x39ea                              
  3a8d  b700             mov bh, 0                                
  3a8f  b408             mov ah, 8                                
  3a91  e879f5           call 0x300d                              
  3a94  8bf0             mov si, ax                               
  3a96  eb0a             jmp 0x3aa2                               
  3a98  c45e06           les bx, ptr [bp + 6]                     
  3a9b  268b37           mov si, word ptr es:[bx]                 
  3a9e  83460602         add word ptr [bp + 6], 2                 
  3aa2  837ef600         cmp word ptr [bp - 0xa], 0               
  3aa6  741d             je 0x3ac5                                
  3aa8  16               push ss                                  
  3aa9  8d46fe           lea ax, [bp - 2]                         
  3aac  50               push ax                                  
  3aad  16               push ss                                  
  3aae  8d46fa           lea ax, [bp - 6]                         
  3ab1  50               push ax                                  
  3ab2  e835ff           call 0x39ea                              
  3ab5  8bc6             mov ax, si                               
  3ab7  8adc             mov bl, ah                               
  3ab9  b90100           mov cx, 1                                
  3abc  b700             mov bh, 0                                
  3abe  b409             mov ah, 9                                
  3ac0  e84af5           call 0x300d                              
  3ac3  eb0a             jmp 0x3acf                               
  3ac5  c45e0a           les bx, ptr [bp + 0xa]                   
  3ac8  268937           mov word ptr es:[bx], si                 
  3acb  83460a02         add word ptr [bp + 0xa], 2               
  3acf  8bc7             mov ax, di                               
  3ad1  4f               dec di                                   
  3ad2  0bc0             or ax, ax                                
  3ad4  75a4             jne 0x3a7a                               
  3ad6  8b56f8           mov dx, word ptr [bp - 8]                
  3ad9  b700             mov bh, 0                                
  3adb  b402             mov ah, 2                                
  3add  e82df5           call 0x300d                              
  3ae0  5f               pop di                                   
  3ae1  5e               pop si                                   
  3ae2  8be5             mov sp, bp                               
  3ae4  5d               pop bp                                   
  3ae5  c20a00           ret 0xa                                  

res_0000_3ae8:  ; ENTRY
  3ae8  55               push bp                                  
  3ae9  8bec             mov bp, sp                               
  3aeb  8b5604           mov dx, word ptr [bp + 4]                
  3aee  a07b3e           mov al, byte ptr [0x3e7b]                
  3af1  b400             mov ah, 0                                
  3af3  0bc0             or ax, ax                                
  3af5  7519             jne 0x3b10                               
  3af7  833e813e00       cmp word ptr [0x3e81], 0                 
  3afc  7412             je 0x3b10                                
  3afe  ff760c           push word ptr [bp + 0xc]                 
  3b01  ff760a           push word ptr [bp + 0xa]                 
  3b04  ff7608           push word ptr [bp + 8]                   
  3b07  ff7606           push word ptr [bp + 6]                   
  3b0a  52               push dx                                  
  3b0b  e8d7f2           call 0x2de5                              
  3b0e  eb10             jmp 0x3b20                               
  3b10  ff760c           push word ptr [bp + 0xc]                 
  3b13  ff760a           push word ptr [bp + 0xa]                 
  3b16  ff7608           push word ptr [bp + 8]                   
  3b19  ff7606           push word ptr [bp + 6]                   
  3b1c  52               push dx                                  
  3b1d  e8fefe           call 0x3a1e                              
  3b20  5d               pop bp                                   
  3b21  c20a00           ret 0xa                                  

res_0000_3b24:  ; ENTRY
  3b24  55               push bp                                  
  3b25  8bec             mov bp, sp                               
  3b27  56               push si                                  
  3b28  57               push di                                  
  3b29  8b5e0a           mov bx, word ptr [bp + 0xa]              
  3b2c  8b7608           mov si, word ptr [bp + 8]                
  3b2f  8b7e06           mov di, word ptr [bp + 6]                
  3b32  a07a3e           mov al, byte ptr [0x3e7a]                
  3b35  b400             mov ah, 0                                
  3b37  8bc8             mov cx, ax                               
  3b39  a0793e           mov al, byte ptr [0x3e79]                
  3b3c  b400             mov ah, 0                                
  3b3e  8bd0             mov dx, ax                               
  3b40  3bd9             cmp bx, cx                               
  3b42  772d             ja 0x3b71                                
  3b44  3bf9             cmp di, cx                               
  3b46  7729             ja 0x3b71                                
  3b48  3bdf             cmp bx, di                               
  3b4a  7f25             jg 0x3b71                                
  3b4c  3bf2             cmp si, dx                               
  3b4e  7721             ja 0x3b71                                
  3b50  395604           cmp word ptr [bp + 4], dx                
  3b53  771c             ja 0x3b71                                
  3b55  3b7604           cmp si, word ptr [bp + 4]                
  3b58  7f17             jg 0x3b71                                
  3b5a  0bdb             or bx, bx                                
  3b5c  7e13             jle 0x3b71                               
  3b5e  0bff             or di, di                                
  3b60  7e0f             jle 0x3b71                               
  3b62  0bf6             or si, si                                
  3b64  7e0b             jle 0x3b71                               
  3b66  837e0400         cmp word ptr [bp + 4], 0                 
  3b6a  7e05             jle 0x3b71                               
  3b6c  b80100           mov ax, 1                                
  3b6f  eb02             jmp 0x3b73                               
  3b71  33c0             xor ax, ax                               
  3b73  5f               pop di                                   
  3b74  5e               pop si                                   
  3b75  5d               pop bp                                   
  3b76  c20800           ret 8                                    

res_0000_3b79:  ; ENTRY
  3b79  55               push bp                                  
  3b7a  8bec             mov bp, sp                               
  3b7c  8b5606           mov dx, word ptr [bp + 6]                
  3b7f  8a2e763e         mov ch, byte ptr [0x3e76]                
  3b83  b120             mov cl, 0x20                             
  3b85  eb0b             jmp 0x3b92                               
  3b87  c45e08           les bx, ptr [bp + 8]                     
  3b8a  26890f           mov word ptr es:[bx], cx                 
  3b8d  83460802         add word ptr [bp + 8], 2                 
  3b91  42               inc dx                                   
  3b92  3b5604           cmp dx, word ptr [bp + 4]                
  3b95  7ef0             jle 0x3b87                               
  3b97  5d               pop bp                                   
  3b98  c20800           ret 8                                    

res_0000_3b9b:  ; ENTRY
  3b9b  55               push bp                                  
  3b9c  8bec             mov bp, sp                               
  3b9e  81eca000         sub sp, 0xa0                             
  3ba2  a07b3e           mov al, byte ptr [0x3e7b]                
  3ba5  b400             mov ah, 0                                
  3ba7  0bc0             or ax, ax                                
  3ba9  7403             je 0x3bae                                
  3bab  e93a01           jmp 0x3ce8                               
  3bae  833e813e00       cmp word ptr [0x3e81], 0                 
  3bb3  7503             jne 0x3bb8                               
  3bb5  e93001           jmp 0x3ce8                               
  3bb8  807e0401         cmp byte ptr [bp + 4], 1                 
  3bbc  7403             je 0x3bc1                                
  3bbe  e92701           jmp 0x3ce8                               
  3bc1  fe460c           inc byte ptr [bp + 0xc]                  
  3bc4  fe460a           inc byte ptr [bp + 0xa]                  
  3bc7  fe4608           inc byte ptr [bp + 8]                    
  3bca  fe4606           inc byte ptr [bp + 6]                    
  3bcd  807e0e06         cmp byte ptr [bp + 0xe], 6               
  3bd1  7403             je 0x3bd6                                
  3bd3  e99100           jmp 0x3c67                               
  3bd6  8a460a           mov al, byte ptr [bp + 0xa]              
  3bd9  b400             mov ah, 0                                
  3bdb  50               push ax                                  
  3bdc  8a460c           mov al, byte ptr [bp + 0xc]              
  3bdf  b400             mov ah, 0                                
  3be1  50               push ax                                  
  3be2  8a4606           mov al, byte ptr [bp + 6]                
  3be5  b400             mov ah, 0                                
  3be7  50               push ax                                  
  3be8  8a4608           mov al, byte ptr [bp + 8]                
  3beb  b400             mov ah, 0                                
  3bed  50               push ax                                  
  3bee  8a460a           mov al, byte ptr [bp + 0xa]              
  3bf1  b400             mov ah, 0                                
  3bf3  40               inc ax                                   
  3bf4  50               push ax                                  
  3bf5  8a460c           mov al, byte ptr [bp + 0xc]              
  3bf8  b400             mov ah, 0                                
  3bfa  50               push ax                                  
  3bfb  90               nop                                      
  3bfc  0e               push cs                                  
  3bfd  e8eefc           call 0x38ee                              
  3c00  83c40c           add sp, 0xc                              
  3c03  16               push ss                                  
  3c04  8d8660ff         lea ax, [bp - 0xa0]                      
  3c08  50               push ax                                  
  3c09  8a4606           mov al, byte ptr [bp + 6]                
  3c0c  b400             mov ah, 0                                
  3c0e  50               push ax                                  
  3c0f  8a460c           mov al, byte ptr [bp + 0xc]              
  3c12  b400             mov ah, 0                                
  3c14  50               push ax                                  
  3c15  8a4606           mov al, byte ptr [bp + 6]                
  3c18  b400             mov ah, 0                                
  3c1a  50               push ax                                  
  3c1b  8a460c           mov al, byte ptr [bp + 0xc]              
  3c1e  b400             mov ah, 0                                
  3c20  50               push ax                                  
  3c21  90               nop                                      
  3c22  0e               push cs                                  
  3c23  e840fb           call 0x3766                              
  3c26  83c40c           add sp, 0xc                              
  3c29  16               push ss                                  
  3c2a  8d8660ff         lea ax, [bp - 0xa0]                      
  3c2e  50               push ax                                  
  3c2f  8a460c           mov al, byte ptr [bp + 0xc]              
  3c32  b400             mov ah, 0                                
  3c34  50               push ax                                  
  3c35  8a4608           mov al, byte ptr [bp + 8]                
  3c38  b400             mov ah, 0                                
  3c3a  50               push ax                                  
  3c3b  e83bff           call 0x3b79                              
  3c3e  16               push ss                                  
  3c3f  8d8660ff         lea ax, [bp - 0xa0]                      
  3c43  50               push ax                                  
  3c44  8a4606           mov al, byte ptr [bp + 6]                
  3c47  b400             mov ah, 0                                
  3c49  50               push ax                                  
  3c4a  8a4608           mov al, byte ptr [bp + 8]                
  3c4d  b400             mov ah, 0                                
  3c4f  50               push ax                                  
  3c50  8a4606           mov al, byte ptr [bp + 6]                
  3c53  b400             mov ah, 0                                
  3c55  50               push ax                                  
  3c56  8a460c           mov al, byte ptr [bp + 0xc]              
  3c59  b400             mov ah, 0                                
  3c5b  50               push ax                                  
  3c5c  90               nop                                      
  3c5d  0e               push cs                                  
  3c5e  e85bfb           call 0x37bc                              
  3c61  83c40c           add sp, 0xc                              
  3c64  e99a00           jmp 0x3d01                               
  3c67  8a460a           mov al, byte ptr [bp + 0xa]              
  3c6a  b400             mov ah, 0                                
  3c6c  40               inc ax                                   
  3c6d  50               push ax                                  
  3c6e  8a460c           mov al, byte ptr [bp + 0xc]              
  3c71  b400             mov ah, 0                                
  3c73  50               push ax                                  
  3c74  8a4606           mov al, byte ptr [bp + 6]                
  3c77  b400             mov ah, 0                                
  3c79  48               dec ax                                   
  3c7a  50               push ax                                  
  3c7b  8a4608           mov al, byte ptr [bp + 8]                
  3c7e  b400             mov ah, 0                                
  3c80  50               push ax                                  
  3c81  8a460a           mov al, byte ptr [bp + 0xa]              
  3c84  b400             mov ah, 0                                
  3c86  50               push ax                                  
  3c87  8a460c           mov al, byte ptr [bp + 0xc]              
  3c8a  b400             mov ah, 0                                
  3c8c  50               push ax                                  
  3c8d  90               nop                                      
  3c8e  0e               push cs                                  
  3c8f  e85cfc           call 0x38ee                              
  3c92  83c40c           add sp, 0xc                              
  3c95  16               push ss                                  
  3c96  8d8660ff         lea ax, [bp - 0xa0]                      
  3c9a  50               push ax                                  
  3c9b  8a460a           mov al, byte ptr [bp + 0xa]              
  3c9e  b400             mov ah, 0                                
  3ca0  50               push ax                                  
  3ca1  8a460c           mov al, byte ptr [bp + 0xc]              
  3ca4  b400             mov ah, 0                                
  3ca6  50               push ax                                  
  3ca7  8a460a           mov al, byte ptr [bp + 0xa]              
  3caa  b400             mov ah, 0                                
  3cac  50               push ax                                  
  3cad  8a460c           mov al, byte ptr [bp + 0xc]              
  3cb0  b400             mov ah, 0                                
  3cb2  50               push ax                                  
  3cb3  90               nop                                      
  3cb4  0e               push cs                                  
  3cb5  e8aefa           call 0x3766                              
  3cb8  83c40c           add sp, 0xc                              
  3cbb  16               push ss                                  
  3cbc  8d8660ff         lea ax, [bp - 0xa0]                      
  3cc0  50               push ax                                  
  3cc1  8a460c           mov al, byte ptr [bp + 0xc]              
  3cc4  b400             mov ah, 0                                
  3cc6  50               push ax                                  
  3cc7  8a4608           mov al, byte ptr [bp + 8]                
  3cca  b400             mov ah, 0                                
  3ccc  50               push ax                                  
  3ccd  e8a9fe           call 0x3b79                              
  3cd0  16               push ss                                  
  3cd1  8d8660ff         lea ax, [bp - 0xa0]                      
  3cd5  50               push ax                                  
  3cd6  8a460a           mov al, byte ptr [bp + 0xa]              
  3cd9  b400             mov ah, 0                                
  3cdb  50               push ax                                  
  3cdc  8a4608           mov al, byte ptr [bp + 8]                
  3cdf  b400             mov ah, 0                                
  3ce1  50               push ax                                  
  3ce2  8a460a           mov al, byte ptr [bp + 0xa]              
  3ce5  e96bff           jmp 0x3c53                               
  3ce8  8a3e763e         mov bh, byte ptr [0x3e76]                
  3cec  8a660e           mov ah, byte ptr [bp + 0xe]              
  3cef  8a4604           mov al, byte ptr [bp + 4]                
  3cf2  8a6e0a           mov ch, byte ptr [bp + 0xa]              
  3cf5  8a4e0c           mov cl, byte ptr [bp + 0xc]              
  3cf8  8a7606           mov dh, byte ptr [bp + 6]                
  3cfb  8a5608           mov dl, byte ptr [bp + 8]                
  3cfe  e80cf3           call 0x300d                              
  3d01  8be5             mov sp, bp                               
  3d03  5d               pop bp                                   
  3d04  c20c00           ret 0xc                                  
  3d07  0000             add byte ptr [bx + si], al               
  3d09  8f06c63e         pop word ptr [0x3ec6]                    
  3d0d  8f06c83e         pop word ptr [0x3ec8]                    
  3d11  8f06ca3e         pop word ptr [0x3eca]                    
  3d15  2e8c1e073d       mov word ptr cs:[0x3d07], ds             
  3d1a  8936cc3e         mov word ptr [0x3ecc], si                
  3d1e  893ece3e         mov word ptr [0x3ece], di                
  3d22  fc               cld                                      
  3d23  8e067b00         mov es, word ptr [0x7b]                  
  3d27  be8000           mov si, 0x80                             
  3d2a  32e4             xor ah, ah                               
  3d2c  26ac             lodsb al, byte ptr es:[si]               
  3d2e  40               inc ax                                   
  3d2f  8cc5             mov bp, es                               
  3d31  87d6             xchg si, dx                              
  3d33  93               xchg bx, ax                              
  3d34  8b367500         mov si, word ptr [0x75]                  
  3d38  46               inc si                                   
  3d39  46               inc si                                   
  3d3a  b90100           mov cx, 1                                
  3d3d  803e7d0003       cmp byte ptr [0x7d], 3                   
  3d42  7211             jb 0x3d55                                
  3d44  8e067700         mov es, word ptr [0x77]                  
  3d48  8bfe             mov di, si                               
  3d4a  b17f             mov cl, 0x7f                             
  3d4c  32c0             xor al, al                               
  3d4e  f2ae             repne scasb al, byte ptr es:[di]         
  3d50  e372             jcxz 0x3dc4                              
  3d52  80f17f           xor cl, 0x7f                             
  3d55  50               push ax                                  
  3d56  8bc1             mov ax, cx                               
  3d58  03c3             add ax, bx                               
  3d5a  40               inc ax                                   
  3d5b  25feff           and ax, 0xfffe                           
  3d5e  8bfc             mov di, sp                               
  3d60  2bf8             sub di, ax                               
  3d62  7260             jb 0x3dc4                                
  3d64  8be7             mov sp, di                               
  3d66  06               push es                                  
  3d67  1f               pop ds                                   
  3d68  16               push ss                                  
  3d69  07               pop es                                   
  3d6a  51               push cx                                  
  3d6b  49               dec cx                                   
  3d6c  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  3d6e  32c0             xor al, al                               
  3d70  aa               stosb byte ptr es:[di], al               
  3d71  8edd             mov ds, bp                               
  3d73  87f2             xchg dx, si                              
  3d75  87d9             xchg cx, bx                              
  3d77  8bc3             mov ax, bx                               
  3d79  8bd0             mov dx, ax                               
  3d7b  43               inc bx                                   
  3d7c  e81d00           call 0x3d9c                              
  3d7f  770b             ja 0x3d8c                                
  3d81  7246             jb 0x3dc9                                
  3d83  3c0d             cmp al, 0xd                              
  3d85  7411             je 0x3d98                                
  3d87  e81200           call 0x3d9c                              
  3d8a  77f5             ja 0x3d81                                
  3d8c  3c20             cmp al, 0x20                             
  3d8e  7408             je 0x3d98                                
  3d90  3c0d             cmp al, 0xd                              
  3d92  7404             je 0x3d98                                
  3d94  3c09             cmp al, 9                                
  3d96  75e4             jne 0x3d7c                               
  3d98  32c0             xor al, al                               
  3d9a  ebe0             jmp 0x3d7c                               

res_0000_3d9c:  ; ENTRY
  3d9c  0bc0             or ax, ax                                
  3d9e  7407             je 0x3da7                                
  3da0  42               inc dx                                   
  3da1  aa               stosb byte ptr es:[di], al               
  3da2  0ac0             or al, al                                
  3da4  7501             jne 0x3da7                               
  3da6  43               inc bx                                   
  3da7  86e0             xchg al, ah                              
  3da9  32c0             xor al, al                               
  3dab  f9               stc                                      
  3dac  e315             jcxz 0x3dc3                              
  3dae  ac               lodsb al, byte ptr [si]                  
  3daf  49               dec cx                                   
  3db0  2c22             sub al, 0x22                             
  3db2  740f             je 0x3dc3                                
  3db4  0422             add al, 0x22                             
  3db6  3c5c             cmp al, 0x5c                             
  3db8  7507             jne 0x3dc1                               
  3dba  803c22           cmp byte ptr [si], 0x22                  
  3dbd  7502             jne 0x3dc1                               
  3dbf  ac               lodsb al, byte ptr [si]                  
  3dc0  49               dec cx                                   
  3dc1  0bf6             or si, si                                
  3dc3  c3               ret                                      
  3dc4  90               nop                                      
  3dc5  90               nop                                      
  3dc6  e9b1c4           jmp 0x27a                                
  3dc9  59               pop cx                                   
  3dca  03ca             add cx, dx                               
  3dcc  2e8e1e073d       mov ds, word ptr cs:[0x3d07]             
  3dd1  891ec03e         mov word ptr [0x3ec0], bx                
  3dd5  43               inc bx                                   
  3dd6  03db             add bx, bx                               
  3dd8  03db             add bx, bx                               
  3dda  8bf4             mov si, sp                               
  3ddc  8bec             mov bp, sp                               
  3dde  2beb             sub bp, bx                               
  3de0  72e2             jb 0x3dc4                                
  3de2  8be5             mov sp, bp                               
  3de4  892ec23e         mov word ptr [0x3ec2], bp                
  3de8  8c16c43e         mov word ptr [0x3ec4], ss                
  3dec  e311             jcxz 0x3dff                              
  3dee  897600           mov word ptr [bp], si                    
  3df1  8c5602           mov word ptr [bp + 2], ss                
  3df4  83c504           add bp, 4                                
  3df7  36ac             lodsb al, byte ptr ss:[si]               
  3df9  0ac0             or al, al                                
  3dfb  e0fa             loopne 0x3df7                            
  3dfd  74ed             je 0x3dec                                
  3dff  33c0             xor ax, ax                               
  3e01  894600           mov word ptr [bp], ax                    
  3e04  894602           mov word ptr [bp + 2], ax                
  3e07  2e8e1e073d       mov ds, word ptr cs:[0x3d07]             
  3e0c  8b36cc3e         mov si, word ptr [0x3ecc]                
  3e10  8b3ece3e         mov di, word ptr [0x3ece]                
  3e14  ff36ca3e         push word ptr [0x3eca]                   
  3e18  ff36c83e         push word ptr [0x3ec8]                   
  3e1c  a1c03e           mov ax, word ptr [0x3ec0]                
  3e1f  a36b00           mov word ptr [0x6b], ax                  
  3e22  a1c43e           mov ax, word ptr [0x3ec4]                
  3e25  a36f00           mov word ptr [0x6f], ax                  
  3e28  a1c23e           mov ax, word ptr [0x3ec2]                
  3e2b  a36d00           mov word ptr [0x6d], ax                  
  3e2e  ff26c63e         jmp word ptr [0x3ec6]                    

res_0000_3e32:  ; ENTRY
  3e32  55               push bp                                  
  3e33  8bec             mov bp, sp                               
  3e35  b44a             mov ah, 0x4a                             
  3e37  8b5e08           mov bx, word ptr [bp + 8]                
  3e3a  8e4606           mov es, word ptr [bp + 6]                
  3e3d  cd21             int 0x21                                 
  3e3f  7205             jb 0x3e46                                
  3e41  b8ffff           mov ax, 0xffff                           
  3e44  eb06             jmp 0x3e4c                               
  3e46  53               push bx                                  
  3e47  50               push ax                                  
  3e48  e84fe0           call 0x1e9a                              
  3e4b  58               pop ax                                   
  3e4c  5d               pop bp                                   
  3e4d  cb               retf                                     
  3e4e  56               push si                                  
  3e4f  57               push di                                  
  3e50  8e067700         mov es, word ptr [0x77]                  
  3e54  33ff             xor di, di                               
  3e56  06               push es                                  
  3e57  ff367900         push word ptr [0x79]                     
  3e5b  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  3e60  5b               pop bx                                   
  3e61  8bd8             mov bx, ax                               
  3e63  07               pop es                                   
  3e64  a3d03e           mov word ptr [0x3ed0], ax                
  3e67  8916d23e         mov word ptr [0x3ed2], dx                
  3e6b  1e               push ds                                  
  3e6c  8eda             mov ds, dx                               
  3e6e  0bc2             or ax, dx                                
  3e70  7505             jne 0x3e77                               
  3e72  90               nop                                      
  3e73  90               nop                                      
  3e74  e903c4           jmp 0x27a                                
  3e77  33c0             xor ax, ax                               
  3e79  b9ffff           mov cx, 0xffff                           
  3e7c  26803d00         cmp byte ptr es:[di], 0                  
  3e80  740f             je 0x3e91                                
  3e82  893f             mov word ptr [bx], di                    
  3e84  8c4702           mov word ptr [bx + 2], es                
  3e87  83c304           add bx, 4                                
  3e8a  f2ae             repne scasb al, byte ptr es:[di]         
  3e8c  263805           cmp byte ptr es:[di], al                 
  3e8f  75f1             jne 0x3e82                               
  3e91  8907             mov word ptr [bx], ax                    
  3e93  894702           mov word ptr [bx + 2], ax                
  3e96  1f               pop ds                                   
  3e97  5f               pop di                                   
  3e98  5e               pop si                                   
  3e99  a1d23e           mov ax, word ptr [0x3ed2]                
  3e9c  a37300           mov word ptr [0x73], ax                  
  3e9f  a1d03e           mov ax, word ptr [0x3ed0]                
  3ea2  a37100           mov word ptr [0x71], ax                  
  3ea5  c3               ret                                      

res_0000_3ea6:  ; ENTRY
  3ea6  b403             mov ah, 3                                
  3ea8  b700             mov bh, 0                                
  3eaa  e860f1           call 0x300d                              
  3ead  8bc2             mov ax, dx                               
  3eaf  c3               ret                                      
  3eb0  e8f3ff           call 0x3ea6                              
  3eb3  b400             mov ah, 0                                
  3eb5  8a16723e         mov dl, byte ptr [0x3e72]                
  3eb9  b600             mov dh, 0                                
  3ebb  2bc2             sub ax, dx                               
  3ebd  40               inc ax                                   
  3ebe  cb               retf                                     
  3ebf  e8e4ff           call 0x3ea6                              
  3ec2  b108             mov cl, 8                                
  3ec4  d3e8             shr ax, cl                               
  3ec6  b400             mov ah, 0                                
  3ec8  8a16733e         mov dl, byte ptr [0x3e73]                
  3ecc  b600             mov dh, 0                                
  3ece  2bc2             sub ax, dx                               
  3ed0  40               inc ax                                   
  3ed1  cb               retf                                     

res_0000_3ed2:  ; ENTRY
  3ed2  55               push bp                                  
  3ed3  8bec             mov bp, sp                               
  3ed5  56               push si                                  
  3ed6  57               push di                                  
  3ed7  06               push es                                  
  3ed8  55               push bp                                  
  3ed9  c47606           les si, ptr [bp + 6]                     
  3edc  fc               cld                                      
  3edd  2bc0             sub ax, ax                               
  3edf  99               cdq                                      
  3ee0  b90a00           mov cx, 0xa                              
  3ee3  b700             mov bh, 0                                
  3ee5  bf5f3a           mov di, 0x3a5f                           
  3ee8  268a1c           mov bl, byte ptr es:[si]                 
  3eeb  46               inc si                                   
  3eec  f60101           test byte ptr [bx + di], 1               
  3eef  75f7             jne 0x3ee8                               
  3ef1  bd0000           mov bp, 0                                
  3ef4  80fb2b           cmp bl, 0x2b                             
  3ef7  7406             je 0x3eff                                
  3ef9  80fb2d           cmp bl, 0x2d                             
  3efc  7505             jne 0x3f03                               
  3efe  45               inc bp                                   
  3eff  268a1c           mov bl, byte ptr es:[si]                 
  3f02  46               inc si                                   
  3f03  80fb39           cmp bl, 0x39                             
  3f06  772f             ja 0x3f37                                
  3f08  80eb30           sub bl, 0x30                             
  3f0b  722a             jb 0x3f37                                
  3f0d  f7e1             mul cx                                   
  3f0f  03c3             add ax, bx                               
  3f11  12d6             adc dl, dh                               
  3f13  74ea             je 0x3eff                                
  3f15  eb12             jmp 0x3f29                               
  3f17  8bfa             mov di, dx                               
  3f19  b90a00           mov cx, 0xa                              
  3f1c  f7e1             mul cx                                   
  3f1e  97               xchg di, ax                              
  3f1f  87d1             xchg cx, dx                              
  3f21  f7e2             mul dx                                   
  3f23  92               xchg dx, ax                              
  3f24  97               xchg di, ax                              
  3f25  03c3             add ax, bx                               
  3f27  13d1             adc dx, cx                               
  3f29  268a1c           mov bl, byte ptr es:[si]                 
  3f2c  46               inc si                                   
  3f2d  80fb39           cmp bl, 0x39                             
  3f30  7705             ja 0x3f37                                
  3f32  80eb30           sub bl, 0x30                             
  3f35  73e0             jae 0x3f17                               
  3f37  4d               dec bp                                   
  3f38  7c07             jl 0x3f41                                
  3f3a  f7da             neg dx                                   
  3f3c  f7d8             neg ax                                   
  3f3e  83da00           sbb dx, 0                                
  3f41  5d               pop bp                                   
  3f42  07               pop es                                   
  3f43  5f               pop di                                   
  3f44  5e               pop si                                   
  3f45  5d               pop bp                                   
  3f46  cb               retf                                     
  3f47  55               push bp                                  
  3f48  8bec             mov bp, sp                               
  3f4a  ff7608           push word ptr [bp + 8]                   
  3f4d  ff7606           push word ptr [bp + 6]                   
  3f50  0e               push cs                                  
  3f51  e87eff           call 0x3ed2                              
  3f54  59               pop cx                                   
  3f55  59               pop cx                                   
  3f56  5d               pop bp                                   
  3f57  cb               retf                                     

res_0000_3f58:  ; ENTRY
  3f58  55               push bp                                  
  3f59  8bec             mov bp, sp                               
  3f5b  56               push si                                  
  3f5c  8b4606           mov ax, word ptr [bp + 6]                
  3f5f  0b4608           or ax, word ptr [bp + 8]                 
  3f62  7508             jne 0x3f6c                               
  3f64  90               nop                                      
  3f65  0e               push cs                                  
  3f66  e8bc00           call 0x4025                              
  3f69  e9b400           jmp 0x4020                               
  3f6c  c45e06           les bx, ptr [bp + 6]                     
  3f6f  268b4712         mov ax, word ptr es:[bx + 0x12]          
  3f73  3b4606           cmp ax, word ptr [bp + 6]                
  3f76  7406             je 0x3f7e                                
  3f78  b8ffff           mov ax, 0xffff                           
  3f7b  e9a400           jmp 0x4022                               
  3f7e  c45e06           les bx, ptr [bp + 6]                     
  3f81  26833f00         cmp word ptr es:[bx], 0                  
  3f85  7c51             jl 0x3fd8                                
  3f87  26f747020800     test word ptr es:[bx + 2], 8             
  3f8d  7518             jne 0x3fa7                               
  3f8f  268b470e         mov ax, word ptr es:[bx + 0xe]           
  3f93  8b5606           mov dx, word ptr [bp + 6]                
  3f96  83c205           add dx, 5                                
  3f99  3b4608           cmp ax, word ptr [bp + 8]                
  3f9c  7403             je 0x3fa1                                
  3f9e  e97f00           jmp 0x4020                               
  3fa1  2639570c         cmp word ptr es:[bx + 0xc], dx           
  3fa5  7579             jne 0x4020                               
  3fa7  c45e06           les bx, ptr [bp + 6]                     
  3faa  26c7070000       mov word ptr es:[bx], 0                  
  3faf  268b470e         mov ax, word ptr es:[bx + 0xe]           
  3fb3  8b5606           mov dx, word ptr [bp + 6]                
  3fb6  83c205           add dx, 5                                
  3fb9  3b4608           cmp ax, word ptr [bp + 8]                
  3fbc  7562             jne 0x4020                               
  3fbe  2639570c         cmp word ptr es:[bx + 0xc], dx           
  3fc2  755c             jne 0x4020                               
  3fc4  268b470a         mov ax, word ptr es:[bx + 0xa]           
  3fc8  268b5708         mov dx, word ptr es:[bx + 8]             
  3fcc  2689470e         mov word ptr es:[bx + 0xe], ax           
  3fd0  2689570c         mov word ptr es:[bx + 0xc], dx           
  3fd4  eb4a             jmp 0x4020                               
  3fd6  eb48             jmp 0x4020                               
  3fd8  c45e06           les bx, ptr [bp + 6]                     
  3fdb  268b4706         mov ax, word ptr es:[bx + 6]             
  3fdf  260307           add ax, word ptr es:[bx]                 
  3fe2  40               inc ax                                   
  3fe3  8bf0             mov si, ax                               
  3fe5  262937           sub word ptr es:[bx], si                 
  3fe8  50               push ax                                  
  3fe9  268b470a         mov ax, word ptr es:[bx + 0xa]           
  3fed  268b5708         mov dx, word ptr es:[bx + 8]             
  3ff1  2689470e         mov word ptr es:[bx + 0xe], ax           
  3ff5  2689570c         mov word ptr es:[bx + 0xc], dx           
  3ff9  50               push ax                                  
  3ffa  52               push dx                                  
  3ffb  268a4704         mov al, byte ptr es:[bx + 4]             
  3fff  98               cwde                                     
  4000  50               push ax                                  
  4001  90               nop                                      
  4002  0e               push cs                                  
  4003  e8de10           call 0x50e4                              
  4006  83c408           add sp, 8                                
  4009  3bc6             cmp ax, si                               
  400b  7413             je 0x4020                                
  400d  c45e06           les bx, ptr [bp + 6]                     
  4010  26f747020002     test word ptr es:[bx + 2], 0x200         
  4016  7508             jne 0x4020                               
  4018  26834f0210       or word ptr es:[bx + 2], 0x10            
  401d  e958ff           jmp 0x3f78                               
  4020  33c0             xor ax, ax                               
  4022  5e               pop si                                   
  4023  5d               pop bp                                   
  4024  cb               retf                                     

res_0000_4025:  ; ENTRY
  4025  55               push bp                                  
  4026  8bec             mov bp, sp                               
  4028  83ec04           sub sp, 4                                
  402b  56               push si                                  
  402c  57               push di                                  
  402d  33ff             xor di, di                               
  402f  8b36fc3c         mov si, word ptr [0x3cfc]                
  4033  8c5efe           mov word ptr [bp - 2], ds                
  4036  c746fc6c3b       mov word ptr [bp - 4], 0x3b6c            
  403b  eb1b             jmp 0x4058                               
  403d  c45efc           les bx, ptr [bp - 4]                     
  4040  26f747020300     test word ptr es:[bx + 2], 3             
  4046  740c             je 0x4054                                
  4048  ff76fe           push word ptr [bp - 2]                   
  404b  53               push bx                                  
  404c  90               nop                                      
  404d  0e               push cs                                  
  404e  e807ff           call 0x3f58                              
  4051  59               pop cx                                   
  4052  59               pop cx                                   
  4053  47               inc di                                   
  4054  8346fc14         add word ptr [bp - 4], 0x14              
  4058  8bc6             mov ax, si                               
  405a  4e               dec si                                   
  405b  0bc0             or ax, ax                                
  405d  75de             jne 0x403d                               
  405f  8bc7             mov ax, di                               
  4061  5f               pop di                                   
  4062  5e               pop si                                   
  4063  8be5             mov sp, bp                               
  4065  5d               pop bp                                   
  4066  cb               retf                                     

res_0000_4067:  ; ENTRY
  4067  55               push bp                                  
  4068  8bec             mov bp, sp                               
  406a  b88c45           mov ax, 0x458c                           
  406d  50               push ax                                  
  406e  ff7608           push word ptr [bp + 8]                   
  4071  ff7606           push word ptr [bp + 6]                   
  4074  ff760c           push word ptr [bp + 0xc]                 
  4077  ff760a           push word ptr [bp + 0xa]                 
  407a  8d460e           lea ax, [bp + 0xe]                       
  407d  50               push ax                                  
  407e  e87ce8           call 0x28fd                              
  4081  5d               pop bp                                   
  4082  cb               retf                                     

res_0000_4083:  ; ENTRY
  4083  55               push bp                                  
  4084  8bec             mov bp, sp                               
  4086  83ec04           sub sp, 4                                
  4089  56               push si                                  
  408a  c45e04           les bx, ptr [bp + 4]                     
  408d  26833f00         cmp word ptr es:[bx], 0                  
  4091  7d0c             jge 0x409f                               
  4093  268b4f06         mov cx, word ptr es:[bx + 6]             
  4097  26030f           add cx, word ptr es:[bx]                 
  409a  41               inc cx                                   
  409b  8bf1             mov si, cx                               
  409d  eb0f             jmp 0x40ae                               
  409f  c45e04           les bx, ptr [bp + 4]                     
  40a2  268b07           mov ax, word ptr es:[bx]                 
  40a5  99               cdq                                      
  40a6  33c2             xor ax, dx                               
  40a8  2bc2             sub ax, dx                               
  40aa  8bc8             mov cx, ax                               
  40ac  8bf0             mov si, ax                               
  40ae  c45e04           les bx, ptr [bp + 4]                     
  40b1  26f747024000     test word ptr es:[bx + 2], 0x40          
  40b7  7543             jne 0x40fc                               
  40b9  c45e04           les bx, ptr [bp + 4]                     
  40bc  268b470e         mov ax, word ptr es:[bx + 0xe]           
  40c0  268b570c         mov dx, word ptr es:[bx + 0xc]           
  40c4  8946fe           mov word ptr [bp - 2], ax                
  40c7  8956fc           mov word ptr [bp - 4], dx                
  40ca  26833f00         cmp word ptr es:[bx], 0                  
  40ce  7d25             jge 0x40f5                               
  40d0  eb0d             jmp 0x40df                               
  40d2  ff4efc           dec word ptr [bp - 4]                    
  40d5  c45efc           les bx, ptr [bp - 4]                     
  40d8  26803f0a         cmp byte ptr es:[bx], 0xa                
  40dc  7501             jne 0x40df                               
  40de  46               inc si                                   
  40df  8bc1             mov ax, cx                               
  40e1  49               dec cx                                   
  40e2  0bc0             or ax, ax                                
  40e4  75ec             jne 0x40d2                               
  40e6  eb14             jmp 0x40fc                               
  40e8  c45efc           les bx, ptr [bp - 4]                     
  40eb  ff46fc           inc word ptr [bp - 4]                    
  40ee  26803f0a         cmp byte ptr es:[bx], 0xa                
  40f2  7501             jne 0x40f5                               
  40f4  46               inc si                                   
  40f5  8bc1             mov ax, cx                               
  40f7  49               dec cx                                   
  40f8  0bc0             or ax, ax                                
  40fa  75ec             jne 0x40e8                               
  40fc  8bc6             mov ax, si                               
  40fe  5e               pop si                                   
  40ff  8be5             mov sp, bp                               
  4101  5d               pop bp                                   
  4102  c20400           ret 4                                    

res_0000_4105:  ; ENTRY
  4105  55               push bp                                  
  4106  8bec             mov bp, sp                               
  4108  56               push si                                  
  4109  8b760e           mov si, word ptr [bp + 0xe]              
  410c  ff7608           push word ptr [bp + 8]                   
  410f  ff7606           push word ptr [bp + 6]                   
  4112  90               nop                                      
  4113  0e               push cs                                  
  4114  e841fe           call 0x3f58                              
  4117  59               pop cx                                   
  4118  59               pop cx                                   
  4119  0bc0             or ax, ax                                
  411b  7405             je 0x4122                                
  411d  b8ffff           mov ax, 0xffff                           
  4120  eb60             jmp 0x4182                               
  4122  83fe01           cmp si, 1                                
  4125  7517             jne 0x413e                               
  4127  c45e06           les bx, ptr [bp + 6]                     
  412a  26833f00         cmp word ptr es:[bx], 0                  
  412e  7e0e             jle 0x413e                               
  4130  ff7608           push word ptr [bp + 8]                   
  4133  53               push bx                                  
  4134  e84cff           call 0x4083                              
  4137  99               cdq                                      
  4138  29460a           sub word ptr [bp + 0xa], ax              
  413b  19560c           sbb word ptr [bp + 0xc], dx              
  413e  c45e06           les bx, ptr [bp + 6]                     
  4141  268167025ffe     and word ptr es:[bx + 2], 0xfe5f         
  4147  26c7070000       mov word ptr es:[bx], 0                  
  414c  268b470a         mov ax, word ptr es:[bx + 0xa]           
  4150  268b5708         mov dx, word ptr es:[bx + 8]             
  4154  2689470e         mov word ptr es:[bx + 0xe], ax           
  4158  2689570c         mov word ptr es:[bx + 0xc], dx           
  415c  56               push si                                  
  415d  ff760c           push word ptr [bp + 0xc]                 
  4160  ff760a           push word ptr [bp + 0xa]                 
  4163  268a4704         mov al, byte ptr es:[bx + 4]             
  4167  98               cwde                                     
  4168  50               push ax                                  
  4169  90               nop                                      
  416a  0e               push cs                                  
  416b  e82ade           call 0x1f98                              
  416e  83c408           add sp, 8                                
  4171  83faff           cmp dx, -1                               
  4174  750a             jne 0x4180                               
  4176  3dffff           cmp ax, 0xffff                           
  4179  7505             jne 0x4180                               
  417b  b8ffff           mov ax, 0xffff                           
  417e  eb02             jmp 0x4182                               
  4180  33c0             xor ax, ax                               
  4182  5e               pop si                                   
  4183  5d               pop bp                                   
  4184  cb               retf                                     
  4185  55               push bp                                  
  4186  8bec             mov bp, sp                               
  4188  83ec08           sub sp, 8                                
  418b  b80100           mov ax, 1                                
  418e  50               push ax                                  
  418f  33c0             xor ax, ax                               
  4191  33d2             xor dx, dx                               
  4193  50               push ax                                  
  4194  52               push dx                                  
  4195  c45e06           les bx, ptr [bp + 6]                     
  4198  268a4704         mov al, byte ptr es:[bx + 4]             
  419c  98               cwde                                     
  419d  50               push ax                                  
  419e  90               nop                                      
  419f  0e               push cs                                  
  41a0  e8f5dd           call 0x1f98                              
  41a3  83c408           add sp, 8                                
  41a6  8956fe           mov word ptr [bp - 2], dx                
  41a9  8946fc           mov word ptr [bp - 4], ax                
  41ac  83faff           cmp dx, -1                               
  41af  7508             jne 0x41b9                               
  41b1  3dffff           cmp ax, 0xffff                           
  41b4  7503             jne 0x41b9                               
  41b6  e9a200           jmp 0x425b                               
  41b9  c45e06           les bx, ptr [bp + 6]                     
  41bc  26833f00         cmp word ptr es:[bx], 0                  
  41c0  7c03             jl 0x41c5                                
  41c2  e98600           jmp 0x424b                               
  41c5  268a4704         mov al, byte ptr es:[bx + 4]             
  41c9  98               cwde                                     
  41ca  d1e0             shl ax, 1                                
  41cc  8bd8             mov bx, ax                               
  41ce  f787fe3c0008     test word ptr [bx + 0x3cfe], 0x800       
  41d4  7463             je 0x4239                                
  41d6  b80200           mov ax, 2                                
  41d9  50               push ax                                  
  41da  33c0             xor ax, ax                               
  41dc  33d2             xor dx, dx                               
  41de  50               push ax                                  
  41df  52               push dx                                  
  41e0  8b5e06           mov bx, word ptr [bp + 6]                
  41e3  268a4704         mov al, byte ptr es:[bx + 4]             
  41e7  98               cwde                                     
  41e8  50               push ax                                  
  41e9  90               nop                                      
  41ea  0e               push cs                                  
  41eb  e8aadd           call 0x1f98                              
  41ee  83c408           add sp, 8                                
  41f1  8956fa           mov word ptr [bp - 6], dx                
  41f4  8946f8           mov word ptr [bp - 8], ax                
  41f7  83faff           cmp dx, -1                               
  41fa  7505             jne 0x4201                               
  41fc  3dffff           cmp ax, 0xffff                           
  41ff  7460             je 0x4261                                
  4201  33c0             xor ax, ax                               
  4203  50               push ax                                  
  4204  ff76fe           push word ptr [bp - 2]                   
  4207  ff76fc           push word ptr [bp - 4]                   
  420a  c45e06           les bx, ptr [bp + 6]                     
  420d  268a4704         mov al, byte ptr es:[bx + 4]             
  4211  98               cwde                                     
  4212  50               push ax                                  
  4213  90               nop                                      
  4214  0e               push cs                                  
  4215  e880dd           call 0x1f98                              
  4218  83c408           add sp, 8                                
  421b  83faff           cmp dx, -1                               
  421e  750d             jne 0x422d                               
  4220  3dffff           cmp ax, 0xffff                           
  4223  7508             jne 0x422d                               
  4225  baffff           mov dx, 0xffff                           
  4228  b8ffff           mov ax, 0xffff                           
  422b  eb34             jmp 0x4261                               
  422d  8b46fa           mov ax, word ptr [bp - 6]                
  4230  8b56f8           mov dx, word ptr [bp - 8]                
  4233  8946fe           mov word ptr [bp - 2], ax                
  4236  8956fc           mov word ptr [bp - 4], dx                
  4239  ff7608           push word ptr [bp + 8]                   
  423c  ff7606           push word ptr [bp + 6]                   
  423f  e841fe           call 0x4083                              
  4242  99               cdq                                      
  4243  0146fc           add word ptr [bp - 4], ax                
  4246  1156fe           adc word ptr [bp - 2], dx                
  4249  eb10             jmp 0x425b                               
  424b  ff7608           push word ptr [bp + 8]                   
  424e  ff7606           push word ptr [bp + 6]                   
  4251  e82ffe           call 0x4083                              
  4254  99               cdq                                      
  4255  2946fc           sub word ptr [bp - 4], ax                
  4258  1956fe           sbb word ptr [bp - 2], dx                
  425b  8b56fe           mov dx, word ptr [bp - 2]                
  425e  8b46fc           mov ax, word ptr [bp - 4]                
  4261  8be5             mov sp, bp                               
  4263  5d               pop bp                                   
  4264  cb               retf                                     

res_0000_4265:  ; ENTRY
  4265  55               push bp                                  
  4266  8bec             mov bp, sp                               
  4268  83ec04           sub sp, 4                                
  426b  56               push si                                  
  426c  57               push di                                  
  426d  c47e06           les di, ptr [bp + 6]                     
  4270  8cc0             mov ax, es                               
  4272  0bc7             or ax, di                                
  4274  7420             je 0x4296                                
  4276  b000             mov al, 0                                
  4278  268a25           mov ah, byte ptr es:[di]                 
  427b  b9ffff           mov cx, 0xffff                           
  427e  fc               cld                                      
  427f  f2ae             repne scasb al, byte ptr es:[di]         
  4281  f7d1             not cx                                   
  4283  49               dec cx                                   
  4284  7410             je 0x4296                                
  4286  c43ed03e         les di, ptr [0x3ed0]                     
  428a  8c46fe           mov word ptr [bp - 2], es                
  428d  8cc3             mov bx, es                               
  428f  0bdf             or bx, di                                
  4291  897efc           mov word ptr [bp - 4], di                
  4294  750d             jne 0x42a3                               
  4296  33d2             xor dx, dx                               
  4298  33c0             xor ax, ax                               
  429a  eb33             jmp 0x42cf                               
  429c  8346fc04         add word ptr [bp - 4], 4                 
  42a0  c47efc           les di, ptr [bp - 4]                     
  42a3  26c43d           les di, ptr es:[di]                      
  42a6  8cc3             mov bx, es                               
  42a8  0bdf             or bx, di                                
  42aa  74ea             je 0x4296                                
  42ac  268a05           mov al, byte ptr es:[di]                 
  42af  0ac0             or al, al                                
  42b1  74e3             je 0x4296                                
  42b3  3ae0             cmp ah, al                               
  42b5  75e5             jne 0x429c                               
  42b7  8bd9             mov bx, cx                               
  42b9  2680393d         cmp byte ptr es:[bx + di], 0x3d          
  42bd  75dd             jne 0x429c                               
  42bf  1e               push ds                                  
  42c0  c57606           lds si, ptr [bp + 6]                     
  42c3  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  42c5  1f               pop ds                                   
  42c6  87cb             xchg bx, cx                              
  42c8  75d2             jne 0x429c                               
  42ca  47               inc di                                   
  42cb  8bc7             mov ax, di                               
  42cd  8cc2             mov dx, es                               
  42cf  5f               pop di                                   
  42d0  5e               pop si                                   
  42d1  8be5             mov sp, bp                               
  42d3  5d               pop bp                                   
  42d4  cb               retf                                     

res_0000_42d5:  ; ENTRY
  42d5  55               push bp                                  
  42d6  8bec             mov bp, sp                               
  42d8  8b5e06           mov bx, word ptr [bp + 6]                
  42db  8b4e0c           mov cx, word ptr [bp + 0xc]              
  42de  83f90a           cmp cx, 0xa                              
  42e1  7505             jne 0x42e8                               
  42e3  8bc3             mov ax, bx                               
  42e5  99               cdq                                      
  42e6  eb04             jmp 0x42ec                               
  42e8  8bc3             mov ax, bx                               
  42ea  33d2             xor dx, dx                               
  42ec  52               push dx                                  
  42ed  50               push ax                                  
  42ee  ff760a           push word ptr [bp + 0xa]                 
  42f1  ff7608           push word ptr [bp + 8]                   
  42f4  51               push cx                                  
  42f5  b001             mov al, 1                                
  42f7  50               push ax                                  
  42f8  b061             mov al, 0x61                             
  42fa  50               push ax                                  
  42fb  e8f8db           call 0x1ef6                              
  42fe  5d               pop bp                                   
  42ff  cb               retf                                     
  4300  55               push bp                                  
  4301  8bec             mov bp, sp                               
  4303  ff7608           push word ptr [bp + 8]                   
  4306  ff7606           push word ptr [bp + 6]                   
  4309  ff760c           push word ptr [bp + 0xc]                 
  430c  ff760a           push word ptr [bp + 0xa]                 
  430f  ff760e           push word ptr [bp + 0xe]                 
  4312  b000             mov al, 0                                
  4314  50               push ax                                  
  4315  b061             mov al, 0x61                             
  4317  50               push ax                                  
  4318  e8dbdb           call 0x1ef6                              
  431b  5d               pop bp                                   
  431c  cb               retf                                     
  431d  55               push bp                                  
  431e  8bec             mov bp, sp                               
  4320  8b460e           mov ax, word ptr [bp + 0xe]              
  4323  ff7608           push word ptr [bp + 8]                   
  4326  ff7606           push word ptr [bp + 6]                   
  4329  ff760c           push word ptr [bp + 0xc]                 
  432c  ff760a           push word ptr [bp + 0xa]                 
  432f  50               push ax                                  
  4330  3d0a00           cmp ax, 0xa                              
  4333  7505             jne 0x433a                               
  4335  b80100           mov ax, 1                                
  4338  eb02             jmp 0x433c                               
  433a  33c0             xor ax, ax                               
  433c  50               push ax                                  
  433d  b061             mov al, 0x61                             
  433f  50               push ax                                  
  4340  e8b3db           call 0x1ef6                              
  4343  5d               pop bp                                   
  4344  cb               retf                                     

res_0000_4345:  ; ENTRY
  4345  55               push bp                                  
  4346  8bec             mov bp, sp                               
  4348  56               push si                                  
  4349  57               push di                                  
  434a  8cda             mov dx, ds                               
  434c  c47e06           les di, ptr [bp + 6]                     
  434f  c5760a           lds si, ptr [bp + 0xa]                   
  4352  8b4e0e           mov cx, word ptr [bp + 0xe]              
  4355  d1e9             shr cx, 1                                
  4357  fc               cld                                      
  4358  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  435a  7301             jae 0x435d                               
  435c  a4               movsb byte ptr es:[di], byte ptr [si]    
  435d  8eda             mov ds, dx                               
  435f  8b5608           mov dx, word ptr [bp + 8]                
  4362  8b4606           mov ax, word ptr [bp + 6]                
  4365  5f               pop di                                   
  4366  5e               pop si                                   
  4367  5d               pop bp                                   
  4368  cb               retf                                     

res_0000_4369:  ; ENTRY
  4369  55               push bp                                  
  436a  8bec             mov bp, sp                               
  436c  57               push di                                  
  436d  c47e06           les di, ptr [bp + 6]                     
  4370  8b4e0a           mov cx, word ptr [bp + 0xa]              
  4373  8a460c           mov al, byte ptr [bp + 0xc]              
  4376  8ae0             mov ah, al                               
  4378  fc               cld                                      
  4379  f7c70100         test di, 1                               
  437d  7404             je 0x4383                                
  437f  e309             jcxz 0x438a                              
  4381  aa               stosb byte ptr es:[di], al               
  4382  49               dec cx                                   
  4383  d1e9             shr cx, 1                                
  4385  f3ab             rep stosw word ptr es:[di], ax           
  4387  7301             jae 0x438a                               
  4389  aa               stosb byte ptr es:[di], al               
  438a  5f               pop di                                   
  438b  5d               pop bp                                   
  438c  cb               retf                                     

res_0000_438d:  ; ENTRY
  438d  55               push bp                                  
  438e  8bec             mov bp, sp                               
  4390  8a460a           mov al, byte ptr [bp + 0xa]              
  4393  50               push ax                                  
  4394  ff760c           push word ptr [bp + 0xc]                 
  4397  ff7608           push word ptr [bp + 8]                   
  439a  ff7606           push word ptr [bp + 6]                   
  439d  0e               push cs                                  
  439e  e8c8ff           call 0x4369                              
  43a1  83c408           add sp, 8                                
  43a4  8b5608           mov dx, word ptr [bp + 8]                
  43a7  8b4606           mov ax, word ptr [bp + 6]                
  43aa  5d               pop bp                                   
  43ab  cb               retf                                     

res_0000_43ac:  ; ENTRY
  43ac  55               push bp                                  
  43ad  8bec             mov bp, sp                               
  43af  b88c45           mov ax, 0x458c                           
  43b2  50               push ax                                  
  43b3  1e               push ds                                  
  43b4  b8803b           mov ax, 0x3b80                           
  43b7  50               push ax                                  
  43b8  ff7608           push word ptr [bp + 8]                   
  43bb  ff7606           push word ptr [bp + 6]                   
  43be  8d460a           lea ax, [bp + 0xa]                       
  43c1  50               push ax                                  
  43c2  e838e5           call 0x28fd                              
  43c5  5d               pop bp                                   
  43c6  cb               retf                                     

res_0000_43c7:  ; ENTRY
  43c7  55               push bp                                  
  43c8  8bec             mov bp, sp                               
  43ca  c45e08           les bx, ptr [bp + 8]                     
  43cd  26ff0f           dec word ptr es:[bx]                     
  43d0  ff760a           push word ptr [bp + 0xa]                 
  43d3  53               push bx                                  
  43d4  8a4606           mov al, byte ptr [bp + 6]                
  43d7  98               cwde                                     
  43d8  50               push ax                                  
  43d9  90               nop                                      
  43da  0e               push cs                                  
  43db  e80500           call 0x43e3                              
  43de  83c406           add sp, 6                                
  43e1  5d               pop bp                                   
  43e2  cb               retf                                     

res_0000_43e3:  ; ENTRY
  43e3  55               push bp                                  
  43e4  8bec             mov bp, sp                               
  43e6  56               push si                                  
  43e7  8a4606           mov al, byte ptr [bp + 6]                
  43ea  a25c71           mov byte ptr [0x715c], al                
  43ed  c45e08           les bx, ptr [bp + 8]                     
  43f0  26833fff         cmp word ptr es:[bx], -1                 
  43f4  7d54             jge 0x444a                               
  43f6  26ff07           inc word ptr es:[bx]                     
  43f9  268b470e         mov ax, word ptr es:[bx + 0xe]           
  43fd  268b770c         mov si, word ptr es:[bx + 0xc]           
  4401  26ff470c         inc word ptr es:[bx + 0xc]               
  4405  8a165c71         mov dl, byte ptr [0x715c]                
  4409  8ec0             mov es, ax                               
  440b  268814           mov byte ptr es:[si], dl                 
  440e  8e460a           mov es, word ptr [bp + 0xa]              
  4411  26f747020800     test word ptr es:[bx + 2], 8             
  4417  7503             jne 0x441c                               
  4419  e95401           jmp 0x4570                               
  441c  803e5c710a       cmp byte ptr [0x715c], 0xa               
  4421  740a             je 0x442d                                
  4423  803e5c710d       cmp byte ptr [0x715c], 0xd               
  4428  7403             je 0x442d                                
  442a  e94301           jmp 0x4570                               
  442d  ff760a           push word ptr [bp + 0xa]                 
  4430  ff7608           push word ptr [bp + 8]                   
  4433  90               nop                                      
  4434  0e               push cs                                  
  4435  e820fb           call 0x3f58                              
  4438  59               pop cx                                   
  4439  59               pop cx                                   
  443a  0bc0             or ax, ax                                
  443c  7503             jne 0x4441                               
  443e  e92f01           jmp 0x4570                               
  4441  b8ffff           mov ax, 0xffff                           
  4444  e92e01           jmp 0x4575                               
  4447  e92601           jmp 0x4570                               
  444a  c45e08           les bx, ptr [bp + 8]                     
  444d  26f747029000     test word ptr es:[bx + 2], 0x90          
  4453  7508             jne 0x445d                               
  4455  26f747020200     test word ptr es:[bx + 2], 2             
  445b  750a             jne 0x4467                               
  445d  c45e08           les bx, ptr [bp + 8]                     
  4460  26834f0210       or word ptr es:[bx + 2], 0x10            
  4465  ebda             jmp 0x4441                               
  4467  c45e08           les bx, ptr [bp + 8]                     
  446a  26814f020001     or word ptr es:[bx + 2], 0x100           
  4470  26837f0600       cmp word ptr es:[bx + 6], 0              
  4475  746f             je 0x44e6                                
  4477  26833f00         cmp word ptr es:[bx], 0                  
  447b  740f             je 0x448c                                
  447d  ff760a           push word ptr [bp + 0xa]                 
  4480  53               push bx                                  
  4481  90               nop                                      
  4482  0e               push cs                                  
  4483  e8d2fa           call 0x3f58                              
  4486  59               pop cx                                   
  4487  59               pop cx                                   
  4488  0bc0             or ax, ax                                
  448a  75b5             jne 0x4441                               
  448c  c45e08           les bx, ptr [bp + 8]                     
  448f  268b4706         mov ax, word ptr es:[bx + 6]             
  4493  f7d8             neg ax                                   
  4495  268907           mov word ptr es:[bx], ax                 
  4498  268b470e         mov ax, word ptr es:[bx + 0xe]           
  449c  268b770c         mov si, word ptr es:[bx + 0xc]           
  44a0  26ff470c         inc word ptr es:[bx + 0xc]               
  44a4  8a165c71         mov dl, byte ptr [0x715c]                
  44a8  8ec0             mov es, ax                               
  44aa  268814           mov byte ptr es:[si], dl                 
  44ad  8e460a           mov es, word ptr [bp + 0xa]              
  44b0  26f747020800     test word ptr es:[bx + 2], 8             
  44b6  7503             jne 0x44bb                               
  44b8  e9b500           jmp 0x4570                               
  44bb  803e5c710a       cmp byte ptr [0x715c], 0xa               
  44c0  740a             je 0x44cc                                
  44c2  803e5c710d       cmp byte ptr [0x715c], 0xd               
  44c7  7403             je 0x44cc                                
  44c9  e9a400           jmp 0x4570                               
  44cc  ff760a           push word ptr [bp + 0xa]                 
  44cf  ff7608           push word ptr [bp + 8]                   
  44d2  90               nop                                      
  44d3  0e               push cs                                  
  44d4  e881fa           call 0x3f58                              
  44d7  59               pop cx                                   
  44d8  59               pop cx                                   
  44d9  0bc0             or ax, ax                                
  44db  7503             jne 0x44e0                               
  44dd  e99000           jmp 0x4570                               
  44e0  e95eff           jmp 0x4441                               
  44e3  e98a00           jmp 0x4570                               
  44e6  c45e08           les bx, ptr [bp + 8]                     
  44e9  268a4704         mov al, byte ptr es:[bx + 4]             
  44ed  98               cwde                                     
  44ee  d1e0             shl ax, 1                                
  44f0  8bd8             mov bx, ax                               
  44f2  f787fe3c0008     test word ptr [bx + 0x3cfe], 0x800       
  44f8  741b             je 0x4515                                
  44fa  b80200           mov ax, 2                                
  44fd  50               push ax                                  
  44fe  33c0             xor ax, ax                               
  4500  33d2             xor dx, dx                               
  4502  50               push ax                                  
  4503  52               push dx                                  
  4504  8b5e08           mov bx, word ptr [bp + 8]                
  4507  268a4704         mov al, byte ptr es:[bx + 4]             
  450b  98               cwde                                     
  450c  50               push ax                                  
  450d  90               nop                                      
  450e  0e               push cs                                  
  450f  e886da           call 0x1f98                              
  4512  83c408           add sp, 8                                
  4515  803e5c710a       cmp byte ptr [0x715c], 0xa               
  451a  7527             jne 0x4543                               
  451c  c45e08           les bx, ptr [bp + 8]                     
  451f  26f747024000     test word ptr es:[bx + 2], 0x40          
  4525  751c             jne 0x4543                               
  4527  b80100           mov ax, 1                                
  452a  50               push ax                                  
  452b  1e               push ds                                  
  452c  b8d43e           mov ax, 0x3ed4                           
  452f  50               push ax                                  
  4530  268a4704         mov al, byte ptr es:[bx + 4]             
  4534  98               cwde                                     
  4535  50               push ax                                  
  4536  90               nop                                      
  4537  0e               push cs                                  
  4538  e8fa0c           call 0x5235                              
  453b  83c408           add sp, 8                                
  453e  3d0100           cmp ax, 1                                
  4541  751f             jne 0x4562                               
  4543  b80100           mov ax, 1                                
  4546  50               push ax                                  
  4547  1e               push ds                                  
  4548  b85c71           mov ax, 0x715c                           
  454b  50               push ax                                  
  454c  c45e08           les bx, ptr [bp + 8]                     
  454f  268a4704         mov al, byte ptr es:[bx + 4]             
  4553  98               cwde                                     
  4554  50               push ax                                  
  4555  90               nop                                      
  4556  0e               push cs                                  
  4557  e8db0c           call 0x5235                              
  455a  83c408           add sp, 8                                
  455d  3d0100           cmp ax, 1                                
  4560  740e             je 0x4570                                
  4562  c45e08           les bx, ptr [bp + 8]                     
  4565  26f747020002     test word ptr es:[bx + 2], 0x200         
  456b  7503             jne 0x4570                               
  456d  e9edfe           jmp 0x445d                               
  4570  a05c71           mov al, byte ptr [0x715c]                
  4573  b400             mov ah, 0                                
  4575  5e               pop si                                   
  4576  5d               pop bp                                   
  4577  cb               retf                                     
  4578  55               push bp                                  
  4579  8bec             mov bp, sp                               
  457b  1e               push ds                                  
  457c  b8803b           mov ax, 0x3b80                           
  457f  50               push ax                                  
  4580  ff7606           push word ptr [bp + 6]                   
  4583  0e               push cs                                  
  4584  e85cfe           call 0x43e3                              
  4587  83c406           add sp, 6                                
  458a  5d               pop bp                                   
  458b  cb               retf                                     

res_0000_458c:  ; ENTRY
  458c  55               push bp                                  
  458d  8bec             mov bp, sp                               
  458f  83ec02           sub sp, 2                                
  4592  56               push si                                  
  4593  57               push di                                  
  4594  8b7e08           mov di, word ptr [bp + 8]                
  4597  897efe           mov word ptr [bp - 2], di                
  459a  c45e04           les bx, ptr [bp + 4]                     
  459d  26f747020800     test word ptr es:[bx + 2], 8             
  45a3  742e             je 0x45d3                                
  45a5  eb22             jmp 0x45c9                               
  45a7  ff7606           push word ptr [bp + 6]                   
  45aa  ff7604           push word ptr [bp + 4]                   
  45ad  c45e0a           les bx, ptr [bp + 0xa]                   
  45b0  ff460a           inc word ptr [bp + 0xa]                  
  45b3  268a07           mov al, byte ptr es:[bx]                 
  45b6  98               cwde                                     
  45b7  50               push ax                                  
  45b8  0e               push cs                                  
  45b9  e827fe           call 0x43e3                              
  45bc  83c406           add sp, 6                                
  45bf  3dffff           cmp ax, 0xffff                           
  45c2  7505             jne 0x45c9                               
  45c4  33c0             xor ax, ax                               
  45c6  e9be01           jmp 0x4787                               
  45c9  8bc7             mov ax, di                               
  45cb  4f               dec di                                   
  45cc  0bc0             or ax, ax                                
  45ce  75d7             jne 0x45a7                               
  45d0  e9b101           jmp 0x4784                               
  45d3  c45e04           les bx, ptr [bp + 4]                     
  45d6  26f747024000     test word ptr es:[bx + 2], 0x40          
  45dc  7503             jne 0x45e1                               
  45de  e92801           jmp 0x4709                               
  45e1  26837f0600       cmp word ptr es:[bx + 6], 0              
  45e6  7503             jne 0x45eb                               
  45e8  e9cb00           jmp 0x46b6                               
  45eb  26397f06         cmp word ptr es:[bx + 6], di             
  45ef  7369             jae 0x465a                               
  45f1  26833f00         cmp word ptr es:[bx], 0                  
  45f5  740f             je 0x4606                                
  45f7  ff7606           push word ptr [bp + 6]                   
  45fa  53               push bx                                  
  45fb  90               nop                                      
  45fc  0e               push cs                                  
  45fd  e858f9           call 0x3f58                              
  4600  59               pop cx                                   
  4601  59               pop cx                                   
  4602  0bc0             or ax, ax                                
  4604  75be             jne 0x45c4                               
  4606  c45e04           les bx, ptr [bp + 4]                     
  4609  268a4704         mov al, byte ptr es:[bx + 4]             
  460d  98               cwde                                     
  460e  d1e0             shl ax, 1                                
  4610  8bd8             mov bx, ax                               
  4612  f787fe3c0008     test word ptr [bx + 0x3cfe], 0x800       
  4618  741b             je 0x4635                                
  461a  b80200           mov ax, 2                                
  461d  50               push ax                                  
  461e  33c0             xor ax, ax                               
  4620  33d2             xor dx, dx                               
  4622  50               push ax                                  
  4623  52               push dx                                  
  4624  8b5e04           mov bx, word ptr [bp + 4]                
  4627  268a4704         mov al, byte ptr es:[bx + 4]             
  462b  98               cwde                                     
  462c  50               push ax                                  
  462d  90               nop                                      
  462e  0e               push cs                                  
  462f  e866d9           call 0x1f98                              
  4632  83c408           add sp, 8                                
  4635  57               push di                                  
  4636  ff760c           push word ptr [bp + 0xc]                 
  4639  ff760a           push word ptr [bp + 0xa]                 
  463c  c45e04           les bx, ptr [bp + 4]                     
  463f  268a4704         mov al, byte ptr es:[bx + 4]             
  4643  98               cwde                                     
  4644  50               push ax                                  
  4645  90               nop                                      
  4646  0e               push cs                                  
  4647  e8eb0b           call 0x5235                              
  464a  83c408           add sp, 8                                
  464d  3bc7             cmp ax, di                               
  464f  7503             jne 0x4654                               
  4651  e93001           jmp 0x4784                               
  4654  e96dff           jmp 0x45c4                               
  4657  e92a01           jmp 0x4784                               
  465a  c45e04           les bx, ptr [bp + 4]                     
  465d  268b07           mov ax, word ptr es:[bx]                 
  4660  03c7             add ax, di                               
  4662  7c26             jl 0x468a                                
  4664  26833f00         cmp word ptr es:[bx], 0                  
  4668  750c             jne 0x4676                               
  466a  b8ffff           mov ax, 0xffff                           
  466d  262b4706         sub ax, word ptr es:[bx + 6]             
  4671  268907           mov word ptr es:[bx], ax                 
  4674  eb14             jmp 0x468a                               
  4676  ff7606           push word ptr [bp + 6]                   
  4679  ff7604           push word ptr [bp + 4]                   
  467c  90               nop                                      
  467d  0e               push cs                                  
  467e  e8d7f8           call 0x3f58                              
  4681  59               pop cx                                   
  4682  59               pop cx                                   
  4683  0bc0             or ax, ax                                
  4685  7403             je 0x468a                                
  4687  e93aff           jmp 0x45c4                               
  468a  57               push di                                  
  468b  ff760c           push word ptr [bp + 0xc]                 
  468e  ff760a           push word ptr [bp + 0xa]                 
  4691  c45e04           les bx, ptr [bp + 4]                     
  4694  26ff770e         push word ptr es:[bx + 0xe]              
  4698  26ff770c         push word ptr es:[bx + 0xc]              
  469c  90               nop                                      
  469d  0e               push cs                                  
  469e  e8a4fc           call 0x4345                              
  46a1  83c40a           add sp, 0xa                              
  46a4  c45e04           les bx, ptr [bp + 4]                     
  46a7  268b07           mov ax, word ptr es:[bx]                 
  46aa  03c7             add ax, di                               
  46ac  268907           mov word ptr es:[bx], ax                 
  46af  26017f0c         add word ptr es:[bx + 0xc], di           
  46b3  e9ce00           jmp 0x4784                               
  46b6  c45e04           les bx, ptr [bp + 4]                     
  46b9  268a4704         mov al, byte ptr es:[bx + 4]             
  46bd  98               cwde                                     
  46be  d1e0             shl ax, 1                                
  46c0  8bd8             mov bx, ax                               
  46c2  f787fe3c0008     test word ptr [bx + 0x3cfe], 0x800       
  46c8  741b             je 0x46e5                                
  46ca  b80200           mov ax, 2                                
  46cd  50               push ax                                  
  46ce  33c0             xor ax, ax                               
  46d0  33d2             xor dx, dx                               
  46d2  50               push ax                                  
  46d3  52               push dx                                  
  46d4  8b5e04           mov bx, word ptr [bp + 4]                
  46d7  268a4704         mov al, byte ptr es:[bx + 4]             
  46db  98               cwde                                     
  46dc  50               push ax                                  
  46dd  90               nop                                      
  46de  0e               push cs                                  
  46df  e8b6d8           call 0x1f98                              
  46e2  83c408           add sp, 8                                
  46e5  57               push di                                  
  46e6  ff760c           push word ptr [bp + 0xc]                 
  46e9  ff760a           push word ptr [bp + 0xa]                 
  46ec  c45e04           les bx, ptr [bp + 4]                     
  46ef  268a4704         mov al, byte ptr es:[bx + 4]             
  46f3  98               cwde                                     
  46f4  50               push ax                                  
  46f5  90               nop                                      
  46f6  0e               push cs                                  
  46f7  e83b0b           call 0x5235                              
  46fa  83c408           add sp, 8                                
  46fd  3bc7             cmp ax, di                               
  46ff  7503             jne 0x4704                               
  4701  e98000           jmp 0x4784                               
  4704  e9bdfe           jmp 0x45c4                               
  4707  eb7b             jmp 0x4784                               
  4709  c45e04           les bx, ptr [bp + 4]                     
  470c  26837f0600       cmp word ptr es:[bx + 6], 0              
  4711  7452             je 0x4765                                
  4713  eb47             jmp 0x475c                               
  4715  c45e04           les bx, ptr [bp + 4]                     
  4718  26ff07           inc word ptr es:[bx]                     
  471b  7d20             jge 0x473d                               
  471d  268b470e         mov ax, word ptr es:[bx + 0xe]           
  4721  268b770c         mov si, word ptr es:[bx + 0xc]           
  4725  26ff470c         inc word ptr es:[bx + 0xc]               
  4729  c45e0a           les bx, ptr [bp + 0xa]                   
  472c  ff460a           inc word ptr [bp + 0xa]                  
  472f  268a17           mov dl, byte ptr es:[bx]                 
  4732  8ec0             mov es, ax                               
  4734  268814           mov byte ptr es:[si], dl                 
  4737  8ac2             mov al, dl                               
  4739  b400             mov ah, 0                                
  473b  eb17             jmp 0x4754                               
  473d  ff7606           push word ptr [bp + 6]                   
  4740  ff7604           push word ptr [bp + 4]                   
  4743  c45e0a           les bx, ptr [bp + 0xa]                   
  4746  ff460a           inc word ptr [bp + 0xa]                  
  4749  268a07           mov al, byte ptr es:[bx]                 
  474c  50               push ax                                  
  474d  0e               push cs                                  
  474e  e876fc           call 0x43c7                              
  4751  83c406           add sp, 6                                
  4754  3dffff           cmp ax, 0xffff                           
  4757  7503             jne 0x475c                               
  4759  e968fe           jmp 0x45c4                               
  475c  8bc7             mov ax, di                               
  475e  4f               dec di                                   
  475f  0bc0             or ax, ax                                
  4761  75b2             jne 0x4715                               
  4763  eb1f             jmp 0x4784                               
  4765  57               push di                                  
  4766  ff760c           push word ptr [bp + 0xc]                 
  4769  ff760a           push word ptr [bp + 0xa]                 
  476c  c45e04           les bx, ptr [bp + 4]                     
  476f  268a4704         mov al, byte ptr es:[bx + 4]             
  4773  98               cwde                                     
  4774  50               push ax                                  
  4775  90               nop                                      
  4776  0e               push cs                                  
  4777  e86a09           call 0x50e4                              
  477a  83c408           add sp, 8                                
  477d  3bc7             cmp ax, di                               
  477f  7403             je 0x4784                                
  4781  e940fe           jmp 0x45c4                               
  4784  8b46fe           mov ax, word ptr [bp - 2]                
  4787  5f               pop di                                   
  4788  5e               pop si                                   
  4789  8be5             mov sp, bp                               
  478b  5d               pop bp                                   
  478c  c20a00           ret 0xa                                  

res_0000_478f:  ; ENTRY
  478f  55               push bp                                  
  4790  8bec             mov bp, sp                               
  4792  56               push si                                  
  4793  8b4606           mov ax, word ptr [bp + 6]                
  4796  0b4608           or ax, word ptr [bp + 8]                 
  4799  7504             jne 0x479f                               
  479b  33c0             xor ax, ax                               
  479d  eb45             jmp 0x47e4                               
  479f  ff7608           push word ptr [bp + 8]                   
  47a2  ff7606           push word ptr [bp + 6]                   
  47a5  90               nop                                      
  47a6  0e               push cs                                  
  47a7  e8ef02           call 0x4a99                              
  47aa  59               pop cx                                   
  47ab  59               pop cx                                   
  47ac  8bf0             mov si, ax                               
  47ae  ff7608           push word ptr [bp + 8]                   
  47b1  ff7606           push word ptr [bp + 6]                   
  47b4  50               push ax                                  
  47b5  1e               push ds                                  
  47b6  b8803b           mov ax, 0x3b80                           
  47b9  50               push ax                                  
  47ba  e8cffd           call 0x458c                              
  47bd  3bc6             cmp ax, si                               
  47bf  7405             je 0x47c6                                
  47c1  b8ffff           mov ax, 0xffff                           
  47c4  eb1e             jmp 0x47e4                               
  47c6  1e               push ds                                  
  47c7  b8803b           mov ax, 0x3b80                           
  47ca  50               push ax                                  
  47cb  b80a00           mov ax, 0xa                              
  47ce  50               push ax                                  
  47cf  90               nop                                      
  47d0  0e               push cs                                  
  47d1  e80ffc           call 0x43e3                              
  47d4  83c406           add sp, 6                                
  47d7  3d0a00           cmp ax, 0xa                              
  47da  7405             je 0x47e1                                
  47dc  b8ffff           mov ax, 0xffff                           
  47df  eb03             jmp 0x47e4                               
  47e1  b80a00           mov ax, 0xa                              
  47e4  5e               pop si                                   
  47e5  5d               pop bp                                   
  47e6  cb               retf                                     

res_0000_47e7:  ; ENTRY
  47e7  55               push bp                                  
  47e8  8bec             mov bp, sp                               
  47ea  56               push si                                  
  47eb  57               push di                                  
  47ec  8b7e0e           mov di, word ptr [bp + 0xe]              
  47ef  8b7610           mov si, word ptr [bp + 0x10]             
  47f2  c45e06           les bx, ptr [bp + 6]                     
  47f5  268b4712         mov ax, word ptr es:[bx + 0x12]          
  47f9  3b4606           cmp ax, word ptr [bp + 6]                
  47fc  750b             jne 0x4809                               
  47fe  83ff02           cmp di, 2                                
  4801  7f06             jg 0x4809                                
  4803  81feff7f         cmp si, 0x7fff                           
  4807  7606             jbe 0x480f                               
  4809  b8ffff           mov ax, 0xffff                           
  480c  e9f100           jmp 0x4900                               
  480f  833ed83e00       cmp word ptr [0x3ed8], 0                 
  4814  750f             jne 0x4825                               
  4816  817e06803b       cmp word ptr [bp + 6], 0x3b80            
  481b  7508             jne 0x4825                               
  481d  c706d83e0100     mov word ptr [0x3ed8], 1                 
  4823  eb14             jmp 0x4839                               
  4825  833ed63e00       cmp word ptr [0x3ed6], 0                 
  482a  750d             jne 0x4839                               
  482c  817e066c3b       cmp word ptr [bp + 6], 0x3b6c            
  4831  7506             jne 0x4839                               
  4833  c706d63e0100     mov word ptr [0x3ed6], 1                 
  4839  c45e06           les bx, ptr [bp + 6]                     
  483c  26833f00         cmp word ptr es:[bx], 0                  
  4840  7416             je 0x4858                                
  4842  b80100           mov ax, 1                                
  4845  50               push ax                                  
  4846  33c0             xor ax, ax                               
  4848  33d2             xor dx, dx                               
  484a  50               push ax                                  
  484b  52               push dx                                  
  484c  ff7608           push word ptr [bp + 8]                   
  484f  53               push bx                                  
  4850  90               nop                                      
  4851  0e               push cs                                  
  4852  e8b0f8           call 0x4105                              
  4855  83c40a           add sp, 0xa                              
  4858  c45e06           les bx, ptr [bp + 6]                     
  485b  26f747020400     test word ptr es:[bx + 2], 4             
  4861  740f             je 0x4872                                
  4863  26ff770a         push word ptr es:[bx + 0xa]              
  4867  26ff7708         push word ptr es:[bx + 8]                
  486b  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  4870  59               pop cx                                   
  4871  59               pop cx                                   
  4872  c45e06           les bx, ptr [bp + 6]                     
  4875  26836702f3       and word ptr es:[bx + 2], 0xfff3         
  487a  26c747060000     mov word ptr es:[bx + 6], 0              
  4880  8b4608           mov ax, word ptr [bp + 8]                
  4883  8b5606           mov dx, word ptr [bp + 6]                
  4886  83c205           add dx, 5                                
  4889  2689470a         mov word ptr es:[bx + 0xa], ax           
  488d  26895708         mov word ptr es:[bx + 8], dx             
  4891  2689470e         mov word ptr es:[bx + 0xe], ax           
  4895  2689570c         mov word ptr es:[bx + 0xc], dx           
  4899  83ff02           cmp di, 2                                
  489c  7460             je 0x48fe                                
  489e  0bf6             or si, si                                
  48a0  765c             jbe 0x48fe                               
  48a2  c706623b0000     mov word ptr [0x3b62], 0                 
  48a8  c706603b7152     mov word ptr [0x3b60], 0x5271            
  48ae  8b460a           mov ax, word ptr [bp + 0xa]              
  48b1  0b460c           or ax, word ptr [bp + 0xc]               
  48b4  7521             jne 0x48d7                               
  48b6  56               push si                                  
  48b7  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  48bc  59               pop cx                                   
  48bd  89560c           mov word ptr [bp + 0xc], dx              
  48c0  89460a           mov word ptr [bp + 0xa], ax              
  48c3  0bc2             or ax, dx                                
  48c5  7503             jne 0x48ca                               
  48c7  e93fff           jmp 0x4809                               
  48ca  c45e06           les bx, ptr [bp + 6]                     
  48cd  26834f0204       or word ptr es:[bx + 2], 4               
  48d2  eb03             jmp 0x48d7                               
  48d4  e932ff           jmp 0x4809                               
  48d7  c45e06           les bx, ptr [bp + 6]                     
  48da  8b460c           mov ax, word ptr [bp + 0xc]              
  48dd  8b560a           mov dx, word ptr [bp + 0xa]              
  48e0  2689470e         mov word ptr es:[bx + 0xe], ax           
  48e4  2689570c         mov word ptr es:[bx + 0xc], dx           
  48e8  2689470a         mov word ptr es:[bx + 0xa], ax           
  48ec  26895708         mov word ptr es:[bx + 8], dx             
  48f0  26897706         mov word ptr es:[bx + 6], si             
  48f4  83ff01           cmp di, 1                                
  48f7  7505             jne 0x48fe                               
  48f9  26834f0208       or word ptr es:[bx + 2], 8               
  48fe  33c0             xor ax, ax                               
  4900  5f               pop di                                   
  4901  5e               pop si                                   
  4902  5d               pop bp                                   
  4903  cb               retf                                     
  4904  55               push bp                                  
  4905  8bec             mov bp, sp                               
  4907  56               push si                                  
  4908  8b7608           mov si, word ptr [bp + 8]                
  490b  56               push si                                  
  490c  ff760c           push word ptr [bp + 0xc]                 
  490f  ff760a           push word ptr [bp + 0xa]                 
  4912  c45e04           les bx, ptr [bp + 4]                     
  4915  26ff7702         push word ptr es:[bx + 2]                
  4919  26ff37           push word ptr es:[bx]                    
  491c  90               nop                                      
  491d  0e               push cs                                  
  491e  e824fa           call 0x4345                              
  4921  83c40a           add sp, 0xa                              
  4924  c45e04           les bx, ptr [bp + 4]                     
  4927  260137           add word ptr es:[bx], si                 
  492a  53               push bx                                  
  492b  06               push es                                  
  492c  268e4702         mov es, word ptr es:[bx + 2]             
  4930  8cc0             mov ax, es                               
  4932  07               pop es                                   
  4933  5b               pop bx                                   
  4934  268b1f           mov bx, word ptr es:[bx]                 
  4937  8ec0             mov es, ax                               
  4939  26c60700         mov byte ptr es:[bx], 0                  
  493d  8bc6             mov ax, si                               
  493f  5e               pop si                                   
  4940  5d               pop bp                                   
  4941  c20a00           ret 0xa                                  

res_0000_4944:  ; ENTRY
  4944  55               push bp                                  
  4945  8bec             mov bp, sp                               
  4947  c45e06           les bx, ptr [bp + 6]                     
  494a  26c60700         mov byte ptr es:[bx], 0                  
  494e  b80449           mov ax, 0x4904                           
  4951  50               push ax                                  
  4952  16               push ss                                  
  4953  8d4606           lea ax, [bp + 6]                         
  4956  50               push ax                                  
  4957  ff760c           push word ptr [bp + 0xc]                 
  495a  ff760a           push word ptr [bp + 0xa]                 
  495d  8d460e           lea ax, [bp + 0xe]                       
  4960  50               push ax                                  
  4961  e899df           call 0x28fd                              
  4964  5d               pop bp                                   
  4965  cb               retf                                     

res_0000_4966:  ; ENTRY
  4966  55               push bp                                  
  4967  8bec             mov bp, sp                               
  4969  c45e06           les bx, ptr [bp + 6]                     
  496c  26c60700         mov byte ptr es:[bx], 0                  
  4970  b80449           mov ax, 0x4904                           
  4973  50               push ax                                  
  4974  16               push ss                                  
  4975  8d4606           lea ax, [bp + 6]                         
  4978  50               push ax                                  
  4979  ff760c           push word ptr [bp + 0xc]                 
  497c  ff760a           push word ptr [bp + 0xa]                 
  497f  ff760e           push word ptr [bp + 0xe]                 
  4982  e878df           call 0x28fd                              
  4985  5d               pop bp                                   
  4986  cb               retf                                     
  4987  55               push bp                                  
  4988  8bec             mov bp, sp                               
  498a  56               push si                                  
  498b  c45e04           les bx, ptr [bp + 4]                     
  498e  268b4702         mov ax, word ptr es:[bx + 2]             
  4992  268b37           mov si, word ptr es:[bx]                 
  4995  26ff07           inc word ptr es:[bx]                     
  4998  8ec0             mov es, ax                               
  499a  268a14           mov dl, byte ptr es:[si]                 
  499d  8ac2             mov al, dl                               
  499f  0ac0             or al, al                                
  49a1  7505             jne 0x49a8                               
  49a3  b8ffff           mov ax, 0xffff                           
  49a6  eb04             jmp 0x49ac                               
  49a8  8ac2             mov al, dl                               
  49aa  b400             mov ah, 0                                
  49ac  5e               pop si                                   
  49ad  5d               pop bp                                   
  49ae  c3               ret                                      
  49af  55               push bp                                  
  49b0  8bec             mov bp, sp                               
  49b2  c45e06           les bx, ptr [bp + 6]                     
  49b5  26ff0f           dec word ptr es:[bx]                     
  49b8  5d               pop bp                                   
  49b9  c3               ret                                      

res_0000_49ba:  ; ENTRY
  49ba  55               push bp                                  
  49bb  8bec             mov bp, sp                               
  49bd  16               push ss                                  
  49be  8d460e           lea ax, [bp + 0xe]                       
  49c1  50               push ax                                  
  49c2  ff760c           push word ptr [bp + 0xc]                 
  49c5  ff760a           push word ptr [bp + 0xa]                 
  49c8  16               push ss                                  
  49c9  8d4606           lea ax, [bp + 6]                         
  49cc  50               push ax                                  
  49cd  b8af49           mov ax, 0x49af                           
  49d0  50               push ax                                  
  49d1  b88749           mov ax, 0x4987                           
  49d4  50               push ax                                  
  49d5  e858d6           call 0x2030                              
  49d8  83c410           add sp, 0x10                             
  49db  5d               pop bp                                   
  49dc  cb               retf                                     
  49dd  55               push bp                                  
  49de  8bec             mov bp, sp                               
  49e0  ff7610           push word ptr [bp + 0x10]                
  49e3  ff760e           push word ptr [bp + 0xe]                 
  49e6  ff760c           push word ptr [bp + 0xc]                 
  49e9  ff760a           push word ptr [bp + 0xa]                 
  49ec  16               push ss                                  
  49ed  8d4606           lea ax, [bp + 6]                         
  49f0  50               push ax                                  
  49f1  b8af49           mov ax, 0x49af                           
  49f4  50               push ax                                  
  49f5  b88749           mov ax, 0x4987                           
  49f8  50               push ax                                  
  49f9  e834d6           call 0x2030                              
  49fc  83c410           add sp, 0x10                             
  49ff  5d               pop bp                                   
  4a00  cb               retf                                     

res_0000_4a01:  ; ENTRY
  4a01  55               push bp                                  
  4a02  8bec             mov bp, sp                               
  4a04  56               push si                                  
  4a05  57               push di                                  
  4a06  fc               cld                                      
  4a07  1e               push ds                                  
  4a08  c47e06           les di, ptr [bp + 6]                     
  4a0b  8bd7             mov dx, di                               
  4a0d  32c0             xor al, al                               
  4a0f  b9ffff           mov cx, 0xffff                           
  4a12  f2ae             repne scasb al, byte ptr es:[di]         
  4a14  06               push es                                  
  4a15  8d75ff           lea si, [di - 1]                         
  4a18  c47e0a           les di, ptr [bp + 0xa]                   
  4a1b  b9ffff           mov cx, 0xffff                           
  4a1e  f2ae             repne scasb al, byte ptr es:[di]         
  4a20  f7d1             not cx                                   
  4a22  2bf9             sub di, cx                               
  4a24  06               push es                                  
  4a25  1f               pop ds                                   
  4a26  07               pop es                                   
  4a27  87f7             xchg di, si                              
  4a29  f7c60100         test si, 1                               
  4a2d  7402             je 0x4a31                                
  4a2f  a4               movsb byte ptr es:[di], byte ptr [si]    
  4a30  49               dec cx                                   
  4a31  d1e9             shr cx, 1                                
  4a33  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  4a35  7301             jae 0x4a38                               
  4a37  a4               movsb byte ptr es:[di], byte ptr [si]    
  4a38  92               xchg dx, ax                              
  4a39  8cc2             mov dx, es                               
  4a3b  1f               pop ds                                   
  4a3c  5f               pop di                                   
  4a3d  5e               pop si                                   
  4a3e  5d               pop bp                                   
  4a3f  cb               retf                                     

res_0000_4a40:  ; ENTRY
  4a40  55               push bp                                  
  4a41  8bec             mov bp, sp                               
  4a43  56               push si                                  
  4a44  57               push di                                  
  4a45  8cda             mov dx, ds                               
  4a47  fc               cld                                      
  4a48  33c0             xor ax, ax                               
  4a4a  8bd8             mov bx, ax                               
  4a4c  c47e0a           les di, ptr [bp + 0xa]                   
  4a4f  8bf7             mov si, di                               
  4a51  32c0             xor al, al                               
  4a53  b9ffff           mov cx, 0xffff                           
  4a56  f2ae             repne scasb al, byte ptr es:[di]         
  4a58  f7d1             not cx                                   
  4a5a  8bfe             mov di, si                               
  4a5c  c57606           lds si, ptr [bp + 6]                     
  4a5f  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  4a61  8a44ff           mov al, byte ptr [si - 1]                
  4a64  268a5dff         mov bl, byte ptr es:[di - 1]             
  4a68  2bc3             sub ax, bx                               
  4a6a  8eda             mov ds, dx                               
  4a6c  5f               pop di                                   
  4a6d  5e               pop si                                   
  4a6e  5d               pop bp                                   
  4a6f  cb               retf                                     

res_0000_4a70:  ; ENTRY
  4a70  55               push bp                                  
  4a71  8bec             mov bp, sp                               
  4a73  56               push si                                  
  4a74  57               push di                                  
  4a75  fc               cld                                      
  4a76  c47e0a           les di, ptr [bp + 0xa]                   
  4a79  8bf7             mov si, di                               
  4a7b  32c0             xor al, al                               
  4a7d  b9ffff           mov cx, 0xffff                           
  4a80  f2ae             repne scasb al, byte ptr es:[di]         
  4a82  f7d1             not cx                                   
  4a84  1e               push ds                                  
  4a85  8cc0             mov ax, es                               
  4a87  8ed8             mov ds, ax                               
  4a89  c47e06           les di, ptr [bp + 6]                     
  4a8c  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  4a8e  1f               pop ds                                   
  4a8f  8b5608           mov dx, word ptr [bp + 8]                
  4a92  8b4606           mov ax, word ptr [bp + 6]                
  4a95  5f               pop di                                   
  4a96  5e               pop si                                   
  4a97  5d               pop bp                                   
  4a98  cb               retf                                     

res_0000_4a99:  ; ENTRY
  4a99  55               push bp                                  
  4a9a  8bec             mov bp, sp                               
  4a9c  57               push di                                  
  4a9d  c47e06           les di, ptr [bp + 6]                     
  4aa0  33c0             xor ax, ax                               
  4aa2  3b4608           cmp ax, word ptr [bp + 8]                
  4aa5  7504             jne 0x4aab                               
  4aa7  3bc7             cmp ax, di                               
  4aa9  740a             je 0x4ab5                                
  4aab  fc               cld                                      
  4aac  b9ffff           mov cx, 0xffff                           
  4aaf  f2ae             repne scasb al, byte ptr es:[di]         
  4ab1  91               xchg cx, ax                              
  4ab2  f7d0             not ax                                   
  4ab4  48               dec ax                                   
  4ab5  5f               pop di                                   
  4ab6  5d               pop bp                                   
  4ab7  cb               retf                                     

res_0000_4ab8:  ; ENTRY
  4ab8  55               push bp                                  
  4ab9  8bec             mov bp, sp                               
  4abb  56               push si                                  
  4abc  57               push di                                  
  4abd  fc               cld                                      
  4abe  c47e0a           les di, ptr [bp + 0xa]                   
  4ac1  8bf7             mov si, di                               
  4ac3  32c0             xor al, al                               
  4ac5  8b5e0e           mov bx, word ptr [bp + 0xe]              
  4ac8  8bcb             mov cx, bx                               
  4aca  f2ae             repne scasb al, byte ptr es:[di]         
  4acc  2bd9             sub bx, cx                               
  4ace  1e               push ds                                  
  4acf  8cc7             mov di, es                               
  4ad1  8edf             mov ds, di                               
  4ad3  c47e06           les di, ptr [bp + 6]                     
  4ad6  87cb             xchg bx, cx                              
  4ad8  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  4ada  8bcb             mov cx, bx                               
  4adc  f3aa             rep stosb byte ptr es:[di], al           
  4ade  1f               pop ds                                   
  4adf  8b5608           mov dx, word ptr [bp + 8]                
  4ae2  8b4606           mov ax, word ptr [bp + 6]                
  4ae5  5f               pop di                                   
  4ae6  5e               pop si                                   
  4ae7  5d               pop bp                                   
  4ae8  cb               retf                                     

res_0000_4ae9:  ; ENTRY
  4ae9  55               push bp                                  
  4aea  8bec             mov bp, sp                               
  4aec  83ec04           sub sp, 4                                
  4aef  56               push si                                  
  4af0  90               nop                                      
  4af1  0e               push cs                                  
  4af2  e82203           call 0x4e17                              
  4af5  a10a3f           mov ax, word ptr [0x3f0a]                
  4af8  8b16083f         mov dx, word ptr [0x3f08]                
  4afc  81c200a6         add dx, 0xa600                           
  4b00  15ce12           adc ax, 0x12ce                           
  4b03  8946fe           mov word ptr [bp - 2], ax                
  4b06  8956fc           mov word ptr [bp - 4], dx                
  4b09  c45e06           les bx, ptr [bp + 6]                     
  4b0c  268b37           mov si, word ptr es:[bx]                 
  4b0f  81c644f8         add si, 0xf844                           
  4b13  8bc6             mov ax, si                               
  4b15  b102             mov cl, 2                                
  4b17  d3f8             sar ax, cl                               
  4b19  99               cdq                                      
  4b1a  50               push ax                                  
  4b1b  52               push dx                                  
  4b1c  ba8607           mov dx, 0x786                            
  4b1f  b8801f           mov ax, 0x1f80                           
  4b22  59               pop cx                                   
  4b23  5b               pop bx                                   
  4b24  e89ad4           call 0x1fc1                              
  4b27  0146fc           add word ptr [bp - 4], ax                
  4b2a  1156fe           adc word ptr [bp - 2], dx                
  4b2d  8bc6             mov ax, si                               
  4b2f  250300           and ax, 3                                
  4b32  99               cdq                                      
  4b33  50               push ax                                  
  4b34  52               push dx                                  
  4b35  bae101           mov dx, 0x1e1                            
  4b38  b88033           mov ax, 0x3380                           
  4b3b  59               pop cx                                   
  4b3c  5b               pop bx                                   
  4b3d  e881d4           call 0x1fc1                              
  4b40  0146fc           add word ptr [bp - 4], ax                
  4b43  1156fe           adc word ptr [bp - 2], dx                
  4b46  f7c60300         test si, 3                               
  4b4a  7409             je 0x4b55                                
  4b4c  8146fc8051       add word ptr [bp - 4], 0x5180            
  4b51  8356fe01         adc word ptr [bp - 2], 1                 
  4b55  33c9             xor cx, cx                               
  4b57  c45e06           les bx, ptr [bp + 6]                     
  4b5a  268a4703         mov al, byte ptr es:[bx + 3]             
  4b5e  98               cwde                                     
  4b5f  48               dec ax                                   
  4b60  8bf0             mov si, ax                               
  4b62  eb08             jmp 0x4b6c                               
  4b64  4e               dec si                                   
  4b65  8a84da3e         mov al, byte ptr [si + 0x3eda]           
  4b69  98               cwde                                     
  4b6a  03c8             add cx, ax                               
  4b6c  0bf6             or si, si                                
  4b6e  7ff4             jg 0x4b64                                
  4b70  c45e06           les bx, ptr [bp + 6]                     
  4b73  268a4702         mov al, byte ptr es:[bx + 2]             
  4b77  98               cwde                                     
  4b78  48               dec ax                                   
  4b79  03c8             add cx, ax                               
  4b7b  26807f0302       cmp byte ptr es:[bx + 3], 2              
  4b80  7e08             jle 0x4b8a                               
  4b82  26f7070300       test word ptr es:[bx], 3                 
  4b87  7501             jne 0x4b8a                               
  4b89  41               inc cx                                   
  4b8a  c45e0a           les bx, ptr [bp + 0xa]                   
  4b8d  268a4701         mov al, byte ptr es:[bx + 1]             
  4b91  b400             mov ah, 0                                
  4b93  50               push ax                                  
  4b94  8bc1             mov ax, cx                               
  4b96  ba1800           mov dx, 0x18                             
  4b99  f7ea             imul dx                                  
  4b9b  5a               pop dx                                   
  4b9c  03c2             add ax, dx                               
  4b9e  8bf0             mov si, ax                               
  4ba0  833e0c3f00       cmp word ptr [0x3f0c], 0                 
  4ba5  741d             je 0x4bc4                                
  4ba7  268a4701         mov al, byte ptr es:[bx + 1]             
  4bab  b400             mov ah, 0                                
  4bad  50               push ax                                  
  4bae  51               push cx                                  
  4baf  33c0             xor ax, ax                               
  4bb1  50               push ax                                  
  4bb2  c45e06           les bx, ptr [bp + 6]                     
  4bb5  268b07           mov ax, word ptr es:[bx]                 
  4bb8  054ef8           add ax, 0xf84e                           
  4bbb  50               push ax                                  
  4bbc  e84604           call 0x5005                              
  4bbf  0bc0             or ax, ax                                
  4bc1  7401             je 0x4bc4                                
  4bc3  4e               dec si                                   
  4bc4  8bc6             mov ax, si                               
  4bc6  99               cdq                                      
  4bc7  50               push ax                                  
  4bc8  52               push dx                                  
  4bc9  33d2             xor dx, dx                               
  4bcb  b8100e           mov ax, 0xe10                            
  4bce  59               pop cx                                   
  4bcf  5b               pop bx                                   
  4bd0  e8eed3           call 0x1fc1                              
  4bd3  0146fc           add word ptr [bp - 4], ax                
  4bd6  1156fe           adc word ptr [bp - 2], dx                
  4bd9  c45e0a           les bx, ptr [bp + 0xa]                   
  4bdc  268a07           mov al, byte ptr es:[bx]                 
  4bdf  b400             mov ah, 0                                
  4be1  99               cdq                                      
  4be2  50               push ax                                  
  4be3  52               push dx                                  
  4be4  33d2             xor dx, dx                               
  4be6  b83c00           mov ax, 0x3c                             
  4be9  59               pop cx                                   
  4bea  5b               pop bx                                   
  4beb  e8d3d3           call 0x1fc1                              
  4bee  c45e0a           les bx, ptr [bp + 0xa]                   
  4bf1  268a5f03         mov bl, byte ptr es:[bx + 3]             
  4bf5  b700             mov bh, 0                                
  4bf7  50               push ax                                  
  4bf8  8bc3             mov ax, bx                               
  4bfa  52               push dx                                  
  4bfb  99               cdq                                      
  4bfc  5b               pop bx                                   
  4bfd  59               pop cx                                   
  4bfe  03c8             add cx, ax                               
  4c00  13da             adc bx, dx                               
  4c02  014efc           add word ptr [bp - 4], cx                
  4c05  115efe           adc word ptr [bp - 2], bx                
  4c08  8b56fe           mov dx, word ptr [bp - 2]                
  4c0b  8b46fc           mov ax, word ptr [bp - 4]                
  4c0e  5e               pop si                                   
  4c0f  8be5             mov sp, bp                               
  4c11  5d               pop bp                                   
  4c12  cb               retf                                     

res_0000_4c13:  ; ENTRY
  4c13  55               push bp                                  
  4c14  8bec             mov bp, sp                               
  4c16  90               nop                                      
  4c17  0e               push cs                                  
  4c18  e8fc01           call 0x4e17                              
  4c1b  a10a3f           mov ax, word ptr [0x3f0a]                
  4c1e  8b16083f         mov dx, word ptr [0x3f08]                
  4c22  81c200a6         add dx, 0xa600                           
  4c26  15ce12           adc ax, 0x12ce                           
  4c29  295606           sub word ptr [bp + 6], dx                
  4c2c  194608           sbb word ptr [bp + 8], ax                
  4c2f  c45e0e           les bx, ptr [bp + 0xe]                   
  4c32  26c6470200       mov byte ptr es:[bx + 2], 0              
  4c37  33c0             xor ax, ax                               
  4c39  ba3c00           mov dx, 0x3c                             
  4c3c  50               push ax                                  
  4c3d  52               push dx                                  
  4c3e  ff7608           push word ptr [bp + 8]                   
  4c41  ff7606           push word ptr [bp + 6]                   
  4c44  e80cd1           call 0x1d53                              
  4c47  c45e0e           les bx, ptr [bp + 0xe]                   
  4c4a  26884703         mov byte ptr es:[bx + 3], al             
  4c4e  33c0             xor ax, ax                               
  4c50  ba3c00           mov dx, 0x3c                             
  4c53  50               push ax                                  
  4c54  52               push dx                                  
  4c55  ff7608           push word ptr [bp + 8]                   
  4c58  ff7606           push word ptr [bp + 6]                   
  4c5b  e8e6d0           call 0x1d44                              
  4c5e  895608           mov word ptr [bp + 8], dx                
  4c61  894606           mov word ptr [bp + 6], ax                
  4c64  33c0             xor ax, ax                               
  4c66  ba3c00           mov dx, 0x3c                             
  4c69  50               push ax                                  
  4c6a  52               push dx                                  
  4c6b  ff7608           push word ptr [bp + 8]                   
  4c6e  ff7606           push word ptr [bp + 6]                   
  4c71  e8dfd0           call 0x1d53                              
  4c74  c45e0e           les bx, ptr [bp + 0xe]                   
  4c77  268807           mov byte ptr es:[bx], al                 
  4c7a  33c0             xor ax, ax                               
  4c7c  ba3c00           mov dx, 0x3c                             
  4c7f  50               push ax                                  
  4c80  52               push dx                                  
  4c81  ff7608           push word ptr [bp + 8]                   
  4c84  ff7606           push word ptr [bp + 6]                   
  4c87  e8bad0           call 0x1d44                              
  4c8a  895608           mov word ptr [bp + 8], dx                
  4c8d  894606           mov word ptr [bp + 6], ax                
  4c90  33c0             xor ax, ax                               
  4c92  baf888           mov dx, 0x88f8                           
  4c95  50               push ax                                  
  4c96  52               push dx                                  
  4c97  ff7608           push word ptr [bp + 8]                   
  4c9a  ff7606           push word ptr [bp + 6]                   
  4c9d  e8a4d0           call 0x1d44                              
  4ca0  b102             mov cl, 2                                
  4ca2  d3e0             shl ax, cl                               
  4ca4  05bc07           add ax, 0x7bc                            
  4ca7  c45e0a           les bx, ptr [bp + 0xa]                   
  4caa  268907           mov word ptr es:[bx], ax                 
  4cad  33c0             xor ax, ax                               
  4caf  baf888           mov dx, 0x88f8                           
  4cb2  50               push ax                                  
  4cb3  52               push dx                                  
  4cb4  ff7608           push word ptr [bp + 8]                   
  4cb7  ff7606           push word ptr [bp + 6]                   
  4cba  e896d0           call 0x1d53                              
  4cbd  895608           mov word ptr [bp + 8], dx                
  4cc0  894606           mov word ptr [bp + 6], ax                
  4cc3  837e0800         cmp word ptr [bp + 8], 0                 
  4cc7  7c44             jl 0x4d0d                                
  4cc9  7507             jne 0x4cd2                               
  4ccb  817e065022       cmp word ptr [bp + 6], 0x2250            
  4cd0  723b             jb 0x4d0d                                
  4cd2  816e065022       sub word ptr [bp + 6], 0x2250            
  4cd7  835e0800         sbb word ptr [bp + 8], 0                 
  4cdb  c45e0a           les bx, ptr [bp + 0xa]                   
  4cde  26ff07           inc word ptr es:[bx]                     
  4ce1  33c0             xor ax, ax                               
  4ce3  ba3822           mov dx, 0x2238                           
  4ce6  50               push ax                                  
  4ce7  52               push dx                                  
  4ce8  ff7608           push word ptr [bp + 8]                   
  4ceb  ff7606           push word ptr [bp + 6]                   
  4cee  e853d0           call 0x1d44                              
  4cf1  c45e0a           les bx, ptr [bp + 0xa]                   
  4cf4  260107           add word ptr es:[bx], ax                 
  4cf7  33c0             xor ax, ax                               
  4cf9  ba3822           mov dx, 0x2238                           
  4cfc  50               push ax                                  
  4cfd  52               push dx                                  
  4cfe  ff7608           push word ptr [bp + 8]                   
  4d01  ff7606           push word ptr [bp + 6]                   
  4d04  e84cd0           call 0x1d53                              
  4d07  895608           mov word ptr [bp + 8], dx                
  4d0a  894606           mov word ptr [bp + 6], ax                
  4d0d  833e0c3f00       cmp word ptr [0x3f0c], 0                 
  4d12  743e             je 0x4d52                                
  4d14  33c0             xor ax, ax                               
  4d16  ba1800           mov dx, 0x18                             
  4d19  50               push ax                                  
  4d1a  52               push dx                                  
  4d1b  ff7608           push word ptr [bp + 8]                   
  4d1e  ff7606           push word ptr [bp + 6]                   
  4d21  e82fd0           call 0x1d53                              
  4d24  50               push ax                                  
  4d25  33c0             xor ax, ax                               
  4d27  ba1800           mov dx, 0x18                             
  4d2a  50               push ax                                  
  4d2b  52               push dx                                  
  4d2c  ff7608           push word ptr [bp + 8]                   
  4d2f  ff7606           push word ptr [bp + 6]                   
  4d32  e80fd0           call 0x1d44                              
  4d35  50               push ax                                  
  4d36  33c0             xor ax, ax                               
  4d38  50               push ax                                  
  4d39  c45e0a           les bx, ptr [bp + 0xa]                   
  4d3c  268b07           mov ax, word ptr es:[bx]                 
  4d3f  054ef8           add ax, 0xf84e                           
  4d42  50               push ax                                  
  4d43  e8bf02           call 0x5005                              
  4d46  0bc0             or ax, ax                                
  4d48  7408             je 0x4d52                                
  4d4a  83460601         add word ptr [bp + 6], 1                 
  4d4e  83560800         adc word ptr [bp + 8], 0                 
  4d52  33c0             xor ax, ax                               
  4d54  ba1800           mov dx, 0x18                             
  4d57  50               push ax                                  
  4d58  52               push dx                                  
  4d59  ff7608           push word ptr [bp + 8]                   
  4d5c  ff7606           push word ptr [bp + 6]                   
  4d5f  e8f1cf           call 0x1d53                              
  4d62  c45e0e           les bx, ptr [bp + 0xe]                   
  4d65  26884701         mov byte ptr es:[bx + 1], al             
  4d69  33c0             xor ax, ax                               
  4d6b  ba1800           mov dx, 0x18                             
  4d6e  50               push ax                                  
  4d6f  52               push dx                                  
  4d70  ff7608           push word ptr [bp + 8]                   
  4d73  ff7606           push word ptr [bp + 6]                   
  4d76  e8cbcf           call 0x1d44                              
  4d79  895608           mov word ptr [bp + 8], dx                
  4d7c  894606           mov word ptr [bp + 6], ax                
  4d7f  83460601         add word ptr [bp + 6], 1                 
  4d83  83560800         adc word ptr [bp + 8], 0                 
  4d87  c45e0a           les bx, ptr [bp + 0xa]                   
  4d8a  26f7070300       test word ptr es:[bx], 3                 
  4d8f  7533             jne 0x4dc4                               
  4d91  837e0800         cmp word ptr [bp + 8], 0                 
  4d95  7c12             jl 0x4da9                                
  4d97  7f06             jg 0x4d9f                                
  4d99  837e063c         cmp word ptr [bp + 6], 0x3c              
  4d9d  760a             jbe 0x4da9                               
  4d9f  836e0601         sub word ptr [bp + 6], 1                 
  4da3  835e0800         sbb word ptr [bp + 8], 0                 
  4da7  eb1b             jmp 0x4dc4                               
  4da9  837e0800         cmp word ptr [bp + 8], 0                 
  4dad  7515             jne 0x4dc4                               
  4daf  837e063c         cmp word ptr [bp + 6], 0x3c              
  4db3  750f             jne 0x4dc4                               
  4db5  c45e0a           les bx, ptr [bp + 0xa]                   
  4db8  26c6470302       mov byte ptr es:[bx + 3], 2              
  4dbd  26c647021d       mov byte ptr es:[bx + 2], 0x1d           
  4dc2  eb51             jmp 0x4e15                               
  4dc4  c45e0a           les bx, ptr [bp + 0xa]                   
  4dc7  26c6470300       mov byte ptr es:[bx + 3], 0              
  4dcc  eb1d             jmp 0x4deb                               
  4dce  c45e0a           les bx, ptr [bp + 0xa]                   
  4dd1  268a4703         mov al, byte ptr es:[bx + 3]             
  4dd5  98               cwde                                     
  4dd6  8bd8             mov bx, ax                               
  4dd8  8a87da3e         mov al, byte ptr [bx + 0x3eda]           
  4ddc  98               cwde                                     
  4ddd  99               cdq                                      
  4dde  294606           sub word ptr [bp + 6], ax                
  4de1  195608           sbb word ptr [bp + 8], dx                
  4de4  8b5e0a           mov bx, word ptr [bp + 0xa]              
  4de7  26fe4703         inc byte ptr es:[bx + 3]                 
  4deb  c45e0a           les bx, ptr [bp + 0xa]                   
  4dee  268a4703         mov al, byte ptr es:[bx + 3]             
  4df2  98               cwde                                     
  4df3  8bd8             mov bx, ax                               
  4df5  8a87da3e         mov al, byte ptr [bx + 0x3eda]           
  4df9  98               cwde                                     
  4dfa  99               cdq                                      
  4dfb  3b5608           cmp dx, word ptr [bp + 8]                
  4dfe  7cce             jl 0x4dce                                
  4e00  7505             jne 0x4e07                               
  4e02  3b4606           cmp ax, word ptr [bp + 6]                
  4e05  72c7             jb 0x4dce                                
  4e07  c45e0a           les bx, ptr [bp + 0xa]                   
  4e0a  26fe4703         inc byte ptr es:[bx + 3]                 
  4e0e  8a4606           mov al, byte ptr [bp + 6]                
  4e11  26884702         mov byte ptr es:[bx + 2], al             
  4e15  5d               pop bp                                   
  4e16  cb               retf                                     

res_0000_4e17:  ; ENTRY
  4e17  55               push bp                                  
  4e18  8bec             mov bp, sp                               
  4e1a  83ec04           sub sp, 4                                
  4e1d  56               push si                                  
  4e1e  1e               push ds                                  
  4e1f  b80e3f           mov ax, 0x3f0e                           
  4e22  50               push ax                                  
  4e23  90               nop                                      
  4e24  0e               push cs                                  
  4e25  e83df4           call 0x4265                              
  4e28  59               pop cx                                   
  4e29  59               pop cx                                   
  4e2a  8956fe           mov word ptr [bp - 2], dx                
  4e2d  8946fc           mov word ptr [bp - 4], ax                
  4e30  0bc2             or ax, dx                                
  4e32  7503             jne 0x4e37                               
  4e34  e99500           jmp 0x4ecc                               
  4e37  52               push dx                                  
  4e38  ff76fc           push word ptr [bp - 4]                   
  4e3b  90               nop                                      
  4e3c  0e               push cs                                  
  4e3d  e859fc           call 0x4a99                              
  4e40  59               pop cx                                   
  4e41  59               pop cx                                   
  4e42  3d0400           cmp ax, 4                                
  4e45  7303             jae 0x4e4a                               
  4e47  e98200           jmp 0x4ecc                               
  4e4a  c45efc           les bx, ptr [bp - 4]                     
  4e4d  268a07           mov al, byte ptr es:[bx]                 
  4e50  98               cwde                                     
  4e51  8bd8             mov bx, ax                               
  4e53  8a875f3a         mov al, byte ptr [bx + 0x3a5f]           
  4e57  98               cwde                                     
  4e58  a90c00           test ax, 0xc                             
  4e5b  746f             je 0x4ecc                                
  4e5d  8b5efc           mov bx, word ptr [bp - 4]                
  4e60  268a4701         mov al, byte ptr es:[bx + 1]             
  4e64  98               cwde                                     
  4e65  8bd8             mov bx, ax                               
  4e67  8a875f3a         mov al, byte ptr [bx + 0x3a5f]           
  4e6b  98               cwde                                     
  4e6c  a90c00           test ax, 0xc                             
  4e6f  745b             je 0x4ecc                                
  4e71  8b5efc           mov bx, word ptr [bp - 4]                
  4e74  268a4702         mov al, byte ptr es:[bx + 2]             
  4e78  98               cwde                                     
  4e79  8bd8             mov bx, ax                               
  4e7b  8a875f3a         mov al, byte ptr [bx + 0x3a5f]           
  4e7f  98               cwde                                     
  4e80  a90c00           test ax, 0xc                             
  4e83  7447             je 0x4ecc                                
  4e85  8b5efc           mov bx, word ptr [bp - 4]                
  4e88  26807f032d       cmp byte ptr es:[bx + 3], 0x2d           
  4e8d  7415             je 0x4ea4                                
  4e8f  26807f032b       cmp byte ptr es:[bx + 3], 0x2b           
  4e94  740e             je 0x4ea4                                
  4e96  268a4703         mov al, byte ptr es:[bx + 3]             
  4e9a  98               cwde                                     
  4e9b  8bd8             mov bx, ax                               
  4e9d  f6875f3a02       test byte ptr [bx + 0x3a5f], 2           
  4ea2  7428             je 0x4ecc                                
  4ea4  c45efc           les bx, ptr [bp - 4]                     
  4ea7  268a4703         mov al, byte ptr es:[bx + 3]             
  4eab  98               cwde                                     
  4eac  8bd8             mov bx, ax                               
  4eae  8a875f3a         mov al, byte ptr [bx + 0x3a5f]           
  4eb2  98               cwde                                     
  4eb3  a90200           test ax, 2                               
  4eb6  7553             jne 0x4f0b                               
  4eb8  8b5efc           mov bx, word ptr [bp - 4]                
  4ebb  268a4704         mov al, byte ptr es:[bx + 4]             
  4ebf  98               cwde                                     
  4ec0  8bd8             mov bx, ax                               
  4ec2  8a875f3a         mov al, byte ptr [bx + 0x3a5f]           
  4ec6  98               cwde                                     
  4ec7  a90200           test ax, 2                               
  4eca  753f             jne 0x4f0b                               
  4ecc  c7060c3f0100     mov word ptr [0x3f0c], 1                 
  4ed2  c7060a3f0000     mov word ptr [0x3f0a], 0                 
  4ed8  c706083f5046     mov word ptr [0x3f08], 0x4650            
  4ede  1e               push ds                                  
  4edf  b8113f           mov ax, 0x3f11                           
  4ee2  50               push ax                                  
  4ee3  ff36023f         push word ptr [0x3f02]                   
  4ee7  ff36003f         push word ptr [0x3f00]                    ; "bq%1^q%1PF"
  4eeb  90               nop                                      
  4eec  0e               push cs                                  
  4eed  e880fb           call 0x4a70                              
  4ef0  83c408           add sp, 8                                
  4ef3  1e               push ds                                  
  4ef4  b8153f           mov ax, 0x3f15                           
  4ef7  50               push ax                                  
  4ef8  ff36063f         push word ptr [0x3f06]                   
  4efc  ff36043f         push word ptr [0x3f04]                   
  4f00  90               nop                                      
  4f01  0e               push cs                                  
  4f02  e86bfb           call 0x4a70                              
  4f05  83c408           add sp, 8                                
  4f08  e9f500           jmp 0x5000                               
  4f0b  b80400           mov ax, 4                                
  4f0e  50               push ax                                  
  4f0f  33c0             xor ax, ax                               
  4f11  50               push ax                                  
  4f12  ff36063f         push word ptr [0x3f06]                   
  4f16  ff36043f         push word ptr [0x3f04]                   
  4f1a  90               nop                                      
  4f1b  0e               push cs                                  
  4f1c  e86ef4           call 0x438d                              
  4f1f  83c408           add sp, 8                                
  4f22  b80300           mov ax, 3                                
  4f25  50               push ax                                  
  4f26  ff76fe           push word ptr [bp - 2]                   
  4f29  ff76fc           push word ptr [bp - 4]                   
  4f2c  ff36023f         push word ptr [0x3f02]                   
  4f30  ff36003f         push word ptr [0x3f00]                    ; "bq%1^q%1PF"
  4f34  90               nop                                      
  4f35  0e               push cs                                  
  4f36  e87ffb           call 0x4ab8                              
  4f39  83c40a           add sp, 0xa                              
  4f3c  c41e003f         les bx, ptr [0x3f00]                      ; "bq%1^q%1PF"
  4f40  26c6470300       mov byte ptr es:[bx + 3], 0              
  4f45  8b46fc           mov ax, word ptr [bp - 4]                
  4f48  050300           add ax, 3                                
  4f4b  ff76fe           push word ptr [bp - 2]                   
  4f4e  50               push ax                                  
  4f4f  90               nop                                      
  4f50  0e               push cs                                  
  4f51  e87eef           call 0x3ed2                              
  4f54  59               pop cx                                   
  4f55  59               pop cx                                   
  4f56  50               push ax                                  
  4f57  52               push dx                                  
  4f58  33d2             xor dx, dx                               
  4f5a  b8100e           mov ax, 0xe10                            
  4f5d  59               pop cx                                   
  4f5e  5b               pop bx                                   
  4f5f  e85fd0           call 0x1fc1                              
  4f62  89160a3f         mov word ptr [0x3f0a], dx                
  4f66  a3083f           mov word ptr [0x3f08], ax                
  4f69  c7060c3f0000     mov word ptr [0x3f0c], 0                 
  4f6f  be0300           mov si, 3                                
  4f72  eb7e             jmp 0x4ff2                               
  4f74  c45efc           les bx, ptr [bp - 4]                     
  4f77  03de             add bx, si                               
  4f79  268a07           mov al, byte ptr es:[bx]                 
  4f7c  98               cwde                                     
  4f7d  8bd8             mov bx, ax                               
  4f7f  f6875f3a0c       test byte ptr [bx + 0x3a5f], 0xc         
  4f84  746b             je 0x4ff1                                
  4f86  8b46fc           mov ax, word ptr [bp - 4]                
  4f89  03c6             add ax, si                               
  4f8b  ff76fe           push word ptr [bp - 2]                   
  4f8e  50               push ax                                  
  4f8f  90               nop                                      
  4f90  0e               push cs                                  
  4f91  e805fb           call 0x4a99                              
  4f94  59               pop cx                                   
  4f95  59               pop cx                                   
  4f96  3d0300           cmp ax, 3                                
  4f99  7265             jb 0x5000                                
  4f9b  c45efc           les bx, ptr [bp - 4]                     
  4f9e  268a4001         mov al, byte ptr es:[bx + si + 1]        
  4fa2  98               cwde                                     
  4fa3  8bd8             mov bx, ax                               
  4fa5  8a875f3a         mov al, byte ptr [bx + 0x3a5f]           
  4fa9  98               cwde                                     
  4faa  a90c00           test ax, 0xc                             
  4fad  7451             je 0x5000                                
  4faf  8b5efc           mov bx, word ptr [bp - 4]                
  4fb2  268a4002         mov al, byte ptr es:[bx + si + 2]        
  4fb6  98               cwde                                     
  4fb7  8bd8             mov bx, ax                               
  4fb9  8a875f3a         mov al, byte ptr [bx + 0x3a5f]           
  4fbd  98               cwde                                     
  4fbe  a90c00           test ax, 0xc                             
  4fc1  743d             je 0x5000                                
  4fc3  b80300           mov ax, 3                                
  4fc6  50               push ax                                  
  4fc7  8b46fc           mov ax, word ptr [bp - 4]                
  4fca  03c6             add ax, si                               
  4fcc  ff76fe           push word ptr [bp - 2]                   
  4fcf  50               push ax                                  
  4fd0  ff36063f         push word ptr [0x3f06]                   
  4fd4  ff36043f         push word ptr [0x3f04]                   
  4fd8  90               nop                                      
  4fd9  0e               push cs                                  
  4fda  e8dbfa           call 0x4ab8                              
  4fdd  83c40a           add sp, 0xa                              
  4fe0  c41e043f         les bx, ptr [0x3f04]                     
  4fe4  26c6470300       mov byte ptr es:[bx + 3], 0              
  4fe9  c7060c3f0100     mov word ptr [0x3f0c], 1                 
  4fef  eb0f             jmp 0x5000                               
  4ff1  46               inc si                                   
  4ff2  c45efc           les bx, ptr [bp - 4]                     
  4ff5  03de             add bx, si                               
  4ff7  26803f00         cmp byte ptr es:[bx], 0                  
  4ffb  7403             je 0x5000                                
  4ffd  e974ff           jmp 0x4f74                               
  5000  5e               pop si                                   
  5001  8be5             mov sp, bp                               
  5003  5d               pop bp                                   
  5004  cb               retf                                     

res_0000_5005:  ; ENTRY
  5005  55               push bp                                  
  5006  8bec             mov bp, sp                               
  5008  56               push si                                  
  5009  837e0600         cmp word ptr [bp + 6], 0                 
  500d  752c             jne 0x503b                               
  500f  8b7608           mov si, word ptr [bp + 8]                
  5012  837e083b         cmp word ptr [bp + 8], 0x3b              
  5016  720c             jb 0x5024                                
  5018  8b4604           mov ax, word ptr [bp + 4]                
  501b  054600           add ax, 0x46                             
  501e  a90300           test ax, 3                               
  5021  7501             jne 0x5024                               
  5023  4e               dec si                                   
  5024  c746060000       mov word ptr [bp + 6], 0                 
  5029  eb03             jmp 0x502e                               
  502b  ff4606           inc word ptr [bp + 6]                    
  502e  8b5e06           mov bx, word ptr [bp + 6]                
  5031  d1e3             shl bx, 1                                
  5033  39b7e63e         cmp word ptr [bx + 0x3ee6], si           
  5037  76f2             jbe 0x502b                               
  5039  eb21             jmp 0x505c                               
  503b  8b5e06           mov bx, word ptr [bp + 6]                
  503e  4b               dec bx                                   
  503f  d1e3             shl bx, 1                                
  5041  8b87e63e         mov ax, word ptr [bx + 0x3ee6]           
  5045  014608           add word ptr [bp + 8], ax                
  5048  837e0603         cmp word ptr [bp + 6], 3                 
  504c  760e             jbe 0x505c                               
  504e  8b4604           mov ax, word ptr [bp + 4]                
  5051  054600           add ax, 0x46                             
  5054  a90300           test ax, 3                               
  5057  7503             jne 0x505c                               
  5059  ff4608           inc word ptr [bp + 8]                    
  505c  837e0604         cmp word ptr [bp + 6], 4                 
  5060  727b             jb 0x50dd                                
  5062  7408             je 0x506c                                
  5064  837e060a         cmp word ptr [bp + 6], 0xa               
  5068  7773             ja 0x50dd                                
  506a  756c             jne 0x50d8                               
  506c  8b5e06           mov bx, word ptr [bp + 6]                
  506f  d1e3             shl bx, 1                                
  5071  837e0410         cmp word ptr [bp + 4], 0x10              
  5075  7e0f             jle 0x5086                               
  5077  837e0604         cmp word ptr [bp + 6], 4                 
  507b  7509             jne 0x5086                               
  507d  8b8fe43e         mov cx, word ptr [bx + 0x3ee4]           
  5081  83c107           add cx, 7                                
  5084  eb04             jmp 0x508a                               
  5086  8b8fe63e         mov cx, word ptr [bx + 0x3ee6]           
  508a  8b5e04           mov bx, word ptr [bp + 4]                
  508d  81c3b207         add bx, 0x7b2                            
  5091  f6c303           test bl, 3                               
  5094  7401             je 0x5097                                
  5096  49               dec cx                                   
  5097  8b5e04           mov bx, word ptr [bp + 4]                
  509a  43               inc bx                                   
  509b  d1fb             sar bx, 1                                
  509d  d1fb             sar bx, 1                                
  509f  03d9             add bx, cx                               
  50a1  b86d01           mov ax, 0x16d                            
  50a4  f76604           mul word ptr [bp + 4]                    
  50a7  03c3             add ax, bx                               
  50a9  050400           add ax, 4                                
  50ac  33d2             xor dx, dx                               
  50ae  bb0700           mov bx, 7                                
  50b1  f7f3             div bx                                   
  50b3  2bca             sub cx, dx                               
  50b5  8b4608           mov ax, word ptr [bp + 8]                
  50b8  837e0604         cmp word ptr [bp + 6], 4                 
  50bc  750e             jne 0x50cc                               
  50be  3bc1             cmp ax, cx                               
  50c0  7716             ja 0x50d8                                
  50c2  7519             jne 0x50dd                               
  50c4  807e0a02         cmp byte ptr [bp + 0xa], 2               
  50c8  7213             jb 0x50dd                                
  50ca  eb0c             jmp 0x50d8                               
  50cc  3bc1             cmp ax, cx                               
  50ce  7208             jb 0x50d8                                
  50d0  750b             jne 0x50dd                               
  50d2  807e0a01         cmp byte ptr [bp + 0xa], 1               
  50d6  7705             ja 0x50dd                                
  50d8  b80100           mov ax, 1                                
  50db  eb02             jmp 0x50df                               
  50dd  33c0             xor ax, ax                               
  50df  5e               pop si                                   
  50e0  5d               pop bp                                   
  50e1  c20800           ret 8                                    

res_0000_50e4:  ; ENTRY
  50e4  55               push bp                                  
  50e5  8bec             mov bp, sp                               
  50e7  81ec8e00         sub sp, 0x8e                             
  50eb  56               push si                                  
  50ec  57               push di                                  
  50ed  8b7e06           mov di, word ptr [bp + 6]                
  50f0  3b3efc3c         cmp di, word ptr [0x3cfc]                
  50f4  720a             jb 0x5100                                
  50f6  b80600           mov ax, 6                                
  50f9  50               push ax                                  
  50fa  e89dcd           call 0x1e9a                              
  50fd  e92f01           jmp 0x522f                               
  5100  8b460c           mov ax, word ptr [bp + 0xc]              
  5103  40               inc ax                                   
  5104  3d0200           cmp ax, 2                                
  5107  7305             jae 0x510e                               
  5109  33c0             xor ax, ax                               
  510b  e92101           jmp 0x522f                               
  510e  8bdf             mov bx, di                               
  5110  d1e3             shl bx, 1                                
  5112  f787fe3c0008     test word ptr [bx + 0x3cfe], 0x800       
  5118  7413             je 0x512d                                
  511a  b80200           mov ax, 2                                
  511d  50               push ax                                  
  511e  33c0             xor ax, ax                               
  5120  33d2             xor dx, dx                               
  5122  50               push ax                                  
  5123  52               push dx                                  
  5124  57               push di                                  
  5125  90               nop                                      
  5126  0e               push cs                                  
  5127  e86ece           call 0x1f98                              
  512a  83c408           add sp, 8                                
  512d  8bdf             mov bx, di                               
  512f  d1e3             shl bx, 1                                
  5131  f787fe3c0040     test word ptr [bx + 0x3cfe], 0x4000      
  5137  7515             jne 0x514e                               
  5139  ff760c           push word ptr [bp + 0xc]                 
  513c  ff760a           push word ptr [bp + 0xa]                 
  513f  ff7608           push word ptr [bp + 8]                   
  5142  57               push di                                  
  5143  90               nop                                      
  5144  0e               push cs                                  
  5145  e8ed00           call 0x5235                              
  5148  83c408           add sp, 8                                
  514b  e9e100           jmp 0x522f                               
  514e  8bdf             mov bx, di                               
  5150  d1e3             shl bx, 1                                
  5152  81a7fe3cfffd     and word ptr [bx + 0x3cfe], 0xfdff       
  5158  8b460a           mov ax, word ptr [bp + 0xa]              
  515b  8b5608           mov dx, word ptr [bp + 8]                
  515e  8946f6           mov word ptr [bp - 0xa], ax              
  5161  8956f4           mov word ptr [bp - 0xc], dx              
  5164  8b460c           mov ax, word ptr [bp + 0xc]              
  5167  8946fa           mov word ptr [bp - 6], ax                
  516a  eb75             jmp 0x51e1                               
  516c  ff4efa           dec word ptr [bp - 6]                    
  516f  c45ef4           les bx, ptr [bp - 0xc]                   
  5172  ff46f4           inc word ptr [bp - 0xc]                  
  5175  268a07           mov al, byte ptr es:[bx]                 
  5178  8846f9           mov byte ptr [bp - 7], al                
  517b  3c0a             cmp al, 0xa                              
  517d  750a             jne 0x5189                               
  517f  c45efc           les bx, ptr [bp - 4]                     
  5182  26c6070d         mov byte ptr es:[bx], 0xd                
  5186  ff46fc           inc word ptr [bp - 4]                    
  5189  c45efc           les bx, ptr [bp - 4]                     
  518c  8a46f9           mov al, byte ptr [bp - 7]                
  518f  268807           mov byte ptr es:[bx], al                 
  5192  ff46fc           inc word ptr [bp - 4]                    
  5195  8d8672ff         lea ax, [bp - 0x8e]                      
  5199  8b56fc           mov dx, word ptr [bp - 4]                
  519c  33db             xor bx, bx                               
  519e  2bd0             sub dx, ax                               
  51a0  83db00           sbb bx, 0                                
  51a3  0bdb             or bx, bx                                
  51a5  7c44             jl 0x51eb                                
  51a7  7506             jne 0x51af                               
  51a9  81fa8000         cmp dx, 0x80                             
  51ad  723c             jb 0x51eb                                
  51af  8d8672ff         lea ax, [bp - 0x8e]                      
  51b3  8b76fc           mov si, word ptr [bp - 4]                
  51b6  33d2             xor dx, dx                               
  51b8  2bf0             sub si, ax                               
  51ba  83da00           sbb dx, 0                                
  51bd  56               push si                                  
  51be  16               push ss                                  
  51bf  50               push ax                                  
  51c0  57               push di                                  
  51c1  90               nop                                      
  51c2  0e               push cs                                  
  51c3  e86f00           call 0x5235                              
  51c6  83c408           add sp, 8                                
  51c9  8bd0             mov dx, ax                               
  51cb  3bc6             cmp ax, si                               
  51cd  7412             je 0x51e1                                
  51cf  83faff           cmp dx, -1                               
  51d2  7505             jne 0x51d9                               
  51d4  b8ffff           mov ax, 0xffff                           
  51d7  eb51             jmp 0x522a                               
  51d9  8b460c           mov ax, word ptr [bp + 0xc]              
  51dc  2b46fa           sub ax, word ptr [bp - 6]                
  51df  eb45             jmp 0x5226                               
  51e1  8d8672ff         lea ax, [bp - 0x8e]                      
  51e5  8c56fe           mov word ptr [bp - 2], ss                
  51e8  8946fc           mov word ptr [bp - 4], ax                
  51eb  837efa00         cmp word ptr [bp - 6], 0                 
  51ef  7403             je 0x51f4                                
  51f1  e978ff           jmp 0x516c                               
  51f4  8d8672ff         lea ax, [bp - 0x8e]                      
  51f8  8b76fc           mov si, word ptr [bp - 4]                
  51fb  33d2             xor dx, dx                               
  51fd  2bf0             sub si, ax                               
  51ff  83da00           sbb dx, 0                                
  5202  8bc6             mov ax, si                               
  5204  0bc0             or ax, ax                                
  5206  7624             jbe 0x522c                               
  5208  56               push si                                  
  5209  16               push ss                                  
  520a  8d8672ff         lea ax, [bp - 0x8e]                      
  520e  50               push ax                                  
  520f  57               push di                                  
  5210  90               nop                                      
  5211  0e               push cs                                  
  5212  e82000           call 0x5235                              
  5215  83c408           add sp, 8                                
  5218  8bd0             mov dx, ax                               
  521a  3bc6             cmp ax, si                               
  521c  740e             je 0x522c                                
  521e  83faff           cmp dx, -1                               
  5221  74b1             je 0x51d4                                
  5223  8b460c           mov ax, word ptr [bp + 0xc]              
  5226  03c2             add ax, dx                               
  5228  2bc6             sub ax, si                               
  522a  eb03             jmp 0x522f                               
  522c  8b460c           mov ax, word ptr [bp + 0xc]              
  522f  5f               pop di                                   
  5230  5e               pop si                                   
  5231  8be5             mov sp, bp                               
  5233  5d               pop bp                                   
  5234  cb               retf                                     

res_0000_5235:  ; ENTRY
  5235  55               push bp                                  
  5236  8bec             mov bp, sp                               
  5238  8b5e06           mov bx, word ptr [bp + 6]                
  523b  d1e3             shl bx, 1                                
  523d  f787fe3c0100     test word ptr [bx + 0x3cfe], 1           
  5243  7406             je 0x524b                                
  5245  b80500           mov ax, 5                                
  5248  50               push ax                                  
  5249  eb21             jmp 0x526c                               
  524b  1e               push ds                                  
  524c  b440             mov ah, 0x40                             
  524e  8b5e06           mov bx, word ptr [bp + 6]                
  5251  8b4e0c           mov cx, word ptr [bp + 0xc]              
  5254  c55608           lds dx, ptr [bp + 8]                     
  5257  cd21             int 0x21                                 
  5259  1f               pop ds                                   
  525a  720f             jb 0x526b                                
  525c  50               push ax                                  
  525d  8b5e06           mov bx, word ptr [bp + 6]                
  5260  d1e3             shl bx, 1                                
  5262  818ffe3c0010     or word ptr [bx + 0x3cfe], 0x1000        
  5268  58               pop ax                                   
  5269  eb04             jmp 0x526f                               
  526b  50               push ax                                  
  526c  e82bcc           call 0x1e9a                              
  526f  5d               pop bp                                   
  5270  cb               retf                                     
  5271  55               push bp                                  
  5272  8bec             mov bp, sp                               
  5274  83ec04           sub sp, 4                                
  5277  56               push si                                  
  5278  be0400           mov si, 4                                
  527b  8c5efe           mov word ptr [bp - 2], ds                
  527e  c746fc6c3b       mov word ptr [bp - 4], 0x3b6c            
  5283  eb1b             jmp 0x52a0                               
  5285  c45efc           les bx, ptr [bp - 4]                     
  5288  26f747020300     test word ptr es:[bx + 2], 3             
  528e  740b             je 0x529b                                
  5290  ff76fe           push word ptr [bp - 2]                   
  5293  53               push bx                                  
  5294  90               nop                                      
  5295  0e               push cs                                  
  5296  e8bfec           call 0x3f58                              
  5299  59               pop cx                                   
  529a  59               pop cx                                   
  529b  4e               dec si                                   
  529c  8346fc14         add word ptr [bp - 4], 0x14              
  52a0  0bf6             or si, si                                
  52a2  75e1             jne 0x5285                               
  52a4  5e               pop si                                   
  52a5  8be5             mov sp, bp                               
  52a7  5d               pop bp                                   
  52a8  cb               retf                                     
  52a9  55               push bp                                  
