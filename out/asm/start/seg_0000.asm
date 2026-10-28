; seg 0000  img 0x0000..0x48a0  file off 0xc00
  0000:0000  ba9e10           mov dx, 0x109e                            [reloc]
  0000:0003  2e89169102       mov word ptr cs:[0x291], dx              
  0000:0008  b430             mov ah, 0x30                             
  0000:000a  cd21             int 0x21                                 
  0000:000c  8b2e0200         mov bp, word ptr [2]                     
  0000:0010  8b1e2c00         mov bx, word ptr [0x2c]                  
  0000:0014  8eda             mov ds, dx                               
  0000:0016  a37d00           mov word ptr [0x7d], ax                  
  0000:0019  8c067b00         mov word ptr [0x7b], es                  
  0000:001d  891e7700         mov word ptr [0x77], bx                  
  0000:0021  892e9100         mov word ptr [0x91], bp                  
  0000:0025  e85501           call 0x17d                               -> 0000:017d
  0000:0028  a17700           mov ax, word ptr [0x77]                  
  0000:002b  8ec0             mov es, ax                               
  0000:002d  33c0             xor ax, ax                               
  0000:002f  8bd8             mov bx, ax                               
  0000:0031  8bf8             mov di, ax                               
  0000:0033  b9ff7f           mov cx, 0x7fff                           
  0000:0036  fc               cld                                      
  0000:0037  f2ae             repne scasb al, byte ptr es:[di]         
  0000:0039  e343             jcxz 0x7e                                
  0000:003b  43               inc bx                                   
  0000:003c  263805           cmp byte ptr es:[di], al                 
  0000:003f  75f6             jne 0x37                                 
  0000:0041  80cd80           or ch, 0x80                              
  0000:0044  f7d9             neg cx                                   
  0000:0046  890e7500         mov word ptr [0x75], cx                  
  0000:004a  b90200           mov cx, 2                                
  0000:004d  d3e3             shl bx, cl                               
  0000:004f  83c310           add bx, 0x10                             
  0000:0052  83e3f0           and bx, 0xfff0                           
  0000:0055  891e7900         mov word ptr [0x79], bx                  
  0000:0059  8cd2             mov dx, ss                               
  0000:005b  2bea             sub bp, dx                               
  0000:005d  bf9e10           mov di, 0x109e                            [reloc]
  0000:0060  8ec7             mov es, di                               
  0000:0062  268b3e9205       mov di, word ptr es:[0x592]              
  0000:0067  81ff0002         cmp di, 0x200                            
  0000:006b  7308             jae 0x75                                 
  0000:006d  bf0002           mov di, 0x200                            
  0000:0070  26893e9205       mov word ptr es:[0x592], di              
  0000:0075  b104             mov cl, 4                                
  0000:0077  d3ef             shr di, cl                               
  0000:0079  47               inc di                                   
  0000:007a  3bef             cmp bp, di                               
  0000:007c  7303             jae 0x81                                 
  0000:007e  e9f901           jmp 0x27a                                
  0000:0081  8bdf             mov bx, di                               
  0000:0083  03da             add bx, dx                               
  0000:0085  891e8900         mov word ptr [0x89], bx                  
  0000:0089  891e8d00         mov word ptr [0x8d], bx                  
  0000:008d  a17b00           mov ax, word ptr [0x7b]                  
  0000:0090  2bd8             sub bx, ax                               
  0000:0092  8ec0             mov es, ax                               
  0000:0094  b44a             mov ah, 0x4a                             
  0000:0096  57               push di                                  
  0000:0097  cd21             int 0x21                                 
  0000:0099  5f               pop di                                   
  0000:009a  d3e7             shl di, cl                               
  0000:009c  fa               cli                                      
  0000:009d  8ed2             mov ss, dx                               
  0000:009f  8be7             mov sp, di                               
  0000:00a1  fb               sti                                      
  0000:00a2  b89e10           mov ax, 0x109e                            [reloc]
  0000:00a5  8ec0             mov es, ax                               
  0000:00a7  26893e9205       mov word ptr es:[0x592], di              
  0000:00ac  33c0             xor ax, ax                               
  0000:00ae  2e8e069102       mov es, word ptr cs:[0x291]              
  0000:00b3  bf1a13           mov di, 0x131a                           
  0000:00b6  b96e1b           mov cx, 0x1b6e                           
  0000:00b9  2bcf             sub cx, di                               
  0000:00bb  fc               cld                                      
  0000:00bc  f3aa             rep stosb byte ptr es:[di], al           
  0000:00be  833e0c1114       cmp word ptr [0x110c], 0x14              
  0000:00c3  7647             jbe 0x10c                                
  0000:00c5  803e7d0003       cmp byte ptr [0x7d], 3                   
  0000:00ca  7240             jb 0x10c                                 
  0000:00cc  7707             ja 0xd5                                  
  0000:00ce  803e7e001e       cmp byte ptr [0x7e], 0x1e                
  0000:00d3  7237             jb 0x10c                                 
  0000:00d5  b80158           mov ax, 0x5801                           
  0000:00d8  bb0200           mov bx, 2                                
  0000:00db  cd21             int 0x21                                 
  0000:00dd  722a             jb 0x109                                 
  0000:00df  b467             mov ah, 0x67                             
  0000:00e1  8b1e0c11         mov bx, word ptr [0x110c]                
  0000:00e5  cd21             int 0x21                                 
  0000:00e7  7220             jb 0x109                                 
  0000:00e9  b448             mov ah, 0x48                             
  0000:00eb  bb0100           mov bx, 1                                
  0000:00ee  cd21             int 0x21                                 
  0000:00f0  7217             jb 0x109                                 
  0000:00f2  40               inc ax                                   
  0000:00f3  a39100           mov word ptr [0x91], ax                  
  0000:00f6  48               dec ax                                   
  0000:00f7  8ec0             mov es, ax                               
  0000:00f9  b449             mov ah, 0x49                             
  0000:00fb  cd21             int 0x21                                 
  0000:00fd  720a             jb 0x109                                 
  0000:00ff  b80158           mov ax, 0x5801                           
  0000:0102  bb0000           mov bx, 0                                
  0000:0105  cd21             int 0x21                                 
  0000:0107  7303             jae 0x10c                                
  0000:0109  e96e01           jmp 0x27a                                
  0000:010c  b400             mov ah, 0                                
  0000:010e  cd1a             int 0x1a                                 
  0000:0110  89168100         mov word ptr [0x81], dx                  
  0000:0114  890e8300         mov word ptr [0x83], cx                  
  0000:0118  0ac0             or al, al                                
  0000:011a  740c             je 0x128                                 
  0000:011c  b84000           mov ax, 0x40                             
  0000:011f  8ec0             mov es, ax                               
  0000:0121  bb7000           mov bx, 0x70                             
  0000:0124  26c60701         mov byte ptr es:[bx], 1                  
  0000:0128  33ed             xor bp, bp                               
  0000:012a  2e8e069102       mov es, word ptr cs:[0x291]              
  0000:012f  bef612           mov si, 0x12f6                           
  0000:0132  bf1413           mov di, 0x1314                           
  0000:0135  e8b500           call 0x1ed                               -> 0000:01ed
  0000:0138  ff367300         push word ptr [0x73]                     
  0000:013c  ff367100         push word ptr [0x71]                     
  0000:0140  ff366f00         push word ptr [0x6f]                     
  0000:0144  ff366d00         push word ptr [0x6d]                     
  0000:0148  ff366b00         push word ptr [0x6b]                     
  0000:014c  9a0f002b06       lcall 0x62b, 0xf                         -> 062b:000f [reloc]
  0000:0151  50               push ax                                  
  0000:0152  90               nop                                      
  0000:0153  0e               push cs                                  
  0000:0154  e8d91a           call 0x1c30                              -> 0000:1c30
  0000:0157  2e8e069102       mov es, word ptr cs:[0x291]              
  0000:015c  56               push si                                  
  0000:015d  57               push di                                  
  0000:015e  be1413           mov si, 0x1314                           
  0000:0161  bf1a13           mov di, 0x131a                           
  0000:0164  e8ca00           call 0x231                               -> 0000:0231
  0000:0167  5f               pop di                                   
  0000:0168  5e               pop si                                   
  0000:0169  cb               retf                                     
  0000:016a  cb               retf                                     
  0000:016b  8bec             mov bp, sp                               
  0000:016d  b44c             mov ah, 0x4c                             
  0000:016f  8a4604           mov al, byte ptr [bp + 4]                
  0000:0172  cd21             int 0x21                                 
  0000:0174  b90e00           mov cx, 0xe                              
  0000:0177  ba2f00           mov dx, 0x2f                             
  0000:017a  e90301           jmp 0x280                                
  0000:017d  1e               push ds                                  
  0000:017e  b80035           mov ax, 0x3500                           
  0000:0181  cd21             int 0x21                                 
  0000:0183  891e5b00         mov word ptr [0x5b], bx                  
  0000:0187  8c065d00         mov word ptr [0x5d], es                  
  0000:018b  b80435           mov ax, 0x3504                           
  0000:018e  cd21             int 0x21                                 
  0000:0190  891e5f00         mov word ptr [0x5f], bx                  
  0000:0194  8c066100         mov word ptr [0x61], es                  
  0000:0198  b80535           mov ax, 0x3505                           
  0000:019b  cd21             int 0x21                                 
  0000:019d  891e6300         mov word ptr [0x63], bx                  
  0000:01a1  8c066500         mov word ptr [0x65], es                  
  0000:01a5  b80635           mov ax, 0x3506                           
  0000:01a8  cd21             int 0x21                                 
  0000:01aa  891e6700         mov word ptr [0x67], bx                  
  0000:01ae  8c066900         mov word ptr [0x69], es                  
  0000:01b2  b80025           mov ax, 0x2500                           
  0000:01b5  8cca             mov dx, cs                               
  0000:01b7  8eda             mov ds, dx                               
  0000:01b9  ba7401           mov dx, 0x174                            
  0000:01bc  cd21             int 0x21                                 
  0000:01be  1f               pop ds                                   
  0000:01bf  c3               ret                                      
  0000:01c0  1e               push ds                                  
  0000:01c1  b80025           mov ax, 0x2500                           
  0000:01c4  c5165b00         lds dx, ptr [0x5b]                       
  0000:01c8  cd21             int 0x21                                 
  0000:01ca  1f               pop ds                                   
  0000:01cb  1e               push ds                                  
  0000:01cc  b80425           mov ax, 0x2504                           
  0000:01cf  c5165f00         lds dx, ptr [0x5f]                       
  0000:01d3  cd21             int 0x21                                 
  0000:01d5  1f               pop ds                                   
  0000:01d6  1e               push ds                                  
  0000:01d7  b80525           mov ax, 0x2505                           
  0000:01da  c5166300         lds dx, ptr [0x63]                       
  0000:01de  cd21             int 0x21                                 
  0000:01e0  1f               pop ds                                   
  0000:01e1  1e               push ds                                  
  0000:01e2  b80625           mov ax, 0x2506                           
  0000:01e5  c5166700         lds dx, ptr [0x67]                       
  0000:01e9  cd21             int 0x21                                 
  0000:01eb  1f               pop ds                                   
  0000:01ec  cb               retf                                     
  0000:01ed  b80001           mov ax, 0x100                            
  0000:01f0  8bd7             mov dx, di                               
  0000:01f2  8bde             mov bx, si                               
  0000:01f4  3bdf             cmp bx, di                               
  0000:01f6  7419             je 0x211                                 
  0000:01f8  26803fff         cmp byte ptr es:[bx], 0xff               
  0000:01fc  740e             je 0x20c                                 
  0000:01fe  268a4f01         mov cl, byte ptr es:[bx + 1]             
  0000:0202  32ed             xor ch, ch                               
  0000:0204  3bc8             cmp cx, ax                               
  0000:0206  7304             jae 0x20c                                
  0000:0208  8bc1             mov ax, cx                               
  0000:020a  8bd3             mov dx, bx                               
  0000:020c  83c306           add bx, 6                                
  0000:020f  ebe3             jmp 0x1f4                                
  0000:0211  3bd7             cmp dx, di                               
  0000:0213  741b             je 0x230                                 
  0000:0215  8bda             mov bx, dx                               
  0000:0217  26803f00         cmp byte ptr es:[bx], 0                  
  0000:021b  26c607ff         mov byte ptr es:[bx], 0xff               
  0000:021f  06               push es                                  
  0000:0220  7407             je 0x229                                 
  0000:0222  26ff5f02         lcall es:[bx + 2]                        
  0000:0226  07               pop es                                   
  0000:0227  ebc4             jmp 0x1ed                                
  0000:0229  26ff5702         call word ptr es:[bx + 2]                
  0000:022d  07               pop es                                   
  0000:022e  ebbd             jmp 0x1ed                                
  0000:0230  c3               ret                                      
  0000:0231  b400             mov ah, 0                                
  0000:0233  8bd7             mov dx, di                               
  0000:0235  8bde             mov bx, si                               
  0000:0237  3bdf             cmp bx, di                               
  0000:0239  7417             je 0x252                                 
  0000:023b  26803fff         cmp byte ptr es:[bx], 0xff               
  0000:023f  740c             je 0x24d                                 
  0000:0241  26386701         cmp byte ptr es:[bx + 1], ah             
  0000:0245  7206             jb 0x24d                                 
  0000:0247  268a6701         mov ah, byte ptr es:[bx + 1]             
  0000:024b  8bd3             mov dx, bx                               
  0000:024d  83c306           add bx, 6                                
  0000:0250  ebe5             jmp 0x237                                
  0000:0252  3bd7             cmp dx, di                               
  0000:0254  741b             je 0x271                                 
  0000:0256  8bda             mov bx, dx                               
  0000:0258  26803f00         cmp byte ptr es:[bx], 0                  
  0000:025c  26c607ff         mov byte ptr es:[bx], 0xff               
  0000:0260  06               push es                                  
  0000:0261  7407             je 0x26a                                 
  0000:0263  26ff5f02         lcall es:[bx + 2]                        
  0000:0267  07               pop es                                   
  0000:0268  ebc7             jmp 0x231                                
  0000:026a  26ff5702         call word ptr es:[bx + 2]                
  0000:026e  07               pop es                                   
  0000:026f  ebc0             jmp 0x231                                
  0000:0271  c3               ret                                      
  0000:0272  b440             mov ah, 0x40                             
  0000:0274  bb0200           mov bx, 2                                
  0000:0277  cd21             int 0x21                                 
  0000:0279  c3               ret                                      
  0000:027a  b91e00           mov cx, 0x1e                             
  0000:027d  ba3d00           mov dx, 0x3d                             
  0000:0280  2e8e1e9102       mov ds, word ptr cs:[0x291]              
  0000:0285  e8eaff           call 0x272                               -> 0000:0272
  0000:0288  b80300           mov ax, 3                                
  0000:028b  50               push ax                                  
  0000:028c  90               nop                                      
  0000:028d  0e               push cs                                  
  0000:028e  e8ae19           call 0x1c3f                              -> 0000:1c3f
  0000:0291  0000             add byte ptr [bx + si], al               
  0000:0293  04c0             add al, 0xc0                             

proc_0000_0295:
  0000:0295  55               push bp                                  
  0000:0296  8bec             mov bp, sp                               
  0000:0298  1e               push ds                                  
  0000:0299  56               push si                                  
  0000:029a  e8f400           call 0x391                               -> 0000:0391
  0000:029d  0bc0             or ax, ax                                
  0000:029f  740e             je 0x2af                                 
  0000:02a1  90               nop                                      
  0000:02a2  90               nop                                      
  0000:02a3  90               nop                                      
  0000:02a4  b88806           mov ax, 0x688                            
  0000:02a7  c57606           lds si, ptr [bp + 6]                     
  0000:02aa  cd66             int 0x66                                 
  0000:02ac  b80100           mov ax, 1                                
  0000:02af  5e               pop si                                   
  0000:02b0  1f               pop ds                                   
  0000:02b1  8be5             mov sp, bp                               
  0000:02b3  5d               pop bp                                   
  0000:02b4  cb               retf                                     
  0000:02b5  b88906           mov ax, 0x689                            
  0000:02b8  cd66             int 0x66                                 
  0000:02ba  cb               retf                                     

proc_0000_02bb:
  0000:02bb  55               push bp                                  
  0000:02bc  8bec             mov bp, sp                               
  0000:02be  1e               push ds                                  
  0000:02bf  56               push si                                  
  0000:02c0  b88a06           mov ax, 0x68a                            
  0000:02c3  c57606           lds si, ptr [bp + 6]                     
  0000:02c6  cd66             int 0x66                                 
  0000:02c8  5e               pop si                                   
  0000:02c9  1f               pop ds                                   
  0000:02ca  8be5             mov sp, bp                               
  0000:02cc  5d               pop bp                                   
  0000:02cd  cb               retf                                     

proc_0000_02ce:
  0000:02ce  55               push bp                                  
  0000:02cf  8bec             mov bp, sp                               
  0000:02d1  1e               push ds                                  
  0000:02d2  56               push si                                  
  0000:02d3  b88b06           mov ax, 0x68b                            
  0000:02d6  c57606           lds si, ptr [bp + 6]                     
  0000:02d9  cd66             int 0x66                                 
  0000:02db  5e               pop si                                   
  0000:02dc  1f               pop ds                                   
  0000:02dd  8be5             mov sp, bp                               
  0000:02df  5d               pop bp                                   
  0000:02e0  cb               retf                                     

proc_0000_02e1:
  0000:02e1  55               push bp                                  
  0000:02e2  8bec             mov bp, sp                               
  0000:02e4  1e               push ds                                  
  0000:02e5  56               push si                                  
  0000:02e6  b89406           mov ax, 0x694                            
  0000:02e9  c57606           lds si, ptr [bp + 6]                     
  0000:02ec  cd66             int 0x66                                 
  0000:02ee  5e               pop si                                   
  0000:02ef  1f               pop ds                                   
  0000:02f0  8be5             mov sp, bp                               
  0000:02f2  5d               pop bp                                   
  0000:02f3  cb               retf                                     
  0000:02f4  b88c06           mov ax, 0x68c                            
  0000:02f7  cd66             int 0x66                                 
  0000:02f9  cb               retf                                     

proc_0000_02fa:
  0000:02fa  55               push bp                                  
  0000:02fb  8bec             mov bp, sp                               
  0000:02fd  06               push es                                  
  0000:02fe  1e               push ds                                  
  0000:02ff  56               push si                                  
  0000:0300  57               push di                                  
  0000:0301  fc               cld                                      
  0000:0302  b88c06           mov ax, 0x68c                            
  0000:0305  cd66             int 0x66                                 
  0000:0307  c47e06           les di, ptr [bp + 6]                     
  0000:030a  8edb             mov ds, bx                               
  0000:030c  8bf1             mov si, cx                               
  0000:030e  b9ffff           mov cx, 0xffff                           
  0000:0311  ac               lodsb al, byte ptr [si]                  
  0000:0312  aa               stosb byte ptr es:[di], al               
  0000:0313  41               inc cx                                   
  0000:0314  0ac0             or al, al                                
  0000:0316  75f9             jne 0x311                                
  0000:0318  8bc1             mov ax, cx                               
  0000:031a  5f               pop di                                   
  0000:031b  5e               pop si                                   
  0000:031c  1f               pop ds                                   
  0000:031d  07               pop es                                   
  0000:031e  8be5             mov sp, bp                               
  0000:0320  5d               pop bp                                   
  0000:0321  cb               retf                                     
  0000:0322  b88d06           mov ax, 0x68d                            
  0000:0325  cd66             int 0x66                                 
  0000:0327  cb               retf                                     

proc_0000_0328:
  0000:0328  55               push bp                                  
  0000:0329  8bec             mov bp, sp                               
  0000:032b  8b5e06           mov bx, word ptr [bp + 6]                
  0000:032e  8b5608           mov dx, word ptr [bp + 8]                
  0000:0331  b88e06           mov ax, 0x68e                            
  0000:0334  cd66             int 0x66                                 
  0000:0336  8be5             mov sp, bp                               
  0000:0338  5d               pop bp                                   
  0000:0339  cb               retf                                     
  0000:033a  b88f06           mov ax, 0x68f                            
  0000:033d  cd66             int 0x66                                 
  0000:033f  cb               retf                                     

proc_0000_0340:
  0000:0340  55               push bp                                  
  0000:0341  8bec             mov bp, sp                               
  0000:0343  b89006           mov ax, 0x690                            
  0000:0346  8b5e06           mov bx, word ptr [bp + 6]                
  0000:0349  8b4e08           mov cx, word ptr [bp + 8]                
  0000:034c  8b560a           mov dx, word ptr [bp + 0xa]              
  0000:034f  cd66             int 0x66                                 
  0000:0351  8be5             mov sp, bp                               
  0000:0353  5d               pop bp                                   
  0000:0354  cb               retf                                     
  0000:0355  b89106           mov ax, 0x691                            
  0000:0358  cd66             int 0x66                                 
  0000:035a  cb               retf                                     
  0000:035b  b88906           mov ax, 0x689                            
  0000:035e  cd66             int 0x66                                 
  0000:0360  0bc0             or ax, ax                                
  0000:0362  75f7             jne 0x35b                                
  0000:0364  cb               retf                                     

proc_0000_0365:
  0000:0365  55               push bp                                  
  0000:0366  8bec             mov bp, sp                               
  0000:0368  1e               push ds                                  
  0000:0369  56               push si                                  
  0000:036a  c57606           lds si, ptr [bp + 6]                     
  0000:036d  b89506           mov ax, 0x695                            
  0000:0370  cd66             int 0x66                                 
  0000:0372  5e               pop si                                   
  0000:0373  1f               pop ds                                   
  0000:0374  8be5             mov sp, bp                               
  0000:0376  5d               pop bp                                   
  0000:0377  cb               retf                                     
  0000:0378  b89606           mov ax, 0x696                            
  0000:037b  cd66             int 0x66                                 
  0000:037d  cb               retf                                     

proc_0000_037e:
  0000:037e  55               push bp                                  
  0000:037f  8bec             mov bp, sp                               
  0000:0381  8b5606           mov dx, word ptr [bp + 6]                
  0000:0384  b89706           mov ax, 0x697                            
  0000:0387  cd66             int 0x66                                 
  0000:0389  8be5             mov sp, bp                               
  0000:038b  5d               pop bp                                   
  0000:038c  cb               retf                                     
  0000:038d  e80100           call 0x391                               -> 0000:0391
  0000:0390  cb               retf                                     
  0000:0391  1e               push ds                                  
  0000:0392  56               push si                                  
  0000:0393  be9801           mov si, 0x198                            
  0000:0396  33c0             xor ax, ax                               
  0000:0398  8ed8             mov ds, ax                               
  0000:039a  c534             lds si, ptr [si]                         
  0000:039c  0bf6             or si, si                                
  0000:039e  7443             je 0x3e3                                 
  0000:03a0  90               nop                                      
  0000:03a1  90               nop                                      
  0000:03a2  90               nop                                      
  0000:03a3  83ee06           sub si, 6                                
  0000:03a6  813c4d49         cmp word ptr [si], 0x494d                
  0000:03aa  751e             jne 0x3ca                                
  0000:03ac  90               nop                                      
  0000:03ad  90               nop                                      
  0000:03ae  90               nop                                      
  0000:03af  817c024449       cmp word ptr [si + 2], 0x4944            
  0000:03b4  7514             jne 0x3ca                                
  0000:03b6  90               nop                                      
  0000:03b7  90               nop                                      
  0000:03b8  90               nop                                      
  0000:03b9  b80107           mov ax, 0x701                            
  0000:03bc  cd66             int 0x66                                 
  0000:03be  0bc0             or ax, ax                                
  0000:03c0  751b             jne 0x3dd                                
  0000:03c2  90               nop                                      
  0000:03c3  90               nop                                      
  0000:03c4  90               nop                                      
  0000:03c5  741c             je 0x3e3                                 
  0000:03c7  90               nop                                      
  0000:03c8  90               nop                                      
  0000:03c9  90               nop                                      
  0000:03ca  813c4b45         cmp word ptr [si], 0x454b                
  0000:03ce  7513             jne 0x3e3                                
  0000:03d0  90               nop                                      
  0000:03d1  90               nop                                      
  0000:03d2  90               nop                                      
  0000:03d3  817c02524e       cmp word ptr [si + 2], 0x4e52            
  0000:03d8  7509             jne 0x3e3                                
  0000:03da  90               nop                                      
  0000:03db  90               nop                                      
  0000:03dc  90               nop                                      
  0000:03dd  b80100           mov ax, 1                                
  0000:03e0  5e               pop si                                   
  0000:03e1  1f               pop ds                                   
  0000:03e2  c3               ret                                      
  0000:03e3  33c0             xor ax, ax                               
  0000:03e5  ebf9             jmp 0x3e0                                
  0000:03e7  0000             add byte ptr [bx + si], al               
  0000:03e9  0000             add byte ptr [bx + si], al               
  0000:03eb  0000             add byte ptr [bx + si], al               
  0000:03ed  0002             add byte ptr [bp + si], al               
  0000:03ef  0000             add byte ptr [bx + si], al               
  0000:03f1  0302             add ax, word ptr [bp + si]               
  0000:03f3  0000             add byte ptr [bx + si], al               

proc_0000_03f5:
  0000:03f5  55               push bp                                  
  0000:03f6  8bec             mov bp, sp                               
  0000:03f8  06               push es                                  
  0000:03f9  1e               push ds                                  
  0000:03fa  56               push si                                  
  0000:03fb  57               push di                                  
  0000:03fc  fc               cld                                      
  0000:03fd  0e               push cs                                  
  0000:03fe  b8eb03           mov ax, 0x3eb                            
  0000:0401  50               push ax                                  
  0000:0402  33c0             xor ax, ax                               
  0000:0404  50               push ax                                  
  0000:0405  50               push ax                                  
  0000:0406  c45606           les dx, ptr [bp + 6]                     
  0000:0409  06               push es                                  
  0000:040a  52               push dx                                  
  0000:040b  90               nop                                      
  0000:040c  0e               push cs                                  
  0000:040d  e8e702           call 0x6f7                               -> 0000:06f7
  0000:0410  83c40c           add sp, 0xc                              
  0000:0413  0bd2             or dx, dx                                
  0000:0415  7503             jne 0x41a                                
  0000:0417  e98300           jmp 0x49d                                
  0000:041a  2ea3e703         mov word ptr cs:[0x3e7], ax              
  0000:041e  2e8916e903       mov word ptr cs:[0x3e9], dx              
  0000:0423  2ea1eb03         mov ax, word ptr cs:[0x3eb]              
  0000:0427  8ec0             mov es, ax                               
  0000:0429  2d1000           sub ax, 0x10                             
  0000:042c  26803e030044     cmp byte ptr es:[3], 0x44                
  0000:0432  754e             jne 0x482                                
  0000:0434  90               nop                                      
  0000:0435  90               nop                                      
  0000:0436  90               nop                                      
  0000:0437  26803e040049     cmp byte ptr es:[4], 0x49                
  0000:043d  7543             jne 0x482                                
  0000:043f  90               nop                                      
  0000:0440  90               nop                                      
  0000:0441  90               nop                                      
  0000:0442  26803e050047     cmp byte ptr es:[5], 0x47                
  0000:0448  7538             jne 0x482                                
  0000:044a  90               nop                                      
  0000:044b  90               nop                                      
  0000:044c  90               nop                                      
  0000:044d  26803e060050     cmp byte ptr es:[6], 0x50                
  0000:0453  752d             jne 0x482                                
  0000:0455  90               nop                                      
  0000:0456  90               nop                                      
  0000:0457  90               nop                                      
  0000:0458  26803e070041     cmp byte ptr es:[7], 0x41                
  0000:045e  7522             jne 0x482                                
  0000:0460  90               nop                                      
  0000:0461  90               nop                                      
  0000:0462  90               nop                                      
  0000:0463  26803e08004b     cmp byte ptr es:[8], 0x4b                
  0000:0469  7517             jne 0x482                                
  0000:046b  90               nop                                      
  0000:046c  90               nop                                      
  0000:046d  90               nop                                      
  0000:046e  2ea3ef03         mov word ptr cs:[0x3ef], ax              
  0000:0472  2ea3f303         mov word ptr cs:[0x3f3], ax              
  0000:0476  2eff1eed03       lcall cs:[0x3ed]                         
  0000:047b  0bc0             or ax, ax                                
  0000:047d  741b             je 0x49a                                 
  0000:047f  90               nop                                      
  0000:0480  90               nop                                      
  0000:0481  90               nop                                      
  0000:0482  2eff36eb03       push word ptr cs:[0x3eb]                 
  0000:0487  33c0             xor ax, ax                               
  0000:0489  50               push ax                                  
  0000:048a  9ae907070c       lcall 0xc07, 0x7e9                       -> 0c07:07e9 [reloc]
  0000:048f  83c404           add sp, 4                                
  0000:0492  33c0             xor ax, ax                               
  0000:0494  2ea3eb03         mov word ptr cs:[0x3eb], ax              
  0000:0498  eb03             jmp 0x49d                                
  0000:049a  b80100           mov ax, 1                                
  0000:049d  5f               pop di                                   
  0000:049e  5e               pop si                                   
  0000:049f  1f               pop ds                                   
  0000:04a0  07               pop es                                   
  0000:04a1  8be5             mov sp, bp                               
  0000:04a3  5d               pop bp                                   
  0000:04a4  cb               retf                                     
  0000:04a5  2e833eeb0300     cmp word ptr cs:[0x3eb], 0               
  0000:04ab  7421             je 0x4ce                                 
  0000:04ad  90               nop                                      
  0000:04ae  90               nop                                      
  0000:04af  90               nop                                      
  0000:04b0  2eff1ef103       lcall cs:[0x3f1]                         
  0000:04b5  2eff36e903       push word ptr cs:[0x3e9]                 
  0000:04ba  2eff36e703       push word ptr cs:[0x3e7]                 
  0000:04bf  9ae907070c       lcall 0xc07, 0x7e9                       -> 0c07:07e9 [reloc]
  0000:04c4  83c404           add sp, 4                                
  0000:04c7  2ec706eb030000   mov word ptr cs:[0x3eb], 0               
  0000:04ce  cb               retf                                     

proc_0000_04cf:
  0000:04cf  55               push bp                                  
  0000:04d0  8bec             mov bp, sp                               
  0000:04d2  1e               push ds                                  
  0000:04d3  56               push si                                  
  0000:04d4  57               push di                                  
  0000:04d5  c55606           lds dx, ptr [bp + 6]                     
  0000:04d8  8b460e           mov ax, word ptr [bp + 0xe]              
  0000:04db  0ac0             or al, al                                
  0000:04dd  7513             jne 0x4f2                                
  0000:04df  90               nop                                      
  0000:04e0  90               nop                                      
  0000:04e1  90               nop                                      
  0000:04e2  33c9             xor cx, cx                               
  0000:04e4  b43c             mov ah, 0x3c                             
  0000:04e6  cd21             int 0x21                                 
  0000:04e8  7252             jb 0x53c                                 
  0000:04ea  90               nop                                      
  0000:04eb  90               nop                                      
  0000:04ec  90               nop                                      
  0000:04ed  730e             jae 0x4fd                                
  0000:04ef  90               nop                                      
  0000:04f0  90               nop                                      
  0000:04f1  90               nop                                      
  0000:04f2  b002             mov al, 2                                
  0000:04f4  b43d             mov ah, 0x3d                             
  0000:04f6  cd21             int 0x21                                 
  0000:04f8  7242             jb 0x53c                                 
  0000:04fa  90               nop                                      
  0000:04fb  90               nop                                      
  0000:04fc  90               nop                                      
  0000:04fd  8bd8             mov bx, ax                               
  0000:04ff  b442             mov ah, 0x42                             
  0000:0501  b002             mov al, 2                                
  0000:0503  33c9             xor cx, cx                               
  0000:0505  33d2             xor dx, dx                               
  0000:0507  cd21             int 0x21                                 
  0000:0509  7231             jb 0x53c                                 
  0000:050b  90               nop                                      
  0000:050c  90               nop                                      
  0000:050d  90               nop                                      
  0000:050e  c57e0a           lds di, ptr [bp + 0xa]                   
  0000:0511  0bff             or di, di                                
  0000:0513  750c             jne 0x521                                
  0000:0515  90               nop                                      
  0000:0516  90               nop                                      
  0000:0517  90               nop                                      
  0000:0518  8cd9             mov cx, ds                               
  0000:051a  e30a             jcxz 0x526                               
  0000:051c  90               nop                                      
  0000:051d  90               nop                                      
  0000:051e  90               nop                                      
  0000:051f  90               nop                                      
  0000:0520  90               nop                                      
  0000:0521  8905             mov word ptr [di], ax                    
  0000:0523  895502           mov word ptr [di + 2], dx                
  0000:0526  b442             mov ah, 0x42                             
  0000:0528  32c0             xor al, al                               
  0000:052a  33c9             xor cx, cx                               
  0000:052c  33d2             xor dx, dx                               
  0000:052e  cd21             int 0x21                                 
  0000:0530  720a             jb 0x53c                                 
  0000:0532  90               nop                                      
  0000:0533  90               nop                                      
  0000:0534  90               nop                                      
  0000:0535  8bc3             mov ax, bx                               
  0000:0537  5f               pop di                                   
  0000:0538  5e               pop si                                   
  0000:0539  1f               pop ds                                   
  0000:053a  5d               pop bp                                   
  0000:053b  cb               retf                                     
  0000:053c  33c0             xor ax, ax                               
  0000:053e  5f               pop di                                   
  0000:053f  5e               pop si                                   
  0000:0540  1f               pop ds                                   
  0000:0541  5d               pop bp                                   
  0000:0542  cb               retf                                     

proc_0000_0543:
  0000:0543  55               push bp                                  
  0000:0544  8bec             mov bp, sp                               
  0000:0546  b43e             mov ah, 0x3e                             
  0000:0548  8b5e06           mov bx, word ptr [bp + 6]                
  0000:054b  cd21             int 0x21                                 
  0000:054d  7208             jb 0x557                                 
  0000:054f  90               nop                                      
  0000:0550  90               nop                                      
  0000:0551  90               nop                                      
  0000:0552  b80100           mov ax, 1                                
  0000:0555  5d               pop bp                                   
  0000:0556  cb               retf                                     
  0000:0557  33c0             xor ax, ax                               
  0000:0559  5d               pop bp                                   
  0000:055a  cb               retf                                     

proc_0000_055b:
  0000:055b  55               push bp                                  
  0000:055c  8bec             mov bp, sp                               
  0000:055e  8b5e06           mov bx, word ptr [bp + 6]                
  0000:0561  b442             mov ah, 0x42                             
  0000:0563  b001             mov al, 1                                
  0000:0565  33c9             xor cx, cx                               
  0000:0567  33d2             xor dx, dx                               
  0000:0569  cd21             int 0x21                                 
  0000:056b  5d               pop bp                                   
  0000:056c  cb               retf                                     

proc_0000_056d:
  0000:056d  55               push bp                                  
  0000:056e  8bec             mov bp, sp                               
  0000:0570  8b5e06           mov bx, word ptr [bp + 6]                
  0000:0573  b442             mov ah, 0x42                             
  0000:0575  b000             mov al, 0                                
  0000:0577  8b5608           mov dx, word ptr [bp + 8]                
  0000:057a  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0000:057d  cd21             int 0x21                                 
  0000:057f  7205             jb 0x586                                 
  0000:0581  90               nop                                      
  0000:0582  90               nop                                      
  0000:0583  90               nop                                      
  0000:0584  5d               pop bp                                   
  0000:0585  cb               retf                                     
  0000:0586  33c0             xor ax, ax                               
  0000:0588  33d2             xor dx, dx                               
  0000:058a  5d               pop bp                                   
  0000:058b  cb               retf                                     

proc_0000_058c:
  0000:058c  55               push bp                                  
  0000:058d  8bec             mov bp, sp                               
  0000:058f  56               push si                                  
  0000:0590  57               push di                                  
  0000:0591  8b5e0e           mov bx, word ptr [bp + 0xe]              
  0000:0594  1e               push ds                                  
  0000:0595  c55606           lds dx, ptr [bp + 6]                     
  0000:0598  b90080           mov cx, 0x8000                           
  0000:059b  837e0c00         cmp word ptr [bp + 0xc], 0               
  0000:059f  750e             jne 0x5af                                
  0000:05a1  90               nop                                      
  0000:05a2  90               nop                                      
  0000:05a3  90               nop                                      
  0000:05a4  3b4e0a           cmp cx, word ptr [bp + 0xa]              
  0000:05a7  7606             jbe 0x5af                                
  0000:05a9  90               nop                                      
  0000:05aa  90               nop                                      
  0000:05ab  90               nop                                      
  0000:05ac  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0000:05af  b43f             mov ah, 0x3f                             
  0000:05b1  cd21             int 0x21                                 
  0000:05b3  723a             jb 0x5ef                                 
  0000:05b5  90               nop                                      
  0000:05b6  90               nop                                      
  0000:05b7  90               nop                                      
  0000:05b8  3bc8             cmp cx, ax                               
  0000:05ba  7533             jne 0x5ef                                
  0000:05bc  90               nop                                      
  0000:05bd  90               nop                                      
  0000:05be  90               nop                                      
  0000:05bf  294e0a           sub word ptr [bp + 0xa], cx              
  0000:05c2  835e0c00         sbb word ptr [bp + 0xc], 0               
  0000:05c6  8bc1             mov ax, cx                               
  0000:05c8  250f00           and ax, 0xf                              
  0000:05cb  03d0             add dx, ax                               
  0000:05cd  d1e9             shr cx, 1                                
  0000:05cf  d1e9             shr cx, 1                                
  0000:05d1  d1e9             shr cx, 1                                
  0000:05d3  d1e9             shr cx, 1                                
  0000:05d5  8cd8             mov ax, ds                               
  0000:05d7  03c1             add ax, cx                               
  0000:05d9  8ed8             mov ds, ax                               
  0000:05db  837e0a00         cmp word ptr [bp + 0xa], 0               
  0000:05df  75b7             jne 0x598                                
  0000:05e1  837e0c00         cmp word ptr [bp + 0xc], 0               
  0000:05e5  75b1             jne 0x598                                
  0000:05e7  b80100           mov ax, 1                                
  0000:05ea  1f               pop ds                                   
  0000:05eb  5f               pop di                                   
  0000:05ec  5e               pop si                                   
  0000:05ed  5d               pop bp                                   
  0000:05ee  cb               retf                                     
  0000:05ef  33c0             xor ax, ax                               
  0000:05f1  1f               pop ds                                   
  0000:05f2  5f               pop di                                   
  0000:05f3  5e               pop si                                   
  0000:05f4  5d               pop bp                                   
  0000:05f5  cb               retf                                     

proc_0000_05f6:
  0000:05f6  55               push bp                                  
  0000:05f7  8bec             mov bp, sp                               
  0000:05f9  56               push si                                  
  0000:05fa  57               push di                                  
  0000:05fb  8b5e0e           mov bx, word ptr [bp + 0xe]              
  0000:05fe  1e               push ds                                  
  0000:05ff  c55606           lds dx, ptr [bp + 6]                     
  0000:0602  b90080           mov cx, 0x8000                           
  0000:0605  837e0c00         cmp word ptr [bp + 0xc], 0               
  0000:0609  750e             jne 0x619                                
  0000:060b  90               nop                                      
  0000:060c  90               nop                                      
  0000:060d  90               nop                                      
  0000:060e  3b4e0a           cmp cx, word ptr [bp + 0xa]              
  0000:0611  7606             jbe 0x619                                
  0000:0613  90               nop                                      
  0000:0614  90               nop                                      
  0000:0615  90               nop                                      
  0000:0616  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0000:0619  b440             mov ah, 0x40                             
  0000:061b  cd21             int 0x21                                 
  0000:061d  723a             jb 0x659                                 
  0000:061f  90               nop                                      
  0000:0620  90               nop                                      
  0000:0621  90               nop                                      
  0000:0622  3bc8             cmp cx, ax                               
  0000:0624  7533             jne 0x659                                
  0000:0626  90               nop                                      
  0000:0627  90               nop                                      
  0000:0628  90               nop                                      
  0000:0629  294e0a           sub word ptr [bp + 0xa], cx              
  0000:062c  835e0c00         sbb word ptr [bp + 0xc], 0               
  0000:0630  8bc1             mov ax, cx                               
  0000:0632  250f00           and ax, 0xf                              
  0000:0635  03d0             add dx, ax                               
  0000:0637  d1e9             shr cx, 1                                
  0000:0639  d1e9             shr cx, 1                                
  0000:063b  d1e9             shr cx, 1                                
  0000:063d  d1e9             shr cx, 1                                
  0000:063f  8cd8             mov ax, ds                               
  0000:0641  03c1             add ax, cx                               
  0000:0643  8ed8             mov ds, ax                               
  0000:0645  837e0a00         cmp word ptr [bp + 0xa], 0               
  0000:0649  75b7             jne 0x602                                
  0000:064b  837e0c00         cmp word ptr [bp + 0xc], 0               
  0000:064f  75b1             jne 0x602                                
  0000:0651  b80100           mov ax, 1                                
  0000:0654  1f               pop ds                                   
  0000:0655  5f               pop di                                   
  0000:0656  5e               pop si                                   
  0000:0657  5d               pop bp                                   
  0000:0658  cb               retf                                     
  0000:0659  33c0             xor ax, ax                               
  0000:065b  1f               pop ds                                   
  0000:065c  5f               pop di                                   
  0000:065d  5e               pop si                                   
  0000:065e  5d               pop bp                                   
  0000:065f  cb               retf                                     

proc_0000_0660:
  0000:0660  55               push bp                                  
  0000:0661  8bec             mov bp, sp                               
  0000:0663  57               push di                                  
  0000:0664  56               push si                                  
  0000:0665  1e               push ds                                  
  0000:0666  8cde             mov si, ds                               
  0000:0668  c55606           lds dx, ptr [bp + 6]                     
  0000:066b  32c0             xor al, al                               
  0000:066d  b43d             mov ah, 0x3d                             
  0000:066f  cd21             int 0x21                                 
  0000:0671  727b             jb 0x6ee                                 
  0000:0673  90               nop                                      
  0000:0674  90               nop                                      
  0000:0675  90               nop                                      
  0000:0676  8bd8             mov bx, ax                               
  0000:0678  b442             mov ah, 0x42                             
  0000:067a  b002             mov al, 2                                
  0000:067c  33c9             xor cx, cx                               
  0000:067e  33d2             xor dx, dx                               
  0000:0680  cd21             int 0x21                                 
  0000:0682  7266             jb 0x6ea                                 
  0000:0684  90               nop                                      
  0000:0685  90               nop                                      
  0000:0686  90               nop                                      
  0000:0687  c57e0a           lds di, ptr [bp + 0xa]                   
  0000:068a  0bff             or di, di                                
  0000:068c  7408             je 0x696                                 
  0000:068e  90               nop                                      
  0000:068f  90               nop                                      
  0000:0690  90               nop                                      
  0000:0691  8905             mov word ptr [di], ax                    
  0000:0693  895502           mov word ptr [di + 2], dx                
  0000:0696  8ede             mov ds, si                               
  0000:0698  8bf3             mov si, bx                               
  0000:069a  52               push dx                                  
  0000:069b  50               push ax                                  
  0000:069c  9ac007070c       lcall 0xc07, 0x7c0                       -> 0c07:07c0 [reloc]
  0000:06a1  83c404           add sp, 4                                
  0000:06a4  8bde             mov bx, si                               
  0000:06a6  0bc0             or ax, ax                                
  0000:06a8  750a             jne 0x6b4                                
  0000:06aa  90               nop                                      
  0000:06ab  90               nop                                      
  0000:06ac  90               nop                                      
  0000:06ad  0bd2             or dx, dx                                
  0000:06af  7439             je 0x6ea                                 
  0000:06b1  90               nop                                      
  0000:06b2  90               nop                                      
  0000:06b3  90               nop                                      
  0000:06b4  8bf8             mov di, ax                               
  0000:06b6  8bf2             mov si, dx                               
  0000:06b8  b442             mov ah, 0x42                             
  0000:06ba  32c0             xor al, al                               
  0000:06bc  33c9             xor cx, cx                               
  0000:06be  33d2             xor dx, dx                               
  0000:06c0  cd21             int 0x21                                 
  0000:06c2  8ede             mov ds, si                               
  0000:06c4  b90080           mov cx, 0x8000                           
  0000:06c7  8bd7             mov dx, di                               
  0000:06c9  b43f             mov ah, 0x3f                             
  0000:06cb  cd21             int 0x21                                 
  0000:06cd  3bc1             cmp ax, cx                               
  0000:06cf  750c             jne 0x6dd                                
  0000:06d1  90               nop                                      
  0000:06d2  90               nop                                      
  0000:06d3  90               nop                                      
  0000:06d4  8cd8             mov ax, ds                               
  0000:06d6  050008           add ax, 0x800                            
  0000:06d9  8ed8             mov ds, ax                               
  0000:06db  ebec             jmp 0x6c9                                
  0000:06dd  b43e             mov ah, 0x3e                             
  0000:06df  cd21             int 0x21                                 
  0000:06e1  8bd6             mov dx, si                               
  0000:06e3  8bc7             mov ax, di                               
  0000:06e5  1f               pop ds                                   
  0000:06e6  5e               pop si                                   
  0000:06e7  5f               pop di                                   
  0000:06e8  5d               pop bp                                   
  0000:06e9  cb               retf                                     
  0000:06ea  b43e             mov ah, 0x3e                             
  0000:06ec  cd21             int 0x21                                 
  0000:06ee  33c0             xor ax, ax                               
  0000:06f0  33d2             xor dx, dx                               
  0000:06f2  1f               pop ds                                   
  0000:06f3  5e               pop si                                   
  0000:06f4  5f               pop di                                   
  0000:06f5  5d               pop bp                                   
  0000:06f6  cb               retf                                     

proc_0000_06f7:
  0000:06f7  55               push bp                                  
  0000:06f8  8bec             mov bp, sp                               
  0000:06fa  57               push di                                  
  0000:06fb  56               push si                                  
  0000:06fc  1e               push ds                                  
  0000:06fd  8cde             mov si, ds                               
  0000:06ff  c55606           lds dx, ptr [bp + 6]                     
  0000:0702  32c0             xor al, al                               
  0000:0704  b43d             mov ah, 0x3d                             
  0000:0706  cd21             int 0x21                                 
  0000:0708  7303             jae 0x70d                                
  0000:070a  e99a00           jmp 0x7a7                                
  0000:070d  8bd8             mov bx, ax                               
  0000:070f  b442             mov ah, 0x42                             
  0000:0711  b002             mov al, 2                                
  0000:0713  33c9             xor cx, cx                               
  0000:0715  33d2             xor dx, dx                               
  0000:0717  cd21             int 0x21                                 
  0000:0719  7303             jae 0x71e                                
  0000:071b  e98500           jmp 0x7a3                                
  0000:071e  c57e0a           lds di, ptr [bp + 0xa]                   
  0000:0721  0bff             or di, di                                
  0000:0723  7408             je 0x72d                                 
  0000:0725  90               nop                                      
  0000:0726  90               nop                                      
  0000:0727  90               nop                                      
  0000:0728  8905             mov word ptr [di], ax                    
  0000:072a  895502           mov word ptr [di + 2], dx                
  0000:072d  8ede             mov ds, si                               
  0000:072f  8bf3             mov si, bx                               
  0000:0731  051000           add ax, 0x10                             
  0000:0734  83d200           adc dx, 0                                
  0000:0737  52               push dx                                  
  0000:0738  50               push ax                                  
  0000:0739  9ac007070c       lcall 0xc07, 0x7c0                       -> 0c07:07c0 [reloc]
  0000:073e  83c404           add sp, 4                                
  0000:0741  8bde             mov bx, si                               
  0000:0743  0bc0             or ax, ax                                
  0000:0745  750a             jne 0x751                                
  0000:0747  90               nop                                      
  0000:0748  90               nop                                      
  0000:0749  90               nop                                      
  0000:074a  0bd2             or dx, dx                                
  0000:074c  7455             je 0x7a3                                 
  0000:074e  90               nop                                      
  0000:074f  90               nop                                      
  0000:0750  90               nop                                      
  0000:0751  8bf8             mov di, ax                               
  0000:0753  8bf2             mov si, dx                               
  0000:0755  b442             mov ah, 0x42                             
  0000:0757  32c0             xor al, al                               
  0000:0759  33c9             xor cx, cx                               
  0000:075b  33d2             xor dx, dx                               
  0000:075d  cd21             int 0x21                                 
  0000:075f  8ede             mov ds, si                               
  0000:0761  b90080           mov cx, 0x8000                           
  0000:0764  8bd7             mov dx, di                               
  0000:0766  83c20f           add dx, 0xf                              
  0000:0769  83e2f0           and dx, 0xfff0                           
  0000:076c  b43f             mov ah, 0x3f                             
  0000:076e  cd21             int 0x21                                 
  0000:0770  3bc1             cmp ax, cx                               
  0000:0772  750c             jne 0x780                                
  0000:0774  90               nop                                      
  0000:0775  90               nop                                      
  0000:0776  90               nop                                      
  0000:0777  8cd8             mov ax, ds                               
  0000:0779  050008           add ax, 0x800                            
  0000:077c  8ed8             mov ds, ax                               
  0000:077e  ebec             jmp 0x76c                                
  0000:0780  b43e             mov ah, 0x3e                             
  0000:0782  cd21             int 0x21                                 
  0000:0784  8bd6             mov dx, si                               
  0000:0786  8bc7             mov ax, di                               
  0000:0788  050f00           add ax, 0xf                              
  0000:078b  d1e8             shr ax, 1                                
  0000:078d  d1e8             shr ax, 1                                
  0000:078f  d1e8             shr ax, 1                                
  0000:0791  d1e8             shr ax, 1                                
  0000:0793  03c2             add ax, dx                               
  0000:0795  c55e0e           lds bx, ptr [bp + 0xe]                   
  0000:0798  8907             mov word ptr [bx], ax                    
  0000:079a  8bd6             mov dx, si                               
  0000:079c  8bc7             mov ax, di                               
  0000:079e  1f               pop ds                                   
  0000:079f  5e               pop si                                   
  0000:07a0  5f               pop di                                   
  0000:07a1  5d               pop bp                                   
  0000:07a2  cb               retf                                     
  0000:07a3  b43e             mov ah, 0x3e                             
  0000:07a5  cd21             int 0x21                                 
  0000:07a7  33c0             xor ax, ax                               
  0000:07a9  33d2             xor dx, dx                               
  0000:07ab  1f               pop ds                                   
  0000:07ac  5e               pop si                                   
  0000:07ad  5f               pop di                                   
  0000:07ae  5d               pop bp                                   
  0000:07af  cb               retf                                     
  0000:07b0  b401             mov ah, 1                                
  0000:07b2  cd16             int 0x16                                 
  0000:07b4  7506             jne 0x7bc                                
  0000:07b6  90               nop                                      
  0000:07b7  90               nop                                      
  0000:07b8  90               nop                                      
  0000:07b9  33c0             xor ax, ax                               
  0000:07bb  cb               retf                                     
  0000:07bc  b80100           mov ax, 1                                
  0000:07bf  cb               retf                                     
  0000:07c0  b407             mov ah, 7                                
  0000:07c2  cd21             int 0x21                                 
  0000:07c4  32e4             xor ah, ah                               
  0000:07c6  0ac0             or al, al                                
  0000:07c8  750c             jne 0x7d6                                
  0000:07ca  90               nop                                      
  0000:07cb  90               nop                                      
  0000:07cc  90               nop                                      
  0000:07cd  b407             mov ah, 7                                
  0000:07cf  cd21             int 0x21                                 
  0000:07d1  32e4             xor ah, ah                               
  0000:07d3  050001           add ax, 0x100                            
  0000:07d6  cb               retf                                     

proc_0000_07d7:
  0000:07d7  55               push bp                                  
  0000:07d8  8bec             mov bp, sp                               
  0000:07da  06               push es                                  
  0000:07db  1e               push ds                                  
  0000:07dc  56               push si                                  
  0000:07dd  57               push di                                  
  0000:07de  c47e06           les di, ptr [bp + 6]                     
  0000:07e1  c5760a           lds si, ptr [bp + 0xa]                   
  0000:07e4  ac               lodsb al, byte ptr [si]                  
  0000:07e5  aa               stosb byte ptr es:[di], al               
  0000:07e6  0ac0             or al, al                                
  0000:07e8  75fa             jne 0x7e4                                
  0000:07ea  5f               pop di                                   
  0000:07eb  5e               pop si                                   
  0000:07ec  1f               pop ds                                   
  0000:07ed  07               pop es                                   
  0000:07ee  5d               pop bp                                   
  0000:07ef  cb               retf                                     

proc_0000_07f0:
  0000:07f0  55               push bp                                  
  0000:07f1  8bec             mov bp, sp                               
  0000:07f3  06               push es                                  
  0000:07f4  1e               push ds                                  
  0000:07f5  56               push si                                  
  0000:07f6  57               push di                                  
  0000:07f7  c47e06           les di, ptr [bp + 6]                     
  0000:07fa  33c0             xor ax, ax                               
  0000:07fc  b9ffff           mov cx, 0xffff                           
  0000:07ff  f2ae             repne scasb al, byte ptr es:[di]         
  0000:0801  4f               dec di                                   
  0000:0802  c5760a           lds si, ptr [bp + 0xa]                   
  0000:0805  ac               lodsb al, byte ptr [si]                  
  0000:0806  aa               stosb byte ptr es:[di], al               
  0000:0807  0ac0             or al, al                                
  0000:0809  75fa             jne 0x805                                
  0000:080b  5f               pop di                                   
  0000:080c  5e               pop si                                   
  0000:080d  1f               pop ds                                   
  0000:080e  07               pop es                                   
  0000:080f  5d               pop bp                                   
  0000:0810  cb               retf                                     

proc_0000_0811:
  0000:0811  55               push bp                                  
  0000:0812  8bec             mov bp, sp                               
  0000:0814  8b4606           mov ax, word ptr [bp + 6]                
  0000:0817  8b5608           mov dx, word ptr [bp + 8]                
  0000:081a  d1fa             sar dx, 1                                
  0000:081c  d1d8             rcr ax, 1                                
  0000:081e  d1fa             sar dx, 1                                
  0000:0820  d1d8             rcr ax, 1                                
  0000:0822  d1fa             sar dx, 1                                
  0000:0824  d1d8             rcr ax, 1                                
  0000:0826  d1fa             sar dx, 1                                
  0000:0828  d1d8             rcr ax, 1                                
  0000:082a  0bd2             or dx, dx                                
  0000:082c  750f             jne 0x83d                                
  0000:082e  90               nop                                      
  0000:082f  90               nop                                      
  0000:0830  90               nop                                      
  0000:0831  8bd8             mov bx, ax                               
  0000:0833  43               inc bx                                   
  0000:0834  b448             mov ah, 0x48                             
  0000:0836  cd21             int 0x21                                 
  0000:0838  7305             jae 0x83f                                
  0000:083a  90               nop                                      
  0000:083b  90               nop                                      
  0000:083c  90               nop                                      
  0000:083d  33c0             xor ax, ax                               
  0000:083f  8bd0             mov dx, ax                               
  0000:0841  33c0             xor ax, ax                               
  0000:0843  5d               pop bp                                   
  0000:0844  cb               retf                                     

proc_0000_0845:
  0000:0845  55               push bp                                  
  0000:0846  8bec             mov bp, sp                               
  0000:0848  06               push es                                  
  0000:0849  8b5e08           mov bx, word ptr [bp + 8]                
  0000:084c  8ec3             mov es, bx                               
  0000:084e  b449             mov ah, 0x49                             
  0000:0850  cd21             int 0x21                                 
  0000:0852  7306             jae 0x85a                                
  0000:0854  90               nop                                      
  0000:0855  90               nop                                      
  0000:0856  90               nop                                      
  0000:0857  b8ffff           mov ax, 0xffff                           
  0000:085a  07               pop es                                   
  0000:085b  5d               pop bp                                   
  0000:085c  cb               retf                                     

proc_0000_085d:
  0000:085d  55               push bp                                  
  0000:085e  8bec             mov bp, sp                               
  0000:0860  1e               push ds                                  
  0000:0861  56               push si                                  
  0000:0862  c57606           lds si, ptr [bp + 6]                     
  0000:0865  b30f             mov bl, 0xf                              
  0000:0867  ac               lodsb al, byte ptr [si]                  
  0000:0868  0ac0             or al, al                                
  0000:086a  7416             je 0x882                                 
  0000:086c  90               nop                                      
  0000:086d  90               nop                                      
  0000:086e  90               nop                                      
  0000:086f  3c0a             cmp al, 0xa                              
  0000:0871  7509             jne 0x87c                                
  0000:0873  90               nop                                      
  0000:0874  90               nop                                      
  0000:0875  90               nop                                      
  0000:0876  b40e             mov ah, 0xe                              
  0000:0878  cd10             int 0x10                                 
  0000:087a  b00d             mov al, 0xd                              
  0000:087c  b40e             mov ah, 0xe                              
  0000:087e  cd10             int 0x10                                 
  0000:0880  ebe5             jmp 0x867                                
  0000:0882  5e               pop si                                   
  0000:0883  1f               pop ds                                   
  0000:0884  5d               pop bp                                   
  0000:0885  cb               retf                                     
  0000:0886  1e               push ds                                  
  0000:0887  33c0             xor ax, ax                               
  0000:0889  8ed8             mov ds, ax                               
  0000:088b  a12000           mov ax, word ptr [0x20]                  
  0000:088e  8b162200         mov dx, word ptr [0x22]                  
  0000:0892  1f               pop ds                                   
  0000:0893  cb               retf                                     

proc_0000_0894:
  0000:0894  55               push bp                                  
  0000:0895  8bec             mov bp, sp                               
  0000:0897  fa               cli                                      
  0000:0898  1e               push ds                                  
  0000:0899  33c0             xor ax, ax                               
  0000:089b  8ed8             mov ds, ax                               
  0000:089d  8b4606           mov ax, word ptr [bp + 6]                
  0000:08a0  a32000           mov word ptr [0x20], ax                  
  0000:08a3  8b4608           mov ax, word ptr [bp + 8]                
  0000:08a6  a32200           mov word ptr [0x22], ax                  
  0000:08a9  8b560a           mov dx, word ptr [bp + 0xa]              
  0000:08ac  b036             mov al, 0x36                             
  0000:08ae  e643             out 0x43, al                             
  0000:08b0  eb00             jmp 0x8b2                                
  0000:08b2  8bc2             mov ax, dx                               
  0000:08b4  e640             out 0x40, al                             
  0000:08b6  eb00             jmp 0x8b8                                
  0000:08b8  8ac4             mov al, ah                               
  0000:08ba  e640             out 0x40, al                             
  0000:08bc  fb               sti                                      
  0000:08bd  1f               pop ds                                   
  0000:08be  8be5             mov sp, bp                               
  0000:08c0  5d               pop bp                                   
  0000:08c1  cb               retf                                     

proc_0000_08c2:
  0000:08c2  55               push bp                                  
  0000:08c3  8bec             mov bp, sp                               
  0000:08c5  1e               push ds                                  
  0000:08c6  c55606           lds dx, ptr [bp + 6]                     
  0000:08c9  b441             mov ah, 0x41                             
  0000:08cb  cd21             int 0x21                                 
  0000:08cd  7307             jae 0x8d6                                
  0000:08cf  90               nop                                      
  0000:08d0  90               nop                                      
  0000:08d1  90               nop                                      
  0000:08d2  33c0             xor ax, ax                               
  0000:08d4  eb03             jmp 0x8d9                                
  0000:08d6  b80100           mov ax, 1                                
  0000:08d9  1f               pop ds                                   
  0000:08da  8be5             mov sp, bp                               
  0000:08dc  5d               pop bp                                   
  0000:08dd  cb               retf                                     

proc_0000_08de:
  0000:08de  55               push bp                                  
  0000:08df  8bec             mov bp, sp                               
  0000:08e1  06               push es                                  
  0000:08e2  57               push di                                  
  0000:08e3  c47e06           les di, ptr [bp + 6]                     
  0000:08e6  33c0             xor ax, ax                               
  0000:08e8  b9ffff           mov cx, 0xffff                           
  0000:08eb  f2ae             repne scasb al, byte ptr es:[di]         
  0000:08ed  f7d1             not cx                                   
  0000:08ef  8bc1             mov ax, cx                               
  0000:08f1  48               dec ax                                   
  0000:08f2  5f               pop di                                   
  0000:08f3  07               pop es                                   
  0000:08f4  8be5             mov sp, bp                               
  0000:08f6  5d               pop bp                                   
  0000:08f7  cb               retf                                     

proc_0000_08f8:
  0000:08f8  55               push bp                                  
  0000:08f9  8bec             mov bp, sp                               
  0000:08fb  06               push es                                  
  0000:08fc  1e               push ds                                  
  0000:08fd  56               push si                                  
  0000:08fe  57               push di                                  
  0000:08ff  fc               cld                                      
  0000:0900  33c0             xor ax, ax                               
  0000:0902  c57606           lds si, ptr [bp + 6]                     
  0000:0905  1e               push ds                                  
  0000:0906  07               pop es                                   
  0000:0907  8bfe             mov di, si                               
  0000:0909  b9ffff           mov cx, 0xffff                           
  0000:090c  33c0             xor ax, ax                               
  0000:090e  f2ae             repne scasb al, byte ptr es:[di]         
  0000:0910  f7d1             not cx                                   
  0000:0912  8bfe             mov di, si                               
  0000:0914  ac               lodsb al, byte ptr [si]                  
  0000:0915  3c61             cmp al, 0x61                             
  0000:0917  7c0c             jl 0x925                                 
  0000:0919  90               nop                                      
  0000:091a  90               nop                                      
  0000:091b  90               nop                                      
  0000:091c  3c7a             cmp al, 0x7a                             
  0000:091e  7f05             jg 0x925                                 
  0000:0920  90               nop                                      
  0000:0921  90               nop                                      
  0000:0922  90               nop                                      
  0000:0923  2c20             sub al, 0x20                             
  0000:0925  aa               stosb byte ptr es:[di], al               
  0000:0926  e2ec             loop 0x914                               
  0000:0928  5f               pop di                                   
  0000:0929  5e               pop si                                   
  0000:092a  1f               pop ds                                   
  0000:092b  07               pop es                                   
  0000:092c  8be5             mov sp, bp                               
  0000:092e  5d               pop bp                                   
  0000:092f  cb               retf                                     

proc_0000_0930:
  0000:0930  55               push bp                                  
  0000:0931  8bec             mov bp, sp                               
  0000:0933  06               push es                                  
  0000:0934  1e               push ds                                  
  0000:0935  56               push si                                  
  0000:0936  57               push di                                  
  0000:0937  fc               cld                                      
  0000:0938  c57606           lds si, ptr [bp + 6]                     
  0000:093b  c47e0a           les di, ptr [bp + 0xa]                   
  0000:093e  57               push di                                  
  0000:093f  b9ffff           mov cx, 0xffff                           
  0000:0942  33c0             xor ax, ax                               
  0000:0944  f2ae             repne scasb al, byte ptr es:[di]         
  0000:0946  f7d1             not cx                                   
  0000:0948  5f               pop di                                   
  0000:0949  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  0000:094b  33db             xor bx, bx                               
  0000:094d  8a44ff           mov al, byte ptr [si - 1]                
  0000:0950  268a5dff         mov bl, byte ptr es:[di - 1]             
  0000:0954  2bc3             sub ax, bx                               
  0000:0956  5f               pop di                                   
  0000:0957  5e               pop si                                   
  0000:0958  1f               pop ds                                   
  0000:0959  07               pop es                                   
  0000:095a  8be5             mov sp, bp                               
  0000:095c  5d               pop bp                                   
  0000:095d  cb               retf                                     

proc_0000_095e:
  0000:095e  55               push bp                                  
  0000:095f  8bec             mov bp, sp                               
  0000:0961  1e               push ds                                  
  0000:0962  c55606           lds dx, ptr [bp + 6]                     
  0000:0965  32c0             xor al, al                               
  0000:0967  b43d             mov ah, 0x3d                             
  0000:0969  cd21             int 0x21                                 
  0000:096b  7211             jb 0x97e                                 
  0000:096d  90               nop                                      
  0000:096e  90               nop                                      
  0000:096f  90               nop                                      
  0000:0970  8bd8             mov bx, ax                               
  0000:0972  b43e             mov ah, 0x3e                             
  0000:0974  cd21             int 0x21                                 
  0000:0976  b80100           mov ax, 1                                
  0000:0979  1f               pop ds                                   
  0000:097a  8be5             mov sp, bp                               
  0000:097c  5d               pop bp                                   
  0000:097d  cb               retf                                     
  0000:097e  33c0             xor ax, ax                               
  0000:0980  ebf7             jmp 0x979                                

proc_0000_0982:
  0000:0982  55               push bp                                  
  0000:0983  8bec             mov bp, sp                               
  0000:0985  06               push es                                  
  0000:0986  1e               push ds                                  
  0000:0987  56               push si                                  
  0000:0988  57               push di                                  
  0000:0989  fc               cld                                      
  0000:098a  c5760c           lds si, ptr [bp + 0xc]                   
  0000:098d  837e0a00         cmp word ptr [bp + 0xa], 0               
  0000:0991  751b             jne 0x9ae                                
  0000:0993  90               nop                                      
  0000:0994  90               nop                                      
  0000:0995  90               nop                                      
  0000:0996  0bf6             or si, si                                
  0000:0998  7503             jne 0x99d                                
  0000:099a  e99e00           jmp 0xa3b                                
  0000:099d  8bfe             mov di, si                               
  0000:099f  1e               push ds                                  
  0000:09a0  07               pop es                                   
  0000:09a1  33c0             xor ax, ax                               
  0000:09a3  b9ffff           mov cx, 0xffff                           
  0000:09a6  f2ae             repne scasb al, byte ptr es:[di]         
  0000:09a8  f7d9             neg cx                                   
  0000:09aa  49               dec cx                                   
  0000:09ab  894e0a           mov word ptr [bp + 0xa], cx              
  0000:09ae  8b4608           mov ax, word ptr [bp + 8]                
  0000:09b1  0bc0             or ax, ax                                
  0000:09b3  7903             jns 0x9b8                                
  0000:09b5  e98300           jmp 0xa3b                                
  0000:09b8  3d1900           cmp ax, 0x19                             
  0000:09bb  7f7e             jg 0xa3b                                 
  0000:09bd  90               nop                                      
  0000:09be  90               nop                                      
  0000:09bf  90               nop                                      
  0000:09c0  8b4606           mov ax, word ptr [bp + 6]                
  0000:09c3  3d4f00           cmp ax, 0x4f                             
  0000:09c6  7f73             jg 0xa3b                                 
  0000:09c8  90               nop                                      
  0000:09c9  90               nop                                      
  0000:09ca  90               nop                                      
  0000:09cb  0bc0             or ax, ax                                
  0000:09cd  7920             jns 0x9ef                                
  0000:09cf  90               nop                                      
  0000:09d0  90               nop                                      
  0000:09d1  90               nop                                      
  0000:09d2  f7d8             neg ax                                   
  0000:09d4  0bf6             or si, si                                
  0000:09d6  7405             je 0x9dd                                 
  0000:09d8  90               nop                                      
  0000:09d9  90               nop                                      
  0000:09da  90               nop                                      
  0000:09db  03f0             add si, ax                               
  0000:09dd  29460a           sub word ptr [bp + 0xa], ax              
  0000:09e0  7859             js 0xa3b                                 
  0000:09e2  90               nop                                      
  0000:09e3  90               nop                                      
  0000:09e4  90               nop                                      
  0000:09e5  7454             je 0xa3b                                 
  0000:09e7  90               nop                                      
  0000:09e8  90               nop                                      
  0000:09e9  90               nop                                      
  0000:09ea  c746060000       mov word ptr [bp + 6], 0                 
  0000:09ef  03460a           add ax, word ptr [bp + 0xa]              
  0000:09f2  48               dec ax                                   
  0000:09f3  3d4f00           cmp ax, 0x4f                             
  0000:09f6  7e0e             jle 0xa06                                
  0000:09f8  90               nop                                      
  0000:09f9  90               nop                                      
  0000:09fa  90               nop                                      
  0000:09fb  2d4f00           sub ax, 0x4f                             
  0000:09fe  29460a           sub word ptr [bp + 0xa], ax              
  0000:0a01  7838             js 0xa3b                                 
  0000:0a03  90               nop                                      
  0000:0a04  90               nop                                      
  0000:0a05  90               nop                                      
  0000:0a06  b800b8           mov ax, 0xb800                           
  0000:0a09  8ec0             mov es, ax                               
  0000:0a0b  b8a000           mov ax, 0xa0                             
  0000:0a0e  f76608           mul word ptr [bp + 8]                    
  0000:0a11  8bf8             mov di, ax                               
  0000:0a13  8b4606           mov ax, word ptr [bp + 6]                
  0000:0a16  d1e0             shl ax, 1                                
  0000:0a18  03f8             add di, ax                               
  0000:0a1a  8b4610           mov ax, word ptr [bp + 0x10]             
  0000:0a1d  8ae0             mov ah, al                               
  0000:0a1f  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0000:0a22  0bf6             or si, si                                
  0000:0a24  7411             je 0xa37                                 
  0000:0a26  90               nop                                      
  0000:0a27  90               nop                                      
  0000:0a28  90               nop                                      
  0000:0a29  ac               lodsb al, byte ptr [si]                  
  0000:0a2a  0ac0             or al, al                                
  0000:0a2c  7409             je 0xa37                                 
  0000:0a2e  90               nop                                      
  0000:0a2f  90               nop                                      
  0000:0a30  90               nop                                      
  0000:0a31  ab               stosw word ptr es:[di], ax               
  0000:0a32  e2f5             loop 0xa29                               
  0000:0a34  eb05             jmp 0xa3b                                
  0000:0a36  90               nop                                      
  0000:0a37  b020             mov al, 0x20                             
  0000:0a39  f3ab             rep stosw word ptr es:[di], ax           
  0000:0a3b  5f               pop di                                   
  0000:0a3c  5e               pop si                                   
  0000:0a3d  1f               pop ds                                   
  0000:0a3e  07               pop es                                   
  0000:0a3f  8be5             mov sp, bp                               
  0000:0a41  5d               pop bp                                   
  0000:0a42  cb               retf                                     

proc_0000_0a43:
  0000:0a43  55               push bp                                  
  0000:0a44  8bec             mov bp, sp                               
  0000:0a46  06               push es                                  
  0000:0a47  1e               push ds                                  
  0000:0a48  56               push si                                  
  0000:0a49  57               push di                                  
  0000:0a4a  fc               cld                                      
  0000:0a4b  b8a000           mov ax, 0xa0                             
  0000:0a4e  f76608           mul word ptr [bp + 8]                    
  0000:0a51  8bf8             mov di, ax                               
  0000:0a53  8b4606           mov ax, word ptr [bp + 6]                
  0000:0a56  d1e0             shl ax, 1                                
  0000:0a58  03f8             add di, ax                               
  0000:0a5a  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0000:0a5d  b800b8           mov ax, 0xb800                           
  0000:0a60  8ec0             mov es, ax                               
  0000:0a62  8b460c           mov ax, word ptr [bp + 0xc]              
  0000:0a65  47               inc di                                   
  0000:0a66  aa               stosb byte ptr es:[di], al               
  0000:0a67  47               inc di                                   
  0000:0a68  e2fc             loop 0xa66                               
  0000:0a6a  5f               pop di                                   
  0000:0a6b  5e               pop si                                   
  0000:0a6c  1f               pop ds                                   
  0000:0a6d  07               pop es                                   
  0000:0a6e  8be5             mov sp, bp                               
  0000:0a70  5d               pop bp                                   
  0000:0a71  cb               retf                                     

proc_0000_0a72:
  0000:0a72  55               push bp                                  
  0000:0a73  8bec             mov bp, sp                               
  0000:0a75  8b4608           mov ax, word ptr [bp + 8]                
  0000:0a78  8b5606           mov dx, word ptr [bp + 6]                
  0000:0a7b  8af0             mov dh, al                               
  0000:0a7d  b402             mov ah, 2                                
  0000:0a7f  b700             mov bh, 0                                
  0000:0a81  cd10             int 0x10                                 
  0000:0a83  8be5             mov sp, bp                               
  0000:0a85  5d               pop bp                                   
  0000:0a86  cb               retf                                     

proc_0000_0a87:
  0000:0a87  55               push bp                                  
  0000:0a88  8bec             mov bp, sp                               
  0000:0a8a  06               push es                                  
  0000:0a8b  1e               push ds                                  
  0000:0a8c  56               push si                                  
  0000:0a8d  57               push di                                  
  0000:0a8e  c47e06           les di, ptr [bp + 6]                     
  0000:0a91  c5760a           lds si, ptr [bp + 0xa]                   
  0000:0a94  8b4e0e           mov cx, word ptr [bp + 0xe]              
  0000:0a97  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0000:0a99  5f               pop di                                   
  0000:0a9a  5e               pop si                                   
  0000:0a9b  1f               pop ds                                   
  0000:0a9c  07               pop es                                   
  0000:0a9d  5d               pop bp                                   
  0000:0a9e  cb               retf                                     

proc_0000_0a9f:
  0000:0a9f  55               push bp                                  
  0000:0aa0  8bec             mov bp, sp                               
  0000:0aa2  8b4608           mov ax, word ptr [bp + 8]                
  0000:0aa5  33d2             xor dx, dx                               
  0000:0aa7  d1e0             shl ax, 1                                
  0000:0aa9  d1d2             rcl dx, 1                                
  0000:0aab  d1e0             shl ax, 1                                
  0000:0aad  d1d2             rcl dx, 1                                
  0000:0aaf  d1e0             shl ax, 1                                
  0000:0ab1  d1d2             rcl dx, 1                                
  0000:0ab3  d1e0             shl ax, 1                                
  0000:0ab5  d1d2             rcl dx, 1                                
  0000:0ab7  034606           add ax, word ptr [bp + 6]                
  0000:0aba  83d200           adc dx, 0                                
  0000:0abd  03460a           add ax, word ptr [bp + 0xa]              
  0000:0ac0  13560c           adc dx, word ptr [bp + 0xc]              
  0000:0ac3  50               push ax                                  
  0000:0ac4  d1fa             sar dx, 1                                
  0000:0ac6  d1d8             rcr ax, 1                                
  0000:0ac8  d1fa             sar dx, 1                                
  0000:0aca  d1d8             rcr ax, 1                                
  0000:0acc  d1fa             sar dx, 1                                
  0000:0ace  d1d8             rcr ax, 1                                
  0000:0ad0  d1fa             sar dx, 1                                
  0000:0ad2  d1d8             rcr ax, 1                                
  0000:0ad4  8bd0             mov dx, ax                               
  0000:0ad6  58               pop ax                                   
  0000:0ad7  250f00           and ax, 0xf                              
  0000:0ada  8be5             mov sp, bp                               
  0000:0adc  5d               pop bp                                   
  0000:0add  cb               retf                                     

proc_0000_0ade:
  0000:0ade  55               push bp                                  
  0000:0adf  8bec             mov bp, sp                               
  0000:0ae1  06               push es                                  
  0000:0ae2  1e               push ds                                  
  0000:0ae3  56               push si                                  
  0000:0ae4  57               push di                                  
  0000:0ae5  fc               cld                                      
  0000:0ae6  c47e06           les di, ptr [bp + 6]                     
  0000:0ae9  57               push di                                  
  0000:0aea  06               push es                                  
  0000:0aeb  1f               pop ds                                   
  0000:0aec  b419             mov ah, 0x19                             
  0000:0aee  cd21             int 0x21                                 
  0000:0af0  0441             add al, 0x41                             
  0000:0af2  aa               stosb byte ptr es:[di], al               
  0000:0af3  b03a             mov al, 0x3a                             
  0000:0af5  aa               stosb byte ptr es:[di], al               
  0000:0af6  b05c             mov al, 0x5c                             
  0000:0af8  aa               stosb byte ptr es:[di], al               
  0000:0af9  32d2             xor dl, dl                               
  0000:0afb  8bf7             mov si, di                               
  0000:0afd  b447             mov ah, 0x47                             
  0000:0aff  cd21             int 0x21                                 
  0000:0b01  5f               pop di                                   
  0000:0b02  b9ffff           mov cx, 0xffff                           
  0000:0b05  33c0             xor ax, ax                               
  0000:0b07  f2ae             repne scasb al, byte ptr es:[di]         
  0000:0b09  f7d1             not cx                                   
  0000:0b0b  49               dec cx                                   
  0000:0b0c  8bc1             mov ax, cx                               
  0000:0b0e  5f               pop di                                   
  0000:0b0f  5e               pop si                                   
  0000:0b10  1f               pop ds                                   
  0000:0b11  07               pop es                                   
  0000:0b12  8be5             mov sp, bp                               
  0000:0b14  5d               pop bp                                   
  0000:0b15  cb               retf                                     

proc_0000_0b16:
  0000:0b16  55               push bp                                  
  0000:0b17  8bec             mov bp, sp                               
  0000:0b19  06               push es                                  
  0000:0b1a  1e               push ds                                  
  0000:0b1b  56               push si                                  
  0000:0b1c  57               push di                                  
  0000:0b1d  fc               cld                                      
  0000:0b1e  8cc8             mov ax, cs                               
  0000:0b20  2d1000           sub ax, 0x10                             
  0000:0b23  8ed8             mov ds, ax                               
  0000:0b25  8e062c00         mov es, word ptr [0x2c]                  
  0000:0b29  8e1e2c00         mov ds, word ptr [0x2c]                  
  0000:0b2d  33ff             xor di, di                               
  0000:0b2f  b9ffff           mov cx, 0xffff                           
  0000:0b32  b80001           mov ax, 0x100                            
  0000:0b35  81ff0004         cmp di, 0x400                            
  0000:0b39  7d3c             jge 0xb77                                
  0000:0b3b  90               nop                                      
  0000:0b3c  90               nop                                      
  0000:0b3d  90               nop                                      
  0000:0b3e  f2ae             repne scasb al, byte ptr es:[di]         
  0000:0b40  ae               scasb al, byte ptr es:[di]               
  0000:0b41  75f2             jne 0xb35                                
  0000:0b43  86c4             xchg ah, al                              
  0000:0b45  ae               scasb al, byte ptr es:[di]               
  0000:0b46  86c4             xchg ah, al                              
  0000:0b48  75eb             jne 0xb35                                
  0000:0b4a  ae               scasb al, byte ptr es:[di]               
  0000:0b4b  752a             jne 0xb77                                
  0000:0b4d  90               nop                                      
  0000:0b4e  90               nop                                      
  0000:0b4f  90               nop                                      
  0000:0b50  8bf7             mov si, di                               
  0000:0b52  8cc8             mov ax, cs                               
  0000:0b54  8ec0             mov es, ax                               
  0000:0b56  c47e06           les di, ptr [bp + 6]                     
  0000:0b59  57               push di                                  
  0000:0b5a  b94300           mov cx, 0x43                             
  0000:0b5d  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0000:0b5f  33c0             xor ax, ax                               
  0000:0b61  aa               stosb byte ptr es:[di], al               
  0000:0b62  5f               pop di                                   
  0000:0b63  b9ffff           mov cx, 0xffff                           
  0000:0b66  f2ae             repne scasb al, byte ptr es:[di]         
  0000:0b68  f7d1             not cx                                   
  0000:0b6a  06               push es                                  
  0000:0b6b  1f               pop ds                                   
  0000:0b6c  fd               std                                      
  0000:0b6d  b05c             mov al, 0x5c                             
  0000:0b6f  f2ae             repne scasb al, byte ptr es:[di]         
  0000:0b71  fc               cld                                      
  0000:0b72  7411             je 0xb85                                 
  0000:0b74  90               nop                                      
  0000:0b75  90               nop                                      
  0000:0b76  90               nop                                      
  0000:0b77  c44606           les ax, ptr [bp + 6]                     
  0000:0b7a  06               push es                                  
  0000:0b7b  50               push ax                                  
  0000:0b7c  0e               push cs                                  
  0000:0b7d  e85eff           call 0xade                               -> 0000:0ade
  0000:0b80  83c404           add sp, 4                                
  0000:0b83  eb07             jmp 0xb8c                                
  0000:0b85  47               inc di                                   
  0000:0b86  32c0             xor al, al                               
  0000:0b88  aa               stosb byte ptr es:[di], al               
  0000:0b89  41               inc cx                                   
  0000:0b8a  8bc1             mov ax, cx                               
  0000:0b8c  5f               pop di                                   
  0000:0b8d  5e               pop si                                   
  0000:0b8e  1f               pop ds                                   
  0000:0b8f  07               pop es                                   
  0000:0b90  8be5             mov sp, bp                               
  0000:0b92  5d               pop bp                                   
  0000:0b93  cb               retf                                     

proc_0000_0b94:
  0000:0b94  55               push bp                                  
  0000:0b95  8bec             mov bp, sp                               
  0000:0b97  1e               push ds                                  
  0000:0b98  c57606           lds si, ptr [bp + 6]                     
  0000:0b9b  807c013a         cmp byte ptr [si + 1], 0x3a              
  0000:0b9f  7532             jne 0xbd3                                
  0000:0ba1  90               nop                                      
  0000:0ba2  90               nop                                      
  0000:0ba3  90               nop                                      
  0000:0ba4  ac               lodsb al, byte ptr [si]                  
  0000:0ba5  3c61             cmp al, 0x61                             
  0000:0ba7  720c             jb 0xbb5                                 
  0000:0ba9  90               nop                                      
  0000:0baa  90               nop                                      
  0000:0bab  90               nop                                      
  0000:0bac  3c7a             cmp al, 0x7a                             
  0000:0bae  7705             ja 0xbb5                                 
  0000:0bb0  90               nop                                      
  0000:0bb1  90               nop                                      
  0000:0bb2  90               nop                                      
  0000:0bb3  2c20             sub al, 0x20                             
  0000:0bb5  3c41             cmp al, 0x41                             
  0000:0bb7  722d             jb 0xbe6                                 
  0000:0bb9  90               nop                                      
  0000:0bba  90               nop                                      
  0000:0bbb  90               nop                                      
  0000:0bbc  3c5a             cmp al, 0x5a                             
  0000:0bbe  7726             ja 0xbe6                                 
  0000:0bc0  90               nop                                      
  0000:0bc1  90               nop                                      
  0000:0bc2  90               nop                                      
  0000:0bc3  2c41             sub al, 0x41                             
  0000:0bc5  32e4             xor ah, ah                               
  0000:0bc7  8bd0             mov dx, ax                               
  0000:0bc9  b40e             mov ah, 0xe                              
  0000:0bcb  cd21             int 0x21                                 
  0000:0bcd  7217             jb 0xbe6                                 
  0000:0bcf  90               nop                                      
  0000:0bd0  90               nop                                      
  0000:0bd1  90               nop                                      
  0000:0bd2  46               inc si                                   
  0000:0bd3  8bd6             mov dx, si                               
  0000:0bd5  b43b             mov ah, 0x3b                             
  0000:0bd7  cd21             int 0x21                                 
  0000:0bd9  720b             jb 0xbe6                                 
  0000:0bdb  90               nop                                      
  0000:0bdc  90               nop                                      
  0000:0bdd  90               nop                                      
  0000:0bde  b80100           mov ax, 1                                
  0000:0be1  1f               pop ds                                   
  0000:0be2  8be5             mov sp, bp                               
  0000:0be4  5d               pop bp                                   
  0000:0be5  cb               retf                                     
  0000:0be6  33c0             xor ax, ax                               
  0000:0be8  ebf7             jmp 0xbe1                                

proc_0000_0bea:
  0000:0bea  55               push bp                                  
  0000:0beb  8bec             mov bp, sp                               
  0000:0bed  06               push es                                  
  0000:0bee  1e               push ds                                  
  0000:0bef  56               push si                                  
  0000:0bf0  57               push di                                  
  0000:0bf1  fc               cld                                      
  0000:0bf2  8cc8             mov ax, cs                               
  0000:0bf4  2d1000           sub ax, 0x10                             
  0000:0bf7  8ed8             mov ds, ax                               
  0000:0bf9  ba8000           mov dx, 0x80                             
  0000:0bfc  b41a             mov ah, 0x1a                             
  0000:0bfe  cd21             int 0x21                                 
  0000:0c00  c55606           lds dx, ptr [bp + 6]                     
  0000:0c03  0bd2             or dx, dx                                
  0000:0c05  750c             jne 0xc13                                
  0000:0c07  90               nop                                      
  0000:0c08  90               nop                                      
  0000:0c09  90               nop                                      
  0000:0c0a  8cd8             mov ax, ds                               
  0000:0c0c  0bc0             or ax, ax                                
  0000:0c0e  7434             je 0xc44                                 
  0000:0c10  90               nop                                      
  0000:0c11  90               nop                                      
  0000:0c12  90               nop                                      
  0000:0c13  33c9             xor cx, cx                               
  0000:0c15  b44e             mov ah, 0x4e                             
  0000:0c17  cd21             int 0x21                                 
  0000:0c19  7307             jae 0xc22                                
  0000:0c1b  90               nop                                      
  0000:0c1c  90               nop                                      
  0000:0c1d  90               nop                                      
  0000:0c1e  33c0             xor ax, ax                               
  0000:0c20  eb03             jmp 0xc25                                
  0000:0c22  b80100           mov ax, 1                                
  0000:0c25  50               push ax                                  
  0000:0c26  8cc8             mov ax, cs                               
  0000:0c28  2d1000           sub ax, 0x10                             
  0000:0c2b  8ed8             mov ds, ax                               
  0000:0c2d  be8000           mov si, 0x80                             
  0000:0c30  8d741e           lea si, [si + 0x1e]                      
  0000:0c33  b90d00           mov cx, 0xd                              
  0000:0c36  c47e0a           les di, ptr [bp + 0xa]                   
  0000:0c39  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0000:0c3b  58               pop ax                                   
  0000:0c3c  5f               pop di                                   
  0000:0c3d  5e               pop si                                   
  0000:0c3e  1f               pop ds                                   
  0000:0c3f  07               pop es                                   
  0000:0c40  8be5             mov sp, bp                               
  0000:0c42  5d               pop bp                                   
  0000:0c43  cb               retf                                     
  0000:0c44  b44f             mov ah, 0x4f                             
  0000:0c46  cd21             int 0x21                                 
  0000:0c48  73d8             jae 0xc22                                
  0000:0c4a  33c0             xor ax, ax                               
  0000:0c4c  ebd7             jmp 0xc25                                

proc_0000_0c4e:
  0000:0c4e  55               push bp                                  
  0000:0c4f  8bec             mov bp, sp                               
  0000:0c51  b80207           mov ax, 0x702                            
  0000:0c54  8b5e06           mov bx, word ptr [bp + 6]                
  0000:0c57  cd66             int 0x66                                 
  0000:0c59  8be5             mov sp, bp                               
  0000:0c5b  5d               pop bp                                   
  0000:0c5c  cb               retf                                     

proc_0000_0c5d:
  0000:0c5d  55               push bp                                  
  0000:0c5e  8bec             mov bp, sp                               
  0000:0c60  b80307           mov ax, 0x703                            
  0000:0c63  8b5e06           mov bx, word ptr [bp + 6]                
  0000:0c66  8b4e08           mov cx, word ptr [bp + 8]                
  0000:0c69  cd66             int 0x66                                 
  0000:0c6b  8be5             mov sp, bp                               
  0000:0c6d  5d               pop bp                                   
  0000:0c6e  cb               retf                                     

proc_0000_0c6f:
  0000:0c6f  55               push bp                                  
  0000:0c70  8bec             mov bp, sp                               
  0000:0c72  57               push di                                  
  0000:0c73  56               push si                                  
  0000:0c74  b80407           mov ax, 0x704                            
  0000:0c77  8b5e06           mov bx, word ptr [bp + 6]                
  0000:0c7a  8b4e08           mov cx, word ptr [bp + 8]                
  0000:0c7d  8b760a           mov si, word ptr [bp + 0xa]              
  0000:0c80  8b7e0c           mov di, word ptr [bp + 0xc]              
  0000:0c83  cd66             int 0x66                                 
  0000:0c85  5e               pop si                                   
  0000:0c86  5f               pop di                                   
  0000:0c87  8be5             mov sp, bp                               
  0000:0c89  5d               pop bp                                   
  0000:0c8a  cb               retf                                     
  0000:0c8b  b80507           mov ax, 0x705                            
  0000:0c8e  cd66             int 0x66                                 
  0000:0c90  cb               retf                                     

proc_0000_0c91:
  0000:0c91  55               push bp                                  
  0000:0c92  8bec             mov bp, sp                               
  0000:0c94  b80607           mov ax, 0x706                            
  0000:0c97  8b5e06           mov bx, word ptr [bp + 6]                
  0000:0c9a  8b4e08           mov cx, word ptr [bp + 8]                
  0000:0c9d  cd66             int 0x66                                 
  0000:0c9f  8be5             mov sp, bp                               
  0000:0ca1  5d               pop bp                                   
  0000:0ca2  cb               retf                                     
  0000:0ca3  e80100           call 0xca7                               -> 0000:0ca7
  0000:0ca6  cb               retf                                     
  0000:0ca7  1e               push ds                                  
  0000:0ca8  56               push si                                  
  0000:0ca9  be9801           mov si, 0x198                            
  0000:0cac  33c0             xor ax, ax                               
  0000:0cae  8ed8             mov ds, ax                               
  0000:0cb0  c534             lds si, ptr [si]                         
  0000:0cb2  0bf6             or si, si                                
  0000:0cb4  741f             je 0xcd5                                 
  0000:0cb6  90               nop                                      
  0000:0cb7  90               nop                                      
  0000:0cb8  90               nop                                      
  0000:0cb9  83ee06           sub si, 6                                
  0000:0cbc  813c4d49         cmp word ptr [si], 0x494d                
  0000:0cc0  7513             jne 0xcd5                                
  0000:0cc2  90               nop                                      
  0000:0cc3  90               nop                                      
  0000:0cc4  90               nop                                      
  0000:0cc5  817c024449       cmp word ptr [si + 2], 0x4944            
  0000:0cca  7509             jne 0xcd5                                
  0000:0ccc  90               nop                                      
  0000:0ccd  90               nop                                      
  0000:0cce  90               nop                                      
  0000:0ccf  b80100           mov ax, 1                                
  0000:0cd2  5e               pop si                                   
  0000:0cd3  1f               pop ds                                   
  0000:0cd4  c3               ret                                      
  0000:0cd5  33c0             xor ax, ax                               
  0000:0cd7  ebf9             jmp 0xcd2                                
  0000:0cd9  b80107           mov ax, 0x701                            
  0000:0cdc  cd66             int 0x66                                 
  0000:0cde  cb               retf                                     
  0000:0cdf  b80707           mov ax, 0x707                             ; "palloc: out of hdrs"
  0000:0ce2  cd66             int 0x66                                 
  0000:0ce4  cb               retf                                     
  0000:0ce5  b80807           mov ax, 0x708                            
  0000:0ce8  cd66             int 0x66                                 
  0000:0cea  cb               retf                                     
  0000:0ceb  b80907           mov ax, 0x709                            
  0000:0cee  cd66             int 0x66                                 
  0000:0cf0  cb               retf                                     
  0000:0cf1  b80a07           mov ax, 0x70a                            
  0000:0cf4  cd66             int 0x66                                 
  0000:0cf6  cb               retf                                     
  0000:0cf7  b80b07           mov ax, 0x70b                            
  0000:0cfa  cd66             int 0x66                                 
  0000:0cfc  cb               retf                                     
  0000:0cfd  b80c07           mov ax, 0x70c                            
  0000:0d00  cd66             int 0x66                                 
  0000:0d02  cb               retf                                     
  0000:0d03  b80e07           mov ax, 0x70e                            
  0000:0d06  cd66             int 0x66                                 
  0000:0d08  cb               retf                                     

proc_0000_0d09:
  0000:0d09  55               push bp                                  
  0000:0d0a  8bec             mov bp, sp                               
  0000:0d0c  b80f07           mov ax, 0x70f                            
  0000:0d0f  8b5e06           mov bx, word ptr [bp + 6]                
  0000:0d12  8b4e08           mov cx, word ptr [bp + 8]                
  0000:0d15  cd66             int 0x66                                 
  0000:0d17  8be5             mov sp, bp                               
  0000:0d19  5d               pop bp                                   
  0000:0d1a  cb               retf                                     

proc_0000_0d1b:
  0000:0d1b  55               push bp                                  
  0000:0d1c  8bec             mov bp, sp                               
  0000:0d1e  b80d07           mov ax, 0x70d                            
  0000:0d21  8b5e06           mov bx, word ptr [bp + 6]                
  0000:0d24  8b4e08           mov cx, word ptr [bp + 8]                
  0000:0d27  cd66             int 0x66                                 
  0000:0d29  8be5             mov sp, bp                               
  0000:0d2b  5d               pop bp                                   
  0000:0d2c  cb               retf                                     
  0000:0d2d  0000             add byte ptr [bx + si], al               
  0000:0d2f  0000             add byte ptr [bx + si], al               
  0000:0d31  0000             add byte ptr [bx + si], al               
  0000:0d33  0002             add byte ptr [bp + si], al               
  0000:0d35  0000             add byte ptr [bx + si], al               
  0000:0d37  0302             add ax, word ptr [bp + si]               
  0000:0d39  0000             add byte ptr [bx + si], al               

proc_0000_0d3b:
  0000:0d3b  55               push bp                                  
  0000:0d3c  8bec             mov bp, sp                               
  0000:0d3e  06               push es                                  
  0000:0d3f  1e               push ds                                  
  0000:0d40  56               push si                                  
  0000:0d41  57               push di                                  
  0000:0d42  fc               cld                                      
  0000:0d43  0e               push cs                                  
  0000:0d44  b8310d           mov ax, 0xd31                            
  0000:0d47  50               push ax                                  
  0000:0d48  33c0             xor ax, ax                               
  0000:0d4a  50               push ax                                  
  0000:0d4b  50               push ax                                  
  0000:0d4c  c45606           les dx, ptr [bp + 6]                     
  0000:0d4f  06               push es                                  
  0000:0d50  52               push dx                                  
  0000:0d51  90               nop                                      
  0000:0d52  0e               push cs                                  
  0000:0d53  e8a1f9           call 0x6f7                               -> 0000:06f7
  0000:0d56  83c40c           add sp, 0xc                              
  0000:0d59  0bd2             or dx, dx                                
  0000:0d5b  7503             jne 0xd60                                
  0000:0d5d  e98300           jmp 0xde3                                
  0000:0d60  2ea32d0d         mov word ptr cs:[0xd2d], ax              
  0000:0d64  2e89162f0d       mov word ptr cs:[0xd2f], dx              
  0000:0d69  2ea1310d         mov ax, word ptr cs:[0xd31]              
  0000:0d6d  8ec0             mov es, ax                               
  0000:0d6f  2d1000           sub ax, 0x10                             
  0000:0d72  26803e03004d     cmp byte ptr es:[3], 0x4d                
  0000:0d78  754e             jne 0xdc8                                
  0000:0d7a  90               nop                                      
  0000:0d7b  90               nop                                      
  0000:0d7c  90               nop                                      
  0000:0d7d  26803e040049     cmp byte ptr es:[4], 0x49                
  0000:0d83  7543             jne 0xdc8                                
  0000:0d85  90               nop                                      
  0000:0d86  90               nop                                      
  0000:0d87  90               nop                                      
  0000:0d88  26803e050044     cmp byte ptr es:[5], 0x44                
  0000:0d8e  7538             jne 0xdc8                                
  0000:0d90  90               nop                                      
  0000:0d91  90               nop                                      
  0000:0d92  90               nop                                      
  0000:0d93  26803e060050     cmp byte ptr es:[6], 0x50                
  0000:0d99  752d             jne 0xdc8                                
  0000:0d9b  90               nop                                      
  0000:0d9c  90               nop                                      
  0000:0d9d  90               nop                                      
  0000:0d9e  26803e070041     cmp byte ptr es:[7], 0x41                
  0000:0da4  7522             jne 0xdc8                                
  0000:0da6  90               nop                                      
  0000:0da7  90               nop                                      
  0000:0da8  90               nop                                      
  0000:0da9  26803e08004b     cmp byte ptr es:[8], 0x4b                
  0000:0daf  7517             jne 0xdc8                                
  0000:0db1  90               nop                                      
  0000:0db2  90               nop                                      
  0000:0db3  90               nop                                      
  0000:0db4  2ea3350d         mov word ptr cs:[0xd35], ax              
  0000:0db8  2ea3390d         mov word ptr cs:[0xd39], ax              
  0000:0dbc  2eff1e330d       lcall cs:[0xd33]                         
  0000:0dc1  0bc0             or ax, ax                                
  0000:0dc3  741b             je 0xde0                                 
  0000:0dc5  90               nop                                      
  0000:0dc6  90               nop                                      
  0000:0dc7  90               nop                                      
  0000:0dc8  2eff36310d       push word ptr cs:[0xd31]                 
  0000:0dcd  33c0             xor ax, ax                               
  0000:0dcf  50               push ax                                  
  0000:0dd0  9ae907070c       lcall 0xc07, 0x7e9                       -> 0c07:07e9 [reloc]
  0000:0dd5  83c404           add sp, 4                                
  0000:0dd8  33c0             xor ax, ax                               
  0000:0dda  2ea3310d         mov word ptr cs:[0xd31], ax              
  0000:0dde  eb03             jmp 0xde3                                
  0000:0de0  b80100           mov ax, 1                                
  0000:0de3  5f               pop di                                   
  0000:0de4  5e               pop si                                   
  0000:0de5  1f               pop ds                                   
  0000:0de6  07               pop es                                   
  0000:0de7  8be5             mov sp, bp                               
  0000:0de9  5d               pop bp                                   
  0000:0dea  cb               retf                                     
  0000:0deb  2e833e310d00     cmp word ptr cs:[0xd31], 0               
  0000:0df1  7421             je 0xe14                                 
  0000:0df3  90               nop                                      
  0000:0df4  90               nop                                      
  0000:0df5  90               nop                                      
  0000:0df6  2eff1e370d       lcall cs:[0xd37]                         
  0000:0dfb  2eff362f0d       push word ptr cs:[0xd2f]                 
  0000:0e00  2eff362d0d       push word ptr cs:[0xd2d]                 
  0000:0e05  9ae907070c       lcall 0xc07, 0x7e9                       -> 0c07:07e9 [reloc]
  0000:0e0a  83c404           add sp, 4                                
  0000:0e0d  2ec706310d0000   mov word ptr cs:[0xd31], 0               
  0000:0e14  cb               retf                                     

proc_0000_0e15:
  0000:0e15  55               push bp                                  
  0000:0e16  8bec             mov bp, sp                               
  0000:0e18  06               push es                                  
  0000:0e19  1e               push ds                                  
  0000:0e1a  56               push si                                  
  0000:0e1b  57               push di                                  
  0000:0e1c  fc               cld                                      
  0000:0e1d  8b5e08           mov bx, word ptr [bp + 8]                
  0000:0e20  8b4e06           mov cx, word ptr [bp + 6]                
  0000:0e23  8b560c           mov dx, word ptr [bp + 0xc]              
  0000:0e26  8b760a           mov si, word ptr [bp + 0xa]              
  0000:0e29  b81007           mov ax, 0x710                            
  0000:0e2c  cd66             int 0x66                                 
  0000:0e2e  5f               pop di                                   
  0000:0e2f  5e               pop si                                   
  0000:0e30  1f               pop ds                                   
  0000:0e31  07               pop es                                   
  0000:0e32  8be5             mov sp, bp                               
  0000:0e34  5d               pop bp                                   
  0000:0e35  cb               retf                                     
  0000:0e36  0000             add byte ptr [bx + si], al               
  0000:0e38  0000             add byte ptr [bx + si], al               
  0000:0e3a  0000             add byte ptr [bx + si], al               
  0000:0e3c  0000             add byte ptr [bx + si], al               
  0000:0e3e  0000             add byte ptr [bx + si], al               
  0000:0e40  0000             add byte ptr [bx + si], al               
  0000:0e42  0000             add byte ptr [bx + si], al               
  0000:0e44  0000             add byte ptr [bx + si], al               
  0000:0e46  0000             add byte ptr [bx + si], al               
  0000:0e48  0000             add byte ptr [bx + si], al               
  0000:0e4a  0000             add byte ptr [bx + si], al               
  0000:0e4c  0000             add byte ptr [bx + si], al               
  0000:0e4e  0000             add byte ptr [bx + si], al               
  0000:0e50  0000             add byte ptr [bx + si], al               
  0000:0e52  0000             add byte ptr [bx + si], al               
  0000:0e54  0000             add byte ptr [bx + si], al               
  0000:0e56  0000             add byte ptr [bx + si], al               
  0000:0e58  0000             add byte ptr [bx + si], al               
  0000:0e5a  0000             add byte ptr [bx + si], al               
  0000:0e5c  0000             add byte ptr [bx + si], al               
  0000:0e5e  0000             add byte ptr [bx + si], al               
  0000:0e60  0000             add byte ptr [bx + si], al               
  0000:0e62  0000             add byte ptr [bx + si], al               
  0000:0e64  0000             add byte ptr [bx + si], al               
  0000:0e66  0000             add byte ptr [bx + si], al               
  0000:0e68  0000             add byte ptr [bx + si], al               
  0000:0e6a  0000             add byte ptr [bx + si], al               
  0000:0e6c  807f5032         cmp byte ptr [bx + 0x50], 0x32           
  0000:0e70  c0e6f0           shl dh, 0xf0                             
  0000:0e73  b020             mov al, 0x20                             
  0000:0e75  e6a0             out 0xa0, al                             
  0000:0e77  e620             out 0x20, al                             
  0000:0e79  58               pop ax                                   
  0000:0e7a  cd02             int 2                                    
  0000:0e7c  cf               iret                                     
  0000:0e7d  50               push ax                                  
  0000:0e7e  b85512           mov ax, 0x1255                            [reloc]
  0000:0e81  9a30044010       lcall 0x1040, 0x430                      -> 1040:0430 [reloc]
  0000:0e86  7206             jb 0xe8e                                 
  0000:0e88  58               pop ax                                   
  0000:0e89  ea00000000       ljmp 0:0                                 
  0000:0e8e  93               xchg bx, ax                              
  0000:0e8f  b89e10           mov ax, 0x109e                            [reloc]
  0000:0e92  8ed8             mov ds, ax                               
  0000:0e94  e8ef09           call 0x1886                              -> 0000:1886
  0000:0e97  58               pop ax                                   
  0000:0e98  cf               iret                                     
  0000:0e99  1e               push ds                                  
  0000:0e9a  56               push si                                  
  0000:0e9b  57               push di                                  
  0000:0e9c  b84400           mov ax, 0x44                             
  0000:0e9f  36a30e00         mov word ptr ss:[0xe], ax                
  0000:0ea3  05c000           add ax, 0xc0                             
  0000:0ea6  36a31000         mov word ptr ss:[0x10], ax               
  0000:0eaa  a1b10c           mov ax, word ptr [0xcb1]                 
  0000:0ead  36a30a00         mov word ptr ss:[0xa], ax                
  0000:0eb1  a0b00c           mov al, byte ptr [0xcb0]                 
  0000:0eb4  36a20700         mov byte ptr ss:[7], al                  
  0000:0eb8  8cc9             mov cx, cs                               
  0000:0eba  32c8             xor cl, al                               
  0000:0ebc  8ed9             mov ds, cx                               
  0000:0ebe  b83435           mov ax, 0x3534                           
  0000:0ec1  b90b00           mov cx, 0xb                              
  0000:0ec4  bf360e           mov di, 0xe36                            
  0000:0ec7  cd21             int 0x21                                 
  0000:0ec9  891d             mov word ptr [di], bx                    
  0000:0ecb  8c4502           mov word ptr [di + 2], es                
  0000:0ece  83c704           add di, 4                                
  0000:0ed1  40               inc ax                                   
  0000:0ed2  e2f3             loop 0xec7                               
  0000:0ed4  b87535           mov ax, 0x3575                           
  0000:0ed7  cd21             int 0x21                                 
  0000:0ed9  891d             mov word ptr [di], bx                    
  0000:0edb  8c4502           mov word ptr [di + 2], es                
  0000:0ede  83c704           add di, 4                                
  0000:0ee1  b80235           mov ax, 0x3502                           
  0000:0ee4  cd21             int 0x21                                 
  0000:0ee6  891d             mov word ptr [di], bx                    
  0000:0ee8  8c4502           mov word ptr [di + 2], es                
  0000:0eeb  891e8a0e         mov word ptr [0xe8a], bx                 
  0000:0eef  8c068c0e         mov word ptr [0xe8c], es                 
  0000:0ef3  b89e10           mov ax, 0x109e                            [reloc]
  0000:0ef6  8ed8             mov ds, ax                               
  0000:0ef8  bbffff           mov bx, 0xffff                           
  0000:0efb  8e067b00         mov es, word ptr [0x7b]                  
  0000:0eff  268e062c00       mov es, word ptr es:[0x2c]               
  0000:0f04  2bff             sub di, di                               
  0000:0f06  b9ff7f           mov cx, 0x7fff                           
  0000:0f09  b000             mov al, 0                                
  0000:0f0b  fc               cld                                      
  0000:0f0c  f2ae             repne scasb al, byte ptr es:[di]         
  0000:0f0e  e31f             jcxz 0xf2f                               
  0000:0f10  263a05           cmp al, byte ptr es:[di]                 
  0000:0f13  741a             je 0xf2f                                 
  0000:0f15  26813d3837       cmp word ptr es:[di], 0x3738             
  0000:0f1a  75f0             jne 0xf0c                                
  0000:0f1c  268b5502         mov dx, word ptr es:[di + 2]             
  0000:0f20  80fa3d           cmp dl, 0x3d                             
  0000:0f23  75e7             jne 0xf0c                                
  0000:0f25  43               inc bx                                   
  0000:0f26  80e6df           and dh, 0xdf                             
  0000:0f29  80fe59           cmp dh, 0x59                             
  0000:0f2c  7501             jne 0xf2f                                
  0000:0f2e  43               inc bx                                   
  0000:0f2f  5f               pop di                                   
  0000:0f30  5e               pop si                                   
  0000:0f31  0bdb             or bx, bx                                
  0000:0f33  7464             je 0xf99                                 
  0000:0f35  54               push sp                                  
  0000:0f36  59               pop cx                                   
  0000:0f37  3bcc             cmp cx, sp                               
  0000:0f39  7524             jne 0xf5f                                
  0000:0f3b  0bdb             or bx, bx                                
  0000:0f3d  7f06             jg 0xf45                                 
  0000:0f3f  cd11             int 0x11                                 
  0000:0f41  2402             and al, 2                                
  0000:0f43  7452             je 0xf97                                 
  0000:0f45  dbe3             fninit                                   
  0000:0f47  2ed9066a0e       fld dword ptr cs:[0xe6a]                 
  0000:0f4c  d9e0             fchs                                     
  0000:0f4e  2ed81e6a0e       fcomp dword ptr cs:[0xe6a]               
  0000:0f53  9b               wait                                     
  0000:0f54  dfe0             fnstsw ax                                
  0000:0f56  9e               sahf                                     
  0000:0f57  b002             mov al, 2                                
  0000:0f59  743c             je 0xf97                                 
  0000:0f5b  fec0             inc al                                   
  0000:0f5d  eb38             jmp 0xf97                                
  0000:0f5f  dbe3             fninit                                   
  0000:0f61  c706a00c0000     mov word ptr [0xca0], 0                  
  0000:0f67  d93ea00c         fnstcw word ptr [0xca0]                  
  0000:0f6b  b91400           mov cx, 0x14                             
  0000:0f6e  e2fe             loop 0xf6e                               
  0000:0f70  8b0ea00c         mov cx, word ptr [0xca0]                 
  0000:0f74  81e13f0f         and cx, 0xf3f                            
  0000:0f78  81f93f03         cmp cx, 0x33f                            
  0000:0f7c  7519             jne 0xf97                                
  0000:0f7e  c706a00cffff     mov word ptr [0xca0], 0xffff             
  0000:0f84  dd3ea00c         fnstsw word ptr [0xca0]                  
  0000:0f88  b91400           mov cx, 0x14                             
  0000:0f8b  e2fe             loop 0xf8b                               
  0000:0f8d  f706a00cbfb8     test word ptr [0xca0], 0xb8bf            
  0000:0f93  7502             jne 0xf97                                
  0000:0f95  fec0             inc al                                   
  0000:0f97  98               cwde                                     
  0000:0f98  93               xchg bx, ax                              
  0000:0f99  891ea00c         mov word ptr [0xca0], bx                 
  0000:0f9d  36881e0600       mov byte ptr ss:[6], bl                  
  0000:0fa2  1f               pop ds                                   
  0000:0fa3  1e               push ds                                  

proc_0000_0fa4:
  0000:0fa4  55               push bp                                  
  0000:0fa5  8bec             mov bp, sp                               
  0000:0fa7  83ec08           sub sp, 8                                
  0000:0faa  bb9e10           mov bx, 0x109e                            [reloc]
  0000:0fad  8edb             mov ds, bx                               
  0000:0faf  833ea00c00       cmp word ptr [0xca0], 0                  
  0000:0fb4  c746f80603       mov word ptr [bp - 8], 0x306             
  0000:0fb9  c746fa4010       mov word ptr [bp - 6], 0x1040             [reloc]
  0000:0fbe  c746fcc603       mov word ptr [bp - 4], 0x3c6             
  0000:0fc3  c746fe4010       mov word ptr [bp - 2], 0x1040             [reloc]
  0000:0fc8  7514             jne 0xfde                                
  0000:0fca  c746f85221       mov word ptr [bp - 8], 0x2152            
  0000:0fcf  c746fac80d       mov word ptr [bp - 6], 0xdc8              [reloc]
  0000:0fd4  c746fce026       mov word ptr [bp - 4], 0x26e0            
  0000:0fd9  c746fec80d       mov word ptr [bp - 2], 0xdc8              [reloc]
  0000:0fde  b83425           mov ax, 0x2534                           
  0000:0fe1  b90a00           mov cx, 0xa                              
  0000:0fe4  c556f8           lds dx, ptr [bp - 8]                     
  0000:0fe7  cd21             int 0x21                                 
  0000:0fe9  40               inc ax                                   
  0000:0fea  e2fb             loop 0xfe7                               
  0000:0fec  b83e25           mov ax, 0x253e                           
  0000:0fef  c556fc           lds dx, ptr [bp - 4]                     
  0000:0ff2  cd21             int 0x21                                 
  0000:0ff4  b80225           mov ax, 0x2502                           
  0000:0ff7  0e               push cs                                  
  0000:0ff8  1f               pop ds                                   
  0000:0ff9  ba7d0e           mov dx, 0xe7d                            
  0000:0ffc  cd21             int 0x21                                 
  0000:0ffe  8edb             mov ds, bx                               
  0000:1000  833ea00c00       cmp word ptr [0xca0], 0                  
  0000:1005  7414             je 0x101b                                
  0000:1007  a17d00           mov ax, word ptr [0x7d]                  
  0000:100a  86e0             xchg al, ah                              
  0000:100c  3d0314           cmp ax, 0x1403                           
  0000:100f  750a             jne 0x101b                               
  0000:1011  b87525           mov ax, 0x2575                           
  0000:1014  0e               push cs                                  
  0000:1015  1f               pop ds                                   
  0000:1016  ba6e0e           mov dx, 0xe6e                            
  0000:1019  cd21             int 0x21                                 
  0000:101b  cd37e3           f-fninit                                 ; emu int 37
  0000:101e  36c70620000000   mov word ptr ss:[0x20], 0                
  0000:1025  36c70622000000   mov word ptr ss:[0x22], 0                
  0000:102c  8edb             mov ds, bx                               
  0000:102e  a1b40c           mov ax, word ptr [0xcb4]                 
  0000:1031  8946f8           mov word ptr [bp - 8], ax                
  0000:1034  833ea00c03       cmp word ptr [0xca0], 3                  
  0000:1039  7c04             jl 0x103f                                
  0000:103b  834ef802         or word ptr [bp - 8], 2                  
  0000:103f  cd356ef8         f-fldcw word ptr [bp - 8]                ; emu int 35
  0000:1043  8b46f8           mov ax, word ptr [bp - 8]                
  0000:1046  3621060200       and word ptr ss:[2], ax                  
  0000:104b  33c0             xor ax, ax                               
  0000:104d  99               cdq                                      
  0000:104e  8be5             mov sp, bp                               
  0000:1050  5d               pop bp                                   
  0000:1051  1f               pop ds                                   
  0000:1052  c3               ret                                      
  0000:1053  1e               push ds                                  
  0000:1054  b89e10           mov ax, 0x109e                            [reloc]
  0000:1057  8ed8             mov ds, ax                               
  0000:1059  833ea00c00       cmp word ptr [0xca0], 0                  
  0000:105e  7c28             jl 0x1088                                
  0000:1060  cd37e3           f-fninit                                 ; emu int 37
  0000:1063  b83425           mov ax, 0x2534                           
  0000:1066  bb360e           mov bx, 0xe36                            
  0000:1069  b90b00           mov cx, 0xb                              
  0000:106c  2ec517           lds dx, ptr cs:[bx]                      
  0000:106f  cd21             int 0x21                                 
  0000:1071  83c304           add bx, 4                                
  0000:1074  40               inc ax                                   
  0000:1075  e2f5             loop 0x106c                              
  0000:1077  b87525           mov ax, 0x2575                           
  0000:107a  2ec517           lds dx, ptr cs:[bx]                      
  0000:107d  cd21             int 0x21                                 
  0000:107f  b80225           mov ax, 0x2502                           
  0000:1082  2ec55704         lds dx, ptr cs:[bx + 4]                  
  0000:1086  cd21             int 0x21                                 
  0000:1088  1f               pop ds                                   
  0000:1089  c3               ret                                      
  0000:108a  b80200           mov ax, 2                                
  0000:108d  cb               retf                                     

proc_0000_108e:
  0000:108e  55               push bp                                  
  0000:108f  8bec             mov bp, sp                               
  0000:1091  83ec04           sub sp, 4                                
  0000:1094  33c9             xor cx, cx                               
  0000:1096  b8fe43           mov ax, 0x43fe                           
  0000:1099  bbcd3b           mov bx, 0x3bcd                           
  0000:109c  837e1600         cmp word ptr [bp + 0x16], 0              
  0000:10a0  7506             jne 0x10a8                               
  0000:10a2  b87e40           mov ax, 0x407e                           
  0000:10a5  bb6a3f           mov bx, 0x3f6a                           
  0000:10a8  8b5614           mov dx, word ptr [bp + 0x14]             
  0000:10ab  d1e2             shl dx, 1                                
  0000:10ad  d1d1             rcl cx, 1                                
  0000:10af  d1ea             shr dx, 1                                
  0000:10b1  81faff7f         cmp dx, 0x7fff                           
  0000:10b5  7467             je 0x111e                                
  0000:10b7  3bd0             cmp dx, ax                               
  0000:10b9  7408             je 0x10c3                                
  0000:10bb  7e3b             jle 0x10f8                               
  0000:10bd  cd394604         f-fld qword ptr [bp + 4]                 ; emu int 39
  0000:10c1  eb4c             jmp 0x110f                               
  0000:10c3  cd357efe         f-fnstcw word ptr [bp - 2]               ; emu int 35
  0000:10c7  b8000c           mov ax, 0xc00                            
  0000:10ca  cd3d             fwait                                    ; emu
  0000:10cc  0b46fe           or ax, word ptr [bp - 2]                 
  0000:10cf  8946fc           mov word ptr [bp - 4], ax                
  0000:10d2  cd356efc         f-fldcw word ptr [bp - 4]                ; emu int 35
  0000:10d6  cd376e0c         f-fld xword ptr [bp + 0xc]               ; emu int 37
  0000:10da  837e1600         cmp word ptr [bp + 0x16], 0              
  0000:10de  750a             jne 0x10ea                               
  0000:10e0  cd355e04         f-fstp dword ptr [bp + 4]                ; emu int 35
  0000:10e4  cd354604         f-fld dword ptr [bp + 4]                 ; emu int 35
  0000:10e8  eb08             jmp 0x10f2                               
  0000:10ea  cd395e04         f-fstp qword ptr [bp + 4]                ; emu int 39
  0000:10ee  cd394604         f-fld qword ptr [bp + 4]                 ; emu int 39
  0000:10f2  cd356efe         f-fldcw word ptr [bp - 2]                ; emu int 35
  0000:10f6  eb2a             jmp 0x1122                               
  0000:10f8  8bc2             mov ax, dx                               
  0000:10fa  0b4612           or ax, word ptr [bp + 0x12]              
  0000:10fd  0b4610           or ax, word ptr [bp + 0x10]              
  0000:1100  0b460e           or ax, word ptr [bp + 0xe]               
  0000:1103  0b460c           or ax, word ptr [bp + 0xc]               
  0000:1106  7416             je 0x111e                                
  0000:1108  3bd3             cmp dx, bx                               
  0000:110a  7d12             jge 0x111e                               
  0000:110c  cd35ee           f-fldz                                   ; emu int 35
  0000:110f  0bc9             or cx, cx                                
  0000:1111  7403             je 0x1116                                
  0000:1113  cd35e0           f-fchs                                   ; emu int 35
  0000:1116  c7067f002200     mov word ptr [0x7f], 0x22                
  0000:111c  eb04             jmp 0x1122                               
  0000:111e  cd376e0c         f-fld xword ptr [bp + 0xc]               ; emu int 37
  0000:1122  8be5             mov sp, bp                               
  0000:1124  5d               pop bp                                   
  0000:1125  c21400           ret 0x14                                 

proc_0000_1128:
  0000:1128  55               push bp                                  
  0000:1129  8bec             mov bp, sp                               
  0000:112b  b05f             mov al, 0x5f                             
  0000:112d  22c2             and al, dl                               
  0000:112f  3c47             cmp al, 0x47                             
  0000:1131  750e             jne 0x1141                               
  0000:1133  26807fff30       cmp byte ptr es:[bx - 1], 0x30           
  0000:1138  7507             jne 0x1141                               
  0000:113a  4b               dec bx                                   
  0000:113b  3bd9             cmp bx, cx                               
  0000:113d  77f4             ja 0x1133                                
  0000:113f  eb08             jmp 0x1149                               
  0000:1141  26807fff2e       cmp byte ptr es:[bx - 1], 0x2e           
  0000:1146  7501             jne 0x1149                               
  0000:1148  4b               dec bx                                   
  0000:1149  5d               pop bp                                   
  0000:114a  c3               ret                                      

proc_0000_114b:
  0000:114b  55               push bp                                  
  0000:114c  8bec             mov bp, sp                               
  0000:114e  83ec30           sub sp, 0x30                             
  0000:1151  56               push si                                  
  0000:1152  57               push di                                  
  0000:1153  06               push es                                  
  0000:1154  8b460e           mov ax, word ptr [bp + 0xe]              
  0000:1157  3d2800           cmp ax, 0x28                             
  0000:115a  7606             jbe 0x1162                               
  0000:115c  b82800           mov ax, 0x28                             
  0000:115f  89460e           mov word ptr [bp + 0xe], ax              
  0000:1162  8946fc           mov word ptr [bp - 4], ax                
  0000:1165  8a5608           mov dl, byte ptr [bp + 8]                
  0000:1168  80e2df           and dl, 0xdf                             
  0000:116b  80fa46           cmp dl, 0x46                             
  0000:116e  750b             jne 0x117b                               
  0000:1170  f7d8             neg ax                                   
  0000:1172  7e10             jle 0x1184                               
  0000:1174  2bc0             sub ax, ax                               
  0000:1176  89460e           mov word ptr [bp + 0xe], ax              
  0000:1179  eb09             jmp 0x1184                               
  0000:117b  0bc0             or ax, ax                                
  0000:117d  7f05             jg 0x1184                                
  0000:117f  b80100           mov ax, 1                                
  0000:1182  eb09             jmp 0x118d                               
  0000:1184  80fa45           cmp dl, 0x45                             
  0000:1187  7504             jne 0x118d                               
  0000:1189  40               inc ax                                   
  0000:118a  ff460e           inc word ptr [bp + 0xe]                  
  0000:118d  ff7612           push word ptr [bp + 0x12]                
  0000:1190  ff7610           push word ptr [bp + 0x10]                
  0000:1193  50               push ax                                  
  0000:1194  16               push ss                                  
  0000:1195  8d5efe           lea bx, [bp - 2]                         
  0000:1198  53               push bx                                  
  0000:1199  16               push ss                                  
  0000:119a  8d76d0           lea si, [bp - 0x30]                      
  0000:119d  56               push si                                  
  0000:119e  8b4604           mov ax, word ptr [bp + 4]                
  0000:11a1  50               push ax                                  
  0000:11a2  e8d504           call 0x167a                              -> 0000:167a
  0000:11a5  93               xchg bx, ax                              
  0000:11a6  c47e0a           les di, ptr [bp + 0xa]                   
  0000:11a9  fc               cld                                      
  0000:11aa  81fbff7f         cmp bx, 0x7fff                           
  0000:11ae  7408             je 0x11b8                                
  0000:11b0  81fbfe7f         cmp bx, 0x7ffe                           
  0000:11b4  7415             je 0x11cb                                
  0000:11b6  eb25             jmp 0x11dd                               
  0000:11b8  b82b49           mov ax, 0x492b                           
  0000:11bb  837efe00         cmp word ptr [bp - 2], 0                 
  0000:11bf  7402             je 0x11c3                                
  0000:11c1  40               inc ax                                   
  0000:11c2  40               inc ax                                   
  0000:11c3  ab               stosw word ptr es:[di], ax               
  0000:11c4  b84e46           mov ax, 0x464e                           
  0000:11c7  ab               stosw word ptr es:[di], ax               
  0000:11c8  e90901           jmp 0x12d4                               
  0000:11cb  b82b4e           mov ax, 0x4e2b                           
  0000:11ce  837efe00         cmp word ptr [bp - 2], 0                 
  0000:11d2  7402             je 0x11d6                                
  0000:11d4  40               inc ax                                   
  0000:11d5  40               inc ax                                   
  0000:11d6  ab               stosw word ptr es:[di], ax               
  0000:11d7  b041             mov al, 0x41                             
  0000:11d9  ab               stosw word ptr es:[di], ax               
  0000:11da  e9f700           jmp 0x12d4                               
  0000:11dd  807efe00         cmp byte ptr [bp - 2], 0                 
  0000:11e1  7403             je 0x11e6                                
  0000:11e3  b02d             mov al, 0x2d                             
  0000:11e5  aa               stosb byte ptr es:[di], al               
  0000:11e6  8a5608           mov dl, byte ptr [bp + 8]                
  0000:11e9  80e25f           and dl, 0x5f                             
  0000:11ec  80fa46           cmp dl, 0x46                             
  0000:11ef  7416             je 0x1207                                
  0000:11f1  80fa45           cmp dl, 0x45                             
  0000:11f4  7473             je 0x1269                                
  0000:11f6  83fbfd           cmp bx, -3                               
  0000:11f9  7c6e             jl 0x1269                                
  0000:11fb  8b460e           mov ax, word ptr [bp + 0xe]              
  0000:11fe  0bc0             or ax, ax                                
  0000:1200  7501             jne 0x1203                               
  0000:1202  40               inc ax                                   
  0000:1203  3bd8             cmp bx, ax                               
  0000:1205  7f62             jg 0x1269                                
  0000:1207  83fb28           cmp bx, 0x28                             
  0000:120a  7f5d             jg 0x1269                                
  0000:120c  0bdb             or bx, bx                                
  0000:120e  7f0f             jg 0x121f                                
  0000:1210  b8302e           mov ax, 0x2e30                           
  0000:1213  ab               stosw word ptr es:[di], ax               
  0000:1214  b90100           mov cx, 1                                
  0000:1217  7409             je 0x1222                                
  0000:1219  b030             mov al, 0x30                             
  0000:121b  aa               stosb byte ptr es:[di], al               
  0000:121c  43               inc bx                                   
  0000:121d  75fc             jne 0x121b                               
  0000:121f  b90000           mov cx, 0                                
  0000:1222  36ac             lodsb al, byte ptr ss:[si]               
  0000:1224  0ac0             or al, al                                
  0000:1226  740a             je 0x1232                                
  0000:1228  aa               stosb byte ptr es:[di], al               
  0000:1229  4b               dec bx                                   
  0000:122a  75f6             jne 0x1222                               
  0000:122c  b02e             mov al, 0x2e                             
  0000:122e  aa               stosb byte ptr es:[di], al               
  0000:122f  41               inc cx                                   
  0000:1230  ebf0             jmp 0x1222                               
  0000:1232  8b460e           mov ax, word ptr [bp + 0xe]              
  0000:1235  034efc           add cx, word ptr [bp - 4]                
  0000:1238  3bc1             cmp ax, cx                               
  0000:123a  760d             jbe 0x1249                               
  0000:123c  2bc1             sub ax, cx                               
  0000:123e  8bc8             mov cx, ax                               
  0000:1240  03d8             add bx, ax                               
  0000:1242  b030             mov al, 0x30                             
  0000:1244  f3aa             rep stosb byte ptr es:[di], al           
  0000:1246  4b               dec bx                                   
  0000:1247  7416             je 0x125f                                
  0000:1249  4b               dec bx                                   
  0000:124a  7413             je 0x125f                                
  0000:124c  807e0600         cmp byte ptr [bp + 6], 0                 
  0000:1250  750d             jne 0x125f                               
  0000:1252  8a5608           mov dl, byte ptr [bp + 8]                
  0000:1255  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0000:1258  87df             xchg di, bx                              
  0000:125a  e8cbfe           call 0x1128                              -> 0000:1128
  0000:125d  87fb             xchg bx, di                              
  0000:125f  3b7e0a           cmp di, word ptr [bp + 0xa]              
  0000:1262  7503             jne 0x1267                               
  0000:1264  b030             mov al, 0x30                             
  0000:1266  aa               stosb byte ptr es:[di], al               
  0000:1267  eb6b             jmp 0x12d4                               
  0000:1269  36ad             lodsw ax, word ptr ss:[si]               
  0000:126b  aa               stosb byte ptr es:[di], al               
  0000:126c  b02e             mov al, 0x2e                             
  0000:126e  0ae4             or ah, ah                                
  0000:1270  7509             jne 0x127b                               
  0000:1272  807e0600         cmp byte ptr [bp + 6], 0                 
  0000:1276  7420             je 0x1298                                
  0000:1278  aa               stosb byte ptr es:[di], al               
  0000:1279  eb1d             jmp 0x1298                               
  0000:127b  aa               stosb byte ptr es:[di], al               
  0000:127c  8ac4             mov al, ah                               
  0000:127e  aa               stosb byte ptr es:[di], al               
  0000:127f  36ac             lodsb al, byte ptr ss:[si]               
  0000:1281  0ac0             or al, al                                
  0000:1283  75f9             jne 0x127e                               
  0000:1285  807e0600         cmp byte ptr [bp + 6], 0                 
  0000:1289  750d             jne 0x1298                               
  0000:128b  8a5608           mov dl, byte ptr [bp + 8]                
  0000:128e  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0000:1291  87df             xchg di, bx                              
  0000:1293  e892fe           call 0x1128                              -> 0000:1128
  0000:1296  87fb             xchg bx, di                              
  0000:1298  b020             mov al, 0x20                             
  0000:129a  224608           and al, byte ptr [bp + 8]                
  0000:129d  0c45             or al, 0x45                              
  0000:129f  aa               stosb byte ptr es:[di], al               
  0000:12a0  b82b2d           mov ax, 0x2d2b                           
  0000:12a3  4b               dec bx                                   
  0000:12a4  7d04             jge 0x12aa                               
  0000:12a6  86c4             xchg ah, al                              
  0000:12a8  f7db             neg bx                                   
  0000:12aa  aa               stosb byte ptr es:[di], al               
  0000:12ab  93               xchg bx, ax                              
  0000:12ac  b93030           mov cx, 0x3030                           
  0000:12af  3d6300           cmp ax, 0x63                             
  0000:12b2  7619             jbe 0x12cd                               
  0000:12b4  3de703           cmp ax, 0x3e7                            
  0000:12b7  760a             jbe 0x12c3                               
  0000:12b9  99               cdq                                      
  0000:12ba  bbe803           mov bx, 0x3e8                            
  0000:12bd  f7f3             div bx                                   
  0000:12bf  02c1             add al, cl                               
  0000:12c1  aa               stosb byte ptr es:[di], al               
  0000:12c2  92               xchg dx, ax                              
  0000:12c3  b364             mov bl, 0x64                             
  0000:12c5  f6f3             div bl                                   
  0000:12c7  02c1             add al, cl                               
  0000:12c9  aa               stosb byte ptr es:[di], al               
  0000:12ca  86c4             xchg ah, al                              
  0000:12cc  98               cwde                                     
  0000:12cd  b30a             mov bl, 0xa                              
  0000:12cf  f6f3             div bl                                   
  0000:12d1  03c1             add ax, cx                               
  0000:12d3  ab               stosw word ptr es:[di], ax               
  0000:12d4  32c0             xor al, al                               
  0000:12d6  aa               stosb byte ptr es:[di], al               
  0000:12d7  07               pop es                                   
  0000:12d8  5f               pop di                                   
  0000:12d9  5e               pop si                                   
  0000:12da  8be5             mov sp, bp                               
  0000:12dc  5d               pop bp                                   
  0000:12dd  c21000           ret 0x10                                 

proc_0000_12e0:
  0000:12e0  55               push bp                                  
  0000:12e1  8bec             mov bp, sp                               
  0000:12e3  5d               pop bp                                   
  0000:12e4  c3               ret                                      

proc_0000_12e5:
  0000:12e5  55               push bp                                  
  0000:12e6  8bec             mov bp, sp                               
  0000:12e8  83ec18           sub sp, 0x18                             
  0000:12eb  56               push si                                  
  0000:12ec  57               push di                                  
  0000:12ed  c646fb00         mov byte ptr [bp - 5], 0                 
  0000:12f1  c646fa01         mov byte ptr [bp - 6], 1                 
  0000:12f5  c646f900         mov byte ptr [bp - 7], 0                 
  0000:12f9  c646f800         mov byte ptr [bp - 8], 0                 
  0000:12fd  c646f700         mov byte ptr [bp - 9], 0                 
  0000:1301  c746f40000       mov word ptr [bp - 0xc], 0               
  0000:1306  c746f20100       mov word ptr [bp - 0xe], 1               
  0000:130b  cd35ee           f-fldz                                   ; emu int 35
  0000:130e  cd377ee8         f-fstp xword ptr [bp - 0x18]             ; emu int 37
  0000:1312  cd3d             fwait                                    ; emu
  0000:1314  be0080           mov si, 0x8000                           
  0000:1317  bffeff           mov di, 0xfffe                           
  0000:131a  ff46f4           inc word ptr [bp - 0xc]                  
  0000:131d  ff760a           push word ptr [bp + 0xa]                 
  0000:1320  ff7608           push word ptr [bp + 8]                   
  0000:1323  ff5604           call word ptr [bp + 4]                   
  0000:1326  59               pop cx                                   
  0000:1327  59               pop cx                                   
  0000:1328  0bc0             or ax, ax                                
  0000:132a  7d03             jge 0x132f                               
  0000:132c  e98100           jmp 0x13b0                               
  0000:132f  98               cwde                                     
  0000:1330  93               xchg bx, ax                              
  0000:1331  f6c380           test bl, 0x80                            
  0000:1334  7507             jne 0x133d                               
  0000:1336  f6876f0e01       test byte ptr [bx + 0xe6f], 1            
  0000:133b  75dd             jne 0x131a                               
  0000:133d  93               xchg bx, ax                              
  0000:133e  ff4e0c           dec word ptr [bp + 0xc]                  
  0000:1341  7c68             jl 0x13ab                                
  0000:1343  3c2b             cmp al, 0x2b                             
  0000:1345  7407             je 0x134e                                
  0000:1347  3c2d             cmp al, 0x2d                             
  0000:1349  7535             jne 0x1380                               
  0000:134b  fe46fb           inc byte ptr [bp - 5]                    
  0000:134e  fe46f9           inc byte ptr [bp - 7]                    
  0000:1351  ff4e0c           dec word ptr [bp + 0xc]                  
  0000:1354  7c55             jl 0x13ab                                
  0000:1356  ff46f4           inc word ptr [bp - 0xc]                  
  0000:1359  ff760a           push word ptr [bp + 0xa]                 
  0000:135c  ff7608           push word ptr [bp + 8]                   
  0000:135f  ff5604           call word ptr [bp + 4]                   
  0000:1362  59               pop cx                                   
  0000:1363  59               pop cx                                   
  0000:1364  807efa01         cmp byte ptr [bp - 6], 1                 
  0000:1368  7516             jne 0x1380                               
  0000:136a  807ef900         cmp byte ptr [bp - 7], 0                 
  0000:136e  7410             je 0x1380                                
  0000:1370  3c49             cmp al, 0x49                             
  0000:1372  7406             je 0x137a                                
  0000:1374  3c4e             cmp al, 0x4e                             
  0000:1376  7405             je 0x137d                                
  0000:1378  eb06             jmp 0x1380                               
  0000:137a  e9df01           jmp 0x155c                               
  0000:137d  e91e02           jmp 0x159e                               
  0000:1380  c646fa00         mov byte ptr [bp - 6], 0                 
  0000:1384  3c2e             cmp al, 0x2e                             
  0000:1386  7432             je 0x13ba                                
  0000:1388  3c39             cmp al, 0x39                             
  0000:138a  772b             ja 0x13b7                                
  0000:138c  3c30             cmp al, 0x30                             
  0000:138e  7227             jb 0x13b7                                
  0000:1390  2c30             sub al, 0x30                             
  0000:1392  98               cwde                                     
  0000:1393  47               inc di                                   
  0000:1394  7f34             jg 0x13ca                                
  0000:1396  8846e8           mov byte ptr [bp - 0x18], al             
  0000:1399  bf0100           mov di, 1                                
  0000:139c  0ac0             or al, al                                
  0000:139e  75b1             jne 0x1351                               
  0000:13a0  f7df             neg di                                   
  0000:13a2  81fe0080         cmp si, 0x8000                           
  0000:13a6  74a9             je 0x1351                                
  0000:13a8  4e               dec si                                   
  0000:13a9  eba6             jmp 0x1351                               
  0000:13ab  b065             mov al, 0x65                             
  0000:13ad  e99000           jmp 0x1440                               
  0000:13b0  c746f2ffff       mov word ptr [bp - 0xe], 0xffff          
  0000:13b5  eb6d             jmp 0x1424                               
  0000:13b7  e98600           jmp 0x1440                               
  0000:13ba  81fe0080         cmp si, 0x8000                           
  0000:13be  75ed             jne 0x13ad                               
  0000:13c0  2bf6             sub si, si                               
  0000:13c2  0bff             or di, di                                
  0000:13c4  7e8b             jle 0x1351                               
  0000:13c6  8bf7             mov si, di                               
  0000:13c8  eb87             jmp 0x1351                               
  0000:13ca  83ff05           cmp di, 5                                
  0000:13cd  7714             ja 0x13e3                                
  0000:13cf  93               xchg bx, ax                              
  0000:13d0  b80a00           mov ax, 0xa                              
  0000:13d3  f766e8           mul word ptr [bp - 0x18]                 
  0000:13d6  03c3             add ax, bx                               
  0000:13d8  12d6             adc dl, dh                               
  0000:13da  8946e8           mov word ptr [bp - 0x18], ax             
  0000:13dd  8956ea           mov word ptr [bp - 0x16], dx             
  0000:13e0  e96eff           jmp 0x1351                               
  0000:13e3  83ff12           cmp di, 0x12                             
  0000:13e6  7734             ja 0x141c                                
  0000:13e8  93               xchg bx, ax                              
  0000:13e9  b80a00           mov ax, 0xa                              
  0000:13ec  f766ee           mul word ptr [bp - 0x12]                 
  0000:13ef  8946ee           mov word ptr [bp - 0x12], ax             
  0000:13f2  b80a00           mov ax, 0xa                              
  0000:13f5  f766ec           mul word ptr [bp - 0x14]                 
  0000:13f8  8946ec           mov word ptr [bp - 0x14], ax             
  0000:13fb  52               push dx                                  
  0000:13fc  b80a00           mov ax, 0xa                              
  0000:13ff  f766ea           mul word ptr [bp - 0x16]                 
  0000:1402  8946ea           mov word ptr [bp - 0x16], ax             
  0000:1405  52               push dx                                  
  0000:1406  b80a00           mov ax, 0xa                              
  0000:1409  f766e8           mul word ptr [bp - 0x18]                 
  0000:140c  03c3             add ax, bx                               
  0000:140e  8946e8           mov word ptr [bp - 0x18], ax             
  0000:1411  1156ea           adc word ptr [bp - 0x16], dx             
  0000:1414  5a               pop dx                                   
  0000:1415  1156ec           adc word ptr [bp - 0x14], dx             
  0000:1418  5a               pop dx                                   
  0000:1419  1156ee           adc word ptr [bp - 0x12], dx             
  0000:141c  e932ff           jmp 0x1351                               
  0000:141f  c746f20000       mov word ptr [bp - 0xe], 0               
  0000:1424  837e0c00         cmp word ptr [bp + 0xc], 0               
  0000:1428  7c10             jl 0x143a                                
  0000:142a  ff760a           push word ptr [bp + 0xa]                 
  0000:142d  ff7608           push word ptr [bp + 8]                   
  0000:1430  50               push ax                                  
  0000:1431  ff5606           call word ptr [bp + 6]                   
  0000:1434  83c406           add sp, 6                                
  0000:1437  ff4ef4           dec word ptr [bp - 0xc]                  
  0000:143a  cd35ee           f-fldz                                   ; emu int 35
  0000:143d  e9fe00           jmp 0x153e                               
  0000:1440  83fffe           cmp di, -2                               
  0000:1443  74da             je 0x141f                                
  0000:1445  81fe0080         cmp si, 0x8000                           
  0000:1449  7502             jne 0x144d                               
  0000:144b  8bf7             mov si, di                               
  0000:144d  897efc           mov word ptr [bp - 4], di                
  0000:1450  8976fe           mov word ptr [bp - 2], si                
  0000:1453  2bff             sub di, di                               
  0000:1455  3c45             cmp al, 0x45                             
  0000:1457  7404             je 0x145d                                
  0000:1459  3c65             cmp al, 0x65                             
  0000:145b  7552             jne 0x14af                               
  0000:145d  ff4e0c           dec word ptr [bp + 0xc]                  
  0000:1460  7c5d             jl 0x14bf                                
  0000:1462  ff46f4           inc word ptr [bp - 0xc]                  
  0000:1465  ff760a           push word ptr [bp + 0xa]                 
  0000:1468  ff7608           push word ptr [bp + 8]                   
  0000:146b  ff5604           call word ptr [bp + 4]                   
  0000:146e  59               pop cx                                   
  0000:146f  59               pop cx                                   
  0000:1470  3c2b             cmp al, 0x2b                             
  0000:1472  7407             je 0x147b                                
  0000:1474  3c2d             cmp al, 0x2d                             
  0000:1476  7516             jne 0x148e                               
  0000:1478  fe46f8           inc byte ptr [bp - 8]                    
  0000:147b  ff4e0c           dec word ptr [bp + 0xc]                  
  0000:147e  7c3f             jl 0x14bf                                
  0000:1480  ff46f4           inc word ptr [bp - 0xc]                  
  0000:1483  ff760a           push word ptr [bp + 0xa]                 
  0000:1486  ff7608           push word ptr [bp + 8]                   
  0000:1489  ff5604           call word ptr [bp + 4]                   
  0000:148c  59               pop cx                                   
  0000:148d  59               pop cx                                   
  0000:148e  3c39             cmp al, 0x39                             
  0000:1490  771d             ja 0x14af                                
  0000:1492  2c30             sub al, 0x30                             
  0000:1494  7217             jb 0x14ad                                
  0000:1496  98               cwde                                     
  0000:1497  97               xchg di, ax                              
  0000:1498  ba0a00           mov dx, 0xa                              
  0000:149b  f7e2             mul dx                                   
  0000:149d  03f8             add di, ax                               
  0000:149f  81ff4413         cmp di, 0x1344                           
  0000:14a3  7ed6             jle 0x147b                               
  0000:14a5  33ff             xor di, di                               
  0000:14a7  c646f701         mov byte ptr [bp - 9], 1                 
  0000:14ab  ebce             jmp 0x147b                               
  0000:14ad  0430             add al, 0x30                             
  0000:14af  ff760a           push word ptr [bp + 0xa]                 
  0000:14b2  ff7608           push word ptr [bp + 8]                   
  0000:14b5  50               push ax                                  
  0000:14b6  ff5606           call word ptr [bp + 6]                   
  0000:14b9  83c406           add sp, 6                                
  0000:14bc  ff4ef4           dec word ptr [bp - 0xc]                  
  0000:14bf  f646f8ff         test byte ptr [bp - 8], 0xff             
  0000:14c3  7405             je 0x14ca                                
  0000:14c5  f7df             neg di                                   
  0000:14c7  f65ef7           neg byte ptr [bp - 9]                    
  0000:14ca  8b5efc           mov bx, word ptr [bp - 4]                
  0000:14cd  0bdb             or bx, bx                                
  0000:14cf  7d05             jge 0x14d6                               
  0000:14d1  cd35ee           f-fldz                                   ; emu int 35
  0000:14d4  eb68             jmp 0x153e                               
  0000:14d6  8b4efe           mov cx, word ptr [bp - 2]                
  0000:14d9  8bc1             mov ax, cx                               
  0000:14db  03c7             add ax, di                               
  0000:14dd  807ef701         cmp byte ptr [bp - 9], 1                 
  0000:14e1  740b             je 0x14ee                                
  0000:14e3  807ef7ff         cmp byte ptr [bp - 9], 0xff              
  0000:14e7  7524             jne 0x150d                               
  0000:14e9  cd35ee           f-fldz                                   ; emu int 35
  0000:14ec  eb18             jmp 0x1506                               
  0000:14ee  b8ffff           mov ax, 0xffff                           
  0000:14f1  8946e8           mov word ptr [bp - 0x18], ax             
  0000:14f4  8946ea           mov word ptr [bp - 0x16], ax             
  0000:14f7  8946ec           mov word ptr [bp - 0x14], ax             
  0000:14fa  8946ee           mov word ptr [bp - 0x12], ax             
  0000:14fd  c746f0fe7f       mov word ptr [bp - 0x10], 0x7ffe         
  0000:1502  cd376ee8         f-fld xword ptr [bp - 0x18]              ; emu int 37
  0000:1506  c746f20200       mov word ptr [bp - 0xe], 2               
  0000:150b  eb31             jmp 0x153e                               
  0000:150d  8bc3             mov ax, bx                               
  0000:150f  83fb12           cmp bx, 0x12                             
  0000:1512  7603             jbe 0x1517                               
  0000:1514  bb1200           mov bx, 0x12                             
  0000:1517  03c1             add ax, cx                               
  0000:1519  2bcb             sub cx, bx                               
  0000:151b  03f9             add di, cx                               
  0000:151d  cd3b6ee8         f-fild qword ptr [bp - 0x18]             ; emu int 3b
  0000:1521  8bc7             mov ax, di                               
  0000:1523  0bc0             or ax, ax                                
  0000:1525  7417             je 0x153e                                
  0000:1527  7d02             jge 0x152b                               
  0000:1529  f7d8             neg ax                                   
  0000:152b  50               push ax                                  
  0000:152c  90               nop                                      
  0000:152d  0e               push cs                                  
  0000:152e  e8cf04           call 0x1a00                              -> 0000:1a00
  0000:1531  58               pop ax                                   
  0000:1532  0bff             or di, di                                
  0000:1534  7d05             jge 0x153b                               
  0000:1536  cd3af9           f-fdivp st(1)                            ; emu int 3a
  0000:1539  eb03             jmp 0x153e                               
  0000:153b  cd3ac9           f-fmulp st(1)                            ; emu int 3a
  0000:153e  807efb00         cmp byte ptr [bp - 5], 0                 
  0000:1542  7403             je 0x1547                                
  0000:1544  cd35e0           f-fchs                                   ; emu int 35
  0000:1547  c47e0e           les di, ptr [bp + 0xe]                   
  0000:154a  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0000:154d  26011d           add word ptr es:[di], bx                 
  0000:1550  c47e12           les di, ptr [bp + 0x12]                  
  0000:1553  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0000:1556  26891d           mov word ptr es:[di], bx                 
  0000:1559  e98e00           jmp 0x15ea                               
  0000:155c  ff46f4           inc word ptr [bp - 0xc]                  
  0000:155f  ff760a           push word ptr [bp + 0xa]                 
  0000:1562  ff7608           push word ptr [bp + 8]                   
  0000:1565  ff5604           call word ptr [bp + 4]                   
  0000:1568  59               pop cx                                   
  0000:1569  59               pop cx                                   
  0000:156a  ff4e0c           dec word ptr [bp + 0xc]                  
  0000:156d  7c73             jl 0x15e2                                
  0000:156f  3c4e             cmp al, 0x4e                             
  0000:1571  756f             jne 0x15e2                               
  0000:1573  ff46f4           inc word ptr [bp - 0xc]                  
  0000:1576  ff760a           push word ptr [bp + 0xa]                 
  0000:1579  ff7608           push word ptr [bp + 8]                   
  0000:157c  ff5604           call word ptr [bp + 4]                   
  0000:157f  59               pop cx                                   
  0000:1580  59               pop cx                                   
  0000:1581  ff4e0c           dec word ptr [bp + 0xc]                  
  0000:1584  7c5c             jl 0x15e2                                
  0000:1586  3c46             cmp al, 0x46                             
  0000:1588  7558             jne 0x15e2                               
  0000:158a  807efb00         cmp byte ptr [bp - 5], 0                 
  0000:158e  7407             je 0x1597                                
  0000:1590  cd3506220d       f-fld dword ptr [0xd22]                  ; emu int 35
  0000:1595  ebb0             jmp 0x1547                               
  0000:1597  cd35061e0d       f-fld dword ptr [0xd1e]                  ; emu int 35
  0000:159c  eba9             jmp 0x1547                               
  0000:159e  ff46f4           inc word ptr [bp - 0xc]                  
  0000:15a1  ff760a           push word ptr [bp + 0xa]                 
  0000:15a4  ff7608           push word ptr [bp + 8]                   
  0000:15a7  ff5604           call word ptr [bp + 4]                   
  0000:15aa  59               pop cx                                   
  0000:15ab  59               pop cx                                   
  0000:15ac  ff4e0c           dec word ptr [bp + 0xc]                  
  0000:15af  7c31             jl 0x15e2                                
  0000:15b1  3c41             cmp al, 0x41                             
  0000:15b3  752d             jne 0x15e2                               
  0000:15b5  ff46f4           inc word ptr [bp - 0xc]                  
  0000:15b8  ff760a           push word ptr [bp + 0xa]                 
  0000:15bb  ff7608           push word ptr [bp + 8]                   
  0000:15be  ff5604           call word ptr [bp + 4]                   
  0000:15c1  59               pop cx                                   
  0000:15c2  59               pop cx                                   
  0000:15c3  ff4e0c           dec word ptr [bp + 0xc]                  
  0000:15c6  7c1a             jl 0x15e2                                
  0000:15c8  3c4e             cmp al, 0x4e                             
  0000:15ca  7516             jne 0x15e2                               
  0000:15cc  807efb00         cmp byte ptr [bp - 5], 0                 
  0000:15d0  7408             je 0x15da                                
  0000:15d2  cd35062a0d       f-fld dword ptr [0xd2a]                  ; emu int 35
  0000:15d7  e96dff           jmp 0x1547                               
  0000:15da  cd3506260d       f-fld dword ptr [0xd26]                  ; emu int 35
  0000:15df  e965ff           jmp 0x1547                               
  0000:15e2  c746f20000       mov word ptr [bp - 0xe], 0               
  0000:15e7  e935fe           jmp 0x141f                               
  0000:15ea  5f               pop di                                   
  0000:15eb  5e               pop si                                   
  0000:15ec  8be5             mov sp, bp                               
  0000:15ee  5d               pop bp                                   
  0000:15ef  c3               ret                                      

proc_0000_15f0:
  0000:15f0  55               push bp                                  
  0000:15f1  8bec             mov bp, sp                               
  0000:15f3  cd39d8           f-fstp st(0)                             ; emu int 39
  0000:15f6  5d               pop bp                                   
  0000:15f7  c3               ret                                      

proc_0000_15f8:
  0000:15f8  55               push bp                                  
  0000:15f9  8bec             mov bp, sp                               
  0000:15fb  83ec0a           sub sp, 0xa                              
  0000:15fe  56               push si                                  
  0000:15ff  8b7608           mov si, word ptr [bp + 8]                
  0000:1602  cd377ef6         f-fstp xword ptr [bp - 0xa]              ; emu int 37
  0000:1606  f7c60400         test si, 4                               
  0000:160a  7429             je 0x1635                                
  0000:160c  b80100           mov ax, 1                                
  0000:160f  50               push ax                                  
  0000:1610  cd376ef6         f-fld xword ptr [bp - 0xa]               ; emu int 37
  0000:1614  83ec0a           sub sp, 0xa                              
  0000:1617  cd377ee8         f-fstp xword ptr [bp - 0x18]             ; emu int 37
  0000:161b  cd3906ba0c       f-fld qword ptr [0xcba]                  ; emu int 39
  0000:1620  83ec08           sub sp, 8                                
  0000:1623  cd395ee0         f-fstp qword ptr [bp - 0x20]             ; emu int 39
  0000:1627  cd3d             fwait                                    ; emu
  0000:1629  e862fa           call 0x108e                              -> 0000:108e
  0000:162c  c45e04           les bx, ptr [bp + 4]                     
  0000:162f  cd3c             int 0x3c                                 
  0000:1631  dd1f             fstp qword ptr [bx]                      
  0000:1633  eb39             jmp 0x166e                               
  0000:1635  f7c60800         test si, 8                               
  0000:1639  740d             je 0x1648                                
  0000:163b  c45e04           les bx, ptr [bp + 4]                     
  0000:163e  cd376ef6         f-fld xword ptr [bp - 0xa]               ; emu int 37
  0000:1642  cd3c             int 0x3c                                 
  0000:1644  db3f             fstp xword ptr [bx]                      
  0000:1646  eb26             jmp 0x166e                               
  0000:1648  33c0             xor ax, ax                               
  0000:164a  50               push ax                                  
  0000:164b  cd376ef6         f-fld xword ptr [bp - 0xa]               ; emu int 37
  0000:164f  83ec0a           sub sp, 0xa                              
  0000:1652  cd377ee8         f-fstp xword ptr [bp - 0x18]             ; emu int 37
  0000:1656  cd39062e0d       f-fld qword ptr [0xd2e]                  ; emu int 39
  0000:165b  83ec08           sub sp, 8                                
  0000:165e  cd395ee0         f-fstp qword ptr [bp - 0x20]             ; emu int 39
  0000:1662  cd3d             fwait                                    ; emu
  0000:1664  e827fa           call 0x108e                              -> 0000:108e
  0000:1667  c45e04           les bx, ptr [bp + 4]                     
  0000:166a  cd3c             int 0x3c                                 
  0000:166c  d91f             fstp dword ptr [bx]                      
  0000:166e  cd3d             fwait                                    ; emu
  0000:1670  5e               pop si                                   
  0000:1671  8be5             mov sp, bp                               
  0000:1673  5d               pop bp                                   
  0000:1674  c3               ret                                      

proc_0000_1675:
  0000:1675  55               push bp                                  
  0000:1676  8bec             mov bp, sp                               
  0000:1678  5d               pop bp                                   
  0000:1679  cb               retf                                     

proc_0000_167a:
  0000:167a  55               push bp                                  
  0000:167b  8bec             mov bp, sp                               
  0000:167d  83ec10           sub sp, 0x10                             
  0000:1680  56               push si                                  
  0000:1681  57               push di                                  
  0000:1682  c746fe0080       mov word ptr [bp - 2], 0x8000            
  0000:1687  c746fc0a00       mov word ptr [bp - 4], 0xa               
  0000:168c  06               push es                                  
  0000:168d  c47e10           les di, ptr [bp + 0x10]                  
  0000:1690  b8ff7f           mov ax, 0x7fff                           
  0000:1693  8b5e04           mov bx, word ptr [bp + 4]                
  0000:1696  268b09           mov cx, word ptr es:[bx + di]            
  0000:1699  214efe           and word ptr [bp - 2], cx                
  0000:169c  262101           and word ptr es:[bx + di], ax            
  0000:169f  d1eb             shr bx, 1                                
  0000:16a1  d1eb             shr bx, 1                                
  0000:16a3  d1e3             shl bx, 1                                
  0000:16a5  2effa7aa16       jmp word ptr cs:[bx + 0x16aa]            
  0000:16aa  b016             mov al, 0x16                             
  0000:16ac  b616             mov dh, 0x16                             
  0000:16ae  bc16cd           mov sp, 0xcd16                           
  0000:16b1  3cd9             cmp al, 0xd9                             
  0000:16b3  05eb17           add ax, 0x17eb                           
  0000:16b6  cd3c             int 0x3c                                 
  0000:16b8  dd05             fld qword ptr [di]                       
  0000:16ba  eb11             jmp 0x16cd                               
  0000:16bc  26234508         and ax, word ptr es:[di + 8]             
  0000:16c0  3dff7f           cmp ax, 0x7fff                           
  0000:16c3  7404             je 0x16c9                                
  0000:16c5  268025f0         and byte ptr es:[di], 0xf0               
  0000:16c9  cd3c             int 0x3c                                 
  0000:16cb  db2d             fld xword ptr [di]                       
  0000:16cd  33db             xor bx, bx                               
  0000:16cf  d1e1             shl cx, 1                                
  0000:16d1  d1d3             rcl bx, 1                                
  0000:16d3  c47e0a           les di, ptr [bp + 0xa]                   
  0000:16d6  26891d           mov word ptr es:[di], bx                 
  0000:16d9  cd35e5           f-fxam                                   ; emu int 35
  0000:16dc  cd397efa         f-fnstsw word ptr [bp - 6]               ; emu int 39
  0000:16e0  cd3d             fwait                                    ; emu
  0000:16e2  8b46fa           mov ax, word ptr [bp - 6]                
  0000:16e5  80e447           and ah, 0x47                             
  0000:16e8  80fc40           cmp ah, 0x40                             
  0000:16eb  7416             je 0x1703                                
  0000:16ed  80fc05           cmp ah, 5                                
  0000:16f0  740c             je 0x16fe                                
  0000:16f2  80fc01           cmp ah, 1                                
  0000:16f5  7402             je 0x16f9                                
  0000:16f7  eb30             jmp 0x1729                               
  0000:16f9  bafe7f           mov dx, 0x7ffe                           
  0000:16fc  eb25             jmp 0x1723                               
  0000:16fe  baff7f           mov dx, 0x7fff                           
  0000:1701  eb20             jmp 0x1723                               
  0000:1703  ba0100           mov dx, 1                                
  0000:1706  b030             mov al, 0x30                             
  0000:1708  8b4e0e           mov cx, word ptr [bp + 0xe]              
  0000:170b  0bc9             or cx, cx                                
  0000:170d  7f03             jg 0x1712                                
  0000:170f  f7d9             neg cx                                   
  0000:1711  41               inc cx                                   
  0000:1712  83f928           cmp cx, 0x28                             
  0000:1715  7603             jbe 0x171a                               
  0000:1717  b92800           mov cx, 0x28                             
  0000:171a  fc               cld                                      
  0000:171b  c47e06           les di, ptr [bp + 6]                     
  0000:171e  f3aa             rep stosb byte ptr es:[di], al           
  0000:1720  32c0             xor al, al                               
  0000:1722  aa               stosb byte ptr es:[di], al               
  0000:1723  cd39d8           f-fstp st(0)                             ; emu int 39
  0000:1726  e94501           jmp 0x186e                               
  0000:1729  cd35c0           f-fld st(0)                              ; emu int 35
  0000:172c  cd377ef0         f-fstp xword ptr [bp - 0x10]             ; emu int 37
  0000:1730  cd3d             fwait                                    ; emu
  0000:1732  8b46f8           mov ax, word ptr [bp - 8]                
  0000:1735  2dff3f           sub ax, 0x3fff                           
  0000:1738  ba104d           mov dx, 0x4d10                           
  0000:173b  f7ea             imul dx                                  
  0000:173d  93               xchg bx, ax                              
  0000:173e  b44d             mov ah, 0x4d                             
  0000:1740  8a46f7           mov al, byte ptr [bp - 9]                
  0000:1743  d0e0             shl al, 1                                
  0000:1745  f6e4             mul ah                                   
  0000:1747  03c3             add ax, bx                               
  0000:1749  83d200           adc dx, 0                                
  0000:174c  f7d8             neg ax                                   
  0000:174e  83d200           adc dx, 0                                
  0000:1751  8b460e           mov ax, word ptr [bp + 0xe]              
  0000:1754  0bc0             or ax, ax                                
  0000:1756  7f06             jg 0x175e                                
  0000:1758  f7d8             neg ax                                   
  0000:175a  03c2             add ax, dx                               
  0000:175c  7ca5             jl 0x1703                                
  0000:175e  3d1200           cmp ax, 0x12                             
  0000:1761  7e03             jle 0x1766                               
  0000:1763  b81200           mov ax, 0x12                             
  0000:1766  8bd8             mov bx, ax                               
  0000:1768  2bc2             sub ax, dx                               
  0000:176a  7428             je 0x1794                                
  0000:176c  8bf0             mov si, ax                               
  0000:176e  7d02             jge 0x1772                               
  0000:1770  f7d8             neg ax                                   
  0000:1772  3d4413           cmp ax, 0x1344                           
  0000:1775  7e03             jle 0x177a                               
  0000:1777  b84413           mov ax, 0x1344                           
  0000:177a  50               push ax                                  
  0000:177b  90               nop                                      
  0000:177c  0e               push cs                                  
  0000:177d  e88002           call 0x1a00                              -> 0000:1a00
  0000:1780  58               pop ax                                   
  0000:1781  0bf6             or si, si                                
  0000:1783  7f07             jg 0x178c                                
  0000:1785  cd3af9           f-fdivp st(1)                            ; emu int 3a
  0000:1788  03c6             add ax, si                               
  0000:178a  ebde             jmp 0x176a                               
  0000:178c  cd3ac9           f-fmulp st(1)                            ; emu int 3a
  0000:178f  96               xchg si, ax                              
  0000:1790  2bc6             sub ax, si                               
  0000:1792  ebd6             jmp 0x176a                               
  0000:1794  53               push bx                                  
  0000:1795  90               nop                                      
  0000:1796  0e               push cs                                  
  0000:1797  e86602           call 0x1a00                              -> 0000:1a00
  0000:179a  58               pop ax                                   
  0000:179b  cd34d9           f-fcomp st(1)                            ; emu int 34
  0000:179e  cd397efa         f-fnstsw word ptr [bp - 6]               ; emu int 39
  0000:17a2  cd3d             fwait                                    ; emu
  0000:17a4  f646fb45         test byte ptr [bp - 5], 0x45             
  0000:17a8  7414             je 0x17be                                
  0000:17aa  42               inc dx                                   
  0000:17ab  43               inc bx                                   
  0000:17ac  83fb12           cmp bx, 0x12                             
  0000:17af  7706             ja 0x17b7                                
  0000:17b1  837e0e00         cmp word ptr [bp + 0xe], 0               
  0000:17b5  7e2d             jle 0x17e4                               
  0000:17b7  cd3a76fc         f-fidiv word ptr [bp - 4]                ; emu int 3a
  0000:17bb  4b               dec bx                                   
  0000:17bc  eb26             jmp 0x17e4                               
  0000:17be  8bc3             mov ax, bx                               
  0000:17c0  48               dec ax                                   
  0000:17c1  50               push ax                                  
  0000:17c2  90               nop                                      
  0000:17c3  0e               push cs                                  
  0000:17c4  e83902           call 0x1a00                              -> 0000:1a00
  0000:17c7  58               pop ax                                   
  0000:17c8  cd34d9           f-fcomp st(1)                            ; emu int 34
  0000:17cb  cd397efa         f-fnstsw word ptr [bp - 6]               ; emu int 39
  0000:17cf  cd3d             fwait                                    ; emu
  0000:17d1  f646fb41         test byte ptr [bp - 5], 0x41             
  0000:17d5  750d             jne 0x17e4                               
  0000:17d7  4a               dec dx                                   
  0000:17d8  4b               dec bx                                   
  0000:17d9  837e0e00         cmp word ptr [bp + 0xe], 0               
  0000:17dd  7e05             jle 0x17e4                               
  0000:17df  cd3a4efc         f-fimul word ptr [bp - 4]                ; emu int 3a
  0000:17e3  43               inc bx                                   
  0000:17e4  0bdb             or bx, bx                                
  0000:17e6  7c25             jl 0x180d                                
  0000:17e8  cd35fc           f-frndint                                ; emu int 35
  0000:17eb  cd3b76f0         f-fbstp tbyte ptr [bp - 0x10]            ; emu int 3b
  0000:17ef  c47e06           les di, ptr [bp + 6]                     
  0000:17f2  03fb             add di, bx                               
  0000:17f4  57               push di                                  
  0000:17f5  32c0             xor al, al                               
  0000:17f7  fd               std                                      
  0000:17f8  aa               stosb byte ptr es:[di], al               
  0000:17f9  8d76f0           lea si, [bp - 0x10]                      
  0000:17fc  b90400           mov cx, 4                                
  0000:17ff  cd3d             fwait                                    ; emu
  0000:1801  0bdb             or bx, bx                                
  0000:1803  750f             jne 0x1814                               
  0000:1805  368a2c           mov ch, byte ptr ss:[si]                 
  0000:1808  80f501           xor ch, 1                                
  0000:180b  7422             je 0x182f                                
  0000:180d  cd35ee           f-fldz                                   ; emu int 35
  0000:1810  5f               pop di                                   
  0000:1811  e9effe           jmp 0x1703                               
  0000:1814  368a04           mov al, byte ptr ss:[si]                 
  0000:1817  46               inc si                                   
  0000:1818  8ae0             mov ah, al                               
  0000:181a  d2ec             shr ah, cl                               
  0000:181c  240f             and al, 0xf                              
  0000:181e  053030           add ax, 0x3030                           
  0000:1821  aa               stosb byte ptr es:[di], al               
  0000:1822  0ae8             or ch, al                                
  0000:1824  4b               dec bx                                   
  0000:1825  7408             je 0x182f                                
  0000:1827  8ac4             mov al, ah                               
  0000:1829  aa               stosb byte ptr es:[di], al               
  0000:182a  0ae8             or ch, al                                
  0000:182c  4b               dec bx                                   
  0000:182d  75e5             jne 0x1814                               
  0000:182f  5b               pop bx                                   
  0000:1830  80e50f           and ch, 0xf                              
  0000:1833  7511             jne 0x1846                               
  0000:1835  42               inc dx                                   
  0000:1836  837e0e00         cmp word ptr [bp + 0xe], 0               
  0000:183a  7f04             jg 0x1840                                
  0000:183c  26c60730         mov byte ptr es:[bx], 0x30               
  0000:1840  43               inc bx                                   
  0000:1841  26c6450131       mov byte ptr es:[di + 1], 0x31           
  0000:1846  8b4e0e           mov cx, word ptr [bp + 0xe]              
  0000:1849  0bc9             or cx, cx                                
  0000:184b  7f04             jg 0x1851                                
  0000:184d  f7d9             neg cx                                   
  0000:184f  03ca             add cx, dx                               
  0000:1851  83f928           cmp cx, 0x28                             
  0000:1854  7603             jbe 0x1859                               
  0000:1856  b92800           mov cx, 0x28                             
  0000:1859  26c60700         mov byte ptr es:[bx], 0                  
  0000:185d  8bc3             mov ax, bx                               
  0000:185f  2b4606           sub ax, word ptr [bp + 6]                
  0000:1862  2bc8             sub cx, ax                               
  0000:1864  7608             jbe 0x186e                               
  0000:1866  26c7073000       mov word ptr es:[bx], 0x30               
  0000:186b  43               inc bx                                   
  0000:186c  e2f8             loop 0x1866                              
  0000:186e  fc               cld                                      
  0000:186f  c47e10           les di, ptr [bp + 0x10]                  
  0000:1872  8b5e04           mov bx, word ptr [bp + 4]                
  0000:1875  8b4efe           mov cx, word ptr [bp - 2]                
  0000:1878  260909           or word ptr es:[bx + di], cx             
  0000:187b  07               pop es                                   
  0000:187c  8bc2             mov ax, dx                               
  0000:187e  5f               pop di                                   
  0000:187f  5e               pop si                                   
  0000:1880  8be5             mov sp, bp                               
  0000:1882  5d               pop bp                                   
  0000:1883  c21000           ret 0x10                                 

proc_0000_1886:
  0000:1886  55               push bp                                  
  0000:1887  8bec             mov bp, sp                               
  0000:1889  83ec08           sub sp, 8                                
  0000:188c  8c56fe           mov word ptr [bp - 2], ss                
  0000:188f  895efc           mov word ptr [bp - 4], bx                
  0000:1892  a1681b           mov ax, word ptr [0x1b68]                
  0000:1895  0b066a1b         or ax, word ptr [0x1b6a]                 
  0000:1899  7467             je 0x1902                                
  0000:189b  33c0             xor ax, ax                               
  0000:189d  33d2             xor dx, dx                               
  0000:189f  50               push ax                                  
  0000:18a0  52               push dx                                  
  0000:18a1  b80800           mov ax, 8                                
  0000:18a4  50               push ax                                  
  0000:18a5  ff1e681b         lcall [0x1b68]                           
  0000:18a9  83c406           add sp, 6                                
  0000:18ac  8956fa           mov word ptr [bp - 6], dx                
  0000:18af  8946f8           mov word ptr [bp - 8], ax                
  0000:18b2  52               push dx                                  
  0000:18b3  50               push ax                                  
  0000:18b4  b80800           mov ax, 8                                
  0000:18b7  50               push ax                                  
  0000:18b8  ff1e681b         lcall [0x1b68]                           
  0000:18bc  83c406           add sp, 6                                
  0000:18bf  837efa00         cmp word ptr [bp - 6], 0                 
  0000:18c3  7506             jne 0x18cb                               
  0000:18c5  837ef801         cmp word ptr [bp - 8], 1                 
  0000:18c9  7468             je 0x1933                                
  0000:18cb  8b46f8           mov ax, word ptr [bp - 8]                
  0000:18ce  0b46fa           or ax, word ptr [bp - 6]                 
  0000:18d1  742f             je 0x1902                                
  0000:18d3  33c0             xor ax, ax                               
  0000:18d5  33d2             xor dx, dx                               
  0000:18d7  50               push ax                                  
  0000:18d8  52               push dx                                  
  0000:18d9  b80800           mov ax, 8                                
  0000:18dc  50               push ax                                  
  0000:18dd  ff1e681b         lcall [0x1b68]                           
  0000:18e1  83c406           add sp, 6                                
  0000:18e4  c45efc           les bx, ptr [bp - 4]                     
  0000:18e7  268b07           mov ax, word ptr es:[bx]                 
  0000:18ea  ba0600           mov dx, 6                                
  0000:18ed  f7ea             imul dx                                  
  0000:18ef  8bd8             mov bx, ax                               
  0000:18f1  ffb7300d         push word ptr [bx + 0xd30]               
  0000:18f5  b80800           mov ax, 8                                
  0000:18f8  50               push ax                                  
  0000:18f9  ff5ef8           lcall [bp - 8]                           
  0000:18fc  59               pop cx                                   
  0000:18fd  59               pop cx                                   
  0000:18fe  eb33             jmp 0x1933                               
  0000:1900  eb31             jmp 0x1933                               
  0000:1902  c45efc           les bx, ptr [bp - 4]                     
  0000:1905  268b07           mov ax, word ptr es:[bx]                 
  0000:1908  ba0600           mov dx, 6                                
  0000:190b  f7ea             imul dx                                  
  0000:190d  ba300d           mov dx, 0xd30                            
  0000:1910  83c202           add dx, 2                                
  0000:1913  03c2             add ax, dx                               
  0000:1915  8bd8             mov bx, ax                               
  0000:1917  ff7702           push word ptr [bx + 2]                   
  0000:191a  ff37             push word ptr [bx]                       
  0000:191c  1e               push ds                                  
  0000:191d  b8b50d           mov ax, 0xdb5                             ; "Floating point error: %s."
  0000:1920  50               push ax                                  
  0000:1921  1e               push ds                                  
  0000:1922  b8a40f           mov ax, 0xfa4                            
  0000:1925  50               push ax                                  
  0000:1926  90               nop                                      
  0000:1927  0e               push cs                                  
  0000:1928  e84b24           call 0x3d76                              -> 0000:3d76
  0000:192b  83c40c           add sp, 0xc                              
  0000:192e  90               nop                                      
  0000:192f  0e               push cs                                  
  0000:1930  e847e9           call 0x27a                               -> 0000:027a
  0000:1933  8be5             mov sp, bp                               
  0000:1935  5d               pop bp                                   
  0000:1936  c3               ret                                      

proc_0000_1937:
  0000:1937  55               push bp                                  
  0000:1938  8bec             mov bp, sp                               
  0000:193a  56               push si                                  
  0000:193b  8b4604           mov ax, word ptr [bp + 4]                
  0000:193e  3dbcec           cmp ax, 0xecbc                           
  0000:1941  7d06             jge 0x1949                               
  0000:1943  cd35ee           f-fldz                                   ; emu int 35
  0000:1946  e9b200           jmp 0x19fb                               
  0000:1949  3d4413           cmp ax, 0x1344                           
  0000:194c  7e08             jle 0x1956                               
  0000:194e  cd35064c0e       f-fld dword ptr [0xe4c]                  ; emu int 35
  0000:1953  e9a500           jmp 0x19fb                               
  0000:1956  0bc0             or ax, ax                                
  0000:1958  7506             jne 0x1960                               
  0000:195a  cd35e8           f-fld1                                   ; emu int 35
  0000:195d  e99b00           jmp 0x19fb                               
  0000:1960  0bc0             or ax, ax                                
  0000:1962  7d02             jge 0x1966                               
  0000:1964  f7d8             neg ax                                   
  0000:1966  be0700           mov si, 7                                
  0000:1969  23f0             and si, ax                               
  0000:196b  d1e6             shl si, 1                                
  0000:196d  d1e6             shl si, 1                                
  0000:196f  cd3584d00d       f-fld dword ptr [si + 0xdd0]             ; emu int 35
  0000:1974  d1e8             shr ax, 1                                
  0000:1976  d1e8             shr ax, 1                                
  0000:1978  d1e8             shr ax, 1                                
  0000:197a  d1e8             shr ax, 1                                
  0000:197c  7305             jae 0x1983                               
  0000:197e  cd340ef00d       f-fmul dword ptr [0xdf0]                 ; emu int 34
  0000:1983  7502             jne 0x1987                               
  0000:1985  eb69             jmp 0x19f0                               
  0000:1987  d1e8             shr ax, 1                                
  0000:1989  7305             jae 0x1990                               
  0000:198b  cd380ef40d       f-fmul qword ptr [0xdf4]                 ; emu int 38
  0000:1990  d1e8             shr ax, 1                                
  0000:1992  7308             jae 0x199c                               
  0000:1994  cd372efc0d       f-fld xword ptr [0xdfc]                  ; emu int 37
  0000:1999  cd3ac9           f-fmulp st(1)                            ; emu int 3a
  0000:199c  d1e8             shr ax, 1                                
  0000:199e  7308             jae 0x19a8                               
  0000:19a0  cd372e060e       f-fld xword ptr [0xe06]                  ; emu int 37
  0000:19a5  cd3ac9           f-fmulp st(1)                            ; emu int 3a
  0000:19a8  d1e8             shr ax, 1                                
  0000:19aa  7308             jae 0x19b4                               
  0000:19ac  cd372e100e       f-fld xword ptr [0xe10]                  ; emu int 37
  0000:19b1  cd3ac9           f-fmulp st(1)                            ; emu int 3a
  0000:19b4  d1e8             shr ax, 1                                
  0000:19b6  7308             jae 0x19c0                               
  0000:19b8  cd372e1a0e       f-fld xword ptr [0xe1a]                  ; emu int 37
  0000:19bd  cd3ac9           f-fmulp st(1)                            ; emu int 3a
  0000:19c0  d1e8             shr ax, 1                                
  0000:19c2  7308             jae 0x19cc                               
  0000:19c4  cd372e240e       f-fld xword ptr [0xe24]                  ; emu int 37
  0000:19c9  cd3ac9           f-fmulp st(1)                            ; emu int 3a
  0000:19cc  d1e8             shr ax, 1                                
  0000:19ce  7308             jae 0x19d8                               
  0000:19d0  cd372e2e0e       f-fld xword ptr [0xe2e]                  ; emu int 37
  0000:19d5  cd3ac9           f-fmulp st(1)                            ; emu int 3a
  0000:19d8  d1e8             shr ax, 1                                
  0000:19da  7308             jae 0x19e4                               
  0000:19dc  cd372e380e       f-fld xword ptr [0xe38]                  ; emu int 37
  0000:19e1  cd3ac9           f-fmulp st(1)                            ; emu int 3a
  0000:19e4  d1e8             shr ax, 1                                
  0000:19e6  7308             jae 0x19f0                               
  0000:19e8  cd372e420e       f-fld xword ptr [0xe42]                  ; emu int 37
  0000:19ed  cd3ac9           f-fmulp st(1)                            ; emu int 3a
  0000:19f0  f6460580         test byte ptr [bp + 5], 0x80             
  0000:19f4  7405             je 0x19fb                                
  0000:19f6  cd343ed00d       f-fdivr dword ptr [0xdd0]                ; emu int 34
  0000:19fb  5e               pop si                                   
  0000:19fc  5d               pop bp                                   
  0000:19fd  c20200           ret 2                                    

proc_0000_1a00:
  0000:1a00  55               push bp                                  
  0000:1a01  8bec             mov bp, sp                               
  0000:1a03  ff7606           push word ptr [bp + 6]                   
  0000:1a06  e82eff           call 0x1937                              -> 0000:1937
  0000:1a09  5d               pop bp                                   
  0000:1a0a  cb               retf                                     

proc_0000_1a0b:
  0000:1a0b  55               push bp                                  
  0000:1a0c  8bec             mov bp, sp                               
  0000:1a0e  c45e06           les bx, ptr [bp + 6]                     
  0000:1a11  26833f04         cmp word ptr es:[bx], 4                  
  0000:1a15  750f             jne 0x1a26                               
  0000:1a17  cd35ee           f-fldz                                   ; emu int 35
  0000:1a1a  cd3c             int 0x3c                                 
  0000:1a1c  dd5f16           fstp qword ptr [bx + 0x16]               
  0000:1a1f  cd3d             fwait                                    ; emu
  0000:1a21  b80100           mov ax, 1                                
  0000:1a24  eb0d             jmp 0x1a33                               
  0000:1a26  c45e06           les bx, ptr [bp + 6]                     
  0000:1a29  26833f05         cmp word ptr es:[bx], 5                  
  0000:1a2d  7502             jne 0x1a31                               
  0000:1a2f  ebf0             jmp 0x1a21                               
  0000:1a31  33c0             xor ax, ax                               
  0000:1a33  5d               pop bp                                   
  0000:1a34  cb               retf                                     

proc_0000_1a35:
  0000:1a35  55               push bp                                  
  0000:1a36  8bec             mov bp, sp                               
  0000:1a38  cd394606         f-fld qword ptr [bp + 6]                 ; emu int 39
  0000:1a3c  8b460c           mov ax, word ptr [bp + 0xc]              
  0000:1a3f  d1e0             shl ax, 1                                
  0000:1a41  7405             je 0x1a48                                
  0000:1a43  7205             jb 0x1a4a                                
  0000:1a45  cd35fa           f-fsqrt                                  ; emu int 35
  0000:1a48  eb2d             jmp 0x1a77                               
  0000:1a4a  cd39d8           f-fstp st(0)                             ; emu int 39
  0000:1a4d  cd3906500e       f-fld qword ptr [0xe50]                  ; emu int 39
  0000:1a52  83ec08           sub sp, 8                                
  0000:1a55  cd395ef8         f-fstp qword ptr [bp - 8]                ; emu int 39
  0000:1a59  33c0             xor ax, ax                               
  0000:1a5b  33d2             xor dx, dx                               
  0000:1a5d  50               push ax                                  
  0000:1a5e  52               push dx                                  
  0000:1a5f  16               push ss                                  
  0000:1a60  cd3d             fwait                                    ; emu
  0000:1a62  8d4606           lea ax, [bp + 6]                         
  0000:1a65  50               push ax                                  
  0000:1a66  1e               push ds                                  
  0000:1a67  b8580e           mov ax, 0xe58                             ; "sqrt"
  0000:1a6a  50               push ax                                  
  0000:1a6b  b80100           mov ax, 1                                
  0000:1a6e  50               push ax                                  
  0000:1a6f  90               nop                                      
  0000:1a70  0e               push cs                                  
  0000:1a71  e80500           call 0x1a79                              -> 0000:1a79
  0000:1a74  83c416           add sp, 0x16                             
  0000:1a77  5d               pop bp                                   
  0000:1a78  cb               retf                                     

proc_0000_1a79:
  0000:1a79  55               push bp                                  
  0000:1a7a  8bec             mov bp, sp                               
  0000:1a7c  83ec1e           sub sp, 0x1e                             
  0000:1a7f  56               push si                                  
  0000:1a80  8b7606           mov si, word ptr [bp + 6]                
  0000:1a83  8976e2           mov word ptr [bp - 0x1e], si             
  0000:1a86  8b460a           mov ax, word ptr [bp + 0xa]              
  0000:1a89  8b5608           mov dx, word ptr [bp + 8]                
  0000:1a8c  8946e6           mov word ptr [bp - 0x1a], ax             
  0000:1a8f  8956e4           mov word ptr [bp - 0x1c], dx             
  0000:1a92  8b460c           mov ax, word ptr [bp + 0xc]              
  0000:1a95  0b460e           or ax, word ptr [bp + 0xe]               
  0000:1a98  7505             jne 0x1a9f                               
  0000:1a9a  cd35ee           f-fldz                                   ; emu int 35
  0000:1a9d  eb07             jmp 0x1aa6                               
  0000:1a9f  c45e0c           les bx, ptr [bp + 0xc]                   
  0000:1aa2  cd3c             int 0x3c                                 
  0000:1aa4  dd07             fld qword ptr [bx]                       
  0000:1aa6  cd395ee8         f-fstp qword ptr [bp - 0x18]             ; emu int 39
  0000:1aaa  cd3d             fwait                                    ; emu
  0000:1aac  8b4610           mov ax, word ptr [bp + 0x10]             
  0000:1aaf  0b4612           or ax, word ptr [bp + 0x12]              
  0000:1ab2  7505             jne 0x1ab9                               
  0000:1ab4  cd35ee           f-fldz                                   ; emu int 35
  0000:1ab7  eb07             jmp 0x1ac0                               
  0000:1ab9  c45e10           les bx, ptr [bp + 0x10]                  
  0000:1abc  cd3c             int 0x3c                                 
  0000:1abe  dd07             fld qword ptr [bx]                       
  0000:1ac0  cd395ef0         f-fstp qword ptr [bp - 0x10]             ; emu int 39
  0000:1ac4  cd394614         f-fld qword ptr [bp + 0x14]              ; emu int 39
  0000:1ac8  cd395ef8         f-fstp qword ptr [bp - 8]                ; emu int 39
  0000:1acc  16               push ss                                  
  0000:1acd  cd3d             fwait                                    ; emu
  0000:1acf  8d46e2           lea ax, [bp - 0x1e]                      
  0000:1ad2  50               push ax                                  
  0000:1ad3  90               nop                                      
  0000:1ad4  0e               push cs                                  
  0000:1ad5  e833ff           call 0x1a0b                              -> 0000:1a0b
  0000:1ad8  59               pop cx                                   
  0000:1ad9  59               pop cx                                   
  0000:1ada  0bc0             or ax, ax                                
  0000:1adc  753b             jne 0x1b19                               
  0000:1ade  8bde             mov bx, si                               
  0000:1ae0  b102             mov cl, 2                                
  0000:1ae2  d3e3             shl bx, cl                               
  0000:1ae4  ffb7d80c         push word ptr [bx + 0xcd8]               
  0000:1ae8  ffb7d60c         push word ptr [bx + 0xcd6]               
  0000:1aec  ff760a           push word ptr [bp + 0xa]                 
  0000:1aef  ff7608           push word ptr [bp + 8]                   
  0000:1af2  1e               push ds                                  
  0000:1af3  b85e0e           mov ax, 0xe5e                             ; "%s: %s error"
  0000:1af6  50               push ax                                  
  0000:1af7  1e               push ds                                  
  0000:1af8  b8a40f           mov ax, 0xfa4                            
  0000:1afb  50               push ax                                  
  0000:1afc  90               nop                                      
  0000:1afd  0e               push cs                                  
  0000:1afe  e87522           call 0x3d76                              -> 0000:3d76
  0000:1b01  83c410           add sp, 0x10                             
  0000:1b04  83fe03           cmp si, 3                                
  0000:1b07  7405             je 0x1b0e                                
  0000:1b09  83fe04           cmp si, 4                                
  0000:1b0c  7505             jne 0x1b13                               
  0000:1b0e  b82200           mov ax, 0x22                             
  0000:1b11  eb03             jmp 0x1b16                               
  0000:1b13  b82100           mov ax, 0x21                             
  0000:1b16  a37f00           mov word ptr [0x7f], ax                  
  0000:1b19  cd3946f8         f-fld qword ptr [bp - 8]                 ; emu int 39
  0000:1b1d  5e               pop si                                   
  0000:1b1e  8be5             mov sp, bp                               
  0000:1b20  5d               pop bp                                   
  0000:1b21  cb               retf                                     

proc_0000_1b22:
  0000:1b22  55               push bp                                  
  0000:1b23  8bec             mov bp, sp                               
  0000:1b25  83ec0a           sub sp, 0xa                              
  0000:1b28  cd357efe         f-fnstcw word ptr [bp - 2]               ; emu int 35
  0000:1b2c  cd3d             fwait                                    ; emu
  0000:1b2e  8a46ff           mov al, byte ptr [bp - 1]                
  0000:1b31  804eff0c         or byte ptr [bp - 1], 0xc                
  0000:1b35  cd356efe         f-fldcw word ptr [bp - 2]                ; emu int 35
  0000:1b39  cd3b7ef6         f-fistp qword ptr [bp - 0xa]             ; emu int 3b
  0000:1b3d  8846ff           mov byte ptr [bp - 1], al                
  0000:1b40  cd356efe         f-fldcw word ptr [bp - 2]                ; emu int 35
  0000:1b44  8b46f6           mov ax, word ptr [bp - 0xa]              
  0000:1b47  8b56f8           mov dx, word ptr [bp - 8]                
  0000:1b4a  8be5             mov sp, bp                               
  0000:1b4c  5d               pop bp                                   
  0000:1b4d  cb               retf                                     

proc_0000_1b4e:
  0000:1b4e  55               push bp                                  
  0000:1b4f  8bec             mov bp, sp                               
  0000:1b51  833e6c0e20       cmp word ptr [0xe6c], 0x20               
  0000:1b56  7505             jne 0x1b5d                               
  0000:1b58  b80100           mov ax, 1                                
  0000:1b5b  eb1c             jmp 0x1b79                               
  0000:1b5d  8b1e6c0e         mov bx, word ptr [0xe6c]                 
  0000:1b61  b102             mov cl, 2                                
  0000:1b63  d3e3             shl bx, cl                               
  0000:1b65  8b4608           mov ax, word ptr [bp + 8]                
  0000:1b68  8b5606           mov dx, word ptr [bp + 6]                
  0000:1b6b  8987ea1a         mov word ptr [bx + 0x1aea], ax           
  0000:1b6f  8997e81a         mov word ptr [bx + 0x1ae8], dx           
  0000:1b73  ff066c0e         inc word ptr [0xe6c]                     
  0000:1b77  33c0             xor ax, ax                               
  0000:1b79  5d               pop bp                                   
  0000:1b7a  cb               retf                                     
  0000:1b7b  cd11             int 0x11                                 
  0000:1b7d  cb               retf                                     
  0000:1b7e  cd12             int 0x12                                 
  0000:1b80  cb               retf                                     

proc_0000_1b81:
  0000:1b81  55               push bp                                  
  0000:1b82  8bec             mov bp, sp                               
  0000:1b84  8a6606           mov ah, byte ptr [bp + 6]                
  0000:1b87  c45e08           les bx, ptr [bp + 8]                     
  0000:1b8a  268b4f02         mov cx, word ptr es:[bx + 2]             
  0000:1b8e  268b17           mov dx, word ptr es:[bx]                 
  0000:1b91  cd1a             int 0x1a                                 
  0000:1b93  807e0600         cmp byte ptr [bp + 6], 0                 
  0000:1b97  7507             jne 0x1ba0                               
  0000:1b99  268917           mov word ptr es:[bx], dx                 
  0000:1b9c  26894f02         mov word ptr es:[bx + 2], cx             
  0000:1ba0  5d               pop bp                                   
  0000:1ba1  cb               retf                                     

proc_0000_1ba2:
  0000:1ba2  55               push bp                                  
  0000:1ba3  8bec             mov bp, sp                               
  0000:1ba5  b42a             mov ah, 0x2a                             
  0000:1ba7  cd21             int 0x21                                 
  0000:1ba9  c45e06           les bx, ptr [bp + 6]                     
  0000:1bac  26884704         mov byte ptr es:[bx + 4], al             
  0000:1bb0  268817           mov byte ptr es:[bx], dl                 
  0000:1bb3  26887701         mov byte ptr es:[bx + 1], dh             
  0000:1bb7  26894f02         mov word ptr es:[bx + 2], cx             
  0000:1bbb  5d               pop bp                                   
  0000:1bbc  cb               retf                                     

proc_0000_1bbd:
  0000:1bbd  55               push bp                                  
  0000:1bbe  8bec             mov bp, sp                               
  0000:1bc0  b42c             mov ah, 0x2c                             
  0000:1bc2  cd21             int 0x21                                 
  0000:1bc4  c45e06           les bx, ptr [bp + 6]                     
  0000:1bc7  26882f           mov byte ptr es:[bx], ch                 
  0000:1bca  26884f01         mov byte ptr es:[bx + 1], cl             
  0000:1bce  26887702         mov byte ptr es:[bx + 2], dh             
  0000:1bd2  26885703         mov byte ptr es:[bx + 3], dl             
  0000:1bd6  5d               pop bp                                   
  0000:1bd7  cb               retf                                     
  0000:1bd8  cb               retf                                     

proc_0000_1bd9:
  0000:1bd9  55               push bp                                  
  0000:1bda  8bec             mov bp, sp                               
  0000:1bdc  56               push si                                  
  0000:1bdd  8b7608           mov si, word ptr [bp + 8]                
  0000:1be0  0bf6             or si, si                                
  0000:1be2  7522             jne 0x1c06                               
  0000:1be4  eb10             jmp 0x1bf6                               
  0000:1be6  ff0e6c0e         dec word ptr [0xe6c]                     
  0000:1bea  8b1e6c0e         mov bx, word ptr [0xe6c]                 
  0000:1bee  b102             mov cl, 2                                
  0000:1bf0  d3e3             shl bx, cl                               
  0000:1bf2  ff9fe81a         lcall [bx + 0x1ae8]                      
  0000:1bf6  833e6c0e00       cmp word ptr [0xe6c], 0                  
  0000:1bfb  75e9             jne 0x1be6                               
  0000:1bfd  90               nop                                      
  0000:1bfe  0e               push cs                                  
  0000:1bff  e855e5           call 0x157                               -> 0000:0157
  0000:1c02  ff1e700f         lcall [0xf70]                            
  0000:1c06  90               nop                                      
  0000:1c07  0e               push cs                                  
  0000:1c08  e8b5e5           call 0x1c0                               -> 0000:01c0
  0000:1c0b  90               nop                                      
  0000:1c0c  0e               push cs                                  
  0000:1c0d  e85ae5           call 0x16a                               -> 0000:016a
  0000:1c10  837e0600         cmp word ptr [bp + 6], 0                 
  0000:1c14  7515             jne 0x1c2b                               
  0000:1c16  0bf6             or si, si                                
  0000:1c18  7508             jne 0x1c22                               
  0000:1c1a  ff1e740f         lcall [0xf74]                            
  0000:1c1e  ff1e780f         lcall [0xf78]                            
  0000:1c22  ff7604           push word ptr [bp + 4]                   
  0000:1c25  90               nop                                      
  0000:1c26  0e               push cs                                  
  0000:1c27  e841e5           call 0x16b                               -> 0000:016b
  0000:1c2a  59               pop cx                                   
  0000:1c2b  5e               pop si                                   
  0000:1c2c  5d               pop bp                                   
  0000:1c2d  c20600           ret 6                                    

proc_0000_1c30:
  0000:1c30  55               push bp                                  
  0000:1c31  8bec             mov bp, sp                               
  0000:1c33  33c0             xor ax, ax                               
  0000:1c35  50               push ax                                  
  0000:1c36  50               push ax                                  
  0000:1c37  ff7606           push word ptr [bp + 6]                   
  0000:1c3a  e89cff           call 0x1bd9                              -> 0000:1bd9
  0000:1c3d  5d               pop bp                                   
  0000:1c3e  cb               retf                                     

proc_0000_1c3f:
  0000:1c3f  55               push bp                                  
  0000:1c40  8bec             mov bp, sp                               
  0000:1c42  b80100           mov ax, 1                                
  0000:1c45  50               push ax                                  
  0000:1c46  33c0             xor ax, ax                               
  0000:1c48  50               push ax                                  
  0000:1c49  ff7606           push word ptr [bp + 6]                   
  0000:1c4c  e88aff           call 0x1bd9                              -> 0000:1bd9
  0000:1c4f  5d               pop bp                                   
  0000:1c50  cb               retf                                     
  0000:1c51  33c0             xor ax, ax                               
  0000:1c53  50               push ax                                  
  0000:1c54  b80100           mov ax, 1                                
  0000:1c57  50               push ax                                  
  0000:1c58  33c0             xor ax, ax                               
  0000:1c5a  50               push ax                                  
  0000:1c5b  e87bff           call 0x1bd9                              -> 0000:1bd9
  0000:1c5e  cb               retf                                     
  0000:1c5f  b80100           mov ax, 1                                
  0000:1c62  50               push ax                                  
  0000:1c63  50               push ax                                  
  0000:1c64  33c0             xor ax, ax                               
  0000:1c66  50               push ax                                  
  0000:1c67  e86fff           call 0x1bd9                              -> 0000:1bd9
  0000:1c6a  cb               retf                                     

proc_0000_1c6b:
  0000:1c6b  55               push bp                                  
  0000:1c6c  8bec             mov bp, sp                               
  0000:1c6e  56               push si                                  
  0000:1c6f  57               push di                                  
  0000:1c70  1e               push ds                                  
  0000:1c71  c57606           lds si, ptr [bp + 6]                     
  0000:1c74  c47e0a           les di, ptr [bp + 0xa]                   
  0000:1c77  fc               cld                                      
  0000:1c78  d1e9             shr cx, 1                                
  0000:1c7a  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0000:1c7c  13c9             adc cx, cx                               
  0000:1c7e  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0000:1c80  1f               pop ds                                   
  0000:1c81  5f               pop di                                   
  0000:1c82  5e               pop si                                   
  0000:1c83  5d               pop bp                                   
  0000:1c84  ca0800           retf 8                                   
  0000:1c87  5b               pop bx                                   
  0000:1c88  0e               push cs                                  
  0000:1c89  53               push bx                                  
  0000:1c8a  80f910           cmp cl, 0x10                             
  0000:1c8d  7310             jae 0x1c9f                               
  0000:1c8f  8bd8             mov bx, ax                               
  0000:1c91  d3e0             shl ax, cl                               
  0000:1c93  d3e2             shl dx, cl                               
  0000:1c95  f6d9             neg cl                                   
  0000:1c97  80c110           add cl, 0x10                             
  0000:1c9a  d3eb             shr bx, cl                               
  0000:1c9c  0bd3             or dx, bx                                
  0000:1c9e  cb               retf                                     
  0000:1c9f  80e910           sub cl, 0x10                             
  0000:1ca2  92               xchg dx, ax                              
  0000:1ca3  33c0             xor ax, ax                               
  0000:1ca5  d3e2             shl dx, cl                               
  0000:1ca7  cb               retf                                     
  0000:1ca8  07               pop es                                   
  0000:1ca9  0e               push cs                                  
  0000:1caa  06               push es                                  
  0000:1cab  0bc9             or cx, cx                                
  0000:1cad  7d0c             jge 0x1cbb                               
  0000:1caf  f7d3             not bx                                   
  0000:1cb1  f7d1             not cx                                   
  0000:1cb3  83c301           add bx, 1                                
  0000:1cb6  83d100           adc cx, 0                                
  0000:1cb9  eb2f             jmp 0x1cea                               
  0000:1cbb  03c3             add ax, bx                               
  0000:1cbd  7304             jae 0x1cc3                               
  0000:1cbf  81c20010         add dx, 0x1000                           
  0000:1cc3  8ae9             mov ch, cl                               
  0000:1cc5  b104             mov cl, 4                                
  0000:1cc7  d2e5             shl ch, cl                               
  0000:1cc9  02f5             add dh, ch                               
  0000:1ccb  8ae8             mov ch, al                               
  0000:1ccd  d3e8             shr ax, cl                               
  0000:1ccf  03d0             add dx, ax                               
  0000:1cd1  8ac5             mov al, ch                               
  0000:1cd3  250f00           and ax, 0xf                              
  0000:1cd6  cb               retf                                     
  0000:1cd7  07               pop es                                   
  0000:1cd8  0e               push cs                                  
  0000:1cd9  06               push es                                  
  0000:1cda  0bc9             or cx, cx                                
  0000:1cdc  7d0c             jge 0x1cea                               
  0000:1cde  f7d3             not bx                                   
  0000:1ce0  f7d1             not cx                                   
  0000:1ce2  83c301           add bx, 1                                
  0000:1ce5  83d100           adc cx, 0                                
  0000:1ce8  ebd1             jmp 0x1cbb                               
  0000:1cea  2bc3             sub ax, bx                               
  0000:1cec  7304             jae 0x1cf2                               
  0000:1cee  81ea0010         sub dx, 0x1000                           
  0000:1cf2  8af9             mov bh, cl                               
  0000:1cf4  b104             mov cl, 4                                
  0000:1cf6  d2e7             shl bh, cl                               
  0000:1cf8  32db             xor bl, bl                               
  0000:1cfa  2bd3             sub dx, bx                               
  0000:1cfc  8ae8             mov ch, al                               
  0000:1cfe  d3e8             shr ax, cl                               
  0000:1d00  03d0             add dx, ax                               
  0000:1d02  8ac5             mov al, ch                               
  0000:1d04  250f00           and ax, 0xf                              
  0000:1d07  cb               retf                                     

proc_0000_1d08:
  0000:1d08  55               push bp                                  
  0000:1d09  8bec             mov bp, sp                               
  0000:1d0b  56               push si                                  
  0000:1d0c  8b7604           mov si, word ptr [bp + 4]                
  0000:1d0f  0bf6             or si, si                                
  0000:1d11  7c15             jl 0x1d28                                
  0000:1d13  83fe58           cmp si, 0x58                             
  0000:1d16  7e03             jle 0x1d1b                               
  0000:1d18  be5700           mov si, 0x57                             
  0000:1d1b  89363811         mov word ptr [0x1138], si                
  0000:1d1f  8a843a11         mov al, byte ptr [si + 0x113a]           
  0000:1d23  98               cwde                                     
  0000:1d24  8bf0             mov si, ax                               
  0000:1d26  eb0d             jmp 0x1d35                               
  0000:1d28  f7de             neg si                                   
  0000:1d2a  83fe30           cmp si, 0x30                             
  0000:1d2d  7fe9             jg 0x1d18                                
  0000:1d2f  c7063811ffff     mov word ptr [0x1138], 0xffff            
  0000:1d35  89367f00         mov word ptr [0x7f], si                  
  0000:1d39  b8ffff           mov ax, 0xffff                           
  0000:1d3c  5e               pop si                                   
  0000:1d3d  5d               pop bp                                   
  0000:1d3e  c20200           ret 2                                    

proc_0000_1d41:
  0000:1d41  55               push bp                                  
  0000:1d42  8bec             mov bp, sp                               
  0000:1d44  56               push si                                  
  0000:1d45  8b7604           mov si, word ptr [bp + 4]                
  0000:1d48  56               push si                                  
  0000:1d49  e8bcff           call 0x1d08                              -> 0000:1d08
  0000:1d4c  8bc6             mov ax, si                               
  0000:1d4e  5e               pop si                                   
  0000:1d4f  5d               pop bp                                   
  0000:1d50  c20200           ret 2                                    

proc_0000_1d53:
  0000:1d53  55               push bp                                  
  0000:1d54  8bec             mov bp, sp                               
  0000:1d56  b80044           mov ax, 0x4400                           
  0000:1d59  8b5e06           mov bx, word ptr [bp + 6]                
  0000:1d5c  cd21             int 0x21                                 
  0000:1d5e  92               xchg dx, ax                              
  0000:1d5f  258000           and ax, 0x80                             
  0000:1d62  5d               pop bp                                   
  0000:1d63  cb               retf                                     

proc_0000_1d64:
  0000:1d64  55               push bp                                  
  0000:1d65  8bec             mov bp, sp                               
  0000:1d67  83ec22           sub sp, 0x22                             
  0000:1d6a  56               push si                                  
  0000:1d6b  57               push di                                  
  0000:1d6c  06               push es                                  
  0000:1d6d  c47e0a           les di, ptr [bp + 0xa]                   
  0000:1d70  8b5e08           mov bx, word ptr [bp + 8]                
  0000:1d73  83fb24           cmp bx, 0x24                             
  0000:1d76  775c             ja 0x1dd4                                
  0000:1d78  80fb02           cmp bl, 2                                
  0000:1d7b  7257             jb 0x1dd4                                
  0000:1d7d  8b460e           mov ax, word ptr [bp + 0xe]              
  0000:1d80  8b4e10           mov cx, word ptr [bp + 0x10]             
  0000:1d83  0bc9             or cx, cx                                
  0000:1d85  7d12             jge 0x1d99                               
  0000:1d87  807e0600         cmp byte ptr [bp + 6], 0                 
  0000:1d8b  740c             je 0x1d99                                
  0000:1d8d  26c6052d         mov byte ptr es:[di], 0x2d               
  0000:1d91  47               inc di                                   
  0000:1d92  f7d9             neg cx                                   
  0000:1d94  f7d8             neg ax                                   
  0000:1d96  83d900           sbb cx, 0                                
  0000:1d99  8d76de           lea si, [bp - 0x22]                      
  0000:1d9c  e310             jcxz 0x1dae                              
  0000:1d9e  91               xchg cx, ax                              
  0000:1d9f  2bd2             sub dx, dx                               
  0000:1da1  f7f3             div bx                                   
  0000:1da3  91               xchg cx, ax                              
  0000:1da4  f7f3             div bx                                   
  0000:1da6  368814           mov byte ptr ss:[si], dl                 
  0000:1da9  46               inc si                                   
  0000:1daa  e30a             jcxz 0x1db6                              
  0000:1dac  ebf0             jmp 0x1d9e                               
  0000:1dae  2bd2             sub dx, dx                               
  0000:1db0  f7f3             div bx                                   
  0000:1db2  368814           mov byte ptr ss:[si], dl                 
  0000:1db5  46               inc si                                   
  0000:1db6  0bc0             or ax, ax                                
  0000:1db8  75f4             jne 0x1dae                               
  0000:1dba  8d4ede           lea cx, [bp - 0x22]                      
  0000:1dbd  f7d9             neg cx                                   
  0000:1dbf  03ce             add cx, si                               
  0000:1dc1  fc               cld                                      
  0000:1dc2  4e               dec si                                   
  0000:1dc3  368a04           mov al, byte ptr ss:[si]                 
  0000:1dc6  2c0a             sub al, 0xa                              
  0000:1dc8  7304             jae 0x1dce                               
  0000:1dca  043a             add al, 0x3a                             
  0000:1dcc  eb03             jmp 0x1dd1                               
  0000:1dce  024604           add al, byte ptr [bp + 4]                
  0000:1dd1  aa               stosb byte ptr es:[di], al               
  0000:1dd2  e2ee             loop 0x1dc2                              
  0000:1dd4  b000             mov al, 0                                
  0000:1dd6  aa               stosb byte ptr es:[di], al               
  0000:1dd7  07               pop es                                   
  0000:1dd8  8b560c           mov dx, word ptr [bp + 0xc]              
  0000:1ddb  8b460a           mov ax, word ptr [bp + 0xa]              
  0000:1dde  5f               pop di                                   
  0000:1ddf  5e               pop si                                   
  0000:1de0  8be5             mov sp, bp                               
  0000:1de2  5d               pop bp                                   
  0000:1de3  c20e00           ret 0xe                                  

proc_0000_1de6:
  0000:1de6  55               push bp                                  
  0000:1de7  8bec             mov bp, sp                               
  0000:1de9  33c0             xor ax, ax                               
  0000:1deb  50               push ax                                  
  0000:1dec  ff7608           push word ptr [bp + 8]                   
  0000:1def  ff7606           push word ptr [bp + 6]                   
  0000:1df2  ff7604           push word ptr [bp + 4]                   
  0000:1df5  b80a00           mov ax, 0xa                              
  0000:1df8  50               push ax                                  
  0000:1df9  b000             mov al, 0                                
  0000:1dfb  50               push ax                                  
  0000:1dfc  b061             mov al, 0x61                             
  0000:1dfe  50               push ax                                  
  0000:1dff  e862ff           call 0x1d64                              -> 0000:1d64
  0000:1e02  5d               pop bp                                   
  0000:1e03  c20600           ret 6                                    

proc_0000_1e06:
  0000:1e06  55               push bp                                  
  0000:1e07  8bec             mov bp, sp                               
  0000:1e09  8b5e06           mov bx, word ptr [bp + 6]                
  0000:1e0c  d1e3             shl bx, 1                                
  0000:1e0e  81a70e11fffd     and word ptr [bx + 0x110e], 0xfdff       
  0000:1e14  b442             mov ah, 0x42                             
  0000:1e16  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:1e19  8b5e06           mov bx, word ptr [bp + 6]                
  0000:1e1c  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0000:1e1f  8b5608           mov dx, word ptr [bp + 8]                
  0000:1e22  cd21             int 0x21                                 
  0000:1e24  7202             jb 0x1e28                                
  0000:1e26  eb05             jmp 0x1e2d                               
  0000:1e28  50               push ax                                  
  0000:1e29  e8dcfe           call 0x1d08                              -> 0000:1d08
  0000:1e2c  99               cdq                                      
  0000:1e2d  5d               pop bp                                   
  0000:1e2e  cb               retf                                     
  0000:1e2f  56               push si                                  
  0000:1e30  96               xchg si, ax                              
  0000:1e31  92               xchg dx, ax                              
  0000:1e32  85c0             test ax, ax                              
  0000:1e34  7402             je 0x1e38                                
  0000:1e36  f7e3             mul bx                                   
  0000:1e38  e305             jcxz 0x1e3f                              
  0000:1e3a  91               xchg cx, ax                              
  0000:1e3b  f7e6             mul si                                   
  0000:1e3d  03c1             add ax, cx                               
  0000:1e3f  96               xchg si, ax                              
  0000:1e40  f7e3             mul bx                                   
  0000:1e42  03d6             add dx, si                               
  0000:1e44  5e               pop si                                   
  0000:1e45  c3               ret                                      
  0000:1e46  51               push cx                                  
  0000:1e47  8ae8             mov ch, al                               
  0000:1e49  b104             mov cl, 4                                
  0000:1e4b  d3e8             shr ax, cl                               
  0000:1e4d  03d0             add dx, ax                               
  0000:1e4f  8ac5             mov al, ch                               
  0000:1e51  8ae3             mov ah, bl                               
  0000:1e53  d3eb             shr bx, cl                               
  0000:1e55  59               pop cx                                   
  0000:1e56  03cb             add cx, bx                               
  0000:1e58  8adc             mov bl, ah                               
  0000:1e5a  250f00           and ax, 0xf                              
  0000:1e5d  83e30f           and bx, 0xf                              
  0000:1e60  3bd1             cmp dx, cx                               
  0000:1e62  7502             jne 0x1e66                               
  0000:1e64  3bc3             cmp ax, bx                               
  0000:1e66  c3               ret                                      

proc_0000_1e67:
  0000:1e67  55               push bp                                  
  0000:1e68  8bec             mov bp, sp                               
  0000:1e6a  83ec2a           sub sp, 0x2a                             
  0000:1e6d  56               push si                                  
  0000:1e6e  57               push di                                  
  0000:1e6f  c746fc0000       mov word ptr [bp - 4], 0                 
  0000:1e74  c746fa0000       mov word ptr [bp - 6], 0                 
  0000:1e79  eb1b             jmp 0x1e96                               
  0000:1e7b  c47e10           les di, ptr [bp + 0x10]                  
  0000:1e7e  f646ff20         test byte ptr [bp - 1], 0x20             
  0000:1e82  7408             je 0x1e8c                                
  0000:1e84  26c43d           les di, ptr es:[di]                      
  0000:1e87  83461004         add word ptr [bp + 0x10], 4              
  0000:1e8b  c3               ret                                      
  0000:1e8c  268b3d           mov di, word ptr es:[di]                 
  0000:1e8f  1e               push ds                                  
  0000:1e90  07               pop es                                   
  0000:1e91  83461002         add word ptr [bp + 0x10], 2              
  0000:1e95  c3               ret                                      
  0000:1e96  06               push es                                  
  0000:1e97  fc               cld                                      
  0000:1e98  8b760c           mov si, word ptr [bp + 0xc]              
  0000:1e9b  8e460e           mov es, word ptr [bp + 0xe]              
  0000:1e9e  26ac             lodsb al, byte ptr es:[si]               
  0000:1ea0  0ac0             or al, al                                
  0000:1ea2  746e             je 0x1f12                                
  0000:1ea4  3c25             cmp al, 0x25                             
  0000:1ea6  746d             je 0x1f15                                
  0000:1ea8  98               cwde                                     
  0000:1ea9  97               xchg di, ax                              
  0000:1eaa  ff46fa           inc word ptr [bp - 6]                    
  0000:1ead  ff760a           push word ptr [bp + 0xa]                 
  0000:1eb0  ff7608           push word ptr [bp + 8]                   
  0000:1eb3  ff5604           call word ptr [bp + 4]                   
  0000:1eb6  59               pop cx                                   
  0000:1eb7  59               pop cx                                   
  0000:1eb8  0bc0             or ax, ax                                
  0000:1eba  7c2a             jl 0x1ee6                                
  0000:1ebc  98               cwde                                     
  0000:1ebd  0bff             or di, di                                
  0000:1ebf  783a             js 0x1efb                                
  0000:1ec1  80bd941101       cmp byte ptr [di + 0x1194], 1            
  0000:1ec6  7533             jne 0x1efb                               
  0000:1ec8  93               xchg bx, ax                              
  0000:1ec9  0adb             or bl, bl                                
  0000:1ecb  781c             js 0x1ee9                                
  0000:1ecd  80bf941101       cmp byte ptr [bx + 0x1194], 1            
  0000:1ed2  7515             jne 0x1ee9                               
  0000:1ed4  ff46fa           inc word ptr [bp - 6]                    
  0000:1ed7  ff760a           push word ptr [bp + 0xa]                 
  0000:1eda  ff7608           push word ptr [bp + 8]                   
  0000:1edd  ff5604           call word ptr [bp + 4]                   
  0000:1ee0  59               pop cx                                   
  0000:1ee1  59               pop cx                                   
  0000:1ee2  0bc0             or ax, ax                                
  0000:1ee4  7fe2             jg 0x1ec8                                
  0000:1ee6  e99303           jmp 0x227c                               
  0000:1ee9  ff760a           push word ptr [bp + 0xa]                 
  0000:1eec  ff7608           push word ptr [bp + 8]                   
  0000:1eef  53               push bx                                  
  0000:1ef0  ff5606           call word ptr [bp + 6]                   
  0000:1ef3  83c406           add sp, 6                                
  0000:1ef6  ff4efa           dec word ptr [bp - 6]                    
  0000:1ef9  eba0             jmp 0x1e9b                               
  0000:1efb  3bc7             cmp ax, di                               
  0000:1efd  749c             je 0x1e9b                                
  0000:1eff  ff760a           push word ptr [bp + 0xa]                 
  0000:1f02  ff7608           push word ptr [bp + 8]                   
  0000:1f05  50               push ax                                  
  0000:1f06  ff5606           call word ptr [bp + 6]                   
  0000:1f09  83c406           add sp, 6                                
  0000:1f0c  ff4efa           dec word ptr [bp - 6]                    
  0000:1f0f  e98203           jmp 0x2294                               
  0000:1f12  e97f03           jmp 0x2294                               
  0000:1f15  c746f6ffff       mov word ptr [bp - 0xa], 0xffff          
  0000:1f1a  8e460e           mov es, word ptr [bp + 0xe]              
  0000:1f1d  c646ff20         mov byte ptr [bp - 1], 0x20              
  0000:1f21  26ac             lodsb al, byte ptr es:[si]               
  0000:1f23  98               cwde                                     
  0000:1f24  89760c           mov word ptr [bp + 0xc], si              
  0000:1f27  97               xchg di, ax                              
  0000:1f28  0bff             or di, di                                
  0000:1f2a  7c19             jl 0x1f45                                
  0000:1f2c  8a9d9411         mov bl, byte ptr [di + 0x1194]           
  0000:1f30  32ff             xor bh, bh                               
  0000:1f32  83fb15           cmp bx, 0x15                             
  0000:1f35  7603             jbe 0x1f3a                               
  0000:1f37  e94203           jmp 0x227c                               
  0000:1f3a  d1e3             shl bx, 1                                
  0000:1f3c  2effa72f23       jmp word ptr cs:[bx + 0x232f]            
  0000:1f41  97               xchg di, ax                              
  0000:1f42  e963ff           jmp 0x1ea8                               
  0000:1f45  e94c03           jmp 0x2294                               
  0000:1f48  804eff01         or byte ptr [bp - 1], 1                  
  0000:1f4c  ebd3             jmp 0x1f21                               
  0000:1f4e  83ef30           sub di, 0x30                             
  0000:1f51  877ef6           xchg word ptr [bp - 0xa], di             
  0000:1f54  0bff             or di, di                                
  0000:1f56  7cc9             jl 0x1f21                                
  0000:1f58  b80a00           mov ax, 0xa                              
  0000:1f5b  f7e7             mul di                                   
  0000:1f5d  0146f6           add word ptr [bp - 0xa], ax              
  0000:1f60  ebbf             jmp 0x1f21                               
  0000:1f62  804eff08         or byte ptr [bp - 1], 8                  
  0000:1f66  ebb9             jmp 0x1f21                               
  0000:1f68  804eff04         or byte ptr [bp - 1], 4                  
  0000:1f6c  ebb3             jmp 0x1f21                               
  0000:1f6e  804eff02         or byte ptr [bp - 1], 2                  
  0000:1f72  ebad             jmp 0x1f21                               
  0000:1f74  8066ffdf         and byte ptr [bp - 1], 0xdf              
  0000:1f78  eba7             jmp 0x1f21                               
  0000:1f7a  804eff20         or byte ptr [bp - 1], 0x20               
  0000:1f7e  eba1             jmp 0x1f21                               
  0000:1f80  8b46fa           mov ax, word ptr [bp - 6]                
  0000:1f83  2bd2             sub dx, dx                               
  0000:1f85  f646ff01         test byte ptr [bp - 1], 1                
  0000:1f89  7455             je 0x1fe0                                
  0000:1f8b  eb94             jmp 0x1f21                               
  0000:1f8d  be0800           mov si, 8                                
  0000:1f90  eb0c             jmp 0x1f9e                               
  0000:1f92  be0a00           mov si, 0xa                              
  0000:1f95  eb07             jmp 0x1f9e                               
  0000:1f97  be1000           mov si, 0x10                             
  0000:1f9a  eb02             jmp 0x1f9e                               
  0000:1f9c  33f6             xor si, si                               
  0000:1f9e  f7c72000         test di, 0x20                            
  0000:1fa2  7509             jne 0x1fad                               
  0000:1fa4  83ff58           cmp di, 0x58                             
  0000:1fa7  7404             je 0x1fad                                
  0000:1fa9  804eff04         or byte ptr [bp - 1], 4                  
  0000:1fad  16               push ss                                  
  0000:1fae  8d46f8           lea ax, [bp - 8]                         
  0000:1fb1  50               push ax                                  
  0000:1fb2  16               push ss                                  
  0000:1fb3  8d46fa           lea ax, [bp - 6]                         
  0000:1fb6  50               push ax                                  
  0000:1fb7  8b46f6           mov ax, word ptr [bp - 0xa]              
  0000:1fba  25ff7f           and ax, 0x7fff                           
  0000:1fbd  50               push ax                                  
  0000:1fbe  56               push si                                  
  0000:1fbf  ff760a           push word ptr [bp + 0xa]                 
  0000:1fc2  ff7608           push word ptr [bp + 8]                   
  0000:1fc5  ff7606           push word ptr [bp + 6]                   
  0000:1fc8  ff7604           push word ptr [bp + 4]                   
  0000:1fcb  e8b803           call 0x2386                              -> 0000:2386
  0000:1fce  83c414           add sp, 0x14                             
  0000:1fd1  837ef800         cmp word ptr [bp - 8], 0                 
  0000:1fd5  7e18             jle 0x1fef                               
  0000:1fd7  f646ff01         test byte ptr [bp - 1], 1                
  0000:1fdb  750f             jne 0x1fec                               
  0000:1fdd  ff46fc           inc word ptr [bp - 4]                    
  0000:1fe0  e898fe           call 0x1e7b                              -> 0000:1e7b
  0000:1fe3  ab               stosw word ptr es:[di], ax               
  0000:1fe4  f646ff04         test byte ptr [bp - 1], 4                
  0000:1fe8  7402             je 0x1fec                                
  0000:1fea  92               xchg dx, ax                              
  0000:1feb  ab               stosw word ptr es:[di], ax               
  0000:1fec  e9a9fe           jmp 0x1e98                               
  0000:1fef  7c03             jl 0x1ff4                                
  0000:1ff1  e9a002           jmp 0x2294                               
  0000:1ff4  e98502           jmp 0x227c                               
  0000:1ff7  e80000           call 0x1ffa                              -> 0000:1ffa
  0000:1ffa  e99e02           jmp 0x229b                               
  0000:1ffd  ff760a           push word ptr [bp + 0xa]                 
  0000:2000  ff7608           push word ptr [bp + 8]                   
  0000:2003  50               push ax                                  
  0000:2004  ff5606           call word ptr [bp + 6]                   
  0000:2007  83c406           add sp, 6                                
  0000:200a  ff4efa           dec word ptr [bp - 6]                    
  0000:200d  8166f6ff7f       and word ptr [bp - 0xa], 0x7fff          
  0000:2012  e80000           call 0x2015                              -> 0000:2015
  0000:2015  e9ad02           jmp 0x22c5                               
  0000:2018  52               push dx                                  
  0000:2019  3c3a             cmp al, 0x3a                             
  0000:201b  7419             je 0x2036                                
  0000:201d  0bc0             or ax, ax                                
  0000:201f  7e10             jle 0x2031                               
  0000:2021  ff760a           push word ptr [bp + 0xa]                 
  0000:2024  ff7608           push word ptr [bp + 8]                   
  0000:2027  50               push ax                                  
  0000:2028  ff5606           call word ptr [bp + 6]                   
  0000:202b  83c406           add sp, 6                                
  0000:202e  ff4efa           dec word ptr [bp - 6]                    
  0000:2031  5a               pop dx                                   
  0000:2032  8cdb             mov bx, ds                               
  0000:2034  eb1f             jmp 0x2055                               
  0000:2036  e80000           call 0x2039                              -> 0000:2039
  0000:2039  e98902           jmp 0x22c5                               
  0000:203c  5b               pop bx                                   
  0000:203d  0bc0             or ax, ax                                
  0000:203f  7e14             jle 0x2055                               
  0000:2041  52               push dx                                  
  0000:2042  53               push bx                                  
  0000:2043  ff760a           push word ptr [bp + 0xa]                 
  0000:2046  ff7608           push word ptr [bp + 8]                   
  0000:2049  50               push ax                                  
  0000:204a  ff5606           call word ptr [bp + 6]                   
  0000:204d  83c406           add sp, 6                                
  0000:2050  ff4efa           dec word ptr [bp - 6]                    
  0000:2053  5b               pop bx                                   
  0000:2054  5a               pop dx                                   
  0000:2055  f646ff01         test byte ptr [bp - 1], 1                
  0000:2059  7510             jne 0x206b                               
  0000:205b  e81dfe           call 0x1e7b                              -> 0000:1e7b
  0000:205e  ff46fc           inc word ptr [bp - 4]                    
  0000:2061  92               xchg dx, ax                              
  0000:2062  ab               stosw word ptr es:[di], ax               
  0000:2063  f646ff20         test byte ptr [bp - 1], 0x20             
  0000:2067  7402             je 0x206b                                
  0000:2069  93               xchg bx, ax                              
  0000:206a  ab               stosw word ptr es:[di], ax               
  0000:206b  e92afe           jmp 0x1e98                               
  0000:206e  e90b02           jmp 0x227c                               
  0000:2071  16               push ss                                  
  0000:2072  8d46f8           lea ax, [bp - 8]                         
  0000:2075  50               push ax                                  
  0000:2076  16               push ss                                  
  0000:2077  8d46fa           lea ax, [bp - 6]                         
  0000:207a  50               push ax                                  
  0000:207b  b8ff7f           mov ax, 0x7fff                           
  0000:207e  2346f6           and ax, word ptr [bp - 0xa]              
  0000:2081  50               push ax                                  
  0000:2082  ff760a           push word ptr [bp + 0xa]                 
  0000:2085  ff7608           push word ptr [bp + 8]                   
  0000:2088  ff7606           push word ptr [bp + 6]                   
  0000:208b  ff7604           push word ptr [bp + 4]                   
  0000:208e  e80217           call 0x3793                              -> 0000:3793
  0000:2091  83c412           add sp, 0x12                             
  0000:2094  837ef800         cmp word ptr [bp - 8], 0                 
  0000:2098  7e39             jle 0x20d3                               
  0000:209a  8a46ff           mov al, byte ptr [bp - 1]                
  0000:209d  98               cwde                                     
  0000:209e  a90100           test ax, 1                               
  0000:20a1  752a             jne 0x20cd                               
  0000:20a3  e8d5fd           call 0x1e7b                              -> 0000:1e7b
  0000:20a6  ff46fc           inc word ptr [bp - 4]                    
  0000:20a9  f646ff04         test byte ptr [bp - 1], 4                
  0000:20ad  7405             je 0x20b4                                
  0000:20af  b80400           mov ax, 4                                
  0000:20b2  eb0d             jmp 0x20c1                               
  0000:20b4  f646ff08         test byte ptr [bp - 1], 8                
  0000:20b8  7405             je 0x20bf                                
  0000:20ba  b80800           mov ax, 8                                
  0000:20bd  eb02             jmp 0x20c1                               
  0000:20bf  33c0             xor ax, ax                               
  0000:20c1  50               push ax                                  
  0000:20c2  06               push es                                  
  0000:20c3  57               push di                                  
  0000:20c4  e8d016           call 0x3797                              -> 0000:3797
  0000:20c7  83c406           add sp, 6                                
  0000:20ca  e9cbfd           jmp 0x1e98                               
  0000:20cd  e8cb16           call 0x379b                              -> 0000:379b
  0000:20d0  e9c5fd           jmp 0x1e98                               
  0000:20d3  e8c516           call 0x379b                              -> 0000:379b
  0000:20d6  7c96             jl 0x206e                                
  0000:20d8  e9b901           jmp 0x2294                               
  0000:20db  e80000           call 0x20de                              -> 0000:20de
  0000:20de  e9ba01           jmp 0x229b                               
  0000:20e1  f646ff01         test byte ptr [bp - 1], 1                
  0000:20e5  7506             jne 0x20ed                               
  0000:20e7  e891fd           call 0x1e7b                              -> 0000:1e7b
  0000:20ea  ff46fc           inc word ptr [bp - 4]                    
  0000:20ed  8166f6ff7f       and word ptr [bp - 0xa], 0x7fff          
  0000:20f2  742d             je 0x2121                                
  0000:20f4  f646ff01         test byte ptr [bp - 1], 1                
  0000:20f8  7501             jne 0x20fb                               
  0000:20fa  aa               stosb byte ptr es:[di], al               
  0000:20fb  ff46fa           inc word ptr [bp - 6]                    
  0000:20fe  06               push es                                  
  0000:20ff  ff760a           push word ptr [bp + 0xa]                 
  0000:2102  ff7608           push word ptr [bp + 8]                   
  0000:2105  ff5604           call word ptr [bp + 4]                   
  0000:2108  59               pop cx                                   
  0000:2109  59               pop cx                                   
  0000:210a  07               pop es                                   
  0000:210b  0bc0             or ax, ax                                
  0000:210d  7e12             jle 0x2121                               
  0000:210f  0ac0             or al, al                                
  0000:2111  7809             js 0x211c                                
  0000:2113  93               xchg bx, ax                              
  0000:2114  80bf941101       cmp byte ptr [bx + 0x1194], 1            
  0000:2119  93               xchg bx, ax                              
  0000:211a  7e05             jle 0x2121                               
  0000:211c  ff4ef6           dec word ptr [bp - 0xa]                  
  0000:211f  7fd3             jg 0x20f4                                
  0000:2121  06               push es                                  
  0000:2122  ff760a           push word ptr [bp + 0xa]                 
  0000:2125  ff7608           push word ptr [bp + 8]                   
  0000:2128  50               push ax                                  
  0000:2129  ff5606           call word ptr [bp + 6]                   
  0000:212c  83c406           add sp, 6                                
  0000:212f  07               pop es                                   
  0000:2130  ff4efa           dec word ptr [bp - 6]                    
  0000:2133  f646ff01         test byte ptr [bp - 1], 1                
  0000:2137  7503             jne 0x213c                               
  0000:2139  b000             mov al, 0                                
  0000:213b  aa               stosb byte ptr es:[di], al               
  0000:213c  e959fd           jmp 0x1e98                               
  0000:213f  f646ff01         test byte ptr [bp - 1], 1                
  0000:2143  7503             jne 0x2148                               
  0000:2145  e833fd           call 0x1e7b                              -> 0000:1e7b
  0000:2148  8b76f6           mov si, word ptr [bp - 0xa]              
  0000:214b  0bf6             or si, si                                
  0000:214d  7d03             jge 0x2152                               
  0000:214f  be0100           mov si, 1                                
  0000:2152  741e             je 0x2172                                
  0000:2154  ff46fa           inc word ptr [bp - 6]                    
  0000:2157  06               push es                                  
  0000:2158  ff760a           push word ptr [bp + 0xa]                 
  0000:215b  ff7608           push word ptr [bp + 8]                   
  0000:215e  ff5604           call word ptr [bp + 4]                   
  0000:2161  59               pop cx                                   
  0000:2162  59               pop cx                                   
  0000:2163  07               pop es                                   
  0000:2164  0bc0             or ax, ax                                
  0000:2166  7c16             jl 0x217e                                
  0000:2168  f646ff01         test byte ptr [bp - 1], 1                
  0000:216c  7501             jne 0x216f                               
  0000:216e  aa               stosb byte ptr es:[di], al               
  0000:216f  4e               dec si                                   
  0000:2170  7fe2             jg 0x2154                                
  0000:2172  f646ff01         test byte ptr [bp - 1], 1                
  0000:2176  7503             jne 0x217b                               
  0000:2178  ff46fc           inc word ptr [bp - 4]                    
  0000:217b  e91afd           jmp 0x1e98                               
  0000:217e  e9fb00           jmp 0x227c                               
  0000:2181  06               push es                                  
  0000:2182  2bc0             sub ax, ax                               
  0000:2184  fc               cld                                      
  0000:2185  16               push ss                                  
  0000:2186  07               pop es                                   
  0000:2187  8d7ed6           lea di, [bp - 0x2a]                      
  0000:218a  b91000           mov cx, 0x10                             
  0000:218d  f3ab             rep stosw word ptr es:[di], ax           
  0000:218f  07               pop es                                   
  0000:2190  26ac             lodsb al, byte ptr es:[si]               
  0000:2192  8066ffef         and byte ptr [bp - 1], 0xef              
  0000:2196  3c5e             cmp al, 0x5e                             
  0000:2198  7506             jne 0x21a0                               
  0000:219a  804eff10         or byte ptr [bp - 1], 0x10               
  0000:219e  26ac             lodsb al, byte ptr es:[si]               
  0000:21a0  b400             mov ah, 0                                
  0000:21a2  8ad0             mov dl, al                               
  0000:21a4  8bf8             mov di, ax                               
  0000:21a6  b103             mov cl, 3                                
  0000:21a8  d3ef             shr di, cl                               
  0000:21aa  b90701           mov cx, 0x107                            
  0000:21ad  22ca             and cl, dl                               
  0000:21af  d2e5             shl ch, cl                               
  0000:21b1  086bd6           or byte ptr [bp + di - 0x2a], ch         
  0000:21b4  26ac             lodsb al, byte ptr es:[si]               
  0000:21b6  3c00             cmp al, 0                                
  0000:21b8  7429             je 0x21e3                                
  0000:21ba  3c5d             cmp al, 0x5d                             
  0000:21bc  7428             je 0x21e6                                
  0000:21be  3c2d             cmp al, 0x2d                             
  0000:21c0  75e0             jne 0x21a2                               
  0000:21c2  263a14           cmp dl, byte ptr es:[si]                 
  0000:21c5  77db             ja 0x21a2                                
  0000:21c7  26803c5d         cmp byte ptr es:[si], 0x5d               
  0000:21cb  74d5             je 0x21a2                                
  0000:21cd  26ac             lodsb al, byte ptr es:[si]               
  0000:21cf  2ac2             sub al, dl                               
  0000:21d1  74e1             je 0x21b4                                
  0000:21d3  02d0             add dl, al                               
  0000:21d5  d0c5             rol ch, 1                                
  0000:21d7  83d700           adc di, 0                                
  0000:21da  086bd6           or byte ptr [bp + di - 0x2a], ch         
  0000:21dd  fec8             dec al                                   
  0000:21df  75f4             jne 0x21d5                               
  0000:21e1  ebd1             jmp 0x21b4                               
  0000:21e3  e9ae00           jmp 0x2294                               
  0000:21e6  89760c           mov word ptr [bp + 0xc], si              
  0000:21e9  8166f6ff7f       and word ptr [bp - 0xa], 0x7fff          
  0000:21ee  8b76f6           mov si, word ptr [bp - 0xa]              
  0000:21f1  f646ff01         test byte ptr [bp - 1], 1                
  0000:21f5  7503             jne 0x21fa                               
  0000:21f7  e881fc           call 0x1e7b                              -> 0000:1e7b
  0000:21fa  4e               dec si                                   
  0000:21fb  7c58             jl 0x2255                                
  0000:21fd  ff46fa           inc word ptr [bp - 6]                    
  0000:2200  06               push es                                  
  0000:2201  ff760a           push word ptr [bp + 0xa]                 
  0000:2204  ff7608           push word ptr [bp + 8]                   
  0000:2207  ff5604           call word ptr [bp + 4]                   
  0000:220a  59               pop cx                                   
  0000:220b  59               pop cx                                   
  0000:220c  07               pop es                                   
  0000:220d  0bc0             or ax, ax                                
  0000:220f  7c59             jl 0x226a                                
  0000:2211  96               xchg si, ax                              
  0000:2212  8bde             mov bx, si                               
  0000:2214  b103             mov cl, 3                                
  0000:2216  d3ee             shr si, cl                               
  0000:2218  b90701           mov cx, 0x107                            
  0000:221b  22cb             and cl, bl                               
  0000:221d  d2e5             shl ch, cl                               
  0000:221f  846ad6           test byte ptr [bp + si - 0x2a], ch       
  0000:2222  96               xchg si, ax                              
  0000:2223  93               xchg bx, ax                              
  0000:2224  7408             je 0x222e                                
  0000:2226  f646ff10         test byte ptr [bp - 1], 0x10             
  0000:222a  7408             je 0x2234                                
  0000:222c  eb0f             jmp 0x223d                               
  0000:222e  f646ff10         test byte ptr [bp - 1], 0x10             
  0000:2232  7409             je 0x223d                                
  0000:2234  f646ff01         test byte ptr [bp - 1], 1                
  0000:2238  75c0             jne 0x21fa                               
  0000:223a  aa               stosb byte ptr es:[di], al               
  0000:223b  ebbd             jmp 0x21fa                               
  0000:223d  06               push es                                  
  0000:223e  ff760a           push word ptr [bp + 0xa]                 
  0000:2241  ff7608           push word ptr [bp + 8]                   
  0000:2244  50               push ax                                  
  0000:2245  ff5606           call word ptr [bp + 6]                   
  0000:2248  83c406           add sp, 6                                
  0000:224b  07               pop es                                   
  0000:224c  ff4efa           dec word ptr [bp - 6]                    
  0000:224f  46               inc si                                   
  0000:2250  3b76f6           cmp si, word ptr [bp - 0xa]              
  0000:2253  7d09             jge 0x225e                               
  0000:2255  f646ff01         test byte ptr [bp - 1], 1                
  0000:2259  750c             jne 0x2267                               
  0000:225b  ff46fc           inc word ptr [bp - 4]                    
  0000:225e  f646ff01         test byte ptr [bp - 1], 1                
  0000:2262  7503             jne 0x2267                               
  0000:2264  b000             mov al, 0                                
  0000:2266  aa               stosb byte ptr es:[di], al               
  0000:2267  e92efc           jmp 0x1e98                               
  0000:226a  46               inc si                                   
  0000:226b  3b76f6           cmp si, word ptr [bp - 0xa]              
  0000:226e  7d0c             jge 0x227c                               
  0000:2270  f646ff01         test byte ptr [bp - 1], 1                
  0000:2274  7506             jne 0x227c                               
  0000:2276  b000             mov al, 0                                
  0000:2278  aa               stosb byte ptr es:[di], al               
  0000:2279  ff46fc           inc word ptr [bp - 4]                    
  0000:227c  ff760a           push word ptr [bp + 0xa]                 
  0000:227f  ff7608           push word ptr [bp + 8]                   
  0000:2282  b8ffff           mov ax, 0xffff                           
  0000:2285  50               push ax                                  
  0000:2286  ff5606           call word ptr [bp + 6]                   
  0000:2289  83c406           add sp, 6                                
  0000:228c  837efc01         cmp word ptr [bp - 4], 1                 
  0000:2290  835efc00         sbb word ptr [bp - 4], 0                 
  0000:2294  07               pop es                                   
  0000:2295  8b46fc           mov ax, word ptr [bp - 4]                
  0000:2298  e98e00           jmp 0x2329                               
  0000:229b  ff46fa           inc word ptr [bp - 6]                    
  0000:229e  ff760a           push word ptr [bp + 0xa]                 
  0000:22a1  ff7608           push word ptr [bp + 8]                   
  0000:22a4  ff5604           call word ptr [bp + 4]                   
  0000:22a7  59               pop cx                                   
  0000:22a8  59               pop cx                                   
  0000:22a9  0bc0             or ax, ax                                
  0000:22ab  7e13             jle 0x22c0                               
  0000:22ad  0ac0             or al, al                                
  0000:22af  7809             js 0x22ba                                
  0000:22b1  93               xchg bx, ax                              
  0000:22b2  80bf941101       cmp byte ptr [bx + 0x1194], 1            
  0000:22b7  93               xchg bx, ax                              
  0000:22b8  74e1             je 0x229b                                
  0000:22ba  59               pop cx                                   
  0000:22bb  83c103           add cx, 3                                
  0000:22be  ffe1             jmp cx                                   
  0000:22c0  74f8             je 0x22ba                                
  0000:22c2  59               pop cx                                   
  0000:22c3  ebb7             jmp 0x227c                               
  0000:22c5  2bd2             sub dx, dx                               
  0000:22c7  b90400           mov cx, 4                                
  0000:22ca  ff4ef6           dec word ptr [bp - 0xa]                  
  0000:22cd  7c49             jl 0x2318                                
  0000:22cf  52               push dx                                  
  0000:22d0  51               push cx                                  
  0000:22d1  ff46fa           inc word ptr [bp - 6]                    
  0000:22d4  ff760a           push word ptr [bp + 0xa]                 
  0000:22d7  ff7608           push word ptr [bp + 8]                   
  0000:22da  ff5604           call word ptr [bp + 4]                   
  0000:22dd  59               pop cx                                   
  0000:22de  59               pop cx                                   
  0000:22df  59               pop cx                                   
  0000:22e0  5a               pop dx                                   
  0000:22e1  0bc0             or ax, ax                                
  0000:22e3  7e35             jle 0x231a                               
  0000:22e5  fec9             dec cl                                   
  0000:22e7  7c31             jl 0x231a                                
  0000:22e9  8ae8             mov ch, al                               
  0000:22eb  80ed30           sub ch, 0x30                             
  0000:22ee  722a             jb 0x231a                                
  0000:22f0  80fd0a           cmp ch, 0xa                              
  0000:22f3  7217             jb 0x230c                                
  0000:22f5  80ed11           sub ch, 0x11                             
  0000:22f8  7220             jb 0x231a                                
  0000:22fa  80fd06           cmp ch, 6                                
  0000:22fd  720a             jb 0x2309                                
  0000:22ff  80ed20           sub ch, 0x20                             
  0000:2302  7216             jb 0x231a                                
  0000:2304  80fd06           cmp ch, 6                                
  0000:2307  7311             jae 0x231a                               
  0000:2309  80c50a           add ch, 0xa                              
  0000:230c  d1e2             shl dx, 1                                
  0000:230e  d1e2             shl dx, 1                                
  0000:2310  d1e2             shl dx, 1                                
  0000:2312  d1e2             shl dx, 1                                
  0000:2314  02d5             add dl, ch                               
  0000:2316  ebb2             jmp 0x22ca                               
  0000:2318  2bc0             sub ax, ax                               
  0000:231a  80f904           cmp cl, 4                                
  0000:231d  7406             je 0x2325                                
  0000:231f  59               pop cx                                   
  0000:2320  83c103           add cx, 3                                
  0000:2323  ffe1             jmp cx                                   
  0000:2325  59               pop cx                                   
  0000:2326  e953ff           jmp 0x227c                               
  0000:2329  5f               pop di                                   
  0000:232a  5e               pop si                                   
  0000:232b  8be5             mov sp, bp                               
  0000:232d  5d               pop bp                                   
  0000:232e  c3               ret                                      
  0000:232f  94               xchg sp, ax                              
  0000:2330  22942294         and dl, byte ptr [si - 0x6bde]           
  0000:2334  22411f           and al, byte ptr [bx + di + 0x1f]        
  0000:2337  48               dec ax                                   
  0000:2338  1f               pop ds                                   
  0000:2339  4e               dec si                                   
  0000:233a  1f               pop ds                                   
  0000:233b  3f               aas                                      
  0000:233c  21921f92         and word ptr [bp + si - 0x6de1], dx      
  0000:2340  1f               pop ds                                   
  0000:2341  9c               pushf                                    
  0000:2342  1f               pop ds                                   
  0000:2343  7120             jno 0x2365                               
  0000:2345  621f             bound bx, dword ptr [bx]                 
  0000:2347  6e               outsb dx, byte ptr [si]                  
  0000:2348  1f               pop ds                                   
  0000:2349  681f8d           push 0x8d1f                              
  0000:234c  1f               pop ds                                   
  0000:234d  db               db db
  0000:234e  20812180         and byte ptr [bx + di - 0x7fdf], al      
  0000:2352  1f               pop ds                                   
  0000:2353  97               xchg di, ax                              
  0000:2354  1f               pop ds                                   
  0000:2355  f71f             neg word ptr [bx]                        
  0000:2357  741f             je 0x2378                                
  0000:2359  7a1f             jp 0x237a                                
  0000:235b  53               push bx                                  
  0000:235c  80eb30           sub bl, 0x30                             
  0000:235f  7222             jb 0x2383                                
  0000:2361  80fb09           cmp bl, 9                                
  0000:2364  7612             jbe 0x2378                               
  0000:2366  80fb2a           cmp bl, 0x2a                             
  0000:2369  7705             ja 0x2370                                
  0000:236b  80eb07           sub bl, 7                                
  0000:236e  eb03             jmp 0x2373                               
  0000:2370  80eb27           sub bl, 0x27                             
  0000:2373  80fb09           cmp bl, 9                                
  0000:2376  760b             jbe 0x2383                               
  0000:2378  3ad9             cmp bl, cl                               
  0000:237a  7307             jae 0x2383                               
  0000:237c  44               inc sp                                   
  0000:237d  44               inc sp                                   
  0000:237e  f8               clc                                      
  0000:237f  b700             mov bh, 0                                
  0000:2381  eb02             jmp 0x2385                               
  0000:2383  5b               pop bx                                   
  0000:2384  f9               stc                                      
  0000:2385  c3               ret                                      

proc_0000_2386:
  0000:2386  55               push bp                                  
  0000:2387  8bec             mov bp, sp                               
  0000:2389  83ec06           sub sp, 6                                
  0000:238c  56               push si                                  
  0000:238d  57               push di                                  
  0000:238e  c646ff00         mov byte ptr [bp - 1], 0                 
  0000:2392  c746fc0000       mov word ptr [bp - 4], 0                 
  0000:2397  c746fa0100       mov word ptr [bp - 6], 1                 
  0000:239c  ff46fc           inc word ptr [bp - 4]                    
  0000:239f  ff760a           push word ptr [bp + 0xa]                 
  0000:23a2  ff7608           push word ptr [bp + 8]                   
  0000:23a5  ff5604           call word ptr [bp + 4]                   
  0000:23a8  59               pop cx                                   
  0000:23a9  59               pop cx                                   
  0000:23aa  0bc0             or ax, ax                                
  0000:23ac  7c71             jl 0x241f                                
  0000:23ae  98               cwde                                     
  0000:23af  93               xchg bx, ax                              
  0000:23b0  f6c380           test bl, 0x80                            
  0000:23b3  7508             jne 0x23bd                               
  0000:23b5  bf6f0e           mov di, 0xe6f                            
  0000:23b8  f60101           test byte ptr [bx + di], 1               
  0000:23bb  75df             jne 0x239c                               
  0000:23bd  93               xchg bx, ax                              
  0000:23be  ff4e0e           dec word ptr [bp + 0xe]                  
  0000:23c1  7c63             jl 0x2426                                
  0000:23c3  3c2b             cmp al, 0x2b                             
  0000:23c5  7407             je 0x23ce                                
  0000:23c7  3c2d             cmp al, 0x2d                             
  0000:23c9  751a             jne 0x23e5                               
  0000:23cb  fe46ff           inc byte ptr [bp - 1]                    
  0000:23ce  ff4e0e           dec word ptr [bp + 0xe]                  
  0000:23d1  7c53             jl 0x2426                                
  0000:23d3  ff46fc           inc word ptr [bp - 4]                    
  0000:23d6  ff760a           push word ptr [bp + 0xa]                 
  0000:23d9  ff7608           push word ptr [bp + 8]                   
  0000:23dc  ff5604           call word ptr [bp + 4]                   
  0000:23df  59               pop cx                                   
  0000:23e0  59               pop cx                                   
  0000:23e1  0bc0             or ax, ax                                
  0000:23e3  7c3a             jl 0x241f                                
  0000:23e5  2bf6             sub si, si                               
  0000:23e7  8bfe             mov di, si                               
  0000:23e9  8b4e0c           mov cx, word ptr [bp + 0xc]              
  0000:23ec  e356             jcxz 0x2444                              
  0000:23ee  83f924           cmp cx, 0x24                             
  0000:23f1  7733             ja 0x2426                                
  0000:23f3  80f902           cmp cl, 2                                
  0000:23f6  722e             jb 0x2426                                
  0000:23f8  3c30             cmp al, 0x30                             
  0000:23fa  7578             jne 0x2474                               
  0000:23fc  80f910           cmp cl, 0x10                             
  0000:23ff  7571             jne 0x2472                               
  0000:2401  ff4e0e           dec word ptr [bp + 0xe]                  
  0000:2404  7c3b             jl 0x2441                                
  0000:2406  ff46fc           inc word ptr [bp - 4]                    
  0000:2409  ff760a           push word ptr [bp + 0xa]                 
  0000:240c  ff7608           push word ptr [bp + 8]                   
  0000:240f  ff5604           call word ptr [bp + 4]                   
  0000:2412  59               pop cx                                   
  0000:2413  59               pop cx                                   
  0000:2414  3c78             cmp al, 0x78                             
  0000:2416  745a             je 0x2472                                
  0000:2418  3c58             cmp al, 0x58                             
  0000:241a  7456             je 0x2472                                
  0000:241c  e97f00           jmp 0x249e                               
  0000:241f  c746faffff       mov word ptr [bp - 6], 0xffff            
  0000:2424  eb05             jmp 0x242b                               
  0000:2426  c746fa0000       mov word ptr [bp - 6], 0                 
  0000:242b  ff760a           push word ptr [bp + 0xa]                 
  0000:242e  ff7608           push word ptr [bp + 8]                   
  0000:2431  50               push ax                                  
  0000:2432  ff5606           call word ptr [bp + 6]                   
  0000:2435  83c406           add sp, 6                                
  0000:2438  ff4efc           dec word ptr [bp - 4]                    
  0000:243b  2bc0             sub ax, ax                               
  0000:243d  99               cdq                                      
  0000:243e  e9b700           jmp 0x24f8                               
  0000:2441  e9a400           jmp 0x24e8                               
  0000:2444  3c30             cmp al, 0x30                             
  0000:2446  c7460c0a00       mov word ptr [bp + 0xc], 0xa             
  0000:244b  7527             jne 0x2474                               
  0000:244d  ff4e0e           dec word ptr [bp + 0xe]                  
  0000:2450  7cef             jl 0x2441                                
  0000:2452  ff46fc           inc word ptr [bp - 4]                    
  0000:2455  ff760a           push word ptr [bp + 0xa]                 
  0000:2458  ff7608           push word ptr [bp + 8]                   
  0000:245b  ff5604           call word ptr [bp + 4]                   
  0000:245e  59               pop cx                                   
  0000:245f  59               pop cx                                   
  0000:2460  c7460c0800       mov word ptr [bp + 0xc], 8               
  0000:2465  3c78             cmp al, 0x78                             
  0000:2467  7404             je 0x246d                                
  0000:2469  3c58             cmp al, 0x58                             
  0000:246b  7531             jne 0x249e                               
  0000:246d  c7460c1000       mov word ptr [bp + 0xc], 0x10            
  0000:2472  eb17             jmp 0x248b                               
  0000:2474  8b4e0c           mov cx, word ptr [bp + 0xc]              
  0000:2477  93               xchg bx, ax                              
  0000:2478  e8e0fe           call 0x235b                              -> 0000:235b
  0000:247b  93               xchg bx, ax                              
  0000:247c  72a8             jb 0x2426                                
  0000:247e  96               xchg si, ax                              
  0000:247f  eb0a             jmp 0x248b                               
  0000:2481  96               xchg si, ax                              
  0000:2482  f7660c           mul word ptr [bp + 0xc]                  
  0000:2485  03f0             add si, ax                               
  0000:2487  13fa             adc di, dx                               
  0000:2489  7530             jne 0x24bb                               
  0000:248b  ff4e0e           dec word ptr [bp + 0xe]                  
  0000:248e  7c58             jl 0x24e8                                
  0000:2490  ff46fc           inc word ptr [bp - 4]                    
  0000:2493  ff760a           push word ptr [bp + 0xa]                 
  0000:2496  ff7608           push word ptr [bp + 8]                   
  0000:2499  ff5604           call word ptr [bp + 4]                   
  0000:249c  59               pop cx                                   
  0000:249d  59               pop cx                                   
  0000:249e  8b4e0c           mov cx, word ptr [bp + 0xc]              
  0000:24a1  93               xchg bx, ax                              
  0000:24a2  e8b6fe           call 0x235b                              -> 0000:235b
  0000:24a5  93               xchg bx, ax                              
  0000:24a6  73d9             jae 0x2481                               
  0000:24a8  eb2e             jmp 0x24d8                               
  0000:24aa  96               xchg si, ax                              
  0000:24ab  f7e1             mul cx                                   
  0000:24ad  97               xchg di, ax                              
  0000:24ae  87ca             xchg dx, cx                              
  0000:24b0  f7e2             mul dx                                   
  0000:24b2  03f7             add si, di                               
  0000:24b4  13c1             adc ax, cx                               
  0000:24b6  97               xchg di, ax                              
  0000:24b7  12d6             adc dl, dh                               
  0000:24b9  7551             jne 0x250c                               
  0000:24bb  ff4e0e           dec word ptr [bp + 0xe]                  
  0000:24be  7c28             jl 0x24e8                                
  0000:24c0  ff46fc           inc word ptr [bp - 4]                    
  0000:24c3  ff760a           push word ptr [bp + 0xa]                 
  0000:24c6  ff7608           push word ptr [bp + 8]                   
  0000:24c9  ff5604           call word ptr [bp + 4]                   
  0000:24cc  59               pop cx                                   
  0000:24cd  59               pop cx                                   
  0000:24ce  8b4e0c           mov cx, word ptr [bp + 0xc]              
  0000:24d1  93               xchg bx, ax                              
  0000:24d2  e886fe           call 0x235b                              -> 0000:235b
  0000:24d5  93               xchg bx, ax                              
  0000:24d6  73d2             jae 0x24aa                               
  0000:24d8  ff760a           push word ptr [bp + 0xa]                 
  0000:24db  ff7608           push word ptr [bp + 8]                   
  0000:24de  50               push ax                                  
  0000:24df  ff5606           call word ptr [bp + 6]                   
  0000:24e2  83c406           add sp, 6                                
  0000:24e5  ff4efc           dec word ptr [bp - 4]                    
  0000:24e8  8bd7             mov dx, di                               
  0000:24ea  96               xchg si, ax                              
  0000:24eb  807eff00         cmp byte ptr [bp - 1], 0                 
  0000:24ef  7407             je 0x24f8                                
  0000:24f1  f7da             neg dx                                   
  0000:24f3  f7d8             neg ax                                   
  0000:24f5  83da00           sbb dx, 0                                
  0000:24f8  c47e10           les di, ptr [bp + 0x10]                  
  0000:24fb  8b5efc           mov bx, word ptr [bp - 4]                
  0000:24fe  26011d           add word ptr es:[di], bx                 
  0000:2501  c47e14           les di, ptr [bp + 0x14]                  
  0000:2504  8b5efa           mov bx, word ptr [bp - 6]                
  0000:2507  26891d           mov word ptr es:[di], bx                 
  0000:250a  eb16             jmp 0x2522                               
  0000:250c  b8ffff           mov ax, 0xffff                           
  0000:250f  baff7f           mov dx, 0x7fff                           
  0000:2512  0246ff           add al, byte ptr [bp - 1]                
  0000:2515  80d400           adc ah, 0                                
  0000:2518  83d200           adc dx, 0                                
  0000:251b  c746fa0200       mov word ptr [bp - 6], 2                 
  0000:2520  ebd6             jmp 0x24f8                               
  0000:2522  5f               pop di                                   
  0000:2523  5e               pop si                                   
  0000:2524  8be5             mov sp, bp                               
  0000:2526  5d               pop bp                                   
  0000:2527  c3               ret                                      

proc_0000_2528:
  0000:2528  55               push bp                                  
  0000:2529  8bec             mov bp, sp                               
  0000:252b  56               push si                                  
  0000:252c  8cc3             mov bx, es                               
  0000:252e  c47606           les si, ptr [bp + 6]                     
  0000:2531  26891c           mov word ptr es:[si], bx                 
  0000:2534  8b4604           mov ax, word ptr [bp + 4]                
  0000:2537  26894402         mov word ptr es:[si + 2], ax             
  0000:253b  268c5404         mov word ptr es:[si + 4], ss             
  0000:253f  268c5c06         mov word ptr es:[si + 6], ds             
  0000:2543  8ec3             mov es, bx                               
  0000:2545  5e               pop si                                   
  0000:2546  5d               pop bp                                   
  0000:2547  cb               retf                                     
  0000:2548  b90500           mov cx, 5                                
  0000:254b  3b0e0c11         cmp cx, word ptr [0x110c]                
  0000:254f  7338             jae 0x2589                               
  0000:2551  8bd9             mov bx, cx                               
  0000:2553  d1e3             shl bx, 1                                
  0000:2555  c7870e110000     mov word ptr [bx + 0x110e], 0            
  0000:255b  8bc1             mov ax, cx                               
  0000:255d  ba1400           mov dx, 0x14                             
  0000:2560  f7ea             imul dx                                  
  0000:2562  8bd8             mov bx, ax                               
  0000:2564  c687800fff       mov byte ptr [bx + 0xf80], 0xff          
  0000:2569  8bc1             mov ax, cx                               
  0000:256b  ba1400           mov dx, 0x14                             
  0000:256e  f7ea             imul dx                                  
  0000:2570  057c0f           add ax, 0xf7c                            
  0000:2573  50               push ax                                  
  0000:2574  8bc1             mov ax, cx                               
  0000:2576  ba1400           mov dx, 0x14                             
  0000:2579  f7ea             imul dx                                  
  0000:257b  8bd8             mov bx, ax                               
  0000:257d  58               pop ax                                   
  0000:257e  89878e0f         mov word ptr [bx + 0xf8e], ax            
  0000:2582  41               inc cx                                   
  0000:2583  3b0e0c11         cmp cx, word ptr [0x110c]                
  0000:2587  72c8             jb 0x2551                                
  0000:2589  a0800f           mov al, byte ptr [0xf80]                 
  0000:258c  98               cwde                                     
  0000:258d  50               push ax                                  
  0000:258e  90               nop                                      
  0000:258f  0e               push cs                                  
  0000:2590  e8c0f7           call 0x1d53                              -> 0000:1d53
  0000:2593  59               pop cx                                   
  0000:2594  0bc0             or ax, ax                                
  0000:2596  7506             jne 0x259e                               
  0000:2598  81267e0ffffd     and word ptr [0xf7e], 0xfdff             
  0000:259e  b80002           mov ax, 0x200                            
  0000:25a1  50               push ax                                  
  0000:25a2  f7067e0f0002     test word ptr [0xf7e], 0x200             
  0000:25a8  7405             je 0x25af                                
  0000:25aa  b80100           mov ax, 1                                
  0000:25ad  eb02             jmp 0x25b1                               
  0000:25af  33c0             xor ax, ax                               
  0000:25b1  50               push ax                                  
  0000:25b2  33c0             xor ax, ax                               
  0000:25b4  33d2             xor dx, dx                               
  0000:25b6  50               push ax                                  
  0000:25b7  52               push dx                                  
  0000:25b8  1e               push ds                                  
  0000:25b9  b87c0f           mov ax, 0xf7c                            
  0000:25bc  50               push ax                                  
  0000:25bd  90               nop                                      
  0000:25be  0e               push cs                                  
  0000:25bf  e8811e           call 0x4443                              -> 0000:4443
  0000:25c2  83c40c           add sp, 0xc                              
  0000:25c5  a0940f           mov al, byte ptr [0xf94]                 
  0000:25c8  98               cwde                                     
  0000:25c9  50               push ax                                  
  0000:25ca  90               nop                                      
  0000:25cb  0e               push cs                                  
  0000:25cc  e884f7           call 0x1d53                              -> 0000:1d53
  0000:25cf  59               pop cx                                   
  0000:25d0  0bc0             or ax, ax                                
  0000:25d2  7506             jne 0x25da                               
  0000:25d4  8126920ffffd     and word ptr [0xf92], 0xfdff             
  0000:25da  b80002           mov ax, 0x200                            
  0000:25dd  50               push ax                                  
  0000:25de  f706920f0002     test word ptr [0xf92], 0x200             
  0000:25e4  7405             je 0x25eb                                
  0000:25e6  b80200           mov ax, 2                                
  0000:25e9  eb02             jmp 0x25ed                               
  0000:25eb  33c0             xor ax, ax                               
  0000:25ed  50               push ax                                  
  0000:25ee  33c0             xor ax, ax                               
  0000:25f0  33d2             xor dx, dx                               
  0000:25f2  50               push ax                                  
  0000:25f3  52               push dx                                  
  0000:25f4  1e               push ds                                  
  0000:25f5  b8900f           mov ax, 0xf90                            
  0000:25f8  50               push ax                                  
  0000:25f9  90               nop                                      
  0000:25fa  0e               push cs                                  
  0000:25fb  e8451e           call 0x4443                              -> 0000:4443
  0000:25fe  83c40c           add sp, 0xc                              
  0000:2601  c3               ret                                      

proc_0000_2602:
  0000:2602  55               push bp                                  
  0000:2603  8bec             mov bp, sp                               
  0000:2605  8b5606           mov dx, word ptr [bp + 6]                
  0000:2608  83faff           cmp dx, -1                               
  0000:260b  7505             jne 0x2612                               
  0000:260d  b8ffff           mov ax, 0xffff                           
  0000:2610  eb1a             jmp 0x262c                               
  0000:2612  8ac2             mov al, dl                               
  0000:2614  b400             mov ah, 0                                
  0000:2616  8bd8             mov bx, ax                               
  0000:2618  f6876f0e04       test byte ptr [bx + 0xe6f], 4            
  0000:261d  7409             je 0x2628                                
  0000:261f  8ac2             mov al, dl                               
  0000:2621  b400             mov ah, 0                                
  0000:2623  052000           add ax, 0x20                             
  0000:2626  eb04             jmp 0x262c                               
  0000:2628  8ac2             mov al, dl                               
  0000:262a  b400             mov ah, 0                                
  0000:262c  5d               pop bp                                   
  0000:262d  cb               retf                                     

proc_0000_262e:
  0000:262e  55               push bp                                  
  0000:262f  8bec             mov bp, sp                               
  0000:2631  8b5606           mov dx, word ptr [bp + 6]                
  0000:2634  83faff           cmp dx, -1                               
  0000:2637  7505             jne 0x263e                               
  0000:2639  b8ffff           mov ax, 0xffff                           
  0000:263c  eb1a             jmp 0x2658                               
  0000:263e  8ac2             mov al, dl                               
  0000:2640  b400             mov ah, 0                                
  0000:2642  8bd8             mov bx, ax                               
  0000:2644  f6876f0e08       test byte ptr [bx + 0xe6f], 8            
  0000:2649  7409             je 0x2654                                
  0000:264b  8ac2             mov al, dl                               
  0000:264d  b400             mov ah, 0                                
  0000:264f  05e0ff           add ax, 0xffe0                           
  0000:2652  eb04             jmp 0x2658                               
  0000:2654  8ac2             mov al, dl                               
  0000:2656  b400             mov ah, 0                                
  0000:2658  5d               pop bp                                   
  0000:2659  cb               retf                                     
  0000:265a  8ac6             mov al, dh                               
  0000:265c  e80200           call 0x2661                              -> 0000:2661
  0000:265f  8ac2             mov al, dl                               
  0000:2661  d410             aam 0x10                                 
  0000:2663  86e0             xchg al, ah                              
  0000:2665  e80200           call 0x266a                              -> 0000:266a
  0000:2668  86e0             xchg al, ah                              
  0000:266a  0490             add al, 0x90                             
  0000:266c  27               daa                                      
  0000:266d  1440             adc al, 0x40                             
  0000:266f  27               daa                                      
  0000:2670  aa               stosb byte ptr es:[di], al               
  0000:2671  c3               ret                                      

proc_0000_2672:
  0000:2672  55               push bp                                  
  0000:2673  8bec             mov bp, sp                               
  0000:2675  81ec9600         sub sp, 0x96                             
  0000:2679  56               push si                                  
  0000:267a  57               push di                                  
  0000:267b  c746ee0000       mov word ptr [bp - 0x12], 0              
  0000:2680  c746ec5000       mov word ptr [bp - 0x14], 0x50           
  0000:2685  c746ea0000       mov word ptr [bp - 0x16], 0              
  0000:268a  eb4a             jmp 0x26d6                               
  0000:268c  57               push di                                  
  0000:268d  b9ffff           mov cx, 0xffff                           
  0000:2690  32c0             xor al, al                               
  0000:2692  f2ae             repne scasb al, byte ptr es:[di]         
  0000:2694  f7d1             not cx                                   
  0000:2696  49               dec cx                                   
  0000:2697  5f               pop di                                   
  0000:2698  c3               ret                                      
  0000:2699  368805           mov byte ptr ss:[di], al                 
  0000:269c  47               inc di                                   
  0000:269d  fe4eec           dec byte ptr [bp - 0x14]                 
  0000:26a0  7533             jne 0x26d5                               
  0000:26a2  53               push bx                                  
  0000:26a3  51               push cx                                  
  0000:26a4  52               push dx                                  
  0000:26a5  06               push es                                  
  0000:26a6  8d866aff         lea ax, [bp - 0x96]                      
  0000:26aa  2bf8             sub di, ax                               
  0000:26ac  16               push ss                                  
  0000:26ad  8d866aff         lea ax, [bp - 0x96]                      
  0000:26b1  50               push ax                                  
  0000:26b2  57               push di                                  
  0000:26b3  ff760c           push word ptr [bp + 0xc]                 
  0000:26b6  ff760a           push word ptr [bp + 0xa]                 
  0000:26b9  ff560e           call word ptr [bp + 0xe]                 
  0000:26bc  0bc0             or ax, ax                                
  0000:26be  7505             jne 0x26c5                               
  0000:26c0  c746ea0100       mov word ptr [bp - 0x16], 1              
  0000:26c5  c746ec5000       mov word ptr [bp - 0x14], 0x50           
  0000:26ca  017eee           add word ptr [bp - 0x12], di             
  0000:26cd  8dbe6aff         lea di, [bp - 0x96]                      
  0000:26d1  07               pop es                                   
  0000:26d2  5a               pop dx                                   
  0000:26d3  59               pop cx                                   
  0000:26d4  5b               pop bx                                   
  0000:26d5  c3               ret                                      
  0000:26d6  06               push es                                  
  0000:26d7  fc               cld                                      
  0000:26d8  8dbe6aff         lea di, [bp - 0x96]                      
  0000:26dc  897efc           mov word ptr [bp - 4], di                
  0000:26df  8b7efc           mov di, word ptr [bp - 4]                
  0000:26e2  c47606           les si, ptr [bp + 6]                     
  0000:26e5  26ac             lodsb al, byte ptr es:[si]               
  0000:26e7  0ac0             or al, al                                
  0000:26e9  7412             je 0x26fd                                
  0000:26eb  3c25             cmp al, 0x25                             
  0000:26ed  7411             je 0x2700                                
  0000:26ef  368805           mov byte ptr ss:[di], al                 
  0000:26f2  47               inc di                                   
  0000:26f3  fe4eec           dec byte ptr [bp - 0x14]                 
  0000:26f6  7fed             jg 0x26e5                                
  0000:26f8  e8a7ff           call 0x26a2                              -> 0000:26a2
  0000:26fb  ebe8             jmp 0x26e5                               
  0000:26fd  e9e503           jmp 0x2ae5                               
  0000:2700  8976f0           mov word ptr [bp - 0x10], si             
  0000:2703  26ac             lodsb al, byte ptr es:[si]               
  0000:2705  3c25             cmp al, 0x25                             
  0000:2707  74e6             je 0x26ef                                
  0000:2709  897efc           mov word ptr [bp - 4], di                
  0000:270c  33c9             xor cx, cx                               
  0000:270e  894ef2           mov word ptr [bp - 0xe], cx              
  0000:2711  c746fe2000       mov word ptr [bp - 2], 0x20              
  0000:2716  884ef5           mov byte ptr [bp - 0xb], cl              
  0000:2719  c746f8ffff       mov word ptr [bp - 8], 0xffff            
  0000:271e  c746f6ffff       mov word ptr [bp - 0xa], 0xffff          
  0000:2723  eb02             jmp 0x2727                               
  0000:2725  26ac             lodsb al, byte ptr es:[si]               
  0000:2727  32e4             xor ah, ah                               
  0000:2729  8bd0             mov dx, ax                               
  0000:272b  8bd8             mov bx, ax                               
  0000:272d  80eb20           sub bl, 0x20                             
  0000:2730  80fb60           cmp bl, 0x60                             
  0000:2733  7313             jae 0x2748                               
  0000:2735  8a9f1b12         mov bl, byte ptr [bx + 0x121b]           
  0000:2739  83fb17           cmp bx, 0x17                             
  0000:273c  7603             jbe 0x2741                               
  0000:273e  e99003           jmp 0x2ad1                               
  0000:2741  d1e3             shl bx, 1                                
  0000:2743  2effa7052b       jmp word ptr cs:[bx + 0x2b05]            
  0000:2748  e98603           jmp 0x2ad1                               
  0000:274b  80fd00           cmp ch, 0                                
  0000:274e  77f8             ja 0x2748                                
  0000:2750  834efe01         or word ptr [bp - 2], 1                  
  0000:2754  ebcf             jmp 0x2725                               
  0000:2756  80fd00           cmp ch, 0                                
  0000:2759  77ed             ja 0x2748                                
  0000:275b  834efe02         or word ptr [bp - 2], 2                  
  0000:275f  ebc4             jmp 0x2725                               
  0000:2761  80fd00           cmp ch, 0                                
  0000:2764  77e2             ja 0x2748                                
  0000:2766  807ef52b         cmp byte ptr [bp - 0xb], 0x2b            
  0000:276a  7403             je 0x276f                                
  0000:276c  8856f5           mov byte ptr [bp - 0xb], dl              
  0000:276f  ebb4             jmp 0x2725                               
  0000:2771  8366fedf         and word ptr [bp - 2], 0xffdf            
  0000:2775  eb04             jmp 0x277b                               
  0000:2777  834efe20         or word ptr [bp - 2], 0x20               
  0000:277b  b505             mov ch, 5                                
  0000:277d  eba6             jmp 0x2725                               
  0000:277f  80fd00           cmp ch, 0                                
  0000:2782  774d             ja 0x27d1                                
  0000:2784  f746fe0200       test word ptr [bp - 2], 2                
  0000:2789  7529             jne 0x27b4                               
  0000:278b  834efe08         or word ptr [bp - 2], 8                  
  0000:278f  b501             mov ch, 1                                
  0000:2791  eb92             jmp 0x2725                               
  0000:2793  e93b03           jmp 0x2ad1                               
  0000:2796  8b7e04           mov di, word ptr [bp + 4]                
  0000:2799  368b05           mov ax, word ptr ss:[di]                 
  0000:279c  83460402         add word ptr [bp + 4], 2                 
  0000:27a0  80fd02           cmp ch, 2                                
  0000:27a3  7312             jae 0x27b7                               
  0000:27a5  0bc0             or ax, ax                                
  0000:27a7  7906             jns 0x27af                               
  0000:27a9  f7d8             neg ax                                   
  0000:27ab  834efe02         or word ptr [bp - 2], 2                  
  0000:27af  8946f8           mov word ptr [bp - 8], ax                
  0000:27b2  b503             mov ch, 3                                
  0000:27b4  e96eff           jmp 0x2725                               
  0000:27b7  80fd04           cmp ch, 4                                
  0000:27ba  75d7             jne 0x2793                               
  0000:27bc  8946f6           mov word ptr [bp - 0xa], ax              
  0000:27bf  fec5             inc ch                                   
  0000:27c1  e961ff           jmp 0x2725                               
  0000:27c4  80fd04           cmp ch, 4                                
  0000:27c7  73ca             jae 0x2793                               
  0000:27c9  b504             mov ch, 4                                
  0000:27cb  ff46f6           inc word ptr [bp - 0xa]                  
  0000:27ce  e954ff           jmp 0x2725                               
  0000:27d1  92               xchg dx, ax                              
  0000:27d2  2c30             sub al, 0x30                             
  0000:27d4  98               cwde                                     
  0000:27d5  80fd02           cmp ch, 2                                
  0000:27d8  7719             ja 0x27f3                                
  0000:27da  b502             mov ch, 2                                
  0000:27dc  8746f8           xchg word ptr [bp - 8], ax               
  0000:27df  0bc0             or ax, ax                                
  0000:27e1  7cd1             jl 0x27b4                                
  0000:27e3  d1e0             shl ax, 1                                
  0000:27e5  8bd0             mov dx, ax                               
  0000:27e7  d1e0             shl ax, 1                                
  0000:27e9  d1e0             shl ax, 1                                
  0000:27eb  03c2             add ax, dx                               
  0000:27ed  0146f8           add word ptr [bp - 8], ax                
  0000:27f0  e932ff           jmp 0x2725                               
  0000:27f3  80fd04           cmp ch, 4                                
  0000:27f6  759b             jne 0x2793                               
  0000:27f8  8746f6           xchg word ptr [bp - 0xa], ax             
  0000:27fb  0bc0             or ax, ax                                
  0000:27fd  74b5             je 0x27b4                                
  0000:27ff  d1e0             shl ax, 1                                
  0000:2801  8bd0             mov dx, ax                               
  0000:2803  d1e0             shl ax, 1                                
  0000:2805  d1e0             shl ax, 1                                
  0000:2807  03c2             add ax, dx                               
  0000:2809  0146f6           add word ptr [bp - 0xa], ax              
  0000:280c  e916ff           jmp 0x2725                               
  0000:280f  834efe10         or word ptr [bp - 2], 0x10               
  0000:2813  e965ff           jmp 0x277b                               
  0000:2816  814efe0001       or word ptr [bp - 2], 0x100              
  0000:281b  8366feef         and word ptr [bp - 2], 0xffef            
  0000:281f  e959ff           jmp 0x277b                               
  0000:2822  b708             mov bh, 8                                
  0000:2824  eb0a             jmp 0x2830                               
  0000:2826  b70a             mov bh, 0xa                              
  0000:2828  eb0a             jmp 0x2834                               
  0000:282a  b710             mov bh, 0x10                             
  0000:282c  b3e9             mov bl, 0xe9                             
  0000:282e  02da             add bl, dl                               
  0000:2830  c646f500         mov byte ptr [bp - 0xb], 0               
  0000:2834  8856fb           mov byte ptr [bp - 5], dl                
  0000:2837  33d2             xor dx, dx                               
  0000:2839  8856fa           mov byte ptr [bp - 6], dl                
  0000:283c  8b7e04           mov di, word ptr [bp + 4]                
  0000:283f  368b05           mov ax, word ptr ss:[di]                 
  0000:2842  eb10             jmp 0x2854                               
  0000:2844  b70a             mov bh, 0xa                              
  0000:2846  c646fa01         mov byte ptr [bp - 6], 1                 
  0000:284a  8856fb           mov byte ptr [bp - 5], dl                
  0000:284d  8b7e04           mov di, word ptr [bp + 4]                
  0000:2850  368b05           mov ax, word ptr ss:[di]                 
  0000:2853  99               cdq                                      
  0000:2854  47               inc di                                   
  0000:2855  47               inc di                                   
  0000:2856  897606           mov word ptr [bp + 6], si                
  0000:2859  f746fe1000       test word ptr [bp - 2], 0x10             
  0000:285e  7405             je 0x2865                                
  0000:2860  368b15           mov dx, word ptr ss:[di]                 
  0000:2863  47               inc di                                   
  0000:2864  47               inc di                                   
  0000:2865  897e04           mov word ptr [bp + 4], di                
  0000:2868  8d7ebb           lea di, [bp - 0x45]                      
  0000:286b  0bc0             or ax, ax                                
  0000:286d  7512             jne 0x2881                               
  0000:286f  0bd2             or dx, dx                                
  0000:2871  750e             jne 0x2881                               
  0000:2873  837ef600         cmp word ptr [bp - 0xa], 0               
  0000:2877  750c             jne 0x2885                               
  0000:2879  36c60500         mov byte ptr ss:[di], 0                  
  0000:287d  8bc7             mov ax, di                               
  0000:287f  eb14             jmp 0x2895                               
  0000:2881  834efe04         or word ptr [bp - 2], 4                  
  0000:2885  52               push dx                                  
  0000:2886  50               push ax                                  
  0000:2887  16               push ss                                  
  0000:2888  57               push di                                  
  0000:2889  8ac7             mov al, bh                               
  0000:288b  98               cwde                                     
  0000:288c  50               push ax                                  
  0000:288d  8a46fa           mov al, byte ptr [bp - 6]                
  0000:2890  50               push ax                                  
  0000:2891  53               push bx                                  
  0000:2892  e8cff4           call 0x1d64                              -> 0000:1d64
  0000:2895  16               push ss                                  
  0000:2896  07               pop es                                   
  0000:2897  8b56f6           mov dx, word ptr [bp - 0xa]              
  0000:289a  0bd2             or dx, dx                                
  0000:289c  7d03             jge 0x28a1                               
  0000:289e  e9f400           jmp 0x2995                               
  0000:28a1  e9ff00           jmp 0x29a3                               
  0000:28a4  8856fb           mov byte ptr [bp - 5], dl                
  0000:28a7  897606           mov word ptr [bp + 6], si                
  0000:28aa  8d7eba           lea di, [bp - 0x46]                      
  0000:28ad  8b5e04           mov bx, word ptr [bp + 4]                
  0000:28b0  36ff37           push word ptr ss:[bx]                    
  0000:28b3  43               inc bx                                   
  0000:28b4  43               inc bx                                   
  0000:28b5  895e04           mov word ptr [bp + 4], bx                
  0000:28b8  f746fe2000       test word ptr [bp - 2], 0x20             
  0000:28bd  7410             je 0x28cf                                
  0000:28bf  368b17           mov dx, word ptr ss:[bx]                 
  0000:28c2  43               inc bx                                   
  0000:28c3  43               inc bx                                   
  0000:28c4  895e04           mov word ptr [bp + 4], bx                
  0000:28c7  16               push ss                                  
  0000:28c8  07               pop es                                   
  0000:28c9  e88efd           call 0x265a                              -> 0000:265a
  0000:28cc  b03a             mov al, 0x3a                             
  0000:28ce  aa               stosb byte ptr es:[di], al               
  0000:28cf  16               push ss                                  
  0000:28d0  07               pop es                                   
  0000:28d1  5a               pop dx                                   
  0000:28d2  e885fd           call 0x265a                              -> 0000:265a
  0000:28d5  36c60500         mov byte ptr ss:[di], 0                  
  0000:28d9  c646fa00         mov byte ptr [bp - 6], 0                 
  0000:28dd  8366fefb         and word ptr [bp - 2], 0xfffb            
  0000:28e1  8d4eba           lea cx, [bp - 0x46]                      
  0000:28e4  2bf9             sub di, cx                               
  0000:28e6  87cf             xchg di, cx                              
  0000:28e8  8b56f6           mov dx, word ptr [bp - 0xa]              
  0000:28eb  3bd1             cmp dx, cx                               
  0000:28ed  7f02             jg 0x28f1                                
  0000:28ef  8bd1             mov dx, cx                               
  0000:28f1  e9a100           jmp 0x2995                               
  0000:28f4  897606           mov word ptr [bp + 6], si                
  0000:28f7  8856fb           mov byte ptr [bp - 5], dl                
  0000:28fa  8b7e04           mov di, word ptr [bp + 4]                
  0000:28fd  368b05           mov ax, word ptr ss:[di]                 
  0000:2900  83460402         add word ptr [bp + 4], 2                 
  0000:2904  16               push ss                                  
  0000:2905  07               pop es                                   
  0000:2906  8d7ebb           lea di, [bp - 0x45]                      
  0000:2909  32e4             xor ah, ah                               
  0000:290b  368905           mov word ptr ss:[di], ax                 
  0000:290e  b90100           mov cx, 1                                
  0000:2911  e9c400           jmp 0x29d8                               
  0000:2914  897606           mov word ptr [bp + 6], si                
  0000:2917  8856fb           mov byte ptr [bp - 5], dl                
  0000:291a  8b7e04           mov di, word ptr [bp + 4]                
  0000:291d  f746fe2000       test word ptr [bp - 2], 0x20             
  0000:2922  750d             jne 0x2931                               
  0000:2924  368b3d           mov di, word ptr ss:[di]                 
  0000:2927  83460402         add word ptr [bp + 4], 2                 
  0000:292b  1e               push ds                                  
  0000:292c  07               pop es                                   
  0000:292d  0bff             or di, di                                
  0000:292f  eb0b             jmp 0x293c                               
  0000:2931  36c43d           les di, ptr ss:[di]                      
  0000:2934  83460404         add word ptr [bp + 4], 4                 
  0000:2938  8cc0             mov ax, es                               
  0000:293a  0bc7             or ax, di                                
  0000:293c  7505             jne 0x2943                               
  0000:293e  1e               push ds                                  
  0000:293f  07               pop es                                   
  0000:2940  bf1412           mov di, 0x1214                            ; "(null)"
  0000:2943  e846fd           call 0x268c                              -> 0000:268c
  0000:2946  3b4ef6           cmp cx, word ptr [bp - 0xa]              
  0000:2949  7603             jbe 0x294e                               
  0000:294b  8b4ef6           mov cx, word ptr [bp - 0xa]              
  0000:294e  e98700           jmp 0x29d8                               
  0000:2951  897606           mov word ptr [bp + 6], si                
  0000:2954  8856fb           mov byte ptr [bp - 5], dl                
  0000:2957  8b7e04           mov di, word ptr [bp + 4]                
  0000:295a  8b4ef6           mov cx, word ptr [bp - 0xa]              
  0000:295d  0bc9             or cx, cx                                
  0000:295f  7d03             jge 0x2964                               
  0000:2961  b90600           mov cx, 6                                
  0000:2964  16               push ss                                  
  0000:2965  57               push di                                  
  0000:2966  51               push cx                                  
  0000:2967  16               push ss                                  
  0000:2968  8d5ebb           lea bx, [bp - 0x45]                      
  0000:296b  53               push bx                                  
  0000:296c  52               push dx                                  
  0000:296d  b80100           mov ax, 1                                
  0000:2970  2346fe           and ax, word ptr [bp - 2]                
  0000:2973  50               push ax                                  
  0000:2974  8b46fe           mov ax, word ptr [bp - 2]                
  0000:2977  a90001           test ax, 0x100                           
  0000:297a  7409             je 0x2985                                
  0000:297c  b80800           mov ax, 8                                
  0000:297f  8346040a         add word ptr [bp + 4], 0xa               
  0000:2983  eb07             jmp 0x298c                               
  0000:2985  83460408         add word ptr [bp + 4], 8                 
  0000:2989  b80600           mov ax, 6                                
  0000:298c  50               push ax                                  
  0000:298d  e8ff0d           call 0x378f                              -> 0000:378f
  0000:2990  16               push ss                                  
  0000:2991  07               pop es                                   
  0000:2992  8d7ebb           lea di, [bp - 0x45]                      
  0000:2995  f746fe0800       test word ptr [bp - 2], 8                
  0000:299a  7418             je 0x29b4                                
  0000:299c  8b56f8           mov dx, word ptr [bp - 8]                
  0000:299f  0bd2             or dx, dx                                
  0000:29a1  7e11             jle 0x29b4                               
  0000:29a3  e8e6fc           call 0x268c                              -> 0000:268c
  0000:29a6  26803d2d         cmp byte ptr es:[di], 0x2d               
  0000:29aa  7501             jne 0x29ad                               
  0000:29ac  49               dec cx                                   
  0000:29ad  2bd1             sub dx, cx                               
  0000:29af  7e03             jle 0x29b4                               
  0000:29b1  8956f2           mov word ptr [bp - 0xe], dx              
  0000:29b4  26803d2d         cmp byte ptr es:[di], 0x2d               
  0000:29b8  740b             je 0x29c5                                
  0000:29ba  8a46f5           mov al, byte ptr [bp - 0xb]              
  0000:29bd  0ac0             or al, al                                
  0000:29bf  7414             je 0x29d5                                
  0000:29c1  4f               dec di                                   
  0000:29c2  268805           mov byte ptr es:[di], al                 
  0000:29c5  837ef200         cmp word ptr [bp - 0xe], 0               
  0000:29c9  7e0a             jle 0x29d5                               
  0000:29cb  8b4ef6           mov cx, word ptr [bp - 0xa]              
  0000:29ce  0bc9             or cx, cx                                
  0000:29d0  7d03             jge 0x29d5                               
  0000:29d2  ff4ef2           dec word ptr [bp - 0xe]                  
  0000:29d5  e8b4fc           call 0x268c                              -> 0000:268c
  0000:29d8  8bf7             mov si, di                               
  0000:29da  8b7efc           mov di, word ptr [bp - 4]                
  0000:29dd  8b5ef8           mov bx, word ptr [bp - 8]                
  0000:29e0  b80500           mov ax, 5                                
  0000:29e3  2346fe           and ax, word ptr [bp - 2]                
  0000:29e6  3d0500           cmp ax, 5                                
  0000:29e9  7513             jne 0x29fe                               
  0000:29eb  8a66fb           mov ah, byte ptr [bp - 5]                
  0000:29ee  80fc6f           cmp ah, 0x6f                             
  0000:29f1  750d             jne 0x2a00                               
  0000:29f3  837ef200         cmp word ptr [bp - 0xe], 0               
  0000:29f7  7f05             jg 0x29fe                                
  0000:29f9  c746f20100       mov word ptr [bp - 0xe], 1               
  0000:29fe  eb1b             jmp 0x2a1b                               
  0000:2a00  80fc78           cmp ah, 0x78                             
  0000:2a03  7405             je 0x2a0a                                
  0000:2a05  80fc58           cmp ah, 0x58                             
  0000:2a08  7511             jne 0x2a1b                               
  0000:2a0a  834efe40         or word ptr [bp - 2], 0x40               
  0000:2a0e  4b               dec bx                                   
  0000:2a0f  4b               dec bx                                   
  0000:2a10  836ef202         sub word ptr [bp - 0xe], 2               
  0000:2a14  7d05             jge 0x2a1b                               
  0000:2a16  c746f20000       mov word ptr [bp - 0xe], 0               
  0000:2a1b  034ef2           add cx, word ptr [bp - 0xe]              
  0000:2a1e  f746fe0200       test word ptr [bp - 2], 2                
  0000:2a23  750c             jne 0x2a31                               
  0000:2a25  eb06             jmp 0x2a2d                               
  0000:2a27  b020             mov al, 0x20                             
  0000:2a29  e86dfc           call 0x2699                              -> 0000:2699
  0000:2a2c  4b               dec bx                                   
  0000:2a2d  3bd9             cmp bx, cx                               
  0000:2a2f  7ff6             jg 0x2a27                                
  0000:2a31  f746fe4000       test word ptr [bp - 2], 0x40             
  0000:2a36  740b             je 0x2a43                                
  0000:2a38  b030             mov al, 0x30                             
  0000:2a3a  e85cfc           call 0x2699                              -> 0000:2699
  0000:2a3d  8a46fb           mov al, byte ptr [bp - 5]                
  0000:2a40  e856fc           call 0x2699                              -> 0000:2699
  0000:2a43  8b56f2           mov dx, word ptr [bp - 0xe]              
  0000:2a46  0bd2             or dx, dx                                
  0000:2a48  7e27             jle 0x2a71                               
  0000:2a4a  2bca             sub cx, dx                               
  0000:2a4c  2bda             sub bx, dx                               
  0000:2a4e  268a04           mov al, byte ptr es:[si]                 
  0000:2a51  3c2d             cmp al, 0x2d                             
  0000:2a53  7408             je 0x2a5d                                
  0000:2a55  3c20             cmp al, 0x20                             
  0000:2a57  7404             je 0x2a5d                                
  0000:2a59  3c2b             cmp al, 0x2b                             
  0000:2a5b  7507             jne 0x2a64                               
  0000:2a5d  26ac             lodsb al, byte ptr es:[si]               
  0000:2a5f  e837fc           call 0x2699                              -> 0000:2699
  0000:2a62  49               dec cx                                   
  0000:2a63  4b               dec bx                                   
  0000:2a64  87ca             xchg dx, cx                              
  0000:2a66  e307             jcxz 0x2a6f                              
  0000:2a68  b030             mov al, 0x30                             
  0000:2a6a  e82cfc           call 0x2699                              -> 0000:2699
  0000:2a6d  e2f9             loop 0x2a68                              
  0000:2a6f  87ca             xchg dx, cx                              
  0000:2a71  e312             jcxz 0x2a85                              
  0000:2a73  2bd9             sub bx, cx                               
  0000:2a75  26ac             lodsb al, byte ptr es:[si]               
  0000:2a77  368805           mov byte ptr ss:[di], al                 
  0000:2a7a  47               inc di                                   
  0000:2a7b  fe4eec           dec byte ptr [bp - 0x14]                 
  0000:2a7e  7f03             jg 0x2a83                                
  0000:2a80  e81ffc           call 0x26a2                              -> 0000:26a2
  0000:2a83  e2f0             loop 0x2a75                              
  0000:2a85  0bdb             or bx, bx                                
  0000:2a87  7e09             jle 0x2a92                               
  0000:2a89  8bcb             mov cx, bx                               
  0000:2a8b  b020             mov al, 0x20                             
  0000:2a8d  e809fc           call 0x2699                              -> 0000:2699
  0000:2a90  e2f9             loop 0x2a8b                              
  0000:2a92  e94dfc           jmp 0x26e2                               
  0000:2a95  897606           mov word ptr [bp + 6], si                
  0000:2a98  8b7e04           mov di, word ptr [bp + 4]                
  0000:2a9b  f746fe2000       test word ptr [bp - 2], 0x20             
  0000:2aa0  750b             jne 0x2aad                               
  0000:2aa2  368b3d           mov di, word ptr ss:[di]                 
  0000:2aa5  83460402         add word ptr [bp + 4], 2                 
  0000:2aa9  1e               push ds                                  
  0000:2aaa  07               pop es                                   
  0000:2aab  eb07             jmp 0x2ab4                               
  0000:2aad  36c43d           les di, ptr ss:[di]                      
  0000:2ab0  83460404         add word ptr [bp + 4], 4                 
  0000:2ab4  b85000           mov ax, 0x50                             
  0000:2ab7  2a46ec           sub al, byte ptr [bp - 0x14]             
  0000:2aba  0346ee           add ax, word ptr [bp - 0x12]             
  0000:2abd  268905           mov word ptr es:[di], ax                 
  0000:2ac0  f746fe1000       test word ptr [bp - 2], 0x10             
  0000:2ac5  7407             je 0x2ace                                
  0000:2ac7  47               inc di                                   
  0000:2ac8  47               inc di                                   
  0000:2ac9  26c7050000       mov word ptr es:[di], 0                  
  0000:2ace  e90efc           jmp 0x26df                               
  0000:2ad1  8b76f0           mov si, word ptr [bp - 0x10]             
  0000:2ad4  8e4608           mov es, word ptr [bp + 8]                
  0000:2ad7  8b7efc           mov di, word ptr [bp - 4]                
  0000:2ada  b025             mov al, 0x25                             
  0000:2adc  e8bafb           call 0x2699                              -> 0000:2699
  0000:2adf  26ac             lodsb al, byte ptr es:[si]               
  0000:2ae1  0ac0             or al, al                                
  0000:2ae3  75f7             jne 0x2adc                               
  0000:2ae5  807eec50         cmp byte ptr [bp - 0x14], 0x50           
  0000:2ae9  7d03             jge 0x2aee                               
  0000:2aeb  e8b4fb           call 0x26a2                              -> 0000:26a2
  0000:2aee  07               pop es                                   
  0000:2aef  837eea00         cmp word ptr [bp - 0x16], 0              
  0000:2af3  7405             je 0x2afa                                
  0000:2af5  b8ffff           mov ax, 0xffff                           
  0000:2af8  eb03             jmp 0x2afd                               
  0000:2afa  8b46ee           mov ax, word ptr [bp - 0x12]             
  0000:2afd  5f               pop di                                   
  0000:2afe  5e               pop si                                   
  0000:2aff  8be5             mov sp, bp                               
  0000:2b01  5d               pop bp                                   
  0000:2b02  c20c00           ret 0xc                                  
  0000:2b05  61               popaw                                    
  0000:2b06  27               daa                                      
  0000:2b07  4b               dec bx                                   
  0000:2b08  27               daa                                      
  0000:2b09  96               xchg si, ax                              
  0000:2b0a  27               daa                                      
  0000:2b0b  56               push si                                  
  0000:2b0c  27               daa                                      
  0000:2b0d  c427             les sp, ptr [bx]                         
  0000:2b0f  d127             shl word ptr [bx], 1                     
  0000:2b11  0f2816281b       movaps xmm2, xmmword ptr [0x1b28]        
  0000:2b16  287f27           sub byte ptr [bx + 0x27], bh             
  0000:2b19  44               inc sp                                   
  0000:2b1a  2822             sub byte ptr [bp + si], ah               
  0000:2b1c  2826282a         sub byte ptr [0x2a28], ah                
  0000:2b20  28a42851         sub byte ptr [si + 0x5128], ah           
  0000:2b24  29f4             sub sp, si                               
  0000:2b26  2814             sub byte ptr [si], dl                    
  0000:2b28  29952ad1         sub word ptr [di - 0x2ed6], dx           
  0000:2b2c  2ad1             sub dl, cl                               
  0000:2b2e  2ad1             sub dl, cl                               
  0000:2b30  2a7127           sub dh, byte ptr [bx + di + 0x27]        
  0000:2b33  7727             ja 0x2b5c                                

proc_0000_2b35:
  0000:2b35  55               push bp                                  
  0000:2b36  8bec             mov bp, sp                               
  0000:2b38  a08612           mov al, byte ptr [0x1286]                
  0000:2b3b  b400             mov ah, 0                                
  0000:2b3d  8b5604           mov dx, word ptr [bp + 4]                
  0000:2b40  4a               dec dx                                   
  0000:2b41  f7ea             imul dx                                  
  0000:2b43  50               push ax                                  
  0000:2b44  a18912           mov ax, word ptr [0x1289]                
  0000:2b47  5a               pop dx                                   
  0000:2b48  03c2             add ax, dx                               
  0000:2b4a  8b5606           mov dx, word ptr [bp + 6]                
  0000:2b4d  4a               dec dx                                   
  0000:2b4e  03c2             add ax, dx                               
  0000:2b50  d1e0             shl ax, 1                                
  0000:2b52  8b168b12         mov dx, word ptr [0x128b]                
  0000:2b56  5d               pop bp                                   
  0000:2b57  c20400           ret 4                                    

proc_0000_2b5a:
  0000:2b5a  55               push bp                                  
  0000:2b5b  8bec             mov bp, sp                               
  0000:2b5d  83ec02           sub sp, 2                                
  0000:2b60  56               push si                                  
  0000:2b61  57               push di                                  
  0000:2b62  a08812           mov al, byte ptr [0x1288]                
  0000:2b65  b400             mov ah, 0                                
  0000:2b67  8946fe           mov word ptr [bp - 2], ax                
  0000:2b6a  1e               push ds                                  
  0000:2b6b  8b4e04           mov cx, word ptr [bp + 4]                
  0000:2b6e  e35a             jcxz 0x2bca                              
  0000:2b70  c47e0a           les di, ptr [bp + 0xa]                   
  0000:2b73  c57606           lds si, ptr [bp + 6]                     
  0000:2b76  fc               cld                                      
  0000:2b77  3bf7             cmp si, di                               
  0000:2b79  730a             jae 0x2b85                               
  0000:2b7b  8bc1             mov ax, cx                               
  0000:2b7d  48               dec ax                                   
  0000:2b7e  d1e0             shl ax, 1                                
  0000:2b80  03f0             add si, ax                               
  0000:2b82  03f8             add di, ax                               
  0000:2b84  fd               std                                      
  0000:2b85  837efe00         cmp word ptr [bp - 2], 0                 
  0000:2b89  7504             jne 0x2b8f                               
  0000:2b8b  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0000:2b8d  eb3b             jmp 0x2bca                               
  0000:2b8f  bada03           mov dx, 0x3da                            
  0000:2b92  8cc0             mov ax, es                               
  0000:2b94  8cdb             mov bx, ds                               
  0000:2b96  3bc3             cmp ax, bx                               
  0000:2b98  7411             je 0x2bab                                
  0000:2b9a  fa               cli                                      
  0000:2b9b  ec               in al, dx                                
  0000:2b9c  d0c8             ror al, 1                                
  0000:2b9e  72fb             jb 0x2b9b                                
  0000:2ba0  ec               in al, dx                                
  0000:2ba1  d0c8             ror al, 1                                
  0000:2ba3  73fb             jae 0x2ba0                               
  0000:2ba5  a5               movsw word ptr es:[di], word ptr [si]    
  0000:2ba6  fb               sti                                      
  0000:2ba7  e2f1             loop 0x2b9a                              
  0000:2ba9  eb1f             jmp 0x2bca                               
  0000:2bab  fa               cli                                      
  0000:2bac  ec               in al, dx                                
  0000:2bad  d0c8             ror al, 1                                
  0000:2baf  72fb             jb 0x2bac                                
  0000:2bb1  ec               in al, dx                                
  0000:2bb2  d0c8             ror al, 1                                
  0000:2bb4  73fb             jae 0x2bb1                               
  0000:2bb6  ad               lodsw ax, word ptr [si]                  
  0000:2bb7  fb               sti                                      
  0000:2bb8  8bd8             mov bx, ax                               
  0000:2bba  ec               in al, dx                                
  0000:2bbb  d0c8             ror al, 1                                
  0000:2bbd  72fb             jb 0x2bba                                
  0000:2bbf  ec               in al, dx                                
  0000:2bc0  d0c8             ror al, 1                                
  0000:2bc2  73fb             jae 0x2bbf                               
  0000:2bc4  8bc3             mov ax, bx                               
  0000:2bc6  ab               stosw word ptr es:[di], ax               
  0000:2bc7  fb               sti                                      
  0000:2bc8  e2e1             loop 0x2bab                              
  0000:2bca  fc               cld                                      
  0000:2bcb  1f               pop ds                                   
  0000:2bcc  5f               pop di                                   
  0000:2bcd  5e               pop si                                   
  0000:2bce  8be5             mov sp, bp                               
  0000:2bd0  5d               pop bp                                   
  0000:2bd1  c20a00           ret 0xa                                  

proc_0000_2bd4:
  0000:2bd4  55               push bp                                  
  0000:2bd5  8bec             mov bp, sp                               
  0000:2bd7  83ec08           sub sp, 8                                
  0000:2bda  56               push si                                  
  0000:2bdb  8b7608           mov si, word ptr [bp + 8]                
  0000:2bde  c646fb00         mov byte ptr [bp - 5], 0                 
  0000:2be2  e85610           call 0x3c3b                              -> 0000:3c3b
  0000:2be5  b400             mov ah, 0                                
  0000:2be7  8946fe           mov word ptr [bp - 2], ax                
  0000:2bea  e84e10           call 0x3c3b                              -> 0000:3c3b
  0000:2bed  b108             mov cl, 8                                
  0000:2bef  d3e8             shr ax, cl                               
  0000:2bf1  b400             mov ah, 0                                
  0000:2bf3  8946fc           mov word ptr [bp - 4], ax                
  0000:2bf6  e9dc00           jmp 0x2cd5                               
  0000:2bf9  c45e0a           les bx, ptr [bp + 0xa]                   
  0000:2bfc  ff460a           inc word ptr [bp + 0xa]                  
  0000:2bff  268a07           mov al, byte ptr es:[bx]                 
  0000:2c02  8846fb           mov byte ptr [bp - 5], al                
  0000:2c05  b400             mov ah, 0                                
  0000:2c07  2d0700           sub ax, 7                                
  0000:2c0a  8bd8             mov bx, ax                               
  0000:2c0c  83fb06           cmp bx, 6                                
  0000:2c0f  772e             ja 0x2c3f                                
  0000:2c11  d1e3             shl bx, 1                                
  0000:2c13  2effa7f82c       jmp word ptr cs:[bx + 0x2cf8]            
  0000:2c18  b40e             mov ah, 0xe                              
  0000:2c1a  b007             mov al, 7                                
  0000:2c1c  e83e01           call 0x2d5d                              -> 0000:2d5d
  0000:2c1f  eb76             jmp 0x2c97                               
  0000:2c21  a07e12           mov al, byte ptr [0x127e]                
  0000:2c24  b400             mov ah, 0                                
  0000:2c26  3b46fe           cmp ax, word ptr [bp - 2]                
  0000:2c29  7d6c             jge 0x2c97                               
  0000:2c2b  ff4efe           dec word ptr [bp - 2]                    
  0000:2c2e  eb67             jmp 0x2c97                               
  0000:2c30  a07e12           mov al, byte ptr [0x127e]                
  0000:2c33  b400             mov ah, 0                                
  0000:2c35  8946fe           mov word ptr [bp - 2], ax                
  0000:2c38  eb5d             jmp 0x2c97                               
  0000:2c3a  ff46fc           inc word ptr [bp - 4]                    
  0000:2c3d  eb58             jmp 0x2c97                               
  0000:2c3f  a08712           mov al, byte ptr [0x1287]                
  0000:2c42  b400             mov ah, 0                                
  0000:2c44  0bc0             or ax, ax                                
  0000:2c46  752e             jne 0x2c76                               
  0000:2c48  833e8d1200       cmp word ptr [0x128d], 0                 
  0000:2c4d  7427             je 0x2c76                                
  0000:2c4f  8a268212         mov ah, byte ptr [0x1282]                
  0000:2c53  8a46fb           mov al, byte ptr [bp - 5]                
  0000:2c56  8946f8           mov word ptr [bp - 8], ax                
  0000:2c59  8b46fe           mov ax, word ptr [bp - 2]                
  0000:2c5c  40               inc ax                                   
  0000:2c5d  50               push ax                                  
  0000:2c5e  8b46fc           mov ax, word ptr [bp - 4]                
  0000:2c61  40               inc ax                                   
  0000:2c62  50               push ax                                  
  0000:2c63  e8cffe           call 0x2b35                              -> 0000:2b35
  0000:2c66  52               push dx                                  
  0000:2c67  50               push ax                                  
  0000:2c68  16               push ss                                  
  0000:2c69  8d46f8           lea ax, [bp - 8]                         
  0000:2c6c  50               push ax                                  
  0000:2c6d  b80100           mov ax, 1                                
  0000:2c70  50               push ax                                  
  0000:2c71  e8e6fe           call 0x2b5a                              -> 0000:2b5a
  0000:2c74  eb1e             jmp 0x2c94                               
  0000:2c76  8a56fe           mov dl, byte ptr [bp - 2]                
  0000:2c79  8a76fc           mov dh, byte ptr [bp - 4]                
  0000:2c7c  b402             mov ah, 2                                
  0000:2c7e  b700             mov bh, 0                                
  0000:2c80  e8da00           call 0x2d5d                              -> 0000:2d5d
  0000:2c83  8a1e8212         mov bl, byte ptr [0x1282]                
  0000:2c87  8a46fb           mov al, byte ptr [bp - 5]                
  0000:2c8a  b409             mov ah, 9                                
  0000:2c8c  b700             mov bh, 0                                
  0000:2c8e  b90100           mov cx, 1                                
  0000:2c91  e8c900           call 0x2d5d                              -> 0000:2d5d
  0000:2c94  ff46fe           inc word ptr [bp - 2]                    
  0000:2c97  a08012           mov al, byte ptr [0x1280]                
  0000:2c9a  b400             mov ah, 0                                
  0000:2c9c  3b46fe           cmp ax, word ptr [bp - 2]                
  0000:2c9f  7d0e             jge 0x2caf                               
  0000:2ca1  a07e12           mov al, byte ptr [0x127e]                
  0000:2ca4  b400             mov ah, 0                                
  0000:2ca6  8946fe           mov word ptr [bp - 2], ax                
  0000:2ca9  a17c12           mov ax, word ptr [0x127c]                
  0000:2cac  0146fc           add word ptr [bp - 4], ax                
  0000:2caf  a08112           mov al, byte ptr [0x1281]                
  0000:2cb2  b400             mov ah, 0                                
  0000:2cb4  3b46fc           cmp ax, word ptr [bp - 4]                
  0000:2cb7  7d1c             jge 0x2cd5                               
  0000:2cb9  b006             mov al, 6                                
  0000:2cbb  50               push ax                                  
  0000:2cbc  a07e12           mov al, byte ptr [0x127e]                
  0000:2cbf  50               push ax                                  
  0000:2cc0  a07f12           mov al, byte ptr [0x127f]                
  0000:2cc3  50               push ax                                  
  0000:2cc4  a08012           mov al, byte ptr [0x1280]                
  0000:2cc7  50               push ax                                  
  0000:2cc8  a08112           mov al, byte ptr [0x1281]                
  0000:2ccb  50               push ax                                  
  0000:2ccc  b001             mov al, 1                                
  0000:2cce  50               push ax                                  
  0000:2ccf  e8b60c           call 0x3988                              -> 0000:3988
  0000:2cd2  ff4efc           dec word ptr [bp - 4]                    
  0000:2cd5  8bc6             mov ax, si                               
  0000:2cd7  4e               dec si                                   
  0000:2cd8  0bc0             or ax, ax                                
  0000:2cda  7403             je 0x2cdf                                
  0000:2cdc  e91aff           jmp 0x2bf9                               
  0000:2cdf  8a56fe           mov dl, byte ptr [bp - 2]                
  0000:2ce2  8a76fc           mov dh, byte ptr [bp - 4]                
  0000:2ce5  b402             mov ah, 2                                
  0000:2ce7  b700             mov bh, 0                                
  0000:2ce9  e87100           call 0x2d5d                              -> 0000:2d5d
  0000:2cec  8a46fb           mov al, byte ptr [bp - 5]                
  0000:2cef  b400             mov ah, 0                                
  0000:2cf1  5e               pop si                                   
  0000:2cf2  8be5             mov sp, bp                               
  0000:2cf4  5d               pop bp                                   
  0000:2cf5  c20a00           ret 0xa                                  
  0000:2cf8  182c             sbb byte ptr [si], ch                    
  0000:2cfa  212c             and word ptr [si], bp                    
  0000:2cfc  3f               aas                                      
  0000:2cfd  2c3a             sub al, 0x3a                             
  0000:2cff  2c3f             sub al, 0x3f                             
  0000:2d01  2c3f             sub al, 0x3f                             
  0000:2d03  2c30             sub al, 0x30                             
  0000:2d05  2c55             sub al, 0x55                             
  0000:2d07  8bec             mov bp, sp                               
  0000:2d09  b8d42b           mov ax, 0x2bd4                           
  0000:2d0c  50               push ax                                  
  0000:2d0d  33c0             xor ax, ax                               
  0000:2d0f  33d2             xor dx, dx                               
  0000:2d11  50               push ax                                  
  0000:2d12  52               push dx                                  
  0000:2d13  ff7608           push word ptr [bp + 8]                   
  0000:2d16  ff7606           push word ptr [bp + 6]                   
  0000:2d19  8d460a           lea ax, [bp + 0xa]                       
  0000:2d1c  50               push ax                                  
  0000:2d1d  e852f9           call 0x2672                              -> 0000:2672
  0000:2d20  5d               pop bp                                   
  0000:2d21  cb               retf                                     

proc_0000_2d22:
  0000:2d22  55               push bp                                  
  0000:2d23  8bec             mov bp, sp                               
  0000:2d25  eb18             jmp 0x2d3f                               
  0000:2d27  c45e04           les bx, ptr [bp + 4]                     
  0000:2d2a  ff4604           inc word ptr [bp + 4]                    
  0000:2d2d  268a07           mov al, byte ptr es:[bx]                 
  0000:2d30  c45e08           les bx, ptr [bp + 8]                     
  0000:2d33  ff4608           inc word ptr [bp + 8]                    
  0000:2d36  263a07           cmp al, byte ptr es:[bx]                 
  0000:2d39  7404             je 0x2d3f                                
  0000:2d3b  33c0             xor ax, ax                               
  0000:2d3d  eb0c             jmp 0x2d4b                               
  0000:2d3f  c45e04           les bx, ptr [bp + 4]                     
  0000:2d42  26803f00         cmp byte ptr es:[bx], 0                  
  0000:2d46  75df             jne 0x2d27                               
  0000:2d48  b80100           mov ax, 1                                
  0000:2d4b  5d               pop bp                                   
  0000:2d4c  c20800           ret 8                                    
  0000:2d4f  b412             mov ah, 0x12                             
  0000:2d51  b310             mov bl, 0x10                             
  0000:2d53  e80700           call 0x2d5d                              -> 0000:2d5d
  0000:2d56  8ac3             mov al, bl                               
  0000:2d58  04f0             add al, 0xf0                             
  0000:2d5a  b400             mov ah, 0                                
  0000:2d5c  c3               ret                                      
  0000:2d5d  55               push bp                                  
  0000:2d5e  1e               push ds                                  
  0000:2d5f  51               push cx                                  
  0000:2d60  b94000           mov cx, 0x40                             
  0000:2d63  8ed9             mov ds, cx                               
  0000:2d65  59               pop cx                                   
  0000:2d66  80fc00           cmp ah, 0                                
  0000:2d69  7409             je 0x2d74                                
  0000:2d6b  80fc0f           cmp ah, 0xf                              
  0000:2d6e  7459             je 0x2dc9                                
  0000:2d70  cd10             int 0x10                                 
  0000:2d72  eb71             jmp 0x2de5                               
  0000:2d74  3c02             cmp al, 2                                
  0000:2d76  7404             je 0x2d7c                                
  0000:2d78  3c03             cmp al, 3                                
  0000:2d7a  7519             jne 0x2d95                               
  0000:2d7c  50               push ax                                  
  0000:2d7d  b8001a           mov ax, 0x1a00                           
  0000:2d80  cd10             int 0x10                                 
  0000:2d82  3c1a             cmp al, 0x1a                             
  0000:2d84  7405             je 0x2d8b                                
  0000:2d86  80268700fe       and byte ptr [0x87], 0xfe                
  0000:2d8b  b401             mov ah, 1                                
  0000:2d8d  b90706           mov cx, 0x607                            
  0000:2d90  cd10             int 0x10                                 
  0000:2d92  58               pop ax                                   
  0000:2d93  ebdb             jmp 0x2d70                               
  0000:2d95  3c40             cmp al, 0x40                             
  0000:2d97  75d7             jne 0x2d70                               
  0000:2d99  b310             mov bl, 0x10                             
  0000:2d9b  b412             mov ah, 0x12                             
  0000:2d9d  cd10             int 0x10                                 
  0000:2d9f  80fb10           cmp bl, 0x10                             
  0000:2da2  7441             je 0x2de5                                
  0000:2da4  b81211           mov ax, 0x1112                           
  0000:2da7  32db             xor bl, bl                               
  0000:2da9  cd10             int 0x10                                 
  0000:2dab  b80012           mov ax, 0x1200                           
  0000:2dae  b320             mov bl, 0x20                             
  0000:2db0  cd10             int 0x10                                 
  0000:2db2  b8001a           mov ax, 0x1a00                           
  0000:2db5  cd10             int 0x10                                 
  0000:2db7  3c1a             cmp al, 0x1a                             
  0000:2db9  742a             je 0x2de5                                
  0000:2dbb  800e870001       or byte ptr [0x87], 1                    
  0000:2dc0  b401             mov ah, 1                                
  0000:2dc2  b90006           mov cx, 0x600                            
  0000:2dc5  cd10             int 0x10                                 
  0000:2dc7  eb1c             jmp 0x2de5                               
  0000:2dc9  cd10             int 0x10                                 
  0000:2dcb  3c02             cmp al, 2                                
  0000:2dcd  7404             je 0x2dd3                                
  0000:2dcf  3c03             cmp al, 3                                
  0000:2dd1  7512             jne 0x2de5                               
  0000:2dd3  50               push ax                                  
  0000:2dd4  e878ff           call 0x2d4f                              -> 0000:2d4f
  0000:2dd7  0ac0             or al, al                                
  0000:2dd9  58               pop ax                                   
  0000:2dda  7409             je 0x2de5                                
  0000:2ddc  803e840018       cmp byte ptr [0x84], 0x18                
  0000:2de1  7402             je 0x2de5                                
  0000:2de3  b040             mov al, 0x40                             
  0000:2de5  1f               pop ds                                   
  0000:2de6  5d               pop bp                                   
  0000:2de7  c3               ret                                      
  0000:2de8  b40f             mov ah, 0xf                              
  0000:2dea  e870ff           call 0x2d5d                              -> 0000:2d5d
  0000:2ded  50               push ax                                  
  0000:2dee  e81400           call 0x2e05                              -> 0000:2e05
  0000:2df1  59               pop cx                                   
  0000:2df2  b408             mov ah, 8                                
  0000:2df4  b700             mov bh, 0                                
  0000:2df6  e864ff           call 0x2d5d                              -> 0000:2d5d
  0000:2df9  80e47f           and ah, 0x7f                             
  0000:2dfc  88268312         mov byte ptr [0x1283], ah                
  0000:2e00  88268212         mov byte ptr [0x1282], ah                
  0000:2e04  c3               ret                                      

proc_0000_2e05:
  0000:2e05  55               push bp                                  
  0000:2e06  8bec             mov bp, sp                               
  0000:2e08  8a4604           mov al, byte ptr [bp + 4]                
  0000:2e0b  a28412           mov byte ptr [0x1284], al                
  0000:2e0e  b40f             mov ah, 0xf                              
  0000:2e10  e84aff           call 0x2d5d                              -> 0000:2d5d
  0000:2e13  88268612         mov byte ptr [0x1286], ah                
  0000:2e17  3a068412         cmp al, byte ptr [0x1284]                
  0000:2e1b  7414             je 0x2e31                                
  0000:2e1d  a08412           mov al, byte ptr [0x1284]                
  0000:2e20  b400             mov ah, 0                                
  0000:2e22  e838ff           call 0x2d5d                              -> 0000:2d5d
  0000:2e25  b40f             mov ah, 0xf                              
  0000:2e27  e833ff           call 0x2d5d                              -> 0000:2d5d
  0000:2e2a  a28412           mov byte ptr [0x1284], al                
  0000:2e2d  88268612         mov byte ptr [0x1286], ah                
  0000:2e31  803e841203       cmp byte ptr [0x1284], 3                 
  0000:2e36  7613             jbe 0x2e4b                               
  0000:2e38  803e841240       cmp byte ptr [0x1284], 0x40              
  0000:2e3d  730c             jae 0x2e4b                               
  0000:2e3f  803e841207       cmp byte ptr [0x1284], 7                 
  0000:2e44  7405             je 0x2e4b                                
  0000:2e46  b80100           mov ax, 1                                
  0000:2e49  eb02             jmp 0x2e4d                               
  0000:2e4b  33c0             xor ax, ax                               
  0000:2e4d  a28712           mov byte ptr [0x1287], al                
  0000:2e50  803e841240       cmp byte ptr [0x1284], 0x40              
  0000:2e55  7404             je 0x2e5b                                
  0000:2e57  b019             mov al, 0x19                             
  0000:2e59  eb0b             jmp 0x2e66                               
  0000:2e5b  b84000           mov ax, 0x40                             
  0000:2e5e  8ec0             mov es, ax                               
  0000:2e60  26a08400         mov al, byte ptr es:[0x84]               
  0000:2e64  fec0             inc al                                   
  0000:2e66  a28512           mov byte ptr [0x1285], al                
  0000:2e69  803e841207       cmp byte ptr [0x1284], 7                 
  0000:2e6e  7420             je 0x2e90                                
  0000:2e70  b800f0           mov ax, 0xf000                           
  0000:2e73  baeaff           mov dx, 0xffea                           
  0000:2e76  50               push ax                                  
  0000:2e77  52               push dx                                  
  0000:2e78  1e               push ds                                  
  0000:2e79  b88f12           mov ax, 0x128f                            ; "COMPAQ"
  0000:2e7c  50               push ax                                  
  0000:2e7d  e8a2fe           call 0x2d22                              -> 0000:2d22
  0000:2e80  0bc0             or ax, ax                                
  0000:2e82  750c             jne 0x2e90                               
  0000:2e84  e8c8fe           call 0x2d4f                              -> 0000:2d4f
  0000:2e87  0bc0             or ax, ax                                
  0000:2e89  7505             jne 0x2e90                               
  0000:2e8b  b80100           mov ax, 1                                
  0000:2e8e  eb02             jmp 0x2e92                               
  0000:2e90  33c0             xor ax, ax                               
  0000:2e92  a28812           mov byte ptr [0x1288], al                
  0000:2e95  803e841207       cmp byte ptr [0x1284], 7                 
  0000:2e9a  7505             jne 0x2ea1                               
  0000:2e9c  b800b0           mov ax, 0xb000                           
  0000:2e9f  eb03             jmp 0x2ea4                               
  0000:2ea1  b800b8           mov ax, 0xb800                           
  0000:2ea4  a38b12           mov word ptr [0x128b], ax                
  0000:2ea7  c70689120000     mov word ptr [0x1289], 0                 
  0000:2ead  b000             mov al, 0                                
  0000:2eaf  a27f12           mov byte ptr [0x127f], al                
  0000:2eb2  a27e12           mov byte ptr [0x127e], al                
  0000:2eb5  a08612           mov al, byte ptr [0x1286]                
  0000:2eb8  04ff             add al, 0xff                             
  0000:2eba  a28012           mov byte ptr [0x1280], al                
  0000:2ebd  a08512           mov al, byte ptr [0x1285]                
  0000:2ec0  04ff             add al, 0xff                             
  0000:2ec2  a28112           mov byte ptr [0x1281], al                
  0000:2ec5  5d               pop bp                                   
  0000:2ec6  c3               ret                                      
  0000:2ec7  ba9612           mov dx, 0x1296                            ; "print scanf : floating point formats not linked"
  0000:2eca  eb03             jmp 0x2ecf                               
  0000:2ecc  ba9b12           mov dx, 0x129b                           
  0000:2ecf  b90500           mov cx, 5                                
  0000:2ed2  b440             mov ah, 0x40                             
  0000:2ed4  bb0200           mov bx, 2                                
  0000:2ed7  cd21             int 0x21                                 
  0000:2ed9  b92700           mov cx, 0x27                             
  0000:2edc  baa012           mov dx, 0x12a0                           
  0000:2edf  b440             mov ah, 0x40                             
  0000:2ee1  cd21             int 0x21                                 
  0000:2ee3  e994d3           jmp 0x27a                                
  0000:2ee6  c3               ret                                      
  0000:2ee7  9c               pushf                                    
  0000:2ee8  fa               cli                                      
  0000:2ee9  b000             mov al, 0                                
  0000:2eeb  e643             out 0x43, al                             
  0000:2eed  e8f6ff           call 0x2ee6                              -> 0000:2ee6
  0000:2ef0  e440             in al, 0x40                              
  0000:2ef2  8ad8             mov bl, al                               
  0000:2ef4  e8efff           call 0x2ee6                              -> 0000:2ee6
  0000:2ef7  e440             in al, 0x40                              
  0000:2ef9  8af8             mov bh, al                               
  0000:2efb  f7d3             not bx                                   
  0000:2efd  9d               popf                                     
  0000:2efe  8bc3             mov ax, bx                               
  0000:2f00  c3               ret                                      
  0000:2f01  56               push si                                  
  0000:2f02  33f6             xor si, si                               
  0000:2f04  e8e0ff           call 0x2ee7                              -> 0000:2ee7
  0000:2f07  a90100           test ax, 1                               
  0000:2f0a  750e             jne 0x2f1a                               
  0000:2f0c  c706ca120000     mov word ptr [0x12ca], 0                 
  0000:2f12  c706c812a904     mov word ptr [0x12c8], 0x4a9             
  0000:2f18  eb06             jmp 0x2f20                               
  0000:2f1a  46               inc si                                   
  0000:2f1b  83fe64           cmp si, 0x64                             
  0000:2f1e  7ce4             jl 0x2f04                                
  0000:2f20  5e               pop si                                   
  0000:2f21  cb               retf                                     

proc_0000_2f22:
  0000:2f22  55               push bp                                  
  0000:2f23  8bec             mov bp, sp                               
  0000:2f25  83ec04           sub sp, 4                                
  0000:2f28  56               push si                                  
  0000:2f29  e8bbff           call 0x2ee7                              -> 0000:2ee7
  0000:2f2c  8bf0             mov si, ax                               
  0000:2f2e  33d2             xor dx, dx                               
  0000:2f30  8b5e06           mov bx, word ptr [bp + 6]                
  0000:2f33  33c9             xor cx, cx                               
  0000:2f35  50               push ax                                  
  0000:2f36  52               push dx                                  
  0000:2f37  8b16ca12         mov dx, word ptr [0x12ca]                
  0000:2f3b  a1c812           mov ax, word ptr [0x12c8]                
  0000:2f3e  e8eeee           call 0x1e2f                              -> 0000:1e2f
  0000:2f41  5b               pop bx                                   
  0000:2f42  59               pop cx                                   
  0000:2f43  03c8             add cx, ax                               
  0000:2f45  13da             adc bx, dx                               
  0000:2f47  895efe           mov word ptr [bp - 2], bx                
  0000:2f4a  894efc           mov word ptr [bp - 4], cx                
  0000:2f4d  eb1c             jmp 0x2f6b                               
  0000:2f4f  3bde             cmp bx, si                               
  0000:2f51  7316             jae 0x2f69                               
  0000:2f53  837efe01         cmp word ptr [bp - 2], 1                 
  0000:2f57  7708             ja 0x2f61                                
  0000:2f59  7223             jb 0x2f7e                                
  0000:2f5b  837efc00         cmp word ptr [bp - 4], 0                 
  0000:2f5f  721d             jb 0x2f7e                                
  0000:2f61  836efc00         sub word ptr [bp - 4], 0                 
  0000:2f65  835efe01         sbb word ptr [bp - 2], 1                 
  0000:2f69  8bf3             mov si, bx                               
  0000:2f6b  e879ff           call 0x2ee7                              -> 0000:2ee7
  0000:2f6e  8bd8             mov bx, ax                               
  0000:2f70  33d2             xor dx, dx                               
  0000:2f72  3b56fe           cmp dx, word ptr [bp - 2]                
  0000:2f75  72d8             jb 0x2f4f                                
  0000:2f77  7505             jne 0x2f7e                               
  0000:2f79  3b46fc           cmp ax, word ptr [bp - 4]                
  0000:2f7c  72d1             jb 0x2f4f                                
  0000:2f7e  5e               pop si                                   
  0000:2f7f  8be5             mov sp, bp                               
  0000:2f81  5d               pop bp                                   
  0000:2f82  cb               retf                                     
  0000:2f83  0000             add byte ptr [bx + si], al               
  0000:2f85  0000             add byte ptr [bx + si], al               
  0000:2f87  0000             add byte ptr [bx + si], al               
  0000:2f89  0000             add byte ptr [bx + si], al               
  0000:2f8b  0000             add byte ptr [bx + si], al               
  0000:2f8d  0000             add byte ptr [bx + si], al               
  0000:2f8f  2e3b16832f       cmp dx, word ptr cs:[0x2f83]             
  0000:2f94  7437             je 0x2fcd                                
  0000:2f96  8eda             mov ds, dx                               
  0000:2f98  8e1e0200         mov ds, word ptr [2]                     
  0000:2f9c  833e020000       cmp word ptr [2], 0                      
  0000:2fa1  7407             je 0x2faa                                
  0000:2fa3  2e8c1e852f       mov word ptr cs:[0x2f85], ds             
  0000:2fa8  eb38             jmp 0x2fe2                               
  0000:2faa  8cd8             mov ax, ds                               
  0000:2fac  2e3b06832f       cmp ax, word ptr cs:[0x2f83]             
  0000:2fb1  7415             je 0x2fc8                                
  0000:2fb3  a10800           mov ax, word ptr [8]                     
  0000:2fb6  2ea3852f         mov word ptr cs:[0x2f85], ax             
  0000:2fba  1e               push ds                                  
  0000:2fbb  33c0             xor ax, ax                               
  0000:2fbd  50               push ax                                  
  0000:2fbe  e8a200           call 0x3063                              -> 0000:3063
  0000:2fc1  2e8e1e892f       mov ds, word ptr cs:[0x2f89]             
  0000:2fc6  eb23             jmp 0x2feb                               
  0000:2fc8  2e8b16832f       mov dx, word ptr cs:[0x2f83]             
  0000:2fcd  2ec706832f0000   mov word ptr cs:[0x2f83], 0              
  0000:2fd4  2ec706852f0000   mov word ptr cs:[0x2f85], 0              
  0000:2fdb  2ec706872f0000   mov word ptr cs:[0x2f87], 0              
  0000:2fe2  2e8e1e892f       mov ds, word ptr cs:[0x2f89]             
  0000:2fe7  52               push dx                                  
  0000:2fe8  33c0             xor ax, ax                               
  0000:2fea  50               push ax                                  
  0000:2feb  e83d04           call 0x342b                              -> 0000:342b
  0000:2fee  83c404           add sp, 4                                
  0000:2ff1  c3               ret                                      
  0000:2ff2  8eda             mov ds, dx                               
  0000:2ff4  1e               push ds                                  
  0000:2ff5  8e060200         mov es, word ptr [2]                     
  0000:2ff9  c70602000000     mov word ptr [2], 0                      
  0000:2fff  8c060800         mov word ptr [8], es                     
  0000:3003  2e3b16832f       cmp dx, word ptr cs:[0x2f83]             
  0000:3008  742e             je 0x3038                                
  0000:300a  26833e020000     cmp word ptr es:[2], 0                   
  0000:3010  7526             jne 0x3038                               
  0000:3012  a10000           mov ax, word ptr [0]                     
  0000:3015  5b               pop bx                                   
  0000:3016  06               push es                                  
  0000:3017  2601060000       add word ptr es:[0], ax                  
  0000:301c  8cc1             mov cx, es                               
  0000:301e  03d0             add dx, ax                               
  0000:3020  8ec2             mov es, dx                               
  0000:3022  26833e020000     cmp word ptr es:[2], 0                   
  0000:3028  7507             jne 0x3031                               
  0000:302a  26890e0800       mov word ptr es:[8], cx                  
  0000:302f  eb0a             jmp 0x303b                               
  0000:3031  26890e0200       mov word ptr es:[2], cx                  
  0000:3036  eb03             jmp 0x303b                               
  0000:3038  e85100           call 0x308c                              -> 0000:308c
  0000:303b  07               pop es                                   
  0000:303c  8cc0             mov ax, es                               
  0000:303e  2603060000       add ax, word ptr es:[0]                  
  0000:3043  8ed8             mov ds, ax                               
  0000:3045  833e020000       cmp word ptr [2], 0                      
  0000:304a  7401             je 0x304d                                
  0000:304c  c3               ret                                      
  0000:304d  a10000           mov ax, word ptr [0]                     
  0000:3050  2601060000       add word ptr es:[0], ax                  
  0000:3055  8cc0             mov ax, es                               
  0000:3057  8cdb             mov bx, ds                               
  0000:3059  031e0000         add bx, word ptr [0]                     
  0000:305d  8ec3             mov es, bx                               
  0000:305f  26a30200         mov word ptr es:[2], ax                  
  0000:3063  8cdb             mov bx, ds                               
  0000:3065  3b1e0600         cmp bx, word ptr [6]                     
  0000:3069  7419             je 0x3084                                
  0000:306b  8e060600         mov es, word ptr [6]                     
  0000:306f  8e1e0400         mov ds, word ptr [4]                     
  0000:3073  8c060600         mov word ptr [6], es                     
  0000:3077  268c1e0400       mov word ptr es:[4], ds                  
  0000:307c  2e8c1e872f       mov word ptr cs:[0x2f87], ds             
  0000:3081  8edb             mov ds, bx                               
  0000:3083  c3               ret                                      
  0000:3084  2ec706872f0000   mov word ptr cs:[0x2f87], 0              
  0000:308b  c3               ret                                      
  0000:308c  2ea1872f         mov ax, word ptr cs:[0x2f87]             
  0000:3090  0bc0             or ax, ax                                
  0000:3092  7421             je 0x30b5                                
  0000:3094  8cd3             mov bx, ss                               
  0000:3096  9c               pushf                                    
  0000:3097  fa               cli                                      
  0000:3098  8ed0             mov ss, ax                               
  0000:309a  368e060600       mov es, word ptr ss:[6]                  
  0000:309f  368c1e0600       mov word ptr ss:[6], ds                  
  0000:30a4  8c160400         mov word ptr [4], ss                     
  0000:30a8  8ed3             mov ss, bx                               
  0000:30aa  9d               popf                                     
  0000:30ab  268c1e0400       mov word ptr es:[4], ds                  
  0000:30b0  8c060600         mov word ptr [6], es                     
  0000:30b4  c3               ret                                      
  0000:30b5  2e8c1e872f       mov word ptr cs:[0x2f87], ds             
  0000:30ba  8c1e0400         mov word ptr [4], ds                     
  0000:30be  8c1e0600         mov word ptr [6], ds                     
  0000:30c2  c3               ret                                      

proc_0000_30c3:
  0000:30c3  55               push bp                                  
  0000:30c4  8bec             mov bp, sp                               
  0000:30c6  56               push si                                  
  0000:30c7  57               push di                                  
  0000:30c8  2e8c1e892f       mov word ptr cs:[0x2f89], ds             
  0000:30cd  8b5608           mov dx, word ptr [bp + 8]                
  0000:30d0  0bd2             or dx, dx                                
  0000:30d2  740f             je 0x30e3                                
  0000:30d4  2e3b16852f       cmp dx, word ptr cs:[0x2f85]             
  0000:30d9  7505             jne 0x30e0                               
  0000:30db  e8b1fe           call 0x2f8f                              -> 0000:2f8f
  0000:30de  eb03             jmp 0x30e3                               
  0000:30e0  e80fff           call 0x2ff2                              -> 0000:2ff2
  0000:30e3  2e8e1e892f       mov ds, word ptr cs:[0x2f89]             
  0000:30e8  5f               pop di                                   
  0000:30e9  5e               pop si                                   
  0000:30ea  5d               pop bp                                   
  0000:30eb  cb               retf                                     
  0000:30ec  50               push ax                                  
  0000:30ed  2e8e1e892f       mov ds, word ptr cs:[0x2f89]             
  0000:30f2  33c0             xor ax, ax                               
  0000:30f4  50               push ax                                  
  0000:30f5  50               push ax                                  
  0000:30f6  e87103           call 0x346a                              -> 0000:346a
  0000:30f9  83c404           add sp, 4                                
  0000:30fc  250f00           and ax, 0xf                              
  0000:30ff  7414             je 0x3115                                
  0000:3101  ba1000           mov dx, 0x10                             
  0000:3104  2bd0             sub dx, ax                               
  0000:3106  33c0             xor ax, ax                               
  0000:3108  2e8e1e892f       mov ds, word ptr cs:[0x2f89]             
  0000:310d  50               push ax                                  
  0000:310e  52               push dx                                  
  0000:310f  e85803           call 0x346a                              -> 0000:346a
  0000:3112  83c404           add sp, 4                                
  0000:3115  58               pop ax                                   
  0000:3116  50               push ax                                  
  0000:3117  33db             xor bx, bx                               
  0000:3119  8adc             mov bl, ah                               
  0000:311b  b104             mov cl, 4                                
  0000:311d  d3eb             shr bx, cl                               
  0000:311f  d3e0             shl ax, cl                               
  0000:3121  2e8e1e892f       mov ds, word ptr cs:[0x2f89]             
  0000:3126  53               push bx                                  
  0000:3127  50               push ax                                  
  0000:3128  e83f03           call 0x346a                              -> 0000:346a
  0000:312b  83c404           add sp, 4                                
  0000:312e  5b               pop bx                                   
  0000:312f  3dffff           cmp ax, 0xffff                           
  0000:3132  7418             je 0x314c                                
  0000:3134  2e8916832f       mov word ptr cs:[0x2f83], dx             
  0000:3139  2e8916852f       mov word ptr cs:[0x2f85], dx             
  0000:313e  8eda             mov ds, dx                               
  0000:3140  891e0000         mov word ptr [0], bx                     
  0000:3144  89160200         mov word ptr [2], dx                     
  0000:3148  b80400           mov ax, 4                                
  0000:314b  c3               ret                                      
  0000:314c  33c0             xor ax, ax                               
  0000:314e  99               cdq                                      
  0000:314f  c3               ret                                      
  0000:3150  50               push ax                                  
  0000:3151  33db             xor bx, bx                               
  0000:3153  8adc             mov bl, ah                               
  0000:3155  b104             mov cl, 4                                
  0000:3157  d3eb             shr bx, cl                               
  0000:3159  d3e0             shl ax, cl                               
  0000:315b  2e8e1e892f       mov ds, word ptr cs:[0x2f89]             
  0000:3160  53               push bx                                  
  0000:3161  50               push ax                                  
  0000:3162  e80503           call 0x346a                              -> 0000:346a
  0000:3165  83c404           add sp, 4                                
  0000:3168  5b               pop bx                                   
  0000:3169  3dffff           cmp ax, 0xffff                           
  0000:316c  7438             je 0x31a6                                
  0000:316e  250f00           and ax, 0xf                              
  0000:3171  7518             jne 0x318b                               
  0000:3173  2e8b0e852f       mov cx, word ptr cs:[0x2f85]             
  0000:3178  2e8916852f       mov word ptr cs:[0x2f85], dx             
  0000:317d  8eda             mov ds, dx                               
  0000:317f  891e0000         mov word ptr [0], bx                     
  0000:3183  890e0200         mov word ptr [2], cx                     
  0000:3187  b80400           mov ax, 4                                
  0000:318a  c3               ret                                      
  0000:318b  53               push bx                                  
  0000:318c  52               push dx                                  
  0000:318d  f7d8             neg ax                                   
  0000:318f  051000           add ax, 0x10                             
  0000:3192  33db             xor bx, bx                               
  0000:3194  53               push bx                                  
  0000:3195  50               push ax                                  
  0000:3196  e8d102           call 0x346a                              -> 0000:346a
  0000:3199  83c404           add sp, 4                                
  0000:319c  5a               pop dx                                   
  0000:319d  5b               pop bx                                   
  0000:319e  3dffff           cmp ax, 0xffff                           
  0000:31a1  7403             je 0x31a6                                
  0000:31a3  42               inc dx                                   
  0000:31a4  ebcd             jmp 0x3173                               
  0000:31a6  33c0             xor ax, ax                               
  0000:31a8  99               cdq                                      
  0000:31a9  c3               ret                                      
  0000:31aa  8bda             mov bx, dx                               
  0000:31ac  29060000         sub word ptr [0], ax                     
  0000:31b0  03160000         add dx, word ptr [0]                     
  0000:31b4  8eda             mov ds, dx                               
  0000:31b6  a30000           mov word ptr [0], ax                     
  0000:31b9  891e0200         mov word ptr [2], bx                     
  0000:31bd  8bda             mov bx, dx                               
  0000:31bf  031e0000         add bx, word ptr [0]                     
  0000:31c3  8edb             mov ds, bx                               
  0000:31c5  89160200         mov word ptr [2], dx                     
  0000:31c9  b80400           mov ax, 4                                
  0000:31cc  c3               ret                                      

proc_0000_31cd:
  0000:31cd  55               push bp                                  
  0000:31ce  8bec             mov bp, sp                               
  0000:31d0  33d2             xor dx, dx                               
  0000:31d2  8b4606           mov ax, word ptr [bp + 6]                
  0000:31d5  eb09             jmp 0x31e0                               

proc_0000_31d7:
  0000:31d7  55               push bp                                  
  0000:31d8  8bec             mov bp, sp                               
  0000:31da  8b5608           mov dx, word ptr [bp + 8]                
  0000:31dd  8b4606           mov ax, word ptr [bp + 6]                
  0000:31e0  8bc8             mov cx, ax                               
  0000:31e2  0bca             or cx, dx                                
  0000:31e4  56               push si                                  
  0000:31e5  57               push di                                  
  0000:31e6  2e8c1e892f       mov word ptr cs:[0x2f89], ds             
  0000:31eb  745e             je 0x324b                                
  0000:31ed  051300           add ax, 0x13                             
  0000:31f0  83d200           adc dx, 0                                
  0000:31f3  7241             jb 0x3236                                
  0000:31f5  f7c2f0ff         test dx, 0xfff0                          
  0000:31f9  753b             jne 0x3236                               
  0000:31fb  b104             mov cl, 4                                
  0000:31fd  d3e8             shr ax, cl                               
  0000:31ff  d3e2             shl dx, cl                               
  0000:3201  0ae2             or ah, dl                                
  0000:3203  2e8b16832f       mov dx, word ptr cs:[0x2f83]             
  0000:3208  0bd2             or dx, dx                                
  0000:320a  7420             je 0x322c                                
  0000:320c  2e8b16872f       mov dx, word ptr cs:[0x2f87]             
  0000:3211  0bd2             or dx, dx                                
  0000:3213  7412             je 0x3227                                
  0000:3215  8bda             mov bx, dx                               
  0000:3217  8eda             mov ds, dx                               
  0000:3219  39060000         cmp word ptr [0], ax                     
  0000:321d  731c             jae 0x323b                               
  0000:321f  8b160600         mov dx, word ptr [6]                     
  0000:3223  3bd3             cmp dx, bx                               
  0000:3225  75f0             jne 0x3217                               
  0000:3227  e826ff           call 0x3150                              -> 0000:3150
  0000:322a  eb1f             jmp 0x324b                               
  0000:322c  e8bdfe           call 0x30ec                              -> 0000:30ec
  0000:322f  eb1a             jmp 0x324b                               
  0000:3231  e876ff           call 0x31aa                              -> 0000:31aa
  0000:3234  eb15             jmp 0x324b                               
  0000:3236  33c0             xor ax, ax                               
  0000:3238  99               cdq                                      
  0000:3239  eb10             jmp 0x324b                               
  0000:323b  77f4             ja 0x3231                                
  0000:323d  e823fe           call 0x3063                              -> 0000:3063
  0000:3240  8b1e0800         mov bx, word ptr [8]                     
  0000:3244  891e0200         mov word ptr [2], bx                     
  0000:3248  b80400           mov ax, 4                                
  0000:324b  2e8e1e892f       mov ds, word ptr cs:[0x2f89]             
  0000:3250  5f               pop di                                   
  0000:3251  5e               pop si                                   
  0000:3252  5d               pop bp                                   
  0000:3253  cb               retf                                     
  0000:3254  53               push bx                                  
  0000:3255  2e8b368b2f       mov si, word ptr cs:[0x2f8b]             
  0000:325a  56               push si                                  
  0000:325b  2e8b368d2f       mov si, word ptr cs:[0x2f8d]             
  0000:3260  56               push si                                  
  0000:3261  0e               push cs                                  
  0000:3262  e872ff           call 0x31d7                              -> 0000:31d7
  0000:3265  83c404           add sp, 4                                
  0000:3268  0bd2             or dx, dx                                
  0000:326a  7502             jne 0x326e                               
  0000:326c  5b               pop bx                                   
  0000:326d  c3               ret                                      
  0000:326e  1f               pop ds                                   
  0000:326f  8ec2             mov es, dx                               
  0000:3271  06               push es                                  
  0000:3272  1e               push ds                                  
  0000:3273  53               push bx                                  
  0000:3274  8b160000         mov dx, word ptr [0]                     
  0000:3278  fc               cld                                      
  0000:3279  4a               dec dx                                   
  0000:327a  bf0400           mov di, 4                                
  0000:327d  8bf7             mov si, di                               
  0000:327f  b90600           mov cx, 6                                
  0000:3282  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0000:3284  0bd2             or dx, dx                                
  0000:3286  7437             je 0x32bf                                
  0000:3288  8cc0             mov ax, es                               
  0000:328a  40               inc ax                                   
  0000:328b  8ec0             mov es, ax                               
  0000:328d  8cd8             mov ax, ds                               
  0000:328f  40               inc ax                                   
  0000:3290  8ed8             mov ds, ax                               
  0000:3292  33ff             xor di, di                               
  0000:3294  8bf7             mov si, di                               
  0000:3296  8bca             mov cx, dx                               
  0000:3298  81f90010         cmp cx, 0x1000                           
  0000:329c  7603             jbe 0x32a1                               
  0000:329e  b90010           mov cx, 0x1000                           
  0000:32a1  d1e1             shl cx, 1                                
  0000:32a3  d1e1             shl cx, 1                                
  0000:32a5  d1e1             shl cx, 1                                
  0000:32a7  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0000:32a9  81ea0010         sub dx, 0x1000                           
  0000:32ad  7610             jbe 0x32bf                               
  0000:32af  8cc0             mov ax, es                               
  0000:32b1  050010           add ax, 0x1000                           
  0000:32b4  8ec0             mov es, ax                               
  0000:32b6  8cd8             mov ax, ds                               
  0000:32b8  050010           add ax, 0x1000                           
  0000:32bb  8ed8             mov ds, ax                               
  0000:32bd  ebd3             jmp 0x3292                               
  0000:32bf  2e8e1e892f       mov ds, word ptr cs:[0x2f89]             
  0000:32c4  0e               push cs                                  
  0000:32c5  e8fbfd           call 0x30c3                              -> 0000:30c3
  0000:32c8  83c404           add sp, 4                                
  0000:32cb  5a               pop dx                                   
  0000:32cc  b80400           mov ax, 4                                
  0000:32cf  c3               ret                                      
  0000:32d0  2e3b1e852f       cmp bx, word ptr cs:[0x2f85]             
  0000:32d5  7445             je 0x331c                                
  0000:32d7  8bfb             mov di, bx                               
  0000:32d9  03f8             add di, ax                               
  0000:32db  8ec7             mov es, di                               
  0000:32dd  8bf1             mov si, cx                               
  0000:32df  2bf0             sub si, ax                               
  0000:32e1  2689360000       mov word ptr es:[0], si                  
  0000:32e6  26891e0200       mov word ptr es:[2], bx                  
  0000:32eb  06               push es                                  
  0000:32ec  50               push ax                                  
  0000:32ed  8ec3             mov es, bx                               
  0000:32ef  26a30000         mov word ptr es:[0], ax                  
  0000:32f3  8bd3             mov dx, bx                               
  0000:32f5  03d1             add dx, cx                               
  0000:32f7  8ec2             mov es, dx                               
  0000:32f9  26833e020000     cmp word ptr es:[2], 0                   
  0000:32ff  7407             je 0x3308                                
  0000:3301  26893e0200       mov word ptr es:[2], di                  
  0000:3306  eb05             jmp 0x330d                               
  0000:3308  26893e0800       mov word ptr es:[8], di                  
  0000:330d  8bf3             mov si, bx                               
  0000:330f  0e               push cs                                  
  0000:3310  e8b0fd           call 0x30c3                              -> 0000:30c3
  0000:3313  83c404           add sp, 4                                
  0000:3316  8bd6             mov dx, si                               
  0000:3318  b80400           mov ax, 4                                
  0000:331b  c3               ret                                      
  0000:331c  53               push bx                                  
  0000:331d  8ec3             mov es, bx                               
  0000:331f  26a30000         mov word ptr es:[0], ax                  
  0000:3323  03d8             add bx, ax                               
  0000:3325  53               push bx                                  
  0000:3326  33c0             xor ax, ax                               
  0000:3328  50               push ax                                  
  0000:3329  e8ff00           call 0x342b                              -> 0000:342b
  0000:332c  83c404           add sp, 4                                
  0000:332f  5a               pop dx                                   
  0000:3330  b80400           mov ax, 4                                
  0000:3333  c3               ret                                      

proc_0000_3334:
  0000:3334  55               push bp                                  
  0000:3335  8bec             mov bp, sp                               
  0000:3337  33d2             xor dx, dx                               
  0000:3339  eb06             jmp 0x3341                               

proc_0000_333b:
  0000:333b  55               push bp                                  
  0000:333c  8bec             mov bp, sp                               
  0000:333e  8b560c           mov dx, word ptr [bp + 0xc]              
  0000:3341  8b460a           mov ax, word ptr [bp + 0xa]              
  0000:3344  8b5e08           mov bx, word ptr [bp + 8]                
  0000:3347  56               push si                                  
  0000:3348  57               push di                                  
  0000:3349  2e8c1e892f       mov word ptr cs:[0x2f89], ds             
  0000:334e  2e89168b2f       mov word ptr cs:[0x2f8b], dx             
  0000:3353  2ea38d2f         mov word ptr cs:[0x2f8d], ax             
  0000:3357  0bdb             or bx, bx                                
  0000:3359  743a             je 0x3395                                
  0000:335b  8bc8             mov cx, ax                               
  0000:335d  0bca             or cx, dx                                
  0000:335f  743f             je 0x33a0                                
  0000:3361  051300           add ax, 0x13                             
  0000:3364  83d200           adc dx, 0                                
  0000:3367  7240             jb 0x33a9                                
  0000:3369  f7c2f0ff         test dx, 0xfff0                          
  0000:336d  753a             jne 0x33a9                               
  0000:336f  b104             mov cl, 4                                
  0000:3371  d3e8             shr ax, cl                               
  0000:3373  d3e2             shl dx, cl                               
  0000:3375  0ae2             or ah, dl                                
  0000:3377  8ec3             mov es, bx                               
  0000:3379  268b0e0000       mov cx, word ptr es:[0]                  
  0000:337e  3bc8             cmp cx, ax                               
  0000:3380  720e             jb 0x3390                                
  0000:3382  7707             ja 0x338b                                
  0000:3384  8bd3             mov dx, bx                               
  0000:3386  b80400           mov ax, 4                                
  0000:3389  eb21             jmp 0x33ac                               
  0000:338b  e842ff           call 0x32d0                              -> 0000:32d0
  0000:338e  eb1c             jmp 0x33ac                               
  0000:3390  e8c1fe           call 0x3254                              -> 0000:3254
  0000:3393  eb17             jmp 0x33ac                               
  0000:3395  52               push dx                                  
  0000:3396  50               push ax                                  
  0000:3397  0e               push cs                                  
  0000:3398  e83cfe           call 0x31d7                              -> 0000:31d7
  0000:339b  83c404           add sp, 4                                
  0000:339e  eb0c             jmp 0x33ac                               
  0000:33a0  53               push bx                                  
  0000:33a1  50               push ax                                  
  0000:33a2  0e               push cs                                  
  0000:33a3  e81dfd           call 0x30c3                              -> 0000:30c3
  0000:33a6  83c404           add sp, 4                                
  0000:33a9  33c0             xor ax, ax                               
  0000:33ab  99               cdq                                      
  0000:33ac  2e8e1e892f       mov ds, word ptr cs:[0x2f89]             
  0000:33b1  5f               pop di                                   
  0000:33b2  5e               pop si                                   
  0000:33b3  5d               pop bp                                   
  0000:33b4  cb               retf                                     

proc_0000_33b5:
  0000:33b5  55               push bp                                  
  0000:33b6  8bec             mov bp, sp                               
  0000:33b8  56               push si                                  
  0000:33b9  8b7606           mov si, word ptr [bp + 6]                
  0000:33bc  46               inc si                                   
  0000:33bd  2b367b00         sub si, word ptr [0x7b]                  
  0000:33c1  83c63f           add si, 0x3f                             
  0000:33c4  b106             mov cl, 6                                
  0000:33c6  d3ee             shr si, cl                               
  0000:33c8  3b36cc12         cmp si, word ptr [0x12cc]                
  0000:33cc  7512             jne 0x33e0                               
  0000:33ce  8b4606           mov ax, word ptr [bp + 6]                
  0000:33d1  8b5604           mov dx, word ptr [bp + 4]                
  0000:33d4  a38d00           mov word ptr [0x8d], ax                  
  0000:33d7  89168b00         mov word ptr [0x8b], dx                  
  0000:33db  b80100           mov ax, 1                                
  0000:33de  eb46             jmp 0x3426                               
  0000:33e0  b106             mov cl, 6                                
  0000:33e2  d3e6             shl si, cl                               
  0000:33e4  8b169100         mov dx, word ptr [0x91]                  
  0000:33e8  8bc6             mov ax, si                               
  0000:33ea  03067b00         add ax, word ptr [0x7b]                  
  0000:33ee  3bc2             cmp ax, dx                               
  0000:33f0  7606             jbe 0x33f8                               
  0000:33f2  8bf2             mov si, dx                               
  0000:33f4  2b367b00         sub si, word ptr [0x7b]                  
  0000:33f8  56               push si                                  
  0000:33f9  ff367b00         push word ptr [0x7b]                     
  0000:33fd  90               nop                                      
  0000:33fe  0e               push cs                                  
  0000:33ff  e81d08           call 0x3c1f                              -> 0000:3c1f
  0000:3402  59               pop cx                                   
  0000:3403  59               pop cx                                   
  0000:3404  8bd0             mov dx, ax                               
  0000:3406  83faff           cmp dx, -1                               
  0000:3409  750b             jne 0x3416                               
  0000:340b  8bc6             mov ax, si                               
  0000:340d  b106             mov cl, 6                                
  0000:340f  d3e8             shr ax, cl                               
  0000:3411  a3cc12           mov word ptr [0x12cc], ax                
  0000:3414  ebb8             jmp 0x33ce                               
  0000:3416  a17b00           mov ax, word ptr [0x7b]                  
  0000:3419  03c2             add ax, dx                               
  0000:341b  a39100           mov word ptr [0x91], ax                  
  0000:341e  c7068f000000     mov word ptr [0x8f], 0                   
  0000:3424  33c0             xor ax, ax                               
  0000:3426  5e               pop si                                   
  0000:3427  5d               pop bp                                   
  0000:3428  c20400           ret 4                                    

proc_0000_342b:
  0000:342b  55               push bp                                  
  0000:342c  8bec             mov bp, sp                               
  0000:342e  8b0e8900         mov cx, word ptr [0x89]                  
  0000:3432  8b1e8700         mov bx, word ptr [0x87]                  
  0000:3436  8b5606           mov dx, word ptr [bp + 6]                
  0000:3439  8b4604           mov ax, word ptr [bp + 4]                
  0000:343c  e807ea           call 0x1e46                              -> 0000:1e46
  0000:343f  7220             jb 0x3461                                
  0000:3441  8b0e9100         mov cx, word ptr [0x91]                  
  0000:3445  8b1e8f00         mov bx, word ptr [0x8f]                  
  0000:3449  8b5606           mov dx, word ptr [bp + 6]                
  0000:344c  8b4604           mov ax, word ptr [bp + 4]                
  0000:344f  e8f4e9           call 0x1e46                              -> 0000:1e46
  0000:3452  770d             ja 0x3461                                
  0000:3454  ff7606           push word ptr [bp + 6]                   
  0000:3457  ff7604           push word ptr [bp + 4]                   
  0000:345a  e858ff           call 0x33b5                              -> 0000:33b5
  0000:345d  0bc0             or ax, ax                                
  0000:345f  7505             jne 0x3466                               
  0000:3461  b8ffff           mov ax, 0xffff                           
  0000:3464  eb02             jmp 0x3468                               
  0000:3466  33c0             xor ax, ax                               
  0000:3468  5d               pop bp                                   
  0000:3469  c3               ret                                      

proc_0000_346a:
  0000:346a  55               push bp                                  
  0000:346b  8bec             mov bp, sp                               
  0000:346d  83ec08           sub sp, 8                                
  0000:3470  a18d00           mov ax, word ptr [0x8d]                  
  0000:3473  33d2             xor dx, dx                               
  0000:3475  b104             mov cl, 4                                
  0000:3477  e80de8           call 0x1c87                              -> 0000:1c87
  0000:347a  03068b00         add ax, word ptr [0x8b]                  
  0000:347e  83d200           adc dx, 0                                
  0000:3481  034604           add ax, word ptr [bp + 4]                
  0000:3484  135606           adc dx, word ptr [bp + 6]                
  0000:3487  83fa0f           cmp dx, 0xf                              
  0000:348a  7c0f             jl 0x349b                                
  0000:348c  7f05             jg 0x3493                                
  0000:348e  3dffff           cmp ax, 0xffff                           
  0000:3491  7608             jbe 0x349b                               
  0000:3493  baffff           mov dx, 0xffff                           
  0000:3496  b8ffff           mov ax, 0xffff                           
  0000:3499  eb56             jmp 0x34f1                               
  0000:349b  8b168d00         mov dx, word ptr [0x8d]                  
  0000:349f  a18b00           mov ax, word ptr [0x8b]                  
  0000:34a2  8b4e06           mov cx, word ptr [bp + 6]                
  0000:34a5  8b5e04           mov bx, word ptr [bp + 4]                
  0000:34a8  e8fde7           call 0x1ca8                              -> 0000:1ca8
  0000:34ab  8956fe           mov word ptr [bp - 2], dx                
  0000:34ae  8946fc           mov word ptr [bp - 4], ax                
  0000:34b1  8b0e8900         mov cx, word ptr [0x89]                  
  0000:34b5  8b1e8700         mov bx, word ptr [0x87]                  
  0000:34b9  e88ae9           call 0x1e46                              -> 0000:1e46
  0000:34bc  72d5             jb 0x3493                                
  0000:34be  8b0e9100         mov cx, word ptr [0x91]                  
  0000:34c2  8b1e8f00         mov bx, word ptr [0x8f]                  
  0000:34c6  8b56fe           mov dx, word ptr [bp - 2]                
  0000:34c9  8b46fc           mov ax, word ptr [bp - 4]                
  0000:34cc  e877e9           call 0x1e46                              -> 0000:1e46
  0000:34cf  77c2             ja 0x3493                                
  0000:34d1  a18d00           mov ax, word ptr [0x8d]                  
  0000:34d4  8b168b00         mov dx, word ptr [0x8b]                  
  0000:34d8  8946fa           mov word ptr [bp - 6], ax                
  0000:34db  8956f8           mov word ptr [bp - 8], dx                
  0000:34de  ff76fe           push word ptr [bp - 2]                   
  0000:34e1  ff76fc           push word ptr [bp - 4]                   
  0000:34e4  e8cefe           call 0x33b5                              -> 0000:33b5
  0000:34e7  0bc0             or ax, ax                                
  0000:34e9  74a8             je 0x3493                                
  0000:34eb  8b56fa           mov dx, word ptr [bp - 6]                
  0000:34ee  8b46f8           mov ax, word ptr [bp - 8]                
  0000:34f1  8be5             mov sp, bp                               
  0000:34f3  5d               pop bp                                   
  0000:34f4  c3               ret                                      
  0000:34f5  803ece1200       cmp byte ptr [0x12ce], 0                 
  0000:34fa  740a             je 0x3506                                
  0000:34fc  c606ce1200       mov byte ptr [0x12ce], 0                 
  0000:3501  a0cf12           mov al, byte ptr [0x12cf]                
  0000:3504  eb05             jmp 0x350b                               
  0000:3506  b80007           mov ax, 0x700                            
  0000:3509  cd21             int 0x21                                 
  0000:350b  b400             mov ah, 0                                
  0000:350d  cb               retf                                     
  0000:350e  58               pop ax                                   
  0000:350f  0e               push cs                                  
  0000:3510  50               push ax                                  
  0000:3511  56               push si                                  
  0000:3512  803ece1200       cmp byte ptr [0x12ce], 0                 
  0000:3517  7408             je 0x3521                                
  0000:3519  0e               push cs                                  
  0000:351a  e8d8ff           call 0x34f5                              -> 0000:34f5
  0000:351d  8bf0             mov si, ax                               
  0000:351f  eb0d             jmp 0x352e                               
  0000:3521  0e               push cs                                  
  0000:3522  e8d0ff           call 0x34f5                              -> 0000:34f5
  0000:3525  8bf0             mov si, ax                               
  0000:3527  50               push ax                                  
  0000:3528  90               nop                                      
  0000:3529  0e               push cs                                  
  0000:352a  e84b02           call 0x3778                              -> 0000:3778
  0000:352d  59               pop cx                                   
  0000:352e  8bc6             mov ax, si                               
  0000:3530  5e               pop si                                   
  0000:3531  cb               retf                                     
  0000:3532  58               pop ax                                   
  0000:3533  0e               push cs                                  
  0000:3534  50               push ax                                  

proc_0000_3535:
  0000:3535  55               push bp                                  
  0000:3536  8bec             mov bp, sp                               
  0000:3538  803ece1200       cmp byte ptr [0x12ce], 0                 
  0000:353d  7405             je 0x3544                                
  0000:353f  b8ffff           mov ax, 0xffff                           
  0000:3542  eb0d             jmp 0x3551                               
  0000:3544  c606ce1201       mov byte ptr [0x12ce], 1                 
  0000:3549  8a4606           mov al, byte ptr [bp + 6]                
  0000:354c  a2cf12           mov byte ptr [0x12cf], al                
  0000:354f  b400             mov ah, 0                                
  0000:3551  5d               pop bp                                   
  0000:3552  cb               retf                                     

proc_0000_3553:
  0000:3553  55               push bp                                  
  0000:3554  8bec             mov bp, sp                               
  0000:3556  83ec02           sub sp, 2                                
  0000:3559  56               push si                                  
  0000:355a  57               push di                                  
  0000:355b  8b7e06           mov di, word ptr [bp + 6]                
  0000:355e  8b7608           mov si, word ptr [bp + 8]                
  0000:3561  57               push di                                  
  0000:3562  56               push si                                  
  0000:3563  ff760a           push word ptr [bp + 0xa]                 
  0000:3566  ff760c           push word ptr [bp + 0xc]                 
  0000:3569  e8a503           call 0x3911                              -> 0000:3911
  0000:356c  0bc0             or ax, ax                                
  0000:356e  7504             jne 0x3574                               
  0000:3570  33c0             xor ax, ax                               
  0000:3572  eb2f             jmp 0x35a3                               
  0000:3574  8b460a           mov ax, word ptr [bp + 0xa]              
  0000:3577  2bc7             sub ax, di                               
  0000:3579  40               inc ax                                   
  0000:357a  8946fe           mov word ptr [bp - 2], ax                
  0000:357d  eb1c             jmp 0x359b                               
  0000:357f  ff7610           push word ptr [bp + 0x10]                
  0000:3582  ff760e           push word ptr [bp + 0xe]                 
  0000:3585  57               push di                                  
  0000:3586  56               push si                                  
  0000:3587  e8abf5           call 0x2b35                              -> 0000:2b35
  0000:358a  52               push dx                                  
  0000:358b  50               push ax                                  
  0000:358c  ff76fe           push word ptr [bp - 2]                   
  0000:358f  e84303           call 0x38d5                              -> 0000:38d5
  0000:3592  8b46fe           mov ax, word ptr [bp - 2]                
  0000:3595  d1e0             shl ax, 1                                
  0000:3597  01460e           add word ptr [bp + 0xe], ax              
  0000:359a  46               inc si                                   
  0000:359b  3b760c           cmp si, word ptr [bp + 0xc]              
  0000:359e  7edf             jle 0x357f                               
  0000:35a0  b80100           mov ax, 1                                
  0000:35a3  5f               pop di                                   
  0000:35a4  5e               pop si                                   
  0000:35a5  8be5             mov sp, bp                               
  0000:35a7  5d               pop bp                                   
  0000:35a8  cb               retf                                     

proc_0000_35a9:
  0000:35a9  55               push bp                                  
  0000:35aa  8bec             mov bp, sp                               
  0000:35ac  83ec02           sub sp, 2                                
  0000:35af  56               push si                                  
  0000:35b0  57               push di                                  
  0000:35b1  8b7e06           mov di, word ptr [bp + 6]                
  0000:35b4  8b7608           mov si, word ptr [bp + 8]                
  0000:35b7  57               push di                                  
  0000:35b8  56               push si                                  
  0000:35b9  ff760a           push word ptr [bp + 0xa]                 
  0000:35bc  ff760c           push word ptr [bp + 0xc]                 
  0000:35bf  e84f03           call 0x3911                              -> 0000:3911
  0000:35c2  0bc0             or ax, ax                                
  0000:35c4  7504             jne 0x35ca                               
  0000:35c6  33c0             xor ax, ax                               
  0000:35c8  eb2f             jmp 0x35f9                               
  0000:35ca  8b460a           mov ax, word ptr [bp + 0xa]              
  0000:35cd  2bc7             sub ax, di                               
  0000:35cf  40               inc ax                                   
  0000:35d0  8946fe           mov word ptr [bp - 2], ax                
  0000:35d3  eb1c             jmp 0x35f1                               
  0000:35d5  57               push di                                  
  0000:35d6  56               push si                                  
  0000:35d7  e85bf5           call 0x2b35                              -> 0000:2b35
  0000:35da  52               push dx                                  
  0000:35db  50               push ax                                  
  0000:35dc  ff7610           push word ptr [bp + 0x10]                
  0000:35df  ff760e           push word ptr [bp + 0xe]                 
  0000:35e2  ff76fe           push word ptr [bp - 2]                   
  0000:35e5  e8ed02           call 0x38d5                              -> 0000:38d5
  0000:35e8  8b46fe           mov ax, word ptr [bp - 2]                
  0000:35eb  d1e0             shl ax, 1                                
  0000:35ed  01460e           add word ptr [bp + 0xe], ax              
  0000:35f0  46               inc si                                   
  0000:35f1  3b760c           cmp si, word ptr [bp + 0xc]              
  0000:35f4  7edf             jle 0x35d5                               
  0000:35f6  b80100           mov ax, 1                                
  0000:35f9  5f               pop di                                   
  0000:35fa  5e               pop si                                   
  0000:35fb  8be5             mov sp, bp                               
  0000:35fd  5d               pop bp                                   
  0000:35fe  cb               retf                                     

proc_0000_35ff:
  0000:35ff  55               push bp                                  
  0000:3600  8bec             mov bp, sp                               
  0000:3602  83ec08           sub sp, 8                                
  0000:3605  16               push ss                                  
  0000:3606  8d46f8           lea ax, [bp - 8]                         
  0000:3609  50               push ax                                  
  0000:360a  90               nop                                      
  0000:360b  0e               push cs                                  
  0000:360c  e819ef           call 0x2528                              -> 0000:2528
  0000:360f  59               pop cx                                   
  0000:3610  59               pop cx                                   
  0000:3611  16               push ss                                  
  0000:3612  8d46f8           lea ax, [bp - 8]                         
  0000:3615  50               push ax                                  
  0000:3616  ff760e           push word ptr [bp + 0xe]                 
  0000:3619  ff760c           push word ptr [bp + 0xc]                 
  0000:361c  ff760a           push word ptr [bp + 0xa]                 
  0000:361f  ff7608           push word ptr [bp + 8]                   
  0000:3622  ff7606           push word ptr [bp + 6]                   
  0000:3625  0e               push cs                                  
  0000:3626  e80700           call 0x3630                              -> 0000:3630
  0000:3629  83c40e           add sp, 0xe                              
  0000:362c  8be5             mov sp, bp                               
  0000:362e  5d               pop bp                                   
  0000:362f  cb               retf                                     

proc_0000_3630:
  0000:3630  55               push bp                                  
  0000:3631  8bec             mov bp, sp                               
  0000:3633  83ec0e           sub sp, 0xe                              
  0000:3636  56               push si                                  
  0000:3637  57               push di                                  
  0000:3638  1e               push ds                                  
  0000:3639  8d4ef2           lea cx, [bp - 0xe]                       
  0000:363c  894efc           mov word ptr [bp - 4], cx                
  0000:363f  8c56fe           mov word ptr [bp - 2], ss                
  0000:3642  c646f255         mov byte ptr [bp - 0xe], 0x55            
  0000:3646  c646f3cd         mov byte ptr [bp - 0xd], 0xcd            
  0000:364a  8b4606           mov ax, word ptr [bp + 6]                
  0000:364d  8846f4           mov byte ptr [bp - 0xc], al              
  0000:3650  c746f55dcb       mov word ptr [bp - 0xb], 0xcb5d          
  0000:3655  3c25             cmp al, 0x25                             
  0000:3657  7215             jb 0x366e                                
  0000:3659  3c26             cmp al, 0x26                             
  0000:365b  7711             ja 0x366e                                
  0000:365d  c646f536         mov byte ptr [bp - 0xb], 0x36            
  0000:3661  c746f68f06       mov word ptr [bp - 0xa], 0x68f           
  0000:3666  894ef8           mov word ptr [bp - 8], cx                
  0000:3669  c746fa5dcb       mov word ptr [bp - 6], 0xcb5d            
  0000:366e  c57610           lds si, ptr [bp + 0x10]                  
  0000:3671  ff34             push word ptr [si]                       
  0000:3673  ff7406           push word ptr [si + 6]                   
  0000:3676  c57608           lds si, ptr [bp + 8]                     
  0000:3679  8b04             mov ax, word ptr [si]                    
  0000:367b  8b5c02           mov bx, word ptr [si + 2]                
  0000:367e  8b4c04           mov cx, word ptr [si + 4]                
  0000:3681  8b5406           mov dx, word ptr [si + 6]                
  0000:3684  8b7c0a           mov di, word ptr [si + 0xa]              
  0000:3687  8b7408           mov si, word ptr [si + 8]                
  0000:368a  1f               pop ds                                   
  0000:368b  07               pop es                                   
  0000:368c  ff5efc           lcall [bp - 4]                           
  0000:368f  9c               pushf                                    
  0000:3690  9c               pushf                                    
  0000:3691  56               push si                                  
  0000:3692  1e               push ds                                  
  0000:3693  06               push es                                  
  0000:3694  c57610           lds si, ptr [bp + 0x10]                  
  0000:3697  8f04             pop word ptr [si]                        
  0000:3699  8f4406           pop word ptr [si + 6]                    
  0000:369c  c5760c           lds si, ptr [bp + 0xc]                   
  0000:369f  8f4408           pop word ptr [si + 8]                    
  0000:36a2  8f440e           pop word ptr [si + 0xe]                  
  0000:36a5  8f440c           pop word ptr [si + 0xc]                  
  0000:36a8  83640c01         and word ptr [si + 0xc], 1               
  0000:36ac  897c0a           mov word ptr [si + 0xa], di              
  0000:36af  895406           mov word ptr [si + 6], dx                
  0000:36b2  894c04           mov word ptr [si + 4], cx                
  0000:36b5  895c02           mov word ptr [si + 2], bx                
  0000:36b8  8904             mov word ptr [si], ax                    
  0000:36ba  1f               pop ds                                   
  0000:36bb  7406             je 0x36c3                                
  0000:36bd  50               push ax                                  
  0000:36be  50               push ax                                  
  0000:36bf  e846e6           call 0x1d08                              -> 0000:1d08
  0000:36c2  58               pop ax                                   
  0000:36c3  5f               pop di                                   
  0000:36c4  5e               pop si                                   
  0000:36c5  8be5             mov sp, bp                               
  0000:36c7  5d               pop bp                                   
  0000:36c8  cb               retf                                     
  0000:36c9  803ece1200       cmp byte ptr [0x12ce], 0                 
  0000:36ce  7405             je 0x36d5                                
  0000:36d0  b80100           mov ax, 1                                
  0000:36d3  eb05             jmp 0x36da                               
  0000:36d5  b40b             mov ah, 0xb                              
  0000:36d7  cd21             int 0x21                                 
  0000:36d9  98               cwde                                     
  0000:36da  cb               retf                                     

proc_0000_36db:
  0000:36db  55               push bp                                  
  0000:36dc  8bec             mov bp, sp                               
  0000:36de  83ec04           sub sp, 4                                
  0000:36e1  56               push si                                  
  0000:36e2  57               push di                                  
  0000:36e3  8b7608           mov si, word ptr [bp + 8]                
  0000:36e6  8b7e0c           mov di, word ptr [bp + 0xc]              
  0000:36e9  ff7606           push word ptr [bp + 6]                   
  0000:36ec  56               push si                                  
  0000:36ed  ff760a           push word ptr [bp + 0xa]                 
  0000:36f0  57               push di                                  
  0000:36f1  e81d02           call 0x3911                              -> 0000:3911
  0000:36f4  0bc0             or ax, ax                                
  0000:36f6  7423             je 0x371b                                
  0000:36f8  ff760e           push word ptr [bp + 0xe]                 
  0000:36fb  ff7610           push word ptr [bp + 0x10]                
  0000:36fe  8b460a           mov ax, word ptr [bp + 0xa]              
  0000:3701  2b4606           sub ax, word ptr [bp + 6]                
  0000:3704  8b560e           mov dx, word ptr [bp + 0xe]              
  0000:3707  03d0             add dx, ax                               
  0000:3709  52               push dx                                  
  0000:370a  8bc7             mov ax, di                               
  0000:370c  2bc6             sub ax, si                               
  0000:370e  8b5610           mov dx, word ptr [bp + 0x10]             
  0000:3711  03d0             add dx, ax                               
  0000:3713  52               push dx                                  
  0000:3714  e8fa01           call 0x3911                              -> 0000:3911
  0000:3717  0bc0             or ax, ax                                
  0000:3719  7504             jne 0x371f                               
  0000:371b  33c0             xor ax, ax                               
  0000:371d  eb53             jmp 0x3772                               
  0000:371f  8bd6             mov dx, si                               
  0000:3721  897efe           mov word ptr [bp - 2], di                
  0000:3724  c746fc0100       mov word ptr [bp - 4], 1                 
  0000:3729  3b7610           cmp si, word ptr [bp + 0x10]             
  0000:372c  7d0a             jge 0x3738                               
  0000:372e  8bd7             mov dx, di                               
  0000:3730  8976fe           mov word ptr [bp - 2], si                
  0000:3733  c746fcffff       mov word ptr [bp - 4], 0xffff            
  0000:3738  8bfa             mov di, dx                               
  0000:373a  eb29             jmp 0x3765                               
  0000:373c  ff760e           push word ptr [bp + 0xe]                 
  0000:373f  8bc7             mov ax, di                               
  0000:3741  2bc6             sub ax, si                               
  0000:3743  8b5610           mov dx, word ptr [bp + 0x10]             
  0000:3746  03d0             add dx, ax                               
  0000:3748  52               push dx                                  
  0000:3749  e8e9f3           call 0x2b35                              -> 0000:2b35
  0000:374c  52               push dx                                  
  0000:374d  50               push ax                                  
  0000:374e  ff7606           push word ptr [bp + 6]                   
  0000:3751  57               push di                                  
  0000:3752  e8e0f3           call 0x2b35                              -> 0000:2b35
  0000:3755  52               push dx                                  
  0000:3756  50               push ax                                  
  0000:3757  8b460a           mov ax, word ptr [bp + 0xa]              
  0000:375a  2b4606           sub ax, word ptr [bp + 6]                
  0000:375d  40               inc ax                                   
  0000:375e  50               push ax                                  
  0000:375f  e87301           call 0x38d5                              -> 0000:38d5
  0000:3762  037efc           add di, word ptr [bp - 4]                
  0000:3765  8b46fe           mov ax, word ptr [bp - 2]                
  0000:3768  0346fc           add ax, word ptr [bp - 4]                
  0000:376b  3bc7             cmp ax, di                               
  0000:376d  75cd             jne 0x373c                               
  0000:376f  b80100           mov ax, 1                                
  0000:3772  5f               pop di                                   
  0000:3773  5e               pop si                                   
  0000:3774  8be5             mov sp, bp                               
  0000:3776  5d               pop bp                                   
  0000:3777  cb               retf                                     

proc_0000_3778:
  0000:3778  55               push bp                                  
  0000:3779  8bec             mov bp, sp                               
  0000:377b  16               push ss                                  
  0000:377c  8d4606           lea ax, [bp + 6]                         
  0000:377f  50               push ax                                  
  0000:3780  b80100           mov ax, 1                                
  0000:3783  50               push ax                                  
  0000:3784  33c0             xor ax, ax                               
  0000:3786  33d2             xor dx, dx                               
  0000:3788  50               push ax                                  
  0000:3789  52               push dx                                  
  0000:378a  e847f4           call 0x2bd4                              -> 0000:2bd4
  0000:378d  5d               pop bp                                   
  0000:378e  cb               retf                                     
  0000:378f  ff26e612         jmp word ptr [0x12e6]                    
  0000:3793  ff26ea12         jmp word ptr [0x12ea]                    
  0000:3797  ff26ec12         jmp word ptr [0x12ec]                    
  0000:379b  ff26ee12         jmp word ptr [0x12ee]                    

proc_0000_379f:
  0000:379f  55               push bp                                  
  0000:37a0  8bec             mov bp, sp                               
  0000:37a2  83ec02           sub sp, 2                                
  0000:37a5  8b4604           mov ax, word ptr [bp + 4]                
  0000:37a8  d1e8             shr ax, 1                                
  0000:37aa  8bc8             mov cx, ax                               
  0000:37ac  a08612           mov al, byte ptr [0x1286]                
  0000:37af  b400             mov ah, 0                                
  0000:37b1  50               push ax                                  
  0000:37b2  8bc1             mov ax, cx                               
  0000:37b4  33d2             xor dx, dx                               
  0000:37b6  5b               pop bx                                   
  0000:37b7  f7f3             div bx                                   
  0000:37b9  8ad8             mov bl, al                               
  0000:37bb  b400             mov ah, 0                                
  0000:37bd  8a168612         mov dl, byte ptr [0x1286]                
  0000:37c1  b600             mov dh, 0                                
  0000:37c3  f7ea             imul dx                                  
  0000:37c5  8ad1             mov dl, cl                               
  0000:37c7  2ad0             sub dl, al                               
  0000:37c9  8856ff           mov byte ptr [bp - 1], dl                
  0000:37cc  8ae3             mov ah, bl                               
  0000:37ce  8a46ff           mov al, byte ptr [bp - 1]                
  0000:37d1  8be5             mov sp, bp                               
  0000:37d3  5d               pop bp                                   
  0000:37d4  c20400           ret 4                                    

proc_0000_37d7:
  0000:37d7  55               push bp                                  
  0000:37d8  8bec             mov bp, sp                               
  0000:37da  c45e08           les bx, ptr [bp + 8]                     
  0000:37dd  268b17           mov dx, word ptr es:[bx]                 
  0000:37e0  c45e04           les bx, ptr [bp + 4]                     
  0000:37e3  263b17           cmp dx, word ptr es:[bx]                 
  0000:37e6  740d             je 0x37f5                                
  0000:37e8  b700             mov bh, 0                                
  0000:37ea  b402             mov ah, 2                                
  0000:37ec  e86ef5           call 0x2d5d                              -> 0000:2d5d
  0000:37ef  c45e04           les bx, ptr [bp + 4]                     
  0000:37f2  268917           mov word ptr es:[bx], dx                 
  0000:37f5  fec2             inc dl                                   
  0000:37f7  3a168612         cmp dl, byte ptr [0x1286]                
  0000:37fb  7204             jb 0x3801                                
  0000:37fd  fec6             inc dh                                   
  0000:37ff  b200             mov dl, 0                                
  0000:3801  c45e08           les bx, ptr [bp + 8]                     
  0000:3804  268917           mov word ptr es:[bx], dx                 
  0000:3807  5d               pop bp                                   
  0000:3808  c20800           ret 8                                    

proc_0000_380b:
  0000:380b  55               push bp                                  
  0000:380c  8bec             mov bp, sp                               
  0000:380e  83ec0c           sub sp, 0xc                              
  0000:3811  56               push si                                  
  0000:3812  57               push di                                  
  0000:3813  8b7e04           mov di, word ptr [bp + 4]                
  0000:3816  e82204           call 0x3c3b                              -> 0000:3c3b
  0000:3819  8946f8           mov word ptr [bp - 8], ax                
  0000:381c  8946fa           mov word ptr [bp - 6], ax                
  0000:381f  8b460c           mov ax, word ptr [bp + 0xc]              
  0000:3822  3b068b12         cmp ax, word ptr [0x128b]                
  0000:3826  7505             jne 0x382d                               
  0000:3828  b80100           mov ax, 1                                
  0000:382b  eb02             jmp 0x382f                               
  0000:382d  33c0             xor ax, ax                               
  0000:382f  8946f6           mov word ptr [bp - 0xa], ax              
  0000:3832  0bc0             or ax, ax                                
  0000:3834  740c             je 0x3842                                
  0000:3836  ff760c           push word ptr [bp + 0xc]                 
  0000:3839  ff760a           push word ptr [bp + 0xa]                 
  0000:383c  e860ff           call 0x379f                              -> 0000:379f
  0000:383f  8946fe           mov word ptr [bp - 2], ax                
  0000:3842  8b4608           mov ax, word ptr [bp + 8]                
  0000:3845  3b068b12         cmp ax, word ptr [0x128b]                
  0000:3849  7505             jne 0x3850                               
  0000:384b  b80100           mov ax, 1                                
  0000:384e  eb02             jmp 0x3852                               
  0000:3850  33c0             xor ax, ax                               
  0000:3852  8946f4           mov word ptr [bp - 0xc], ax              
  0000:3855  0bc0             or ax, ax                                
  0000:3857  7463             je 0x38bc                                
  0000:3859  ff7608           push word ptr [bp + 8]                   
  0000:385c  ff7606           push word ptr [bp + 6]                   
  0000:385f  e83dff           call 0x379f                              -> 0000:379f
  0000:3862  8946fc           mov word ptr [bp - 4], ax                
  0000:3865  eb55             jmp 0x38bc                               
  0000:3867  837ef400         cmp word ptr [bp - 0xc], 0               
  0000:386b  7418             je 0x3885                                
  0000:386d  16               push ss                                  
  0000:386e  8d46fc           lea ax, [bp - 4]                         
  0000:3871  50               push ax                                  
  0000:3872  16               push ss                                  
  0000:3873  8d46fa           lea ax, [bp - 6]                         
  0000:3876  50               push ax                                  
  0000:3877  e85dff           call 0x37d7                              -> 0000:37d7
  0000:387a  b700             mov bh, 0                                
  0000:387c  b408             mov ah, 8                                
  0000:387e  e8dcf4           call 0x2d5d                              -> 0000:2d5d
  0000:3881  8bf0             mov si, ax                               
  0000:3883  eb0a             jmp 0x388f                               
  0000:3885  c45e06           les bx, ptr [bp + 6]                     
  0000:3888  268b37           mov si, word ptr es:[bx]                 
  0000:388b  83460602         add word ptr [bp + 6], 2                 
  0000:388f  837ef600         cmp word ptr [bp - 0xa], 0               
  0000:3893  741d             je 0x38b2                                
  0000:3895  16               push ss                                  
  0000:3896  8d46fe           lea ax, [bp - 2]                         
  0000:3899  50               push ax                                  
  0000:389a  16               push ss                                  
  0000:389b  8d46fa           lea ax, [bp - 6]                         
  0000:389e  50               push ax                                  
  0000:389f  e835ff           call 0x37d7                              -> 0000:37d7
  0000:38a2  8bc6             mov ax, si                               
  0000:38a4  8adc             mov bl, ah                               
  0000:38a6  b90100           mov cx, 1                                
  0000:38a9  b700             mov bh, 0                                
  0000:38ab  b409             mov ah, 9                                
  0000:38ad  e8adf4           call 0x2d5d                              -> 0000:2d5d
  0000:38b0  eb0a             jmp 0x38bc                               
  0000:38b2  c45e0a           les bx, ptr [bp + 0xa]                   
  0000:38b5  268937           mov word ptr es:[bx], si                 
  0000:38b8  83460a02         add word ptr [bp + 0xa], 2               
  0000:38bc  8bc7             mov ax, di                               
  0000:38be  4f               dec di                                   
  0000:38bf  0bc0             or ax, ax                                
  0000:38c1  75a4             jne 0x3867                               
  0000:38c3  8b56f8           mov dx, word ptr [bp - 8]                
  0000:38c6  b700             mov bh, 0                                
  0000:38c8  b402             mov ah, 2                                
  0000:38ca  e890f4           call 0x2d5d                              -> 0000:2d5d
  0000:38cd  5f               pop di                                   
  0000:38ce  5e               pop si                                   
  0000:38cf  8be5             mov sp, bp                               
  0000:38d1  5d               pop bp                                   
  0000:38d2  c20a00           ret 0xa                                  

proc_0000_38d5:
  0000:38d5  55               push bp                                  
  0000:38d6  8bec             mov bp, sp                               
  0000:38d8  8b5604           mov dx, word ptr [bp + 4]                
  0000:38db  a08712           mov al, byte ptr [0x1287]                
  0000:38de  b400             mov ah, 0                                
  0000:38e0  0bc0             or ax, ax                                
  0000:38e2  7519             jne 0x38fd                               
  0000:38e4  833e8d1200       cmp word ptr [0x128d], 0                 
  0000:38e9  7412             je 0x38fd                                
  0000:38eb  ff760c           push word ptr [bp + 0xc]                 
  0000:38ee  ff760a           push word ptr [bp + 0xa]                 
  0000:38f1  ff7608           push word ptr [bp + 8]                   
  0000:38f4  ff7606           push word ptr [bp + 6]                   
  0000:38f7  52               push dx                                  
  0000:38f8  e85ff2           call 0x2b5a                              -> 0000:2b5a
  0000:38fb  eb10             jmp 0x390d                               
  0000:38fd  ff760c           push word ptr [bp + 0xc]                 
  0000:3900  ff760a           push word ptr [bp + 0xa]                 
  0000:3903  ff7608           push word ptr [bp + 8]                   
  0000:3906  ff7606           push word ptr [bp + 6]                   
  0000:3909  52               push dx                                  
  0000:390a  e8fefe           call 0x380b                              -> 0000:380b
  0000:390d  5d               pop bp                                   
  0000:390e  c20a00           ret 0xa                                  

proc_0000_3911:
  0000:3911  55               push bp                                  
  0000:3912  8bec             mov bp, sp                               
  0000:3914  56               push si                                  
  0000:3915  57               push di                                  
  0000:3916  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0000:3919  8b7608           mov si, word ptr [bp + 8]                
  0000:391c  8b7e06           mov di, word ptr [bp + 6]                
  0000:391f  a08612           mov al, byte ptr [0x1286]                
  0000:3922  b400             mov ah, 0                                
  0000:3924  8bc8             mov cx, ax                               
  0000:3926  a08512           mov al, byte ptr [0x1285]                
  0000:3929  b400             mov ah, 0                                
  0000:392b  8bd0             mov dx, ax                               
  0000:392d  3bd9             cmp bx, cx                               
  0000:392f  772d             ja 0x395e                                
  0000:3931  3bf9             cmp di, cx                               
  0000:3933  7729             ja 0x395e                                
  0000:3935  3bdf             cmp bx, di                               
  0000:3937  7f25             jg 0x395e                                
  0000:3939  3bf2             cmp si, dx                               
  0000:393b  7721             ja 0x395e                                
  0000:393d  395604           cmp word ptr [bp + 4], dx                
  0000:3940  771c             ja 0x395e                                
  0000:3942  3b7604           cmp si, word ptr [bp + 4]                
  0000:3945  7f17             jg 0x395e                                
  0000:3947  0bdb             or bx, bx                                
  0000:3949  7e13             jle 0x395e                               
  0000:394b  0bff             or di, di                                
  0000:394d  7e0f             jle 0x395e                               
  0000:394f  0bf6             or si, si                                
  0000:3951  7e0b             jle 0x395e                               
  0000:3953  837e0400         cmp word ptr [bp + 4], 0                 
  0000:3957  7e05             jle 0x395e                               
  0000:3959  b80100           mov ax, 1                                
  0000:395c  eb02             jmp 0x3960                               
  0000:395e  33c0             xor ax, ax                               
  0000:3960  5f               pop di                                   
  0000:3961  5e               pop si                                   
  0000:3962  5d               pop bp                                   
  0000:3963  c20800           ret 8                                    

proc_0000_3966:
  0000:3966  55               push bp                                  
  0000:3967  8bec             mov bp, sp                               
  0000:3969  8b5606           mov dx, word ptr [bp + 6]                
  0000:396c  8a2e8212         mov ch, byte ptr [0x1282]                
  0000:3970  b120             mov cl, 0x20                             
  0000:3972  eb0b             jmp 0x397f                               
  0000:3974  c45e08           les bx, ptr [bp + 8]                     
  0000:3977  26890f           mov word ptr es:[bx], cx                 
  0000:397a  83460802         add word ptr [bp + 8], 2                 
  0000:397e  42               inc dx                                   
  0000:397f  3b5604           cmp dx, word ptr [bp + 4]                
  0000:3982  7ef0             jle 0x3974                               
  0000:3984  5d               pop bp                                   
  0000:3985  c20800           ret 8                                    

proc_0000_3988:
  0000:3988  55               push bp                                  
  0000:3989  8bec             mov bp, sp                               
  0000:398b  81eca000         sub sp, 0xa0                             
  0000:398f  a08712           mov al, byte ptr [0x1287]                
  0000:3992  b400             mov ah, 0                                
  0000:3994  0bc0             or ax, ax                                
  0000:3996  7403             je 0x399b                                
  0000:3998  e93a01           jmp 0x3ad5                               
  0000:399b  833e8d1200       cmp word ptr [0x128d], 0                 
  0000:39a0  7503             jne 0x39a5                               
  0000:39a2  e93001           jmp 0x3ad5                               
  0000:39a5  807e0401         cmp byte ptr [bp + 4], 1                 
  0000:39a9  7403             je 0x39ae                                
  0000:39ab  e92701           jmp 0x3ad5                               
  0000:39ae  fe460c           inc byte ptr [bp + 0xc]                  
  0000:39b1  fe460a           inc byte ptr [bp + 0xa]                  
  0000:39b4  fe4608           inc byte ptr [bp + 8]                    
  0000:39b7  fe4606           inc byte ptr [bp + 6]                    
  0000:39ba  807e0e06         cmp byte ptr [bp + 0xe], 6               
  0000:39be  7403             je 0x39c3                                
  0000:39c0  e99100           jmp 0x3a54                               
  0000:39c3  8a460a           mov al, byte ptr [bp + 0xa]              
  0000:39c6  b400             mov ah, 0                                
  0000:39c8  50               push ax                                  
  0000:39c9  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:39cc  b400             mov ah, 0                                
  0000:39ce  50               push ax                                  
  0000:39cf  8a4606           mov al, byte ptr [bp + 6]                
  0000:39d2  b400             mov ah, 0                                
  0000:39d4  50               push ax                                  
  0000:39d5  8a4608           mov al, byte ptr [bp + 8]                
  0000:39d8  b400             mov ah, 0                                
  0000:39da  50               push ax                                  
  0000:39db  8a460a           mov al, byte ptr [bp + 0xa]              
  0000:39de  b400             mov ah, 0                                
  0000:39e0  40               inc ax                                   
  0000:39e1  50               push ax                                  
  0000:39e2  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:39e5  b400             mov ah, 0                                
  0000:39e7  50               push ax                                  
  0000:39e8  90               nop                                      
  0000:39e9  0e               push cs                                  
  0000:39ea  e8eefc           call 0x36db                              -> 0000:36db
  0000:39ed  83c40c           add sp, 0xc                              
  0000:39f0  16               push ss                                  
  0000:39f1  8d8660ff         lea ax, [bp - 0xa0]                      
  0000:39f5  50               push ax                                  
  0000:39f6  8a4606           mov al, byte ptr [bp + 6]                
  0000:39f9  b400             mov ah, 0                                
  0000:39fb  50               push ax                                  
  0000:39fc  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:39ff  b400             mov ah, 0                                
  0000:3a01  50               push ax                                  
  0000:3a02  8a4606           mov al, byte ptr [bp + 6]                
  0000:3a05  b400             mov ah, 0                                
  0000:3a07  50               push ax                                  
  0000:3a08  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:3a0b  b400             mov ah, 0                                
  0000:3a0d  50               push ax                                  
  0000:3a0e  90               nop                                      
  0000:3a0f  0e               push cs                                  
  0000:3a10  e840fb           call 0x3553                              -> 0000:3553
  0000:3a13  83c40c           add sp, 0xc                              
  0000:3a16  16               push ss                                  
  0000:3a17  8d8660ff         lea ax, [bp - 0xa0]                      
  0000:3a1b  50               push ax                                  
  0000:3a1c  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:3a1f  b400             mov ah, 0                                
  0000:3a21  50               push ax                                  
  0000:3a22  8a4608           mov al, byte ptr [bp + 8]                
  0000:3a25  b400             mov ah, 0                                
  0000:3a27  50               push ax                                  
  0000:3a28  e83bff           call 0x3966                              -> 0000:3966
  0000:3a2b  16               push ss                                  
  0000:3a2c  8d8660ff         lea ax, [bp - 0xa0]                      
  0000:3a30  50               push ax                                  
  0000:3a31  8a4606           mov al, byte ptr [bp + 6]                
  0000:3a34  b400             mov ah, 0                                
  0000:3a36  50               push ax                                  
  0000:3a37  8a4608           mov al, byte ptr [bp + 8]                
  0000:3a3a  b400             mov ah, 0                                
  0000:3a3c  50               push ax                                  
  0000:3a3d  8a4606           mov al, byte ptr [bp + 6]                
  0000:3a40  b400             mov ah, 0                                
  0000:3a42  50               push ax                                  
  0000:3a43  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:3a46  b400             mov ah, 0                                
  0000:3a48  50               push ax                                  
  0000:3a49  90               nop                                      
  0000:3a4a  0e               push cs                                  
  0000:3a4b  e85bfb           call 0x35a9                              -> 0000:35a9
  0000:3a4e  83c40c           add sp, 0xc                              
  0000:3a51  e99a00           jmp 0x3aee                               
  0000:3a54  8a460a           mov al, byte ptr [bp + 0xa]              
  0000:3a57  b400             mov ah, 0                                
  0000:3a59  40               inc ax                                   
  0000:3a5a  50               push ax                                  
  0000:3a5b  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:3a5e  b400             mov ah, 0                                
  0000:3a60  50               push ax                                  
  0000:3a61  8a4606           mov al, byte ptr [bp + 6]                
  0000:3a64  b400             mov ah, 0                                
  0000:3a66  48               dec ax                                   
  0000:3a67  50               push ax                                  
  0000:3a68  8a4608           mov al, byte ptr [bp + 8]                
  0000:3a6b  b400             mov ah, 0                                
  0000:3a6d  50               push ax                                  
  0000:3a6e  8a460a           mov al, byte ptr [bp + 0xa]              
  0000:3a71  b400             mov ah, 0                                
  0000:3a73  50               push ax                                  
  0000:3a74  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:3a77  b400             mov ah, 0                                
  0000:3a79  50               push ax                                  
  0000:3a7a  90               nop                                      
  0000:3a7b  0e               push cs                                  
  0000:3a7c  e85cfc           call 0x36db                              -> 0000:36db
  0000:3a7f  83c40c           add sp, 0xc                              
  0000:3a82  16               push ss                                  
  0000:3a83  8d8660ff         lea ax, [bp - 0xa0]                      
  0000:3a87  50               push ax                                  
  0000:3a88  8a460a           mov al, byte ptr [bp + 0xa]              
  0000:3a8b  b400             mov ah, 0                                
  0000:3a8d  50               push ax                                  
  0000:3a8e  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:3a91  b400             mov ah, 0                                
  0000:3a93  50               push ax                                  
  0000:3a94  8a460a           mov al, byte ptr [bp + 0xa]              
  0000:3a97  b400             mov ah, 0                                
  0000:3a99  50               push ax                                  
  0000:3a9a  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:3a9d  b400             mov ah, 0                                
  0000:3a9f  50               push ax                                  
  0000:3aa0  90               nop                                      
  0000:3aa1  0e               push cs                                  
  0000:3aa2  e8aefa           call 0x3553                              -> 0000:3553
  0000:3aa5  83c40c           add sp, 0xc                              
  0000:3aa8  16               push ss                                  
  0000:3aa9  8d8660ff         lea ax, [bp - 0xa0]                      
  0000:3aad  50               push ax                                  
  0000:3aae  8a460c           mov al, byte ptr [bp + 0xc]              
  0000:3ab1  b400             mov ah, 0                                
  0000:3ab3  50               push ax                                  
  0000:3ab4  8a4608           mov al, byte ptr [bp + 8]                
  0000:3ab7  b400             mov ah, 0                                
  0000:3ab9  50               push ax                                  
  0000:3aba  e8a9fe           call 0x3966                              -> 0000:3966
  0000:3abd  16               push ss                                  
  0000:3abe  8d8660ff         lea ax, [bp - 0xa0]                      
  0000:3ac2  50               push ax                                  
  0000:3ac3  8a460a           mov al, byte ptr [bp + 0xa]              
  0000:3ac6  b400             mov ah, 0                                
  0000:3ac8  50               push ax                                  
  0000:3ac9  8a4608           mov al, byte ptr [bp + 8]                
  0000:3acc  b400             mov ah, 0                                
  0000:3ace  50               push ax                                  
  0000:3acf  8a460a           mov al, byte ptr [bp + 0xa]              
  0000:3ad2  e96bff           jmp 0x3a40                               
  0000:3ad5  8a3e8212         mov bh, byte ptr [0x1282]                
  0000:3ad9  8a660e           mov ah, byte ptr [bp + 0xe]              
  0000:3adc  8a4604           mov al, byte ptr [bp + 4]                
  0000:3adf  8a6e0a           mov ch, byte ptr [bp + 0xa]              
  0000:3ae2  8a4e0c           mov cl, byte ptr [bp + 0xc]              
  0000:3ae5  8a7606           mov dh, byte ptr [bp + 6]                
  0000:3ae8  8a5608           mov dl, byte ptr [bp + 8]                
  0000:3aeb  e86ff2           call 0x2d5d                              -> 0000:2d5d
  0000:3aee  8be5             mov sp, bp                               
  0000:3af0  5d               pop bp                                   
  0000:3af1  c20c00           ret 0xc                                  
  0000:3af4  0000             add byte ptr [bx + si], al               
  0000:3af6  8f06d612         pop word ptr [0x12d6]                    
  0000:3afa  8f06d812         pop word ptr [0x12d8]                    
  0000:3afe  8f06da12         pop word ptr [0x12da]                    
  0000:3b02  2e8c1ef43a       mov word ptr cs:[0x3af4], ds             
  0000:3b07  8936dc12         mov word ptr [0x12dc], si                
  0000:3b0b  893ede12         mov word ptr [0x12de], di                
  0000:3b0f  fc               cld                                      
  0000:3b10  8e067b00         mov es, word ptr [0x7b]                  
  0000:3b14  be8000           mov si, 0x80                             
  0000:3b17  32e4             xor ah, ah                               
  0000:3b19  26ac             lodsb al, byte ptr es:[si]               
  0000:3b1b  40               inc ax                                   
  0000:3b1c  8cc5             mov bp, es                               
  0000:3b1e  87d6             xchg si, dx                              
  0000:3b20  93               xchg bx, ax                              
  0000:3b21  8b367500         mov si, word ptr [0x75]                  
  0000:3b25  46               inc si                                   
  0000:3b26  46               inc si                                   
  0000:3b27  b90100           mov cx, 1                                
  0000:3b2a  803e7d0003       cmp byte ptr [0x7d], 3                   
  0000:3b2f  7211             jb 0x3b42                                
  0000:3b31  8e067700         mov es, word ptr [0x77]                  
  0000:3b35  8bfe             mov di, si                               
  0000:3b37  b17f             mov cl, 0x7f                             
  0000:3b39  32c0             xor al, al                               
  0000:3b3b  f2ae             repne scasb al, byte ptr es:[di]         
  0000:3b3d  e372             jcxz 0x3bb1                              
  0000:3b3f  80f17f           xor cl, 0x7f                             
  0000:3b42  50               push ax                                  
  0000:3b43  8bc1             mov ax, cx                               
  0000:3b45  03c3             add ax, bx                               
  0000:3b47  40               inc ax                                   
  0000:3b48  25feff           and ax, 0xfffe                           
  0000:3b4b  8bfc             mov di, sp                               
  0000:3b4d  2bf8             sub di, ax                               
  0000:3b4f  7260             jb 0x3bb1                                
  0000:3b51  8be7             mov sp, di                               
  0000:3b53  06               push es                                  
  0000:3b54  1f               pop ds                                   
  0000:3b55  16               push ss                                  
  0000:3b56  07               pop es                                   
  0000:3b57  51               push cx                                  
  0000:3b58  49               dec cx                                   
  0000:3b59  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0000:3b5b  32c0             xor al, al                               
  0000:3b5d  aa               stosb byte ptr es:[di], al               
  0000:3b5e  8edd             mov ds, bp                               
  0000:3b60  87f2             xchg dx, si                              
  0000:3b62  87d9             xchg cx, bx                              
  0000:3b64  8bc3             mov ax, bx                               
  0000:3b66  8bd0             mov dx, ax                               
  0000:3b68  43               inc bx                                   
  0000:3b69  e81d00           call 0x3b89                              -> 0000:3b89
  0000:3b6c  770b             ja 0x3b79                                
  0000:3b6e  7246             jb 0x3bb6                                
  0000:3b70  3c0d             cmp al, 0xd                              
  0000:3b72  7411             je 0x3b85                                
  0000:3b74  e81200           call 0x3b89                              -> 0000:3b89
  0000:3b77  77f5             ja 0x3b6e                                
  0000:3b79  3c20             cmp al, 0x20                             
  0000:3b7b  7408             je 0x3b85                                
  0000:3b7d  3c0d             cmp al, 0xd                              
  0000:3b7f  7404             je 0x3b85                                
  0000:3b81  3c09             cmp al, 9                                
  0000:3b83  75e4             jne 0x3b69                               
  0000:3b85  32c0             xor al, al                               
  0000:3b87  ebe0             jmp 0x3b69                               
  0000:3b89  0bc0             or ax, ax                                
  0000:3b8b  7407             je 0x3b94                                
  0000:3b8d  42               inc dx                                   
  0000:3b8e  aa               stosb byte ptr es:[di], al               
  0000:3b8f  0ac0             or al, al                                
  0000:3b91  7501             jne 0x3b94                               
  0000:3b93  43               inc bx                                   
  0000:3b94  86e0             xchg al, ah                              
  0000:3b96  32c0             xor al, al                               
  0000:3b98  f9               stc                                      
  0000:3b99  e315             jcxz 0x3bb0                              
  0000:3b9b  ac               lodsb al, byte ptr [si]                  
  0000:3b9c  49               dec cx                                   
  0000:3b9d  2c22             sub al, 0x22                             
  0000:3b9f  740f             je 0x3bb0                                
  0000:3ba1  0422             add al, 0x22                             
  0000:3ba3  3c5c             cmp al, 0x5c                             
  0000:3ba5  7507             jne 0x3bae                               
  0000:3ba7  803c22           cmp byte ptr [si], 0x22                  
  0000:3baa  7502             jne 0x3bae                               
  0000:3bac  ac               lodsb al, byte ptr [si]                  
  0000:3bad  49               dec cx                                   
  0000:3bae  0bf6             or si, si                                
  0000:3bb0  c3               ret                                      
  0000:3bb1  90               nop                                      
  0000:3bb2  90               nop                                      
  0000:3bb3  e9c4c6           jmp 0x27a                                
  0000:3bb6  59               pop cx                                   
  0000:3bb7  03ca             add cx, dx                               
  0000:3bb9  2e8e1ef43a       mov ds, word ptr cs:[0x3af4]             
  0000:3bbe  891ed012         mov word ptr [0x12d0], bx                
  0000:3bc2  43               inc bx                                   
  0000:3bc3  03db             add bx, bx                               
  0000:3bc5  03db             add bx, bx                               
  0000:3bc7  8bf4             mov si, sp                               
  0000:3bc9  8bec             mov bp, sp                               
  0000:3bcb  2beb             sub bp, bx                               
  0000:3bcd  72e2             jb 0x3bb1                                
  0000:3bcf  8be5             mov sp, bp                               
  0000:3bd1  892ed212         mov word ptr [0x12d2], bp                
  0000:3bd5  8c16d412         mov word ptr [0x12d4], ss                
  0000:3bd9  e311             jcxz 0x3bec                              
  0000:3bdb  897600           mov word ptr [bp], si                    
  0000:3bde  8c5602           mov word ptr [bp + 2], ss                
  0000:3be1  83c504           add bp, 4                                
  0000:3be4  36ac             lodsb al, byte ptr ss:[si]               
  0000:3be6  0ac0             or al, al                                
  0000:3be8  e0fa             loopne 0x3be4                            
  0000:3bea  74ed             je 0x3bd9                                
  0000:3bec  33c0             xor ax, ax                               
  0000:3bee  894600           mov word ptr [bp], ax                    
  0000:3bf1  894602           mov word ptr [bp + 2], ax                
  0000:3bf4  2e8e1ef43a       mov ds, word ptr cs:[0x3af4]             
  0000:3bf9  8b36dc12         mov si, word ptr [0x12dc]                
  0000:3bfd  8b3ede12         mov di, word ptr [0x12de]                
  0000:3c01  ff36da12         push word ptr [0x12da]                   
  0000:3c05  ff36d812         push word ptr [0x12d8]                   
  0000:3c09  a1d012           mov ax, word ptr [0x12d0]                
  0000:3c0c  a36b00           mov word ptr [0x6b], ax                  
  0000:3c0f  a1d412           mov ax, word ptr [0x12d4]                
  0000:3c12  a36f00           mov word ptr [0x6f], ax                  
  0000:3c15  a1d212           mov ax, word ptr [0x12d2]                
  0000:3c18  a36d00           mov word ptr [0x6d], ax                  
  0000:3c1b  ff26d612         jmp word ptr [0x12d6]                    

proc_0000_3c1f:
  0000:3c1f  55               push bp                                  
  0000:3c20  8bec             mov bp, sp                               
  0000:3c22  b44a             mov ah, 0x4a                             
  0000:3c24  8b5e08           mov bx, word ptr [bp + 8]                
  0000:3c27  8e4606           mov es, word ptr [bp + 6]                
  0000:3c2a  cd21             int 0x21                                 
  0000:3c2c  7205             jb 0x3c33                                
  0000:3c2e  b8ffff           mov ax, 0xffff                           
  0000:3c31  eb06             jmp 0x3c39                               
  0000:3c33  53               push bx                                  
  0000:3c34  50               push ax                                  
  0000:3c35  e8d0e0           call 0x1d08                              -> 0000:1d08
  0000:3c38  58               pop ax                                   
  0000:3c39  5d               pop bp                                   
  0000:3c3a  cb               retf                                     
  0000:3c3b  b403             mov ah, 3                                
  0000:3c3d  b700             mov bh, 0                                
  0000:3c3f  e81bf1           call 0x2d5d                              -> 0000:2d5d
  0000:3c42  8bc2             mov ax, dx                               
  0000:3c44  c3               ret                                      
  0000:3c45  e8f3ff           call 0x3c3b                              -> 0000:3c3b
  0000:3c48  b400             mov ah, 0                                
  0000:3c4a  8a167e12         mov dl, byte ptr [0x127e]                
  0000:3c4e  b600             mov dh, 0                                
  0000:3c50  2bc2             sub ax, dx                               
  0000:3c52  40               inc ax                                   
  0000:3c53  cb               retf                                     
  0000:3c54  e8e4ff           call 0x3c3b                              -> 0000:3c3b
  0000:3c57  b108             mov cl, 8                                
  0000:3c59  d3e8             shr ax, cl                               
  0000:3c5b  b400             mov ah, 0                                
  0000:3c5d  8a167f12         mov dl, byte ptr [0x127f]                
  0000:3c61  b600             mov dh, 0                                
  0000:3c63  2bc2             sub ax, dx                               
  0000:3c65  40               inc ax                                   
  0000:3c66  cb               retf                                     

proc_0000_3c67:
  0000:3c67  55               push bp                                  
  0000:3c68  8bec             mov bp, sp                               
  0000:3c6a  56               push si                                  
  0000:3c6b  8b4606           mov ax, word ptr [bp + 6]                
  0000:3c6e  0b4608           or ax, word ptr [bp + 8]                 
  0000:3c71  7508             jne 0x3c7b                               
  0000:3c73  90               nop                                      
  0000:3c74  0e               push cs                                  
  0000:3c75  e8bc00           call 0x3d34                              -> 0000:3d34
  0000:3c78  e9b400           jmp 0x3d2f                               
  0000:3c7b  c45e06           les bx, ptr [bp + 6]                     
  0000:3c7e  268b4712         mov ax, word ptr es:[bx + 0x12]          
  0000:3c82  3b4606           cmp ax, word ptr [bp + 6]                
  0000:3c85  7406             je 0x3c8d                                
  0000:3c87  b8ffff           mov ax, 0xffff                           
  0000:3c8a  e9a400           jmp 0x3d31                               
  0000:3c8d  c45e06           les bx, ptr [bp + 6]                     
  0000:3c90  26833f00         cmp word ptr es:[bx], 0                  
  0000:3c94  7c51             jl 0x3ce7                                
  0000:3c96  26f747020800     test word ptr es:[bx + 2], 8             
  0000:3c9c  7518             jne 0x3cb6                               
  0000:3c9e  268b470e         mov ax, word ptr es:[bx + 0xe]           
  0000:3ca2  8b5606           mov dx, word ptr [bp + 6]                
  0000:3ca5  83c205           add dx, 5                                
  0000:3ca8  3b4608           cmp ax, word ptr [bp + 8]                
  0000:3cab  7403             je 0x3cb0                                
  0000:3cad  e97f00           jmp 0x3d2f                               
  0000:3cb0  2639570c         cmp word ptr es:[bx + 0xc], dx           
  0000:3cb4  7579             jne 0x3d2f                               
  0000:3cb6  c45e06           les bx, ptr [bp + 6]                     
  0000:3cb9  26c7070000       mov word ptr es:[bx], 0                  
  0000:3cbe  268b470e         mov ax, word ptr es:[bx + 0xe]           
  0000:3cc2  8b5606           mov dx, word ptr [bp + 6]                
  0000:3cc5  83c205           add dx, 5                                
  0000:3cc8  3b4608           cmp ax, word ptr [bp + 8]                
  0000:3ccb  7562             jne 0x3d2f                               
  0000:3ccd  2639570c         cmp word ptr es:[bx + 0xc], dx           
  0000:3cd1  755c             jne 0x3d2f                               
  0000:3cd3  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0000:3cd7  268b5708         mov dx, word ptr es:[bx + 8]             
  0000:3cdb  2689470e         mov word ptr es:[bx + 0xe], ax           
  0000:3cdf  2689570c         mov word ptr es:[bx + 0xc], dx           
  0000:3ce3  eb4a             jmp 0x3d2f                               
  0000:3ce5  eb48             jmp 0x3d2f                               
  0000:3ce7  c45e06           les bx, ptr [bp + 6]                     
  0000:3cea  268b4706         mov ax, word ptr es:[bx + 6]             
  0000:3cee  260307           add ax, word ptr es:[bx]                 
  0000:3cf1  40               inc ax                                   
  0000:3cf2  8bf0             mov si, ax                               
  0000:3cf4  262937           sub word ptr es:[bx], si                 
  0000:3cf7  50               push ax                                  
  0000:3cf8  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0000:3cfc  268b5708         mov dx, word ptr es:[bx + 8]             
  0000:3d00  2689470e         mov word ptr es:[bx + 0xe], ax           
  0000:3d04  2689570c         mov word ptr es:[bx + 0xc], dx           
  0000:3d08  50               push ax                                  
  0000:3d09  52               push dx                                  
  0000:3d0a  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:3d0e  98               cwde                                     
  0000:3d0f  50               push ax                                  
  0000:3d10  90               nop                                      
  0000:3d11  0e               push cs                                  
  0000:3d12  e8cf09           call 0x46e4                              -> 0000:46e4
  0000:3d15  83c408           add sp, 8                                
  0000:3d18  3bc6             cmp ax, si                               
  0000:3d1a  7413             je 0x3d2f                                
  0000:3d1c  c45e06           les bx, ptr [bp + 6]                     
  0000:3d1f  26f747020002     test word ptr es:[bx + 2], 0x200         
  0000:3d25  7508             jne 0x3d2f                               
  0000:3d27  26834f0210       or word ptr es:[bx + 2], 0x10            
  0000:3d2c  e958ff           jmp 0x3c87                               
  0000:3d2f  33c0             xor ax, ax                               
  0000:3d31  5e               pop si                                   
  0000:3d32  5d               pop bp                                   
  0000:3d33  cb               retf                                     

proc_0000_3d34:
  0000:3d34  55               push bp                                  
  0000:3d35  8bec             mov bp, sp                               
  0000:3d37  83ec04           sub sp, 4                                
  0000:3d3a  56               push si                                  
  0000:3d3b  57               push di                                  
  0000:3d3c  33ff             xor di, di                               
  0000:3d3e  8b360c11         mov si, word ptr [0x110c]                
  0000:3d42  8c5efe           mov word ptr [bp - 2], ds                
  0000:3d45  c746fc7c0f       mov word ptr [bp - 4], 0xf7c             
  0000:3d4a  eb1b             jmp 0x3d67                               
  0000:3d4c  c45efc           les bx, ptr [bp - 4]                     
  0000:3d4f  26f747020300     test word ptr es:[bx + 2], 3             
  0000:3d55  740c             je 0x3d63                                
  0000:3d57  ff76fe           push word ptr [bp - 2]                   
  0000:3d5a  53               push bx                                  
  0000:3d5b  90               nop                                      
  0000:3d5c  0e               push cs                                  
  0000:3d5d  e807ff           call 0x3c67                              -> 0000:3c67
  0000:3d60  59               pop cx                                   
  0000:3d61  59               pop cx                                   
  0000:3d62  47               inc di                                   
  0000:3d63  8346fc14         add word ptr [bp - 4], 0x14              
  0000:3d67  8bc6             mov ax, si                               
  0000:3d69  4e               dec si                                   
  0000:3d6a  0bc0             or ax, ax                                
  0000:3d6c  75de             jne 0x3d4c                               
  0000:3d6e  8bc7             mov ax, di                               
  0000:3d70  5f               pop di                                   
  0000:3d71  5e               pop si                                   
  0000:3d72  8be5             mov sp, bp                               
  0000:3d74  5d               pop bp                                   
  0000:3d75  cb               retf                                     

proc_0000_3d76:
  0000:3d76  55               push bp                                  
  0000:3d77  8bec             mov bp, sp                               
  0000:3d79  b8e841           mov ax, 0x41e8                           
  0000:3d7c  50               push ax                                  
  0000:3d7d  ff7608           push word ptr [bp + 8]                   
  0000:3d80  ff7606           push word ptr [bp + 6]                   
  0000:3d83  ff760c           push word ptr [bp + 0xc]                 
  0000:3d86  ff760a           push word ptr [bp + 0xa]                 
  0000:3d89  8d460e           lea ax, [bp + 0xe]                       
  0000:3d8c  50               push ax                                  
  0000:3d8d  e8e2e8           call 0x2672                              -> 0000:2672
  0000:3d90  5d               pop bp                                   
  0000:3d91  cb               retf                                     

proc_0000_3d92:
  0000:3d92  55               push bp                                  
  0000:3d93  8bec             mov bp, sp                               
  0000:3d95  83ec04           sub sp, 4                                
  0000:3d98  56               push si                                  
  0000:3d99  c45e04           les bx, ptr [bp + 4]                     
  0000:3d9c  26833f00         cmp word ptr es:[bx], 0                  
  0000:3da0  7d0c             jge 0x3dae                               
  0000:3da2  268b4f06         mov cx, word ptr es:[bx + 6]             
  0000:3da6  26030f           add cx, word ptr es:[bx]                 
  0000:3da9  41               inc cx                                   
  0000:3daa  8bf1             mov si, cx                               
  0000:3dac  eb0f             jmp 0x3dbd                               
  0000:3dae  c45e04           les bx, ptr [bp + 4]                     
  0000:3db1  268b07           mov ax, word ptr es:[bx]                 
  0000:3db4  99               cdq                                      
  0000:3db5  33c2             xor ax, dx                               
  0000:3db7  2bc2             sub ax, dx                               
  0000:3db9  8bc8             mov cx, ax                               
  0000:3dbb  8bf0             mov si, ax                               
  0000:3dbd  c45e04           les bx, ptr [bp + 4]                     
  0000:3dc0  26f747024000     test word ptr es:[bx + 2], 0x40          
  0000:3dc6  7543             jne 0x3e0b                               
  0000:3dc8  c45e04           les bx, ptr [bp + 4]                     
  0000:3dcb  268b470e         mov ax, word ptr es:[bx + 0xe]           
  0000:3dcf  268b570c         mov dx, word ptr es:[bx + 0xc]           
  0000:3dd3  8946fe           mov word ptr [bp - 2], ax                
  0000:3dd6  8956fc           mov word ptr [bp - 4], dx                
  0000:3dd9  26833f00         cmp word ptr es:[bx], 0                  
  0000:3ddd  7d25             jge 0x3e04                               
  0000:3ddf  eb0d             jmp 0x3dee                               
  0000:3de1  ff4efc           dec word ptr [bp - 4]                    
  0000:3de4  c45efc           les bx, ptr [bp - 4]                     
  0000:3de7  26803f0a         cmp byte ptr es:[bx], 0xa                
  0000:3deb  7501             jne 0x3dee                               
  0000:3ded  46               inc si                                   
  0000:3dee  8bc1             mov ax, cx                               
  0000:3df0  49               dec cx                                   
  0000:3df1  0bc0             or ax, ax                                
  0000:3df3  75ec             jne 0x3de1                               
  0000:3df5  eb14             jmp 0x3e0b                               
  0000:3df7  c45efc           les bx, ptr [bp - 4]                     
  0000:3dfa  ff46fc           inc word ptr [bp - 4]                    
  0000:3dfd  26803f0a         cmp byte ptr es:[bx], 0xa                
  0000:3e01  7501             jne 0x3e04                               
  0000:3e03  46               inc si                                   
  0000:3e04  8bc1             mov ax, cx                               
  0000:3e06  49               dec cx                                   
  0000:3e07  0bc0             or ax, ax                                
  0000:3e09  75ec             jne 0x3df7                               
  0000:3e0b  8bc6             mov ax, si                               
  0000:3e0d  5e               pop si                                   
  0000:3e0e  8be5             mov sp, bp                               
  0000:3e10  5d               pop bp                                   
  0000:3e11  c20400           ret 4                                    

proc_0000_3e14:
  0000:3e14  55               push bp                                  
  0000:3e15  8bec             mov bp, sp                               
  0000:3e17  56               push si                                  
  0000:3e18  8b760e           mov si, word ptr [bp + 0xe]              
  0000:3e1b  ff7608           push word ptr [bp + 8]                   
  0000:3e1e  ff7606           push word ptr [bp + 6]                   
  0000:3e21  90               nop                                      
  0000:3e22  0e               push cs                                  
  0000:3e23  e841fe           call 0x3c67                              -> 0000:3c67
  0000:3e26  59               pop cx                                   
  0000:3e27  59               pop cx                                   
  0000:3e28  0bc0             or ax, ax                                
  0000:3e2a  7405             je 0x3e31                                
  0000:3e2c  b8ffff           mov ax, 0xffff                           
  0000:3e2f  eb60             jmp 0x3e91                               
  0000:3e31  83fe01           cmp si, 1                                
  0000:3e34  7517             jne 0x3e4d                               
  0000:3e36  c45e06           les bx, ptr [bp + 6]                     
  0000:3e39  26833f00         cmp word ptr es:[bx], 0                  
  0000:3e3d  7e0e             jle 0x3e4d                               
  0000:3e3f  ff7608           push word ptr [bp + 8]                   
  0000:3e42  53               push bx                                  
  0000:3e43  e84cff           call 0x3d92                              -> 0000:3d92
  0000:3e46  99               cdq                                      
  0000:3e47  29460a           sub word ptr [bp + 0xa], ax              
  0000:3e4a  19560c           sbb word ptr [bp + 0xc], dx              
  0000:3e4d  c45e06           les bx, ptr [bp + 6]                     
  0000:3e50  268167025ffe     and word ptr es:[bx + 2], 0xfe5f         
  0000:3e56  26c7070000       mov word ptr es:[bx], 0                  
  0000:3e5b  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0000:3e5f  268b5708         mov dx, word ptr es:[bx + 8]             
  0000:3e63  2689470e         mov word ptr es:[bx + 0xe], ax           
  0000:3e67  2689570c         mov word ptr es:[bx + 0xc], dx           
  0000:3e6b  56               push si                                  
  0000:3e6c  ff760c           push word ptr [bp + 0xc]                 
  0000:3e6f  ff760a           push word ptr [bp + 0xa]                 
  0000:3e72  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:3e76  98               cwde                                     
  0000:3e77  50               push ax                                  
  0000:3e78  90               nop                                      
  0000:3e79  0e               push cs                                  
  0000:3e7a  e889df           call 0x1e06                              -> 0000:1e06
  0000:3e7d  83c408           add sp, 8                                
  0000:3e80  83faff           cmp dx, -1                               
  0000:3e83  750a             jne 0x3e8f                               
  0000:3e85  3dffff           cmp ax, 0xffff                           
  0000:3e88  7505             jne 0x3e8f                               
  0000:3e8a  b8ffff           mov ax, 0xffff                           
  0000:3e8d  eb02             jmp 0x3e91                               
  0000:3e8f  33c0             xor ax, ax                               
  0000:3e91  5e               pop si                                   
  0000:3e92  5d               pop bp                                   
  0000:3e93  cb               retf                                     

proc_0000_3e94:
  0000:3e94  55               push bp                                  
  0000:3e95  8bec             mov bp, sp                               
  0000:3e97  83ec08           sub sp, 8                                
  0000:3e9a  b80100           mov ax, 1                                
  0000:3e9d  50               push ax                                  
  0000:3e9e  33c0             xor ax, ax                               
  0000:3ea0  33d2             xor dx, dx                               
  0000:3ea2  50               push ax                                  
  0000:3ea3  52               push dx                                  
  0000:3ea4  c45e06           les bx, ptr [bp + 6]                     
  0000:3ea7  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:3eab  98               cwde                                     
  0000:3eac  50               push ax                                  
  0000:3ead  90               nop                                      
  0000:3eae  0e               push cs                                  
  0000:3eaf  e854df           call 0x1e06                              -> 0000:1e06
  0000:3eb2  83c408           add sp, 8                                
  0000:3eb5  8956fe           mov word ptr [bp - 2], dx                
  0000:3eb8  8946fc           mov word ptr [bp - 4], ax                
  0000:3ebb  83faff           cmp dx, -1                               
  0000:3ebe  7508             jne 0x3ec8                               
  0000:3ec0  3dffff           cmp ax, 0xffff                           
  0000:3ec3  7503             jne 0x3ec8                               
  0000:3ec5  e9a200           jmp 0x3f6a                               
  0000:3ec8  c45e06           les bx, ptr [bp + 6]                     
  0000:3ecb  26833f00         cmp word ptr es:[bx], 0                  
  0000:3ecf  7c03             jl 0x3ed4                                
  0000:3ed1  e98600           jmp 0x3f5a                               
  0000:3ed4  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:3ed8  98               cwde                                     
  0000:3ed9  d1e0             shl ax, 1                                
  0000:3edb  8bd8             mov bx, ax                               
  0000:3edd  f7870e110008     test word ptr [bx + 0x110e], 0x800       
  0000:3ee3  7463             je 0x3f48                                
  0000:3ee5  b80200           mov ax, 2                                
  0000:3ee8  50               push ax                                  
  0000:3ee9  33c0             xor ax, ax                               
  0000:3eeb  33d2             xor dx, dx                               
  0000:3eed  50               push ax                                  
  0000:3eee  52               push dx                                  
  0000:3eef  8b5e06           mov bx, word ptr [bp + 6]                
  0000:3ef2  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:3ef6  98               cwde                                     
  0000:3ef7  50               push ax                                  
  0000:3ef8  90               nop                                      
  0000:3ef9  0e               push cs                                  
  0000:3efa  e809df           call 0x1e06                              -> 0000:1e06
  0000:3efd  83c408           add sp, 8                                
  0000:3f00  8956fa           mov word ptr [bp - 6], dx                
  0000:3f03  8946f8           mov word ptr [bp - 8], ax                
  0000:3f06  83faff           cmp dx, -1                               
  0000:3f09  7505             jne 0x3f10                               
  0000:3f0b  3dffff           cmp ax, 0xffff                           
  0000:3f0e  7460             je 0x3f70                                
  0000:3f10  33c0             xor ax, ax                               
  0000:3f12  50               push ax                                  
  0000:3f13  ff76fe           push word ptr [bp - 2]                   
  0000:3f16  ff76fc           push word ptr [bp - 4]                   
  0000:3f19  c45e06           les bx, ptr [bp + 6]                     
  0000:3f1c  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:3f20  98               cwde                                     
  0000:3f21  50               push ax                                  
  0000:3f22  90               nop                                      
  0000:3f23  0e               push cs                                  
  0000:3f24  e8dfde           call 0x1e06                              -> 0000:1e06
  0000:3f27  83c408           add sp, 8                                
  0000:3f2a  83faff           cmp dx, -1                               
  0000:3f2d  750d             jne 0x3f3c                               
  0000:3f2f  3dffff           cmp ax, 0xffff                           
  0000:3f32  7508             jne 0x3f3c                               
  0000:3f34  baffff           mov dx, 0xffff                           
  0000:3f37  b8ffff           mov ax, 0xffff                           
  0000:3f3a  eb34             jmp 0x3f70                               
  0000:3f3c  8b46fa           mov ax, word ptr [bp - 6]                
  0000:3f3f  8b56f8           mov dx, word ptr [bp - 8]                
  0000:3f42  8946fe           mov word ptr [bp - 2], ax                
  0000:3f45  8956fc           mov word ptr [bp - 4], dx                
  0000:3f48  ff7608           push word ptr [bp + 8]                   
  0000:3f4b  ff7606           push word ptr [bp + 6]                   
  0000:3f4e  e841fe           call 0x3d92                              -> 0000:3d92
  0000:3f51  99               cdq                                      
  0000:3f52  0146fc           add word ptr [bp - 4], ax                
  0000:3f55  1156fe           adc word ptr [bp - 2], dx                
  0000:3f58  eb10             jmp 0x3f6a                               
  0000:3f5a  ff7608           push word ptr [bp + 8]                   
  0000:3f5d  ff7606           push word ptr [bp + 6]                   
  0000:3f60  e82ffe           call 0x3d92                              -> 0000:3d92
  0000:3f63  99               cdq                                      
  0000:3f64  2946fc           sub word ptr [bp - 4], ax                
  0000:3f67  1956fe           sbb word ptr [bp - 2], dx                
  0000:3f6a  8b56fe           mov dx, word ptr [bp - 2]                
  0000:3f6d  8b46fc           mov ax, word ptr [bp - 4]                
  0000:3f70  8be5             mov sp, bp                               
  0000:3f72  5d               pop bp                                   
  0000:3f73  cb               retf                                     

proc_0000_3f74:
  0000:3f74  55               push bp                                  
  0000:3f75  8bec             mov bp, sp                               
  0000:3f77  8b5e06           mov bx, word ptr [bp + 6]                
  0000:3f7a  8b4e0c           mov cx, word ptr [bp + 0xc]              
  0000:3f7d  83f90a           cmp cx, 0xa                              
  0000:3f80  7505             jne 0x3f87                               
  0000:3f82  8bc3             mov ax, bx                               
  0000:3f84  99               cdq                                      
  0000:3f85  eb04             jmp 0x3f8b                               
  0000:3f87  8bc3             mov ax, bx                               
  0000:3f89  33d2             xor dx, dx                               
  0000:3f8b  52               push dx                                  
  0000:3f8c  50               push ax                                  
  0000:3f8d  ff760a           push word ptr [bp + 0xa]                 
  0000:3f90  ff7608           push word ptr [bp + 8]                   
  0000:3f93  51               push cx                                  
  0000:3f94  b001             mov al, 1                                
  0000:3f96  50               push ax                                  
  0000:3f97  b061             mov al, 0x61                             
  0000:3f99  50               push ax                                  
  0000:3f9a  e8c7dd           call 0x1d64                              -> 0000:1d64
  0000:3f9d  5d               pop bp                                   
  0000:3f9e  cb               retf                                     

proc_0000_3f9f:
  0000:3f9f  55               push bp                                  
  0000:3fa0  8bec             mov bp, sp                               
  0000:3fa2  ff7608           push word ptr [bp + 8]                   
  0000:3fa5  ff7606           push word ptr [bp + 6]                   
  0000:3fa8  ff760c           push word ptr [bp + 0xc]                 
  0000:3fab  ff760a           push word ptr [bp + 0xa]                 
  0000:3fae  ff760e           push word ptr [bp + 0xe]                 
  0000:3fb1  b000             mov al, 0                                
  0000:3fb3  50               push ax                                  
  0000:3fb4  b061             mov al, 0x61                             
  0000:3fb6  50               push ax                                  
  0000:3fb7  e8aadd           call 0x1d64                              -> 0000:1d64
  0000:3fba  5d               pop bp                                   
  0000:3fbb  cb               retf                                     

proc_0000_3fbc:
  0000:3fbc  55               push bp                                  
  0000:3fbd  8bec             mov bp, sp                               
  0000:3fbf  8b460e           mov ax, word ptr [bp + 0xe]              
  0000:3fc2  ff7608           push word ptr [bp + 8]                   
  0000:3fc5  ff7606           push word ptr [bp + 6]                   
  0000:3fc8  ff760c           push word ptr [bp + 0xc]                 
  0000:3fcb  ff760a           push word ptr [bp + 0xa]                 
  0000:3fce  50               push ax                                  
  0000:3fcf  3d0a00           cmp ax, 0xa                              
  0000:3fd2  7505             jne 0x3fd9                               
  0000:3fd4  b80100           mov ax, 1                                
  0000:3fd7  eb02             jmp 0x3fdb                               
  0000:3fd9  33c0             xor ax, ax                               
  0000:3fdb  50               push ax                                  
  0000:3fdc  b061             mov al, 0x61                             
  0000:3fde  50               push ax                                  
  0000:3fdf  e882dd           call 0x1d64                              -> 0000:1d64
  0000:3fe2  5d               pop bp                                   
  0000:3fe3  cb               retf                                     

proc_0000_3fe4:
  0000:3fe4  55               push bp                                  
  0000:3fe5  8bec             mov bp, sp                               
  0000:3fe7  56               push si                                  
  0000:3fe8  57               push di                                  
  0000:3fe9  8cda             mov dx, ds                               
  0000:3feb  c47e06           les di, ptr [bp + 6]                     
  0000:3fee  c5760a           lds si, ptr [bp + 0xa]                   
  0000:3ff1  8b4e0e           mov cx, word ptr [bp + 0xe]              
  0000:3ff4  d1e9             shr cx, 1                                
  0000:3ff6  fc               cld                                      
  0000:3ff7  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0000:3ff9  7301             jae 0x3ffc                               
  0000:3ffb  a4               movsb byte ptr es:[di], byte ptr [si]    
  0000:3ffc  8eda             mov ds, dx                               
  0000:3ffe  8b5608           mov dx, word ptr [bp + 8]                
  0000:4001  8b4606           mov ax, word ptr [bp + 6]                
  0000:4004  5f               pop di                                   
  0000:4005  5e               pop si                                   
  0000:4006  5d               pop bp                                   
  0000:4007  cb               retf                                     

proc_0000_4008:
  0000:4008  55               push bp                                  
  0000:4009  8bec             mov bp, sp                               
  0000:400b  b8e841           mov ax, 0x41e8                           
  0000:400e  50               push ax                                  
  0000:400f  1e               push ds                                  
  0000:4010  b8900f           mov ax, 0xf90                            
  0000:4013  50               push ax                                  
  0000:4014  ff7608           push word ptr [bp + 8]                   
  0000:4017  ff7606           push word ptr [bp + 6]                   
  0000:401a  8d460a           lea ax, [bp + 0xa]                       
  0000:401d  50               push ax                                  
  0000:401e  e851e6           call 0x2672                              -> 0000:2672
  0000:4021  5d               pop bp                                   
  0000:4022  cb               retf                                     

proc_0000_4023:
  0000:4023  55               push bp                                  
  0000:4024  8bec             mov bp, sp                               
  0000:4026  c45e08           les bx, ptr [bp + 8]                     
  0000:4029  26ff0f           dec word ptr es:[bx]                     
  0000:402c  ff760a           push word ptr [bp + 0xa]                 
  0000:402f  53               push bx                                  
  0000:4030  8a4606           mov al, byte ptr [bp + 6]                
  0000:4033  98               cwde                                     
  0000:4034  50               push ax                                  
  0000:4035  90               nop                                      
  0000:4036  0e               push cs                                  
  0000:4037  e80500           call 0x403f                              -> 0000:403f
  0000:403a  83c406           add sp, 6                                
  0000:403d  5d               pop bp                                   
  0000:403e  cb               retf                                     

proc_0000_403f:
  0000:403f  55               push bp                                  
  0000:4040  8bec             mov bp, sp                               
  0000:4042  56               push si                                  
  0000:4043  8a4606           mov al, byte ptr [bp + 6]                
  0000:4046  a26c1b           mov byte ptr [0x1b6c], al                
  0000:4049  c45e08           les bx, ptr [bp + 8]                     
  0000:404c  26833fff         cmp word ptr es:[bx], -1                 
  0000:4050  7d54             jge 0x40a6                               
  0000:4052  26ff07           inc word ptr es:[bx]                     
  0000:4055  268b470e         mov ax, word ptr es:[bx + 0xe]           
  0000:4059  268b770c         mov si, word ptr es:[bx + 0xc]           
  0000:405d  26ff470c         inc word ptr es:[bx + 0xc]               
  0000:4061  8a166c1b         mov dl, byte ptr [0x1b6c]                
  0000:4065  8ec0             mov es, ax                               
  0000:4067  268814           mov byte ptr es:[si], dl                 
  0000:406a  8e460a           mov es, word ptr [bp + 0xa]              
  0000:406d  26f747020800     test word ptr es:[bx + 2], 8             
  0000:4073  7503             jne 0x4078                               
  0000:4075  e95401           jmp 0x41cc                               
  0000:4078  803e6c1b0a       cmp byte ptr [0x1b6c], 0xa               
  0000:407d  740a             je 0x4089                                
  0000:407f  803e6c1b0d       cmp byte ptr [0x1b6c], 0xd               
  0000:4084  7403             je 0x4089                                
  0000:4086  e94301           jmp 0x41cc                               
  0000:4089  ff760a           push word ptr [bp + 0xa]                 
  0000:408c  ff7608           push word ptr [bp + 8]                   
  0000:408f  90               nop                                      
  0000:4090  0e               push cs                                  
  0000:4091  e8d3fb           call 0x3c67                              -> 0000:3c67
  0000:4094  59               pop cx                                   
  0000:4095  59               pop cx                                   
  0000:4096  0bc0             or ax, ax                                
  0000:4098  7503             jne 0x409d                               
  0000:409a  e92f01           jmp 0x41cc                               
  0000:409d  b8ffff           mov ax, 0xffff                           
  0000:40a0  e92e01           jmp 0x41d1                               
  0000:40a3  e92601           jmp 0x41cc                               
  0000:40a6  c45e08           les bx, ptr [bp + 8]                     
  0000:40a9  26f747029000     test word ptr es:[bx + 2], 0x90          
  0000:40af  7508             jne 0x40b9                               
  0000:40b1  26f747020200     test word ptr es:[bx + 2], 2             
  0000:40b7  750a             jne 0x40c3                               
  0000:40b9  c45e08           les bx, ptr [bp + 8]                     
  0000:40bc  26834f0210       or word ptr es:[bx + 2], 0x10            
  0000:40c1  ebda             jmp 0x409d                               
  0000:40c3  c45e08           les bx, ptr [bp + 8]                     
  0000:40c6  26814f020001     or word ptr es:[bx + 2], 0x100           
  0000:40cc  26837f0600       cmp word ptr es:[bx + 6], 0              
  0000:40d1  746f             je 0x4142                                
  0000:40d3  26833f00         cmp word ptr es:[bx], 0                  
  0000:40d7  740f             je 0x40e8                                
  0000:40d9  ff760a           push word ptr [bp + 0xa]                 
  0000:40dc  53               push bx                                  
  0000:40dd  90               nop                                      
  0000:40de  0e               push cs                                  
  0000:40df  e885fb           call 0x3c67                              -> 0000:3c67
  0000:40e2  59               pop cx                                   
  0000:40e3  59               pop cx                                   
  0000:40e4  0bc0             or ax, ax                                
  0000:40e6  75b5             jne 0x409d                               
  0000:40e8  c45e08           les bx, ptr [bp + 8]                     
  0000:40eb  268b4706         mov ax, word ptr es:[bx + 6]             
  0000:40ef  f7d8             neg ax                                   
  0000:40f1  268907           mov word ptr es:[bx], ax                 
  0000:40f4  268b470e         mov ax, word ptr es:[bx + 0xe]           
  0000:40f8  268b770c         mov si, word ptr es:[bx + 0xc]           
  0000:40fc  26ff470c         inc word ptr es:[bx + 0xc]               
  0000:4100  8a166c1b         mov dl, byte ptr [0x1b6c]                
  0000:4104  8ec0             mov es, ax                               
  0000:4106  268814           mov byte ptr es:[si], dl                 
  0000:4109  8e460a           mov es, word ptr [bp + 0xa]              
  0000:410c  26f747020800     test word ptr es:[bx + 2], 8             
  0000:4112  7503             jne 0x4117                               
  0000:4114  e9b500           jmp 0x41cc                               
  0000:4117  803e6c1b0a       cmp byte ptr [0x1b6c], 0xa               
  0000:411c  740a             je 0x4128                                
  0000:411e  803e6c1b0d       cmp byte ptr [0x1b6c], 0xd               
  0000:4123  7403             je 0x4128                                
  0000:4125  e9a400           jmp 0x41cc                               
  0000:4128  ff760a           push word ptr [bp + 0xa]                 
  0000:412b  ff7608           push word ptr [bp + 8]                   
  0000:412e  90               nop                                      
  0000:412f  0e               push cs                                  
  0000:4130  e834fb           call 0x3c67                              -> 0000:3c67
  0000:4133  59               pop cx                                   
  0000:4134  59               pop cx                                   
  0000:4135  0bc0             or ax, ax                                
  0000:4137  7503             jne 0x413c                               
  0000:4139  e99000           jmp 0x41cc                               
  0000:413c  e95eff           jmp 0x409d                               
  0000:413f  e98a00           jmp 0x41cc                               
  0000:4142  c45e08           les bx, ptr [bp + 8]                     
  0000:4145  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:4149  98               cwde                                     
  0000:414a  d1e0             shl ax, 1                                
  0000:414c  8bd8             mov bx, ax                               
  0000:414e  f7870e110008     test word ptr [bx + 0x110e], 0x800       
  0000:4154  741b             je 0x4171                                
  0000:4156  b80200           mov ax, 2                                
  0000:4159  50               push ax                                  
  0000:415a  33c0             xor ax, ax                               
  0000:415c  33d2             xor dx, dx                               
  0000:415e  50               push ax                                  
  0000:415f  52               push dx                                  
  0000:4160  8b5e08           mov bx, word ptr [bp + 8]                
  0000:4163  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:4167  98               cwde                                     
  0000:4168  50               push ax                                  
  0000:4169  90               nop                                      
  0000:416a  0e               push cs                                  
  0000:416b  e898dc           call 0x1e06                              -> 0000:1e06
  0000:416e  83c408           add sp, 8                                
  0000:4171  803e6c1b0a       cmp byte ptr [0x1b6c], 0xa               
  0000:4176  7527             jne 0x419f                               
  0000:4178  c45e08           les bx, ptr [bp + 8]                     
  0000:417b  26f747024000     test word ptr es:[bx + 2], 0x40          
  0000:4181  751c             jne 0x419f                               
  0000:4183  b80100           mov ax, 1                                
  0000:4186  50               push ax                                  
  0000:4187  1e               push ds                                  
  0000:4188  b8e012           mov ax, 0x12e0                           
  0000:418b  50               push ax                                  
  0000:418c  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:4190  98               cwde                                     
  0000:4191  50               push ax                                  
  0000:4192  90               nop                                      
  0000:4193  0e               push cs                                  
  0000:4194  e89e06           call 0x4835                              -> 0000:4835
  0000:4197  83c408           add sp, 8                                
  0000:419a  3d0100           cmp ax, 1                                
  0000:419d  751f             jne 0x41be                               
  0000:419f  b80100           mov ax, 1                                
  0000:41a2  50               push ax                                  
  0000:41a3  1e               push ds                                  
  0000:41a4  b86c1b           mov ax, 0x1b6c                           
  0000:41a7  50               push ax                                  
  0000:41a8  c45e08           les bx, ptr [bp + 8]                     
  0000:41ab  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:41af  98               cwde                                     
  0000:41b0  50               push ax                                  
  0000:41b1  90               nop                                      
  0000:41b2  0e               push cs                                  
  0000:41b3  e87f06           call 0x4835                              -> 0000:4835
  0000:41b6  83c408           add sp, 8                                
  0000:41b9  3d0100           cmp ax, 1                                
  0000:41bc  740e             je 0x41cc                                
  0000:41be  c45e08           les bx, ptr [bp + 8]                     
  0000:41c1  26f747020002     test word ptr es:[bx + 2], 0x200         
  0000:41c7  7503             jne 0x41cc                               
  0000:41c9  e9edfe           jmp 0x40b9                               
  0000:41cc  a06c1b           mov al, byte ptr [0x1b6c]                
  0000:41cf  b400             mov ah, 0                                
  0000:41d1  5e               pop si                                   
  0000:41d2  5d               pop bp                                   
  0000:41d3  cb               retf                                     

proc_0000_41d4:
  0000:41d4  55               push bp                                  
  0000:41d5  8bec             mov bp, sp                               
  0000:41d7  1e               push ds                                  
  0000:41d8  b8900f           mov ax, 0xf90                            
  0000:41db  50               push ax                                  
  0000:41dc  ff7606           push word ptr [bp + 6]                   
  0000:41df  0e               push cs                                  
  0000:41e0  e85cfe           call 0x403f                              -> 0000:403f
  0000:41e3  83c406           add sp, 6                                
  0000:41e6  5d               pop bp                                   
  0000:41e7  cb               retf                                     

proc_0000_41e8:
  0000:41e8  55               push bp                                  
  0000:41e9  8bec             mov bp, sp                               
  0000:41eb  83ec02           sub sp, 2                                
  0000:41ee  56               push si                                  
  0000:41ef  57               push di                                  
  0000:41f0  8b7e08           mov di, word ptr [bp + 8]                
  0000:41f3  897efe           mov word ptr [bp - 2], di                
  0000:41f6  c45e04           les bx, ptr [bp + 4]                     
  0000:41f9  26f747020800     test word ptr es:[bx + 2], 8             
  0000:41ff  742e             je 0x422f                                
  0000:4201  eb22             jmp 0x4225                               
  0000:4203  ff7606           push word ptr [bp + 6]                   
  0000:4206  ff7604           push word ptr [bp + 4]                   
  0000:4209  c45e0a           les bx, ptr [bp + 0xa]                   
  0000:420c  ff460a           inc word ptr [bp + 0xa]                  
  0000:420f  268a07           mov al, byte ptr es:[bx]                 
  0000:4212  98               cwde                                     
  0000:4213  50               push ax                                  
  0000:4214  0e               push cs                                  
  0000:4215  e827fe           call 0x403f                              -> 0000:403f
  0000:4218  83c406           add sp, 6                                
  0000:421b  3dffff           cmp ax, 0xffff                           
  0000:421e  7505             jne 0x4225                               
  0000:4220  33c0             xor ax, ax                               
  0000:4222  e9be01           jmp 0x43e3                               
  0000:4225  8bc7             mov ax, di                               
  0000:4227  4f               dec di                                   
  0000:4228  0bc0             or ax, ax                                
  0000:422a  75d7             jne 0x4203                               
  0000:422c  e9b101           jmp 0x43e0                               
  0000:422f  c45e04           les bx, ptr [bp + 4]                     
  0000:4232  26f747024000     test word ptr es:[bx + 2], 0x40          
  0000:4238  7503             jne 0x423d                               
  0000:423a  e92801           jmp 0x4365                               
  0000:423d  26837f0600       cmp word ptr es:[bx + 6], 0              
  0000:4242  7503             jne 0x4247                               
  0000:4244  e9cb00           jmp 0x4312                               
  0000:4247  26397f06         cmp word ptr es:[bx + 6], di             
  0000:424b  7369             jae 0x42b6                               
  0000:424d  26833f00         cmp word ptr es:[bx], 0                  
  0000:4251  740f             je 0x4262                                
  0000:4253  ff7606           push word ptr [bp + 6]                   
  0000:4256  53               push bx                                  
  0000:4257  90               nop                                      
  0000:4258  0e               push cs                                  
  0000:4259  e80bfa           call 0x3c67                              -> 0000:3c67
  0000:425c  59               pop cx                                   
  0000:425d  59               pop cx                                   
  0000:425e  0bc0             or ax, ax                                
  0000:4260  75be             jne 0x4220                               
  0000:4262  c45e04           les bx, ptr [bp + 4]                     
  0000:4265  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:4269  98               cwde                                     
  0000:426a  d1e0             shl ax, 1                                
  0000:426c  8bd8             mov bx, ax                               
  0000:426e  f7870e110008     test word ptr [bx + 0x110e], 0x800       
  0000:4274  741b             je 0x4291                                
  0000:4276  b80200           mov ax, 2                                
  0000:4279  50               push ax                                  
  0000:427a  33c0             xor ax, ax                               
  0000:427c  33d2             xor dx, dx                               
  0000:427e  50               push ax                                  
  0000:427f  52               push dx                                  
  0000:4280  8b5e04           mov bx, word ptr [bp + 4]                
  0000:4283  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:4287  98               cwde                                     
  0000:4288  50               push ax                                  
  0000:4289  90               nop                                      
  0000:428a  0e               push cs                                  
  0000:428b  e878db           call 0x1e06                              -> 0000:1e06
  0000:428e  83c408           add sp, 8                                
  0000:4291  57               push di                                  
  0000:4292  ff760c           push word ptr [bp + 0xc]                 
  0000:4295  ff760a           push word ptr [bp + 0xa]                 
  0000:4298  c45e04           les bx, ptr [bp + 4]                     
  0000:429b  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:429f  98               cwde                                     
  0000:42a0  50               push ax                                  
  0000:42a1  90               nop                                      
  0000:42a2  0e               push cs                                  
  0000:42a3  e88f05           call 0x4835                              -> 0000:4835
  0000:42a6  83c408           add sp, 8                                
  0000:42a9  3bc7             cmp ax, di                               
  0000:42ab  7503             jne 0x42b0                               
  0000:42ad  e93001           jmp 0x43e0                               
  0000:42b0  e96dff           jmp 0x4220                               
  0000:42b3  e92a01           jmp 0x43e0                               
  0000:42b6  c45e04           les bx, ptr [bp + 4]                     
  0000:42b9  268b07           mov ax, word ptr es:[bx]                 
  0000:42bc  03c7             add ax, di                               
  0000:42be  7c26             jl 0x42e6                                
  0000:42c0  26833f00         cmp word ptr es:[bx], 0                  
  0000:42c4  750c             jne 0x42d2                               
  0000:42c6  b8ffff           mov ax, 0xffff                           
  0000:42c9  262b4706         sub ax, word ptr es:[bx + 6]             
  0000:42cd  268907           mov word ptr es:[bx], ax                 
  0000:42d0  eb14             jmp 0x42e6                               
  0000:42d2  ff7606           push word ptr [bp + 6]                   
  0000:42d5  ff7604           push word ptr [bp + 4]                   
  0000:42d8  90               nop                                      
  0000:42d9  0e               push cs                                  
  0000:42da  e88af9           call 0x3c67                              -> 0000:3c67
  0000:42dd  59               pop cx                                   
  0000:42de  59               pop cx                                   
  0000:42df  0bc0             or ax, ax                                
  0000:42e1  7403             je 0x42e6                                
  0000:42e3  e93aff           jmp 0x4220                               
  0000:42e6  57               push di                                  
  0000:42e7  ff760c           push word ptr [bp + 0xc]                 
  0000:42ea  ff760a           push word ptr [bp + 0xa]                 
  0000:42ed  c45e04           les bx, ptr [bp + 4]                     
  0000:42f0  26ff770e         push word ptr es:[bx + 0xe]              
  0000:42f4  26ff770c         push word ptr es:[bx + 0xc]              
  0000:42f8  90               nop                                      
  0000:42f9  0e               push cs                                  
  0000:42fa  e8e7fc           call 0x3fe4                              -> 0000:3fe4
  0000:42fd  83c40a           add sp, 0xa                              
  0000:4300  c45e04           les bx, ptr [bp + 4]                     
  0000:4303  268b07           mov ax, word ptr es:[bx]                 
  0000:4306  03c7             add ax, di                               
  0000:4308  268907           mov word ptr es:[bx], ax                 
  0000:430b  26017f0c         add word ptr es:[bx + 0xc], di           
  0000:430f  e9ce00           jmp 0x43e0                               
  0000:4312  c45e04           les bx, ptr [bp + 4]                     
  0000:4315  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:4319  98               cwde                                     
  0000:431a  d1e0             shl ax, 1                                
  0000:431c  8bd8             mov bx, ax                               
  0000:431e  f7870e110008     test word ptr [bx + 0x110e], 0x800       
  0000:4324  741b             je 0x4341                                
  0000:4326  b80200           mov ax, 2                                
  0000:4329  50               push ax                                  
  0000:432a  33c0             xor ax, ax                               
  0000:432c  33d2             xor dx, dx                               
  0000:432e  50               push ax                                  
  0000:432f  52               push dx                                  
  0000:4330  8b5e04           mov bx, word ptr [bp + 4]                
  0000:4333  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:4337  98               cwde                                     
  0000:4338  50               push ax                                  
  0000:4339  90               nop                                      
  0000:433a  0e               push cs                                  
  0000:433b  e8c8da           call 0x1e06                              -> 0000:1e06
  0000:433e  83c408           add sp, 8                                
  0000:4341  57               push di                                  
  0000:4342  ff760c           push word ptr [bp + 0xc]                 
  0000:4345  ff760a           push word ptr [bp + 0xa]                 
  0000:4348  c45e04           les bx, ptr [bp + 4]                     
  0000:434b  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:434f  98               cwde                                     
  0000:4350  50               push ax                                  
  0000:4351  90               nop                                      
  0000:4352  0e               push cs                                  
  0000:4353  e8df04           call 0x4835                              -> 0000:4835
  0000:4356  83c408           add sp, 8                                
  0000:4359  3bc7             cmp ax, di                               
  0000:435b  7503             jne 0x4360                               
  0000:435d  e98000           jmp 0x43e0                               
  0000:4360  e9bdfe           jmp 0x4220                               
  0000:4363  eb7b             jmp 0x43e0                               
  0000:4365  c45e04           les bx, ptr [bp + 4]                     
  0000:4368  26837f0600       cmp word ptr es:[bx + 6], 0              
  0000:436d  7452             je 0x43c1                                
  0000:436f  eb47             jmp 0x43b8                               
  0000:4371  c45e04           les bx, ptr [bp + 4]                     
  0000:4374  26ff07           inc word ptr es:[bx]                     
  0000:4377  7d20             jge 0x4399                               
  0000:4379  268b470e         mov ax, word ptr es:[bx + 0xe]           
  0000:437d  268b770c         mov si, word ptr es:[bx + 0xc]           
  0000:4381  26ff470c         inc word ptr es:[bx + 0xc]               
  0000:4385  c45e0a           les bx, ptr [bp + 0xa]                   
  0000:4388  ff460a           inc word ptr [bp + 0xa]                  
  0000:438b  268a17           mov dl, byte ptr es:[bx]                 
  0000:438e  8ec0             mov es, ax                               
  0000:4390  268814           mov byte ptr es:[si], dl                 
  0000:4393  8ac2             mov al, dl                               
  0000:4395  b400             mov ah, 0                                
  0000:4397  eb17             jmp 0x43b0                               
  0000:4399  ff7606           push word ptr [bp + 6]                   
  0000:439c  ff7604           push word ptr [bp + 4]                   
  0000:439f  c45e0a           les bx, ptr [bp + 0xa]                   
  0000:43a2  ff460a           inc word ptr [bp + 0xa]                  
  0000:43a5  268a07           mov al, byte ptr es:[bx]                 
  0000:43a8  50               push ax                                  
  0000:43a9  0e               push cs                                  
  0000:43aa  e876fc           call 0x4023                              -> 0000:4023
  0000:43ad  83c406           add sp, 6                                
  0000:43b0  3dffff           cmp ax, 0xffff                           
  0000:43b3  7503             jne 0x43b8                               
  0000:43b5  e968fe           jmp 0x4220                               
  0000:43b8  8bc7             mov ax, di                               
  0000:43ba  4f               dec di                                   
  0000:43bb  0bc0             or ax, ax                                
  0000:43bd  75b2             jne 0x4371                               
  0000:43bf  eb1f             jmp 0x43e0                               
  0000:43c1  57               push di                                  
  0000:43c2  ff760c           push word ptr [bp + 0xc]                 
  0000:43c5  ff760a           push word ptr [bp + 0xa]                 
  0000:43c8  c45e04           les bx, ptr [bp + 4]                     
  0000:43cb  268a4704         mov al, byte ptr es:[bx + 4]             
  0000:43cf  98               cwde                                     
  0000:43d0  50               push ax                                  
  0000:43d1  90               nop                                      
  0000:43d2  0e               push cs                                  
  0000:43d3  e80e03           call 0x46e4                              -> 0000:46e4
  0000:43d6  83c408           add sp, 8                                
  0000:43d9  3bc7             cmp ax, di                               
  0000:43db  7403             je 0x43e0                                
  0000:43dd  e940fe           jmp 0x4220                               
  0000:43e0  8b46fe           mov ax, word ptr [bp - 2]                
  0000:43e3  5f               pop di                                   
  0000:43e4  5e               pop si                                   
  0000:43e5  8be5             mov sp, bp                               
  0000:43e7  5d               pop bp                                   
  0000:43e8  c20a00           ret 0xa                                  

proc_0000_43eb:
  0000:43eb  55               push bp                                  
  0000:43ec  8bec             mov bp, sp                               
  0000:43ee  56               push si                                  
  0000:43ef  8b4606           mov ax, word ptr [bp + 6]                
  0000:43f2  0b4608           or ax, word ptr [bp + 8]                 
  0000:43f5  7504             jne 0x43fb                               
  0000:43f7  33c0             xor ax, ax                               
  0000:43f9  eb45             jmp 0x4440                               
  0000:43fb  ff7608           push word ptr [bp + 8]                   
  0000:43fe  ff7606           push word ptr [bp + 6]                   
  0000:4401  90               nop                                      
  0000:4402  0e               push cs                                  
  0000:4403  e8bf02           call 0x46c5                              -> 0000:46c5
  0000:4406  59               pop cx                                   
  0000:4407  59               pop cx                                   
  0000:4408  8bf0             mov si, ax                               
  0000:440a  ff7608           push word ptr [bp + 8]                   
  0000:440d  ff7606           push word ptr [bp + 6]                   
  0000:4410  50               push ax                                  
  0000:4411  1e               push ds                                  
  0000:4412  b8900f           mov ax, 0xf90                            
  0000:4415  50               push ax                                  
  0000:4416  e8cffd           call 0x41e8                              -> 0000:41e8
  0000:4419  3bc6             cmp ax, si                               
  0000:441b  7405             je 0x4422                                
  0000:441d  b8ffff           mov ax, 0xffff                           
  0000:4420  eb1e             jmp 0x4440                               
  0000:4422  1e               push ds                                  
  0000:4423  b8900f           mov ax, 0xf90                            
  0000:4426  50               push ax                                  
  0000:4427  b80a00           mov ax, 0xa                              
  0000:442a  50               push ax                                  
  0000:442b  90               nop                                      
  0000:442c  0e               push cs                                  
  0000:442d  e80ffc           call 0x403f                              -> 0000:403f
  0000:4430  83c406           add sp, 6                                
  0000:4433  3d0a00           cmp ax, 0xa                              
  0000:4436  7405             je 0x443d                                
  0000:4438  b8ffff           mov ax, 0xffff                           
  0000:443b  eb03             jmp 0x4440                               
  0000:443d  b80a00           mov ax, 0xa                              
  0000:4440  5e               pop si                                   
  0000:4441  5d               pop bp                                   
  0000:4442  cb               retf                                     

proc_0000_4443:
  0000:4443  55               push bp                                  
  0000:4444  8bec             mov bp, sp                               
  0000:4446  56               push si                                  
  0000:4447  57               push di                                  
  0000:4448  8b7e0e           mov di, word ptr [bp + 0xe]              
  0000:444b  8b7610           mov si, word ptr [bp + 0x10]             
  0000:444e  c45e06           les bx, ptr [bp + 6]                     
  0000:4451  268b4712         mov ax, word ptr es:[bx + 0x12]          
  0000:4455  3b4606           cmp ax, word ptr [bp + 6]                
  0000:4458  750b             jne 0x4465                               
  0000:445a  83ff02           cmp di, 2                                
  0000:445d  7f06             jg 0x4465                                
  0000:445f  81feff7f         cmp si, 0x7fff                           
  0000:4463  7606             jbe 0x446b                               
  0000:4465  b8ffff           mov ax, 0xffff                           
  0000:4468  e9f100           jmp 0x455c                               
  0000:446b  833ee41200       cmp word ptr [0x12e4], 0                 
  0000:4470  750f             jne 0x4481                               
  0000:4472  817e06900f       cmp word ptr [bp + 6], 0xf90             
  0000:4477  7508             jne 0x4481                               
  0000:4479  c706e4120100     mov word ptr [0x12e4], 1                 
  0000:447f  eb14             jmp 0x4495                               
  0000:4481  833ee21200       cmp word ptr [0x12e2], 0                 
  0000:4486  750d             jne 0x4495                               
  0000:4488  817e067c0f       cmp word ptr [bp + 6], 0xf7c             
  0000:448d  7506             jne 0x4495                               
  0000:448f  c706e2120100     mov word ptr [0x12e2], 1                 
  0000:4495  c45e06           les bx, ptr [bp + 6]                     
  0000:4498  26833f00         cmp word ptr es:[bx], 0                  
  0000:449c  7416             je 0x44b4                                
  0000:449e  b80100           mov ax, 1                                
  0000:44a1  50               push ax                                  
  0000:44a2  33c0             xor ax, ax                               
  0000:44a4  33d2             xor dx, dx                               
  0000:44a6  50               push ax                                  
  0000:44a7  52               push dx                                  
  0000:44a8  ff7608           push word ptr [bp + 8]                   
  0000:44ab  53               push bx                                  
  0000:44ac  90               nop                                      
  0000:44ad  0e               push cs                                  
  0000:44ae  e863f9           call 0x3e14                              -> 0000:3e14
  0000:44b1  83c40a           add sp, 0xa                              
  0000:44b4  c45e06           les bx, ptr [bp + 6]                     
  0000:44b7  26f747020400     test word ptr es:[bx + 2], 4             
  0000:44bd  740f             je 0x44ce                                
  0000:44bf  26ff770a         push word ptr es:[bx + 0xa]              
  0000:44c3  26ff7708         push word ptr es:[bx + 8]                
  0000:44c7  9a0705870c       lcall 0xc87, 0x507                       -> 0c87:0507 [reloc]
  0000:44cc  59               pop cx                                   
  0000:44cd  59               pop cx                                   
  0000:44ce  c45e06           les bx, ptr [bp + 6]                     
  0000:44d1  26836702f3       and word ptr es:[bx + 2], 0xfff3         
  0000:44d6  26c747060000     mov word ptr es:[bx + 6], 0              
  0000:44dc  8b4608           mov ax, word ptr [bp + 8]                
  0000:44df  8b5606           mov dx, word ptr [bp + 6]                
  0000:44e2  83c205           add dx, 5                                
  0000:44e5  2689470a         mov word ptr es:[bx + 0xa], ax           
  0000:44e9  26895708         mov word ptr es:[bx + 8], dx             
  0000:44ed  2689470e         mov word ptr es:[bx + 0xe], ax           
  0000:44f1  2689570c         mov word ptr es:[bx + 0xc], dx           
  0000:44f5  83ff02           cmp di, 2                                
  0000:44f8  7460             je 0x455a                                
  0000:44fa  0bf6             or si, si                                
  0000:44fc  765c             jbe 0x455a                               
  0000:44fe  c706720f0000     mov word ptr [0xf72], 0                   [reloc]
  0000:4504  c706700f7148     mov word ptr [0xf70], 0x4871             
  0000:450a  8b460a           mov ax, word ptr [bp + 0xa]              
  0000:450d  0b460c           or ax, word ptr [bp + 0xc]               
  0000:4510  7521             jne 0x4533                               
  0000:4512  56               push si                                  
  0000:4513  9acf01870c       lcall 0xc87, 0x1cf                       -> 0c87:01cf [reloc]
  0000:4518  59               pop cx                                   
  0000:4519  89560c           mov word ptr [bp + 0xc], dx              
  0000:451c  89460a           mov word ptr [bp + 0xa], ax              
  0000:451f  0bc2             or ax, dx                                
  0000:4521  7503             jne 0x4526                               
  0000:4523  e93fff           jmp 0x4465                               
  0000:4526  c45e06           les bx, ptr [bp + 6]                     
  0000:4529  26834f0204       or word ptr es:[bx + 2], 4               
  0000:452e  eb03             jmp 0x4533                               
  0000:4530  e932ff           jmp 0x4465                               
  0000:4533  c45e06           les bx, ptr [bp + 6]                     
  0000:4536  8b460c           mov ax, word ptr [bp + 0xc]              
  0000:4539  8b560a           mov dx, word ptr [bp + 0xa]              
  0000:453c  2689470e         mov word ptr es:[bx + 0xe], ax           
  0000:4540  2689570c         mov word ptr es:[bx + 0xc], dx           
  0000:4544  2689470a         mov word ptr es:[bx + 0xa], ax           
  0000:4548  26895708         mov word ptr es:[bx + 8], dx             
  0000:454c  26897706         mov word ptr es:[bx + 6], si             
  0000:4550  83ff01           cmp di, 1                                
  0000:4553  7505             jne 0x455a                               
  0000:4555  26834f0208       or word ptr es:[bx + 2], 8               
  0000:455a  33c0             xor ax, ax                               
  0000:455c  5f               pop di                                   
  0000:455d  5e               pop si                                   
  0000:455e  5d               pop bp                                   
  0000:455f  cb               retf                                     

proc_0000_4560:
  0000:4560  55               push bp                                  
  0000:4561  8bec             mov bp, sp                               
  0000:4563  56               push si                                  
  0000:4564  8b7608           mov si, word ptr [bp + 8]                
  0000:4567  56               push si                                  
  0000:4568  ff760c           push word ptr [bp + 0xc]                 
  0000:456b  ff760a           push word ptr [bp + 0xa]                 
  0000:456e  c45e04           les bx, ptr [bp + 4]                     
  0000:4571  26ff7702         push word ptr es:[bx + 2]                
  0000:4575  26ff37           push word ptr es:[bx]                    
  0000:4578  90               nop                                      
  0000:4579  0e               push cs                                  
  0000:457a  e867fa           call 0x3fe4                              -> 0000:3fe4
  0000:457d  83c40a           add sp, 0xa                              
  0000:4580  c45e04           les bx, ptr [bp + 4]                     
  0000:4583  260137           add word ptr es:[bx], si                 
  0000:4586  53               push bx                                  
  0000:4587  06               push es                                  
  0000:4588  268e4702         mov es, word ptr es:[bx + 2]             
  0000:458c  8cc0             mov ax, es                               
  0000:458e  07               pop es                                   
  0000:458f  5b               pop bx                                   
  0000:4590  268b1f           mov bx, word ptr es:[bx]                 
  0000:4593  8ec0             mov es, ax                               
  0000:4595  26c60700         mov byte ptr es:[bx], 0                  
  0000:4599  8bc6             mov ax, si                               
  0000:459b  5e               pop si                                   
  0000:459c  5d               pop bp                                   
  0000:459d  c20a00           ret 0xa                                  

proc_0000_45a0:
  0000:45a0  55               push bp                                  
  0000:45a1  8bec             mov bp, sp                               
  0000:45a3  c45e06           les bx, ptr [bp + 6]                     
  0000:45a6  26c60700         mov byte ptr es:[bx], 0                  
  0000:45aa  b86045           mov ax, 0x4560                           
  0000:45ad  50               push ax                                  
  0000:45ae  16               push ss                                  
  0000:45af  8d4606           lea ax, [bp + 6]                         
  0000:45b2  50               push ax                                  
  0000:45b3  ff760c           push word ptr [bp + 0xc]                 
  0000:45b6  ff760a           push word ptr [bp + 0xa]                 
  0000:45b9  8d460e           lea ax, [bp + 0xe]                       
  0000:45bc  50               push ax                                  
  0000:45bd  e8b2e0           call 0x2672                              -> 0000:2672
  0000:45c0  5d               pop bp                                   
  0000:45c1  cb               retf                                     

proc_0000_45c2:
  0000:45c2  55               push bp                                  
  0000:45c3  8bec             mov bp, sp                               
  0000:45c5  c45e06           les bx, ptr [bp + 6]                     
  0000:45c8  26c60700         mov byte ptr es:[bx], 0                  
  0000:45cc  b86045           mov ax, 0x4560                           
  0000:45cf  50               push ax                                  
  0000:45d0  16               push ss                                  
  0000:45d1  8d4606           lea ax, [bp + 6]                         
  0000:45d4  50               push ax                                  
  0000:45d5  ff760c           push word ptr [bp + 0xc]                 
  0000:45d8  ff760a           push word ptr [bp + 0xa]                 
  0000:45db  ff760e           push word ptr [bp + 0xe]                 
  0000:45de  e891e0           call 0x2672                              -> 0000:2672
  0000:45e1  5d               pop bp                                   
  0000:45e2  cb               retf                                     

proc_0000_45e3:
  0000:45e3  55               push bp                                  
  0000:45e4  8bec             mov bp, sp                               
  0000:45e6  56               push si                                  
  0000:45e7  c45e04           les bx, ptr [bp + 4]                     
  0000:45ea  268b4702         mov ax, word ptr es:[bx + 2]             
  0000:45ee  268b37           mov si, word ptr es:[bx]                 
  0000:45f1  26ff07           inc word ptr es:[bx]                     
  0000:45f4  8ec0             mov es, ax                               
  0000:45f6  268a14           mov dl, byte ptr es:[si]                 
  0000:45f9  8ac2             mov al, dl                               
  0000:45fb  0ac0             or al, al                                
  0000:45fd  7505             jne 0x4604                               
  0000:45ff  b8ffff           mov ax, 0xffff                           
  0000:4602  eb04             jmp 0x4608                               
  0000:4604  8ac2             mov al, dl                               
  0000:4606  b400             mov ah, 0                                
  0000:4608  5e               pop si                                   
  0000:4609  5d               pop bp                                   
  0000:460a  c3               ret                                      

proc_0000_460b:
  0000:460b  55               push bp                                  
  0000:460c  8bec             mov bp, sp                               
  0000:460e  c45e06           les bx, ptr [bp + 6]                     
  0000:4611  26ff0f           dec word ptr es:[bx]                     
  0000:4614  5d               pop bp                                   
  0000:4615  c3               ret                                      

proc_0000_4616:
  0000:4616  55               push bp                                  
  0000:4617  8bec             mov bp, sp                               
  0000:4619  16               push ss                                  
  0000:461a  8d460e           lea ax, [bp + 0xe]                       
  0000:461d  50               push ax                                  
  0000:461e  ff760c           push word ptr [bp + 0xc]                 
  0000:4621  ff760a           push word ptr [bp + 0xa]                 
  0000:4624  16               push ss                                  
  0000:4625  8d4606           lea ax, [bp + 6]                         
  0000:4628  50               push ax                                  
  0000:4629  b80b46           mov ax, 0x460b                           
  0000:462c  50               push ax                                  
  0000:462d  b8e345           mov ax, 0x45e3                           
  0000:4630  50               push ax                                  
  0000:4631  e833d8           call 0x1e67                              -> 0000:1e67
  0000:4634  83c410           add sp, 0x10                             
  0000:4637  5d               pop bp                                   
  0000:4638  cb               retf                                     

proc_0000_4639:
  0000:4639  55               push bp                                  
  0000:463a  8bec             mov bp, sp                               
  0000:463c  ff7610           push word ptr [bp + 0x10]                
  0000:463f  ff760e           push word ptr [bp + 0xe]                 
  0000:4642  ff760c           push word ptr [bp + 0xc]                 
  0000:4645  ff760a           push word ptr [bp + 0xa]                 
  0000:4648  16               push ss                                  
  0000:4649  8d4606           lea ax, [bp + 6]                         
  0000:464c  50               push ax                                  
  0000:464d  b80b46           mov ax, 0x460b                           
  0000:4650  50               push ax                                  
  0000:4651  b8e345           mov ax, 0x45e3                           
  0000:4654  50               push ax                                  
  0000:4655  e80fd8           call 0x1e67                              -> 0000:1e67
  0000:4658  83c410           add sp, 0x10                             
  0000:465b  5d               pop bp                                   
  0000:465c  cb               retf                                     

proc_0000_465d:
  0000:465d  55               push bp                                  
  0000:465e  8bec             mov bp, sp                               
  0000:4660  56               push si                                  
  0000:4661  57               push di                                  
  0000:4662  fc               cld                                      
  0000:4663  1e               push ds                                  
  0000:4664  c47e06           les di, ptr [bp + 6]                     
  0000:4667  8bd7             mov dx, di                               
  0000:4669  32c0             xor al, al                               
  0000:466b  b9ffff           mov cx, 0xffff                           
  0000:466e  f2ae             repne scasb al, byte ptr es:[di]         
  0000:4670  06               push es                                  
  0000:4671  8d75ff           lea si, [di - 1]                         
  0000:4674  c47e0a           les di, ptr [bp + 0xa]                   
  0000:4677  b9ffff           mov cx, 0xffff                           
  0000:467a  f2ae             repne scasb al, byte ptr es:[di]         
  0000:467c  f7d1             not cx                                   
  0000:467e  2bf9             sub di, cx                               
  0000:4680  06               push es                                  
  0000:4681  1f               pop ds                                   
  0000:4682  07               pop es                                   
  0000:4683  87f7             xchg di, si                              
  0000:4685  f7c60100         test si, 1                               
  0000:4689  7402             je 0x468d                                
  0000:468b  a4               movsb byte ptr es:[di], byte ptr [si]    
  0000:468c  49               dec cx                                   
  0000:468d  d1e9             shr cx, 1                                
  0000:468f  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0000:4691  7301             jae 0x4694                               
  0000:4693  a4               movsb byte ptr es:[di], byte ptr [si]    
  0000:4694  92               xchg dx, ax                              
  0000:4695  8cc2             mov dx, es                               
  0000:4697  1f               pop ds                                   
  0000:4698  5f               pop di                                   
  0000:4699  5e               pop si                                   
  0000:469a  5d               pop bp                                   
  0000:469b  cb               retf                                     

proc_0000_469c:
  0000:469c  55               push bp                                  
  0000:469d  8bec             mov bp, sp                               
  0000:469f  56               push si                                  
  0000:46a0  57               push di                                  
  0000:46a1  fc               cld                                      
  0000:46a2  c47e0a           les di, ptr [bp + 0xa]                   
  0000:46a5  8bf7             mov si, di                               
  0000:46a7  32c0             xor al, al                               
  0000:46a9  b9ffff           mov cx, 0xffff                           
  0000:46ac  f2ae             repne scasb al, byte ptr es:[di]         
  0000:46ae  f7d1             not cx                                   
  0000:46b0  1e               push ds                                  
  0000:46b1  8cc0             mov ax, es                               
  0000:46b3  8ed8             mov ds, ax                               
  0000:46b5  c47e06           les di, ptr [bp + 6]                     
  0000:46b8  f3a4             rep movsb byte ptr es:[di], byte ptr [si] 
  0000:46ba  1f               pop ds                                   
  0000:46bb  8b5608           mov dx, word ptr [bp + 8]                
  0000:46be  8b4606           mov ax, word ptr [bp + 6]                
  0000:46c1  5f               pop di                                   
  0000:46c2  5e               pop si                                   
  0000:46c3  5d               pop bp                                   
  0000:46c4  cb               retf                                     

proc_0000_46c5:
  0000:46c5  55               push bp                                  
  0000:46c6  8bec             mov bp, sp                               
  0000:46c8  57               push di                                  
  0000:46c9  c47e06           les di, ptr [bp + 6]                     
  0000:46cc  33c0             xor ax, ax                               
  0000:46ce  3b4608           cmp ax, word ptr [bp + 8]                
  0000:46d1  7504             jne 0x46d7                               
  0000:46d3  3bc7             cmp ax, di                               
  0000:46d5  740a             je 0x46e1                                
  0000:46d7  fc               cld                                      
  0000:46d8  b9ffff           mov cx, 0xffff                           
  0000:46db  f2ae             repne scasb al, byte ptr es:[di]         
  0000:46dd  91               xchg cx, ax                              
  0000:46de  f7d0             not ax                                   
  0000:46e0  48               dec ax                                   
  0000:46e1  5f               pop di                                   
  0000:46e2  5d               pop bp                                   
  0000:46e3  cb               retf                                     

proc_0000_46e4:
  0000:46e4  55               push bp                                  
  0000:46e5  8bec             mov bp, sp                               
  0000:46e7  81ec8e00         sub sp, 0x8e                             
  0000:46eb  56               push si                                  
  0000:46ec  57               push di                                  
  0000:46ed  8b7e06           mov di, word ptr [bp + 6]                
  0000:46f0  3b3e0c11         cmp di, word ptr [0x110c]                
  0000:46f4  720a             jb 0x4700                                
  0000:46f6  b80600           mov ax, 6                                
  0000:46f9  50               push ax                                  
  0000:46fa  e80bd6           call 0x1d08                              -> 0000:1d08
  0000:46fd  e92f01           jmp 0x482f                               
  0000:4700  8b460c           mov ax, word ptr [bp + 0xc]              
  0000:4703  40               inc ax                                   
  0000:4704  3d0200           cmp ax, 2                                
  0000:4707  7305             jae 0x470e                               
  0000:4709  33c0             xor ax, ax                               
  0000:470b  e92101           jmp 0x482f                               
  0000:470e  8bdf             mov bx, di                               
  0000:4710  d1e3             shl bx, 1                                
  0000:4712  f7870e110008     test word ptr [bx + 0x110e], 0x800       
  0000:4718  7413             je 0x472d                                
  0000:471a  b80200           mov ax, 2                                
  0000:471d  50               push ax                                  
  0000:471e  33c0             xor ax, ax                               
  0000:4720  33d2             xor dx, dx                               
  0000:4722  50               push ax                                  
  0000:4723  52               push dx                                  
  0000:4724  57               push di                                  
  0000:4725  90               nop                                      
  0000:4726  0e               push cs                                  
  0000:4727  e8dcd6           call 0x1e06                              -> 0000:1e06
  0000:472a  83c408           add sp, 8                                
  0000:472d  8bdf             mov bx, di                               
  0000:472f  d1e3             shl bx, 1                                
  0000:4731  f7870e110040     test word ptr [bx + 0x110e], 0x4000      
  0000:4737  7515             jne 0x474e                               
  0000:4739  ff760c           push word ptr [bp + 0xc]                 
  0000:473c  ff760a           push word ptr [bp + 0xa]                 
  0000:473f  ff7608           push word ptr [bp + 8]                   
  0000:4742  57               push di                                  
  0000:4743  90               nop                                      
  0000:4744  0e               push cs                                  
  0000:4745  e8ed00           call 0x4835                              -> 0000:4835
  0000:4748  83c408           add sp, 8                                
  0000:474b  e9e100           jmp 0x482f                               
  0000:474e  8bdf             mov bx, di                               
  0000:4750  d1e3             shl bx, 1                                
  0000:4752  81a70e11fffd     and word ptr [bx + 0x110e], 0xfdff       
  0000:4758  8b460a           mov ax, word ptr [bp + 0xa]              
  0000:475b  8b5608           mov dx, word ptr [bp + 8]                
  0000:475e  8946f6           mov word ptr [bp - 0xa], ax              
  0000:4761  8956f4           mov word ptr [bp - 0xc], dx              
  0000:4764  8b460c           mov ax, word ptr [bp + 0xc]              
  0000:4767  8946fa           mov word ptr [bp - 6], ax                
  0000:476a  eb75             jmp 0x47e1                               
  0000:476c  ff4efa           dec word ptr [bp - 6]                    
  0000:476f  c45ef4           les bx, ptr [bp - 0xc]                   
  0000:4772  ff46f4           inc word ptr [bp - 0xc]                  
  0000:4775  268a07           mov al, byte ptr es:[bx]                 
  0000:4778  8846f9           mov byte ptr [bp - 7], al                
  0000:477b  3c0a             cmp al, 0xa                              
  0000:477d  750a             jne 0x4789                               
  0000:477f  c45efc           les bx, ptr [bp - 4]                     
  0000:4782  26c6070d         mov byte ptr es:[bx], 0xd                
  0000:4786  ff46fc           inc word ptr [bp - 4]                    
  0000:4789  c45efc           les bx, ptr [bp - 4]                     
  0000:478c  8a46f9           mov al, byte ptr [bp - 7]                
  0000:478f  268807           mov byte ptr es:[bx], al                 
  0000:4792  ff46fc           inc word ptr [bp - 4]                    
  0000:4795  8d8672ff         lea ax, [bp - 0x8e]                      
  0000:4799  8b56fc           mov dx, word ptr [bp - 4]                
  0000:479c  33db             xor bx, bx                               
  0000:479e  2bd0             sub dx, ax                               
  0000:47a0  83db00           sbb bx, 0                                
  0000:47a3  0bdb             or bx, bx                                
  0000:47a5  7c44             jl 0x47eb                                
  0000:47a7  7506             jne 0x47af                               
  0000:47a9  81fa8000         cmp dx, 0x80                             
  0000:47ad  723c             jb 0x47eb                                
  0000:47af  8d8672ff         lea ax, [bp - 0x8e]                      
  0000:47b3  8b76fc           mov si, word ptr [bp - 4]                
  0000:47b6  33d2             xor dx, dx                               
  0000:47b8  2bf0             sub si, ax                               
  0000:47ba  83da00           sbb dx, 0                                
  0000:47bd  56               push si                                  
  0000:47be  16               push ss                                  
  0000:47bf  50               push ax                                  
  0000:47c0  57               push di                                  
  0000:47c1  90               nop                                      
  0000:47c2  0e               push cs                                  
  0000:47c3  e86f00           call 0x4835                              -> 0000:4835
  0000:47c6  83c408           add sp, 8                                
  0000:47c9  8bd0             mov dx, ax                               
  0000:47cb  3bc6             cmp ax, si                               
  0000:47cd  7412             je 0x47e1                                
  0000:47cf  83faff           cmp dx, -1                               
  0000:47d2  7505             jne 0x47d9                               
  0000:47d4  b8ffff           mov ax, 0xffff                           
  0000:47d7  eb51             jmp 0x482a                               
  0000:47d9  8b460c           mov ax, word ptr [bp + 0xc]              
  0000:47dc  2b46fa           sub ax, word ptr [bp - 6]                
  0000:47df  eb45             jmp 0x4826                               
  0000:47e1  8d8672ff         lea ax, [bp - 0x8e]                      
  0000:47e5  8c56fe           mov word ptr [bp - 2], ss                
  0000:47e8  8946fc           mov word ptr [bp - 4], ax                
  0000:47eb  837efa00         cmp word ptr [bp - 6], 0                 
  0000:47ef  7403             je 0x47f4                                
  0000:47f1  e978ff           jmp 0x476c                               
  0000:47f4  8d8672ff         lea ax, [bp - 0x8e]                      
  0000:47f8  8b76fc           mov si, word ptr [bp - 4]                
  0000:47fb  33d2             xor dx, dx                               
  0000:47fd  2bf0             sub si, ax                               
  0000:47ff  83da00           sbb dx, 0                                
  0000:4802  8bc6             mov ax, si                               
  0000:4804  0bc0             or ax, ax                                
  0000:4806  7624             jbe 0x482c                               
  0000:4808  56               push si                                  
  0000:4809  16               push ss                                  
  0000:480a  8d8672ff         lea ax, [bp - 0x8e]                      
  0000:480e  50               push ax                                  
  0000:480f  57               push di                                  
  0000:4810  90               nop                                      
  0000:4811  0e               push cs                                  
  0000:4812  e82000           call 0x4835                              -> 0000:4835
  0000:4815  83c408           add sp, 8                                
  0000:4818  8bd0             mov dx, ax                               
  0000:481a  3bc6             cmp ax, si                               
  0000:481c  740e             je 0x482c                                
  0000:481e  83faff           cmp dx, -1                               
  0000:4821  74b1             je 0x47d4                                
  0000:4823  8b460c           mov ax, word ptr [bp + 0xc]              
  0000:4826  03c2             add ax, dx                               
  0000:4828  2bc6             sub ax, si                               
  0000:482a  eb03             jmp 0x482f                               
  0000:482c  8b460c           mov ax, word ptr [bp + 0xc]              
  0000:482f  5f               pop di                                   
  0000:4830  5e               pop si                                   
  0000:4831  8be5             mov sp, bp                               
  0000:4833  5d               pop bp                                   
  0000:4834  cb               retf                                     

proc_0000_4835:
  0000:4835  55               push bp                                  
  0000:4836  8bec             mov bp, sp                               
  0000:4838  8b5e06           mov bx, word ptr [bp + 6]                
  0000:483b  d1e3             shl bx, 1                                
  0000:483d  f7870e110100     test word ptr [bx + 0x110e], 1           
  0000:4843  7406             je 0x484b                                
  0000:4845  b80500           mov ax, 5                                
  0000:4848  50               push ax                                  
  0000:4849  eb21             jmp 0x486c                               
  0000:484b  1e               push ds                                  
  0000:484c  b440             mov ah, 0x40                             
  0000:484e  8b5e06           mov bx, word ptr [bp + 6]                
  0000:4851  8b4e0c           mov cx, word ptr [bp + 0xc]              
  0000:4854  c55608           lds dx, ptr [bp + 8]                     
  0000:4857  cd21             int 0x21                                 
  0000:4859  1f               pop ds                                   
  0000:485a  720f             jb 0x486b                                
  0000:485c  50               push ax                                  
  0000:485d  8b5e06           mov bx, word ptr [bp + 6]                
  0000:4860  d1e3             shl bx, 1                                
  0000:4862  818f0e110010     or word ptr [bx + 0x110e], 0x1000        
  0000:4868  58               pop ax                                   
  0000:4869  eb04             jmp 0x486f                               
  0000:486b  50               push ax                                  
  0000:486c  e899d4           call 0x1d08                              -> 0000:1d08
  0000:486f  5d               pop bp                                   
  0000:4870  cb               retf                                     

proc_0000_4871:
  0000:4871  55               push bp                                  
  0000:4872  8bec             mov bp, sp                               
  0000:4874  83ec04           sub sp, 4                                
  0000:4877  56               push si                                  
  0000:4878  be0400           mov si, 4                                
  0000:487b  8c5efe           mov word ptr [bp - 2], ds                
  0000:487e  c746fc7c0f       mov word ptr [bp - 4], 0xf7c             
  0000:4883  eb1b             jmp 0x48a0                               
  0000:4885  c45efc           les bx, ptr [bp - 4]                     
  0000:4888  26f747020300     test word ptr es:[bx + 2], 3             
  0000:488e  740b             je 0x489b                                
  0000:4890  ff76fe           push word ptr [bp - 2]                   
  0000:4893  53               push bx                                  
  0000:4894  90               nop                                      
  0000:4895  0e               push cs                                  
  0000:4896  e8cef3           call 0x3c67                              -> 0000:3c67
  0000:4899  59               pop cx                                   
  0000:489a  59               pop cx                                   
  0000:489b  4e               dec si                                   
  0000:489c  8346fc14         add word ptr [bp - 4], 0x14              
