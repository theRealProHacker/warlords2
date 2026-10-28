; seg 09a0  img 0x9a00..0x9e80  file off 0xa600
  09a0:0000  07               pop es                                   
  09a0:0001  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:0004  8b46fe           mov ax, word ptr [bp - 2]                
  09a0:0007  268907           mov word ptr es:[bx], ax                 
  09a0:000a  c9               leave                                    
  09a0:000b  cb               retf                                     

proc_09a0_000c:
  09a0:000c  55               push bp                                  
  09a0:000d  8bec             mov bp, sp                               
  09a0:000f  c45e06           les bx, ptr [bp + 6]                     
  09a0:0012  8b460a           mov ax, word ptr [bp + 0xa]              
  09a0:0015  268907           mov word ptr es:[bx], ax                 
  09a0:0018  c45e06           les bx, ptr [bp + 6]                     
  09a0:001b  8b460c           mov ax, word ptr [bp + 0xc]              
  09a0:001e  26894702         mov word ptr es:[bx + 2], ax             
  09a0:0022  8b5608           mov dx, word ptr [bp + 8]                
  09a0:0025  8b4606           mov ax, word ptr [bp + 6]                
  09a0:0028  eb00             jmp 0x2a                                 
  09a0:002a  5d               pop bp                                   
  09a0:002b  cb               retf                                     

proc_09a0_002c:
  09a0:002c  55               push bp                                  
  09a0:002d  8bec             mov bp, sp                               
  09a0:002f  c45e06           les bx, ptr [bp + 6]                     
  09a0:0032  8b460a           mov ax, word ptr [bp + 0xa]              
  09a0:0035  268907           mov word ptr es:[bx], ax                 
  09a0:0038  c45e06           les bx, ptr [bp + 6]                     
  09a0:003b  8b460c           mov ax, word ptr [bp + 0xc]              
  09a0:003e  26894702         mov word ptr es:[bx + 2], ax             
  09a0:0042  c45e06           les bx, ptr [bp + 6]                     
  09a0:0045  8b460e           mov ax, word ptr [bp + 0xe]              
  09a0:0048  26894704         mov word ptr es:[bx + 4], ax             
  09a0:004c  c45e06           les bx, ptr [bp + 6]                     
  09a0:004f  8b4610           mov ax, word ptr [bp + 0x10]             
  09a0:0052  26894706         mov word ptr es:[bx + 6], ax             
  09a0:0056  8b5608           mov dx, word ptr [bp + 8]                
  09a0:0059  8b4606           mov ax, word ptr [bp + 6]                
  09a0:005c  eb00             jmp 0x5e                                 
  09a0:005e  5d               pop bp                                   
  09a0:005f  cb               retf                                     

proc_09a0_0060:
  09a0:0060  55               push bp                                  
  09a0:0061  8bec             mov bp, sp                               
  09a0:0063  c45e06           les bx, ptr [bp + 6]                     
  09a0:0066  8b460a           mov ax, word ptr [bp + 0xa]              
  09a0:0069  260107           add word ptr es:[bx], ax                 
  09a0:006c  c45e06           les bx, ptr [bp + 6]                     
  09a0:006f  8b460c           mov ax, word ptr [bp + 0xc]              
  09a0:0072  26014702         add word ptr es:[bx + 2], ax             
  09a0:0076  8b5608           mov dx, word ptr [bp + 8]                
  09a0:0079  8b4606           mov ax, word ptr [bp + 6]                
  09a0:007c  eb00             jmp 0x7e                                 
  09a0:007e  5d               pop bp                                   
  09a0:007f  cb               retf                                     

proc_09a0_0080:
  09a0:0080  55               push bp                                  
  09a0:0081  8bec             mov bp, sp                               
  09a0:0083  8b560a           mov dx, word ptr [bp + 0xa]              
  09a0:0086  8b4e0c           mov cx, word ptr [bp + 0xc]              
  09a0:0089  c45e06           les bx, ptr [bp + 6]                     
  09a0:008c  260117           add word ptr es:[bx], dx                 
  09a0:008f  c45e06           les bx, ptr [bp + 6]                     
  09a0:0092  26014f02         add word ptr es:[bx + 2], cx             
  09a0:0096  8bc2             mov ax, dx                               
  09a0:0098  d1e0             shl ax, 1                                
  09a0:009a  c45e06           les bx, ptr [bp + 6]                     
  09a0:009d  26294704         sub word ptr es:[bx + 4], ax             
  09a0:00a1  8bc1             mov ax, cx                               
  09a0:00a3  d1e0             shl ax, 1                                
  09a0:00a5  c45e06           les bx, ptr [bp + 6]                     
  09a0:00a8  26294706         sub word ptr es:[bx + 6], ax             
  09a0:00ac  8b5608           mov dx, word ptr [bp + 8]                
  09a0:00af  8b4606           mov ax, word ptr [bp + 6]                
  09a0:00b2  eb00             jmp 0xb4                                 
  09a0:00b4  5d               pop bp                                   
  09a0:00b5  cb               retf                                     

proc_09a0_00b6:
  09a0:00b6  55               push bp                                  
  09a0:00b7  8bec             mov bp, sp                               
  09a0:00b9  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:00bc  26ff7702         push word ptr es:[bx + 2]                
  09a0:00c0  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:00c3  26ff37           push word ptr es:[bx]                    
  09a0:00c6  ff7608           push word ptr [bp + 8]                   
  09a0:00c9  ff7606           push word ptr [bp + 6]                   
  09a0:00cc  90               nop                                      
  09a0:00cd  0e               push cs                                  
  09a0:00ce  e8de00           call 0x1af                               -> 09a0:01af
  09a0:00d1  83c408           add sp, 8                                
  09a0:00d4  eb00             jmp 0xd6                                 
  09a0:00d6  5d               pop bp                                   
  09a0:00d7  cb               retf                                     

proc_09a0_00d8:
  09a0:00d8  55               push bp                                  
  09a0:00d9  8bec             mov bp, sp                               
  09a0:00db  56               push si                                  
  09a0:00dc  c45e06           les bx, ptr [bp + 6]                     
  09a0:00df  268b07           mov ax, word ptr es:[bx]                 
  09a0:00e2  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:00e5  263b07           cmp ax, word ptr es:[bx]                 
  09a0:00e8  7d0b             jge 0xf5                                 
  09a0:00ea  c45e06           les bx, ptr [bp + 6]                     
  09a0:00ed  268b17           mov dx, word ptr es:[bx]                 
  09a0:00f0  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:00f3  eb09             jmp 0xfe                                 
  09a0:00f5  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:00f8  268b17           mov dx, word ptr es:[bx]                 
  09a0:00fb  c45e06           les bx, ptr [bp + 6]                     
  09a0:00fe  268b37           mov si, word ptr es:[bx]                 
  09a0:0101  c45e06           les bx, ptr [bp + 6]                     
  09a0:0104  268b4702         mov ax, word ptr es:[bx + 2]             
  09a0:0108  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:010b  263b4702         cmp ax, word ptr es:[bx + 2]             
  09a0:010f  7d0c             jge 0x11d                                
  09a0:0111  c45e06           les bx, ptr [bp + 6]                     
  09a0:0114  268b4f02         mov cx, word ptr es:[bx + 2]             
  09a0:0118  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:011b  eb0a             jmp 0x127                                
  09a0:011d  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:0120  268b4f02         mov cx, word ptr es:[bx + 2]             
  09a0:0124  c45e06           les bx, ptr [bp + 6]                     
  09a0:0127  268b5f02         mov bx, word ptr es:[bx + 2]             
  09a0:012b  53               push bx                                  
  09a0:012c  56               push si                                  
  09a0:012d  51               push cx                                  
  09a0:012e  52               push dx                                  
  09a0:012f  ff7610           push word ptr [bp + 0x10]                
  09a0:0132  ff760e           push word ptr [bp + 0xe]                 
  09a0:0135  0e               push cs                                  
  09a0:0136  e8f3fe           call 0x2c                                -> 09a0:002c
  09a0:0139  83c40c           add sp, 0xc                              
  09a0:013c  eb00             jmp 0x13e                                
  09a0:013e  5e               pop si                                   
  09a0:013f  5d               pop bp                                   
  09a0:0140  cb               retf                                     

proc_09a0_0141:
  09a0:0141  55               push bp                                  
  09a0:0142  8bec             mov bp, sp                               
  09a0:0144  c45e06           les bx, ptr [bp + 6]                     
  09a0:0147  268b07           mov ax, word ptr es:[bx]                 
  09a0:014a  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:014d  263b07           cmp ax, word ptr es:[bx]                 
  09a0:0150  7535             jne 0x187                                
  09a0:0152  c45e06           les bx, ptr [bp + 6]                     
  09a0:0155  268b4702         mov ax, word ptr es:[bx + 2]             
  09a0:0159  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:015c  263b4702         cmp ax, word ptr es:[bx + 2]             
  09a0:0160  7525             jne 0x187                                
  09a0:0162  c45e06           les bx, ptr [bp + 6]                     
  09a0:0165  268b4704         mov ax, word ptr es:[bx + 4]             
  09a0:0169  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:016c  263b4704         cmp ax, word ptr es:[bx + 4]             
  09a0:0170  7515             jne 0x187                                
  09a0:0172  c45e06           les bx, ptr [bp + 6]                     
  09a0:0175  268b4706         mov ax, word ptr es:[bx + 6]             
  09a0:0179  c45e0a           les bx, ptr [bp + 0xa]                   
  09a0:017c  263b4706         cmp ax, word ptr es:[bx + 6]             
  09a0:0180  7505             jne 0x187                                
  09a0:0182  b80100           mov ax, 1                                
  09a0:0185  eb02             jmp 0x189                                
  09a0:0187  33c0             xor ax, ax                               
  09a0:0189  eb00             jmp 0x18b                                
  09a0:018b  5d               pop bp                                   
  09a0:018c  cb               retf                                     

proc_09a0_018d:
  09a0:018d  55               push bp                                  
  09a0:018e  8bec             mov bp, sp                               
  09a0:0190  c45e06           les bx, ptr [bp + 6]                     
  09a0:0193  26837f0400       cmp word ptr es:[bx + 4], 0              
  09a0:0198  7e0a             jle 0x1a4                                
  09a0:019a  c45e06           les bx, ptr [bp + 6]                     
  09a0:019d  26837f0600       cmp word ptr es:[bx + 6], 0              
  09a0:01a2  7f05             jg 0x1a9                                 
  09a0:01a4  b80100           mov ax, 1                                
  09a0:01a7  eb02             jmp 0x1ab                                
  09a0:01a9  33c0             xor ax, ax                               
  09a0:01ab  eb00             jmp 0x1ad                                
  09a0:01ad  5d               pop bp                                   
  09a0:01ae  cb               retf                                     

proc_09a0_01af:
  09a0:01af  55               push bp                                  
  09a0:01b0  8bec             mov bp, sp                               
  09a0:01b2  56               push si                                  
  09a0:01b3  8b560a           mov dx, word ptr [bp + 0xa]              
  09a0:01b6  8b4e0c           mov cx, word ptr [bp + 0xc]              
  09a0:01b9  c45e06           les bx, ptr [bp + 6]                     
  09a0:01bc  263917           cmp word ptr es:[bx], dx                 
  09a0:01bf  7f33             jg 0x1f4                                 
  09a0:01c1  c45e06           les bx, ptr [bp + 6]                     
  09a0:01c4  06               push es                                  
  09a0:01c5  c47606           les si, ptr [bp + 6]                     
  09a0:01c8  268b04           mov ax, word ptr es:[si]                 
  09a0:01cb  07               pop es                                   
  09a0:01cc  26034704         add ax, word ptr es:[bx + 4]             
  09a0:01d0  3bc2             cmp ax, dx                               
  09a0:01d2  7e20             jle 0x1f4                                
  09a0:01d4  c45e06           les bx, ptr [bp + 6]                     
  09a0:01d7  26394f02         cmp word ptr es:[bx + 2], cx             
  09a0:01db  7f17             jg 0x1f4                                 
  09a0:01dd  c45e06           les bx, ptr [bp + 6]                     
  09a0:01e0  268b4702         mov ax, word ptr es:[bx + 2]             
  09a0:01e4  c45e06           les bx, ptr [bp + 6]                     
  09a0:01e7  26034706         add ax, word ptr es:[bx + 6]             
  09a0:01eb  3bc1             cmp ax, cx                               
  09a0:01ed  7e05             jle 0x1f4                                
  09a0:01ef  b80100           mov ax, 1                                
  09a0:01f2  eb02             jmp 0x1f6                                
  09a0:01f4  33c0             xor ax, ax                               
  09a0:01f6  eb00             jmp 0x1f8                                
  09a0:01f8  5e               pop si                                   
  09a0:01f9  5d               pop bp                                   
  09a0:01fa  cb               retf                                     

proc_09a0_01fb:
  09a0:01fb  55               push bp                                  
  09a0:01fc  8bec             mov bp, sp                               
  09a0:01fe  56               push si                                  
  09a0:01ff  c45e06           les bx, ptr [bp + 6]                     
  09a0:0202  26ff7704         push word ptr es:[bx + 4]                
  09a0:0206  c45e06           les bx, ptr [bp + 6]                     
  09a0:0209  26ff7702         push word ptr es:[bx + 2]                
  09a0:020d  c45e06           les bx, ptr [bp + 6]                     
  09a0:0210  26ff37           push word ptr es:[bx]                    
  09a0:0213  9afc026609       lcall 0x966, 0x2fc                       -> 0966:02fc [reloc]
  09a0:0218  83c406           add sp, 6                                
  09a0:021b  c45e06           les bx, ptr [bp + 6]                     
  09a0:021e  26ff7704         push word ptr es:[bx + 4]                
  09a0:0222  c45e06           les bx, ptr [bp + 6]                     
  09a0:0225  268b4702         mov ax, word ptr es:[bx + 2]             
  09a0:0229  c45e06           les bx, ptr [bp + 6]                     
  09a0:022c  26034706         add ax, word ptr es:[bx + 6]             
  09a0:0230  48               dec ax                                   
  09a0:0231  50               push ax                                  
  09a0:0232  c45e06           les bx, ptr [bp + 6]                     
  09a0:0235  26ff37           push word ptr es:[bx]                    
  09a0:0238  9afc026609       lcall 0x966, 0x2fc                       -> 0966:02fc [reloc]
  09a0:023d  83c406           add sp, 6                                
  09a0:0240  c45e06           les bx, ptr [bp + 6]                     
  09a0:0243  26ff7706         push word ptr es:[bx + 6]                
  09a0:0247  c45e06           les bx, ptr [bp + 6]                     
  09a0:024a  26ff7702         push word ptr es:[bx + 2]                
  09a0:024e  c45e06           les bx, ptr [bp + 6]                     
  09a0:0251  26ff37           push word ptr es:[bx]                    
  09a0:0254  9a42036609       lcall 0x966, 0x342                       -> 0966:0342 [reloc]
  09a0:0259  83c406           add sp, 6                                
  09a0:025c  c45e06           les bx, ptr [bp + 6]                     
  09a0:025f  26ff7706         push word ptr es:[bx + 6]                
  09a0:0263  c45e06           les bx, ptr [bp + 6]                     
  09a0:0266  26ff7702         push word ptr es:[bx + 2]                
  09a0:026a  c45e06           les bx, ptr [bp + 6]                     
  09a0:026d  06               push es                                  
  09a0:026e  c47606           les si, ptr [bp + 6]                     
  09a0:0271  268b04           mov ax, word ptr es:[si]                 
  09a0:0274  07               pop es                                   
  09a0:0275  26034704         add ax, word ptr es:[bx + 4]             
  09a0:0279  48               dec ax                                   
  09a0:027a  50               push ax                                  
  09a0:027b  9a42036609       lcall 0x966, 0x342                       -> 0966:0342 [reloc]
  09a0:0280  83c406           add sp, 6                                
  09a0:0283  5e               pop si                                   
  09a0:0284  5d               pop bp                                   
  09a0:0285  cb               retf                                     

proc_09a0_0286:
  09a0:0286  55               push bp                                  
  09a0:0287  8bec             mov bp, sp                               
  09a0:0289  56               push si                                  
  09a0:028a  833ea20600       cmp word ptr [0x6a2], 0                  
  09a0:028f  7410             je 0x2a1                                 
  09a0:0291  ff7608           push word ptr [bp + 8]                   
  09a0:0294  ff7606           push word ptr [bp + 6]                   
  09a0:0297  90               nop                                      
  09a0:0298  0e               push cs                                  
  09a0:0299  e83a00           call 0x2d6                               -> 09a0:02d6
  09a0:029c  83c404           add sp, 4                                
  09a0:029f  eb32             jmp 0x2d3                                
  09a0:02a1  c45e06           les bx, ptr [bp + 6]                     
  09a0:02a4  268b7702         mov si, word ptr es:[bx + 2]             
  09a0:02a8  eb17             jmp 0x2c1                                
  09a0:02aa  c45e06           les bx, ptr [bp + 6]                     
  09a0:02ad  26ff7704         push word ptr es:[bx + 4]                
  09a0:02b1  56               push si                                  
  09a0:02b2  c45e06           les bx, ptr [bp + 6]                     
  09a0:02b5  26ff37           push word ptr es:[bx]                    
  09a0:02b8  9afc026609       lcall 0x966, 0x2fc                       -> 0966:02fc [reloc]
  09a0:02bd  83c406           add sp, 6                                
  09a0:02c0  46               inc si                                   
  09a0:02c1  c45e06           les bx, ptr [bp + 6]                     
  09a0:02c4  268b4702         mov ax, word ptr es:[bx + 2]             
  09a0:02c8  c45e06           les bx, ptr [bp + 6]                     
  09a0:02cb  26034706         add ax, word ptr es:[bx + 6]             
  09a0:02cf  3bc6             cmp ax, si                               
  09a0:02d1  7fd7             jg 0x2aa                                 
  09a0:02d3  5e               pop si                                   
  09a0:02d4  5d               pop bp                                   
  09a0:02d5  cb               retf                                     
  09a0:02d6  c8160000         enter 0x16, 0                            
  09a0:02da  56               push si                                  
  09a0:02db  57               push di                                  
  09a0:02dc  c45e06           les bx, ptr [bp + 6]                     
  09a0:02df  268b4702         mov ax, word ptr es:[bx + 2]             
  09a0:02e3  c41e5b1a         les bx, ptr [0x1a5b]                     
  09a0:02e7  2603470a         add ax, word ptr es:[bx + 0xa]           
  09a0:02eb  8946f6           mov word ptr [bp - 0xa], ax              
  09a0:02ee  c41e5b1a         les bx, ptr [0x1a5b]                     
  09a0:02f2  06               push es                                  
  09a0:02f3  c47606           les si, ptr [bp + 6]                     
  09a0:02f6  268b04           mov ax, word ptr es:[si]                 
  09a0:02f9  07               pop es                                   
  09a0:02fa  26034708         add ax, word ptr es:[bx + 8]             
  09a0:02fe  8bf0             mov si, ax                               
  09a0:0300  c41e5b1a         les bx, ptr [0x1a5b]                     
  09a0:0304  268b475d         mov ax, word ptr es:[bx + 0x5d]          
  09a0:0308  8946f4           mov word ptr [bp - 0xc], ax              
  09a0:030b  c746f00000       mov word ptr [bp - 0x10], 0              
  09a0:0310  33c9             xor cx, cx                               
  09a0:0312  c41e0908         les bx, ptr [0x809]                      
  09a0:0316  26833f01         cmp word ptr es:[bx], 1                  
  09a0:031a  7414             je 0x330                                 
  09a0:031c  c41e0908         les bx, ptr [0x809]                      
  09a0:0320  26833f02         cmp word ptr es:[bx], 2                  
  09a0:0324  740a             je 0x330                                 
  09a0:0326  c41e0908         les bx, ptr [0x809]                      
  09a0:032a  26833f04         cmp word ptr es:[bx], 4                  
  09a0:032e  7505             jne 0x335                                
  09a0:0330  b85000           mov ax, 0x50                             
  09a0:0333  eb03             jmp 0x338                                
  09a0:0335  b82800           mov ax, 0x28                             
  09a0:0338  8946ec           mov word ptr [bp - 0x14], ax             
  09a0:033b  8a46eb           mov al, byte ptr [bp - 0x15]             
  09a0:033e  8846eb           mov byte ptr [bp - 0x15], al             
  09a0:0341  8bc6             mov ax, si                               
  09a0:0343  bb0800           mov bx, 8                                
  09a0:0346  99               cdq                                      
  09a0:0347  f7fb             idiv bx                                  
  09a0:0349  8bda             mov bx, dx                               
  09a0:034b  8a875008         mov al, byte ptr [bx + 0x850]            
  09a0:034f  b400             mov ah, 0                                
  09a0:0351  8946f2           mov word ptr [bp - 0xe], ax              
  09a0:0354  8bc6             mov ax, si                               
  09a0:0356  bb0800           mov bx, 8                                
  09a0:0359  99               cdq                                      
  09a0:035a  f7fb             idiv bx                                  
  09a0:035c  b80800           mov ax, 8                                
  09a0:035f  2bc2             sub ax, dx                               
  09a0:0361  8946ee           mov word ptr [bp - 0x12], ax             
  09a0:0364  c45e06           les bx, ptr [bp + 6]                     
  09a0:0367  8bc6             mov ax, si                               
  09a0:0369  26034704         add ax, word ptr es:[bx + 4]             
  09a0:036d  48               dec ax                                   
  09a0:036e  bb0800           mov bx, 8                                
  09a0:0371  99               cdq                                      
  09a0:0372  f7fb             idiv bx                                  
  09a0:0374  8bfa             mov di, dx                               
  09a0:0376  8bda             mov bx, dx                               
  09a0:0378  8a875808         mov al, byte ptr [bx + 0x858]            
  09a0:037c  b400             mov ah, 0                                
  09a0:037e  8bc8             mov cx, ax                               
  09a0:0380  47               inc di                                   
  09a0:0381  c45e06           les bx, ptr [bp + 6]                     
  09a0:0384  268b4704         mov ax, word ptr es:[bx + 4]             
  09a0:0388  3b46ee           cmp ax, word ptr [bp - 0x12]             
  09a0:038b  7f08             jg 0x395                                 
  09a0:038d  214ef2           and word ptr [bp - 0xe], cx              
  09a0:0390  b9ffff           mov cx, 0xffff                           
  09a0:0393  eb23             jmp 0x3b8                                
  09a0:0395  c45e06           les bx, ptr [bp + 6]                     
  09a0:0398  8b46ee           mov ax, word ptr [bp - 0x12]             
  09a0:039b  03c7             add ax, di                               
  09a0:039d  26394704         cmp word ptr es:[bx + 4], ax             
  09a0:03a1  7415             je 0x3b8                                 
  09a0:03a3  c45e06           les bx, ptr [bp + 6]                     
  09a0:03a6  268b4704         mov ax, word ptr es:[bx + 4]             
  09a0:03aa  2b46ee           sub ax, word ptr [bp - 0x12]             
  09a0:03ad  2bc7             sub ax, di                               
  09a0:03af  bb0800           mov bx, 8                                
  09a0:03b2  99               cdq                                      
  09a0:03b3  f7fb             idiv bx                                  
  09a0:03b5  8946f0           mov word ptr [bp - 0x10], ax             
  09a0:03b8  bace03           mov dx, 0x3ce                            
  09a0:03bb  b005             mov al, 5                                
  09a0:03bd  ee               out dx, al                               
  09a0:03be  bacf03           mov dx, 0x3cf                            
  09a0:03c1  b002             mov al, 2                                
  09a0:03c3  ee               out dx, al                               
  09a0:03c4  bac403           mov dx, 0x3c4                            
  09a0:03c7  b002             mov al, 2                                
  09a0:03c9  ee               out dx, al                               
  09a0:03ca  bac503           mov dx, 0x3c5                            
  09a0:03cd  b00f             mov al, 0xf                              
  09a0:03cf  ee               out dx, al                               
  09a0:03d0  bace03           mov dx, 0x3ce                            
  09a0:03d3  b008             mov al, 8                                
  09a0:03d5  ee               out dx, al                               
  09a0:03d6  8b46f6           mov ax, word ptr [bp - 0xa]              
  09a0:03d9  f76eec           imul word ptr [bp - 0x14]                
  09a0:03dc  8bd6             mov dx, si                               
  09a0:03de  c1fa03           sar dx, 3                                
  09a0:03e1  03c2             add ax, dx                               
  09a0:03e3  c746fa00a0       mov word ptr [bp - 6], 0xa000            
  09a0:03e8  8946f8           mov word ptr [bp - 8], ax                
  09a0:03eb  33f6             xor si, si                               
  09a0:03ed  eb6d             jmp 0x45c                                
  09a0:03ef  8bc6             mov ax, si                               
  09a0:03f1  f76eec           imul word ptr [bp - 0x14]                
  09a0:03f4  8b56fa           mov dx, word ptr [bp - 6]                
  09a0:03f7  8b5ef8           mov bx, word ptr [bp - 8]                
  09a0:03fa  03d8             add bx, ax                               
  09a0:03fc  8956fe           mov word ptr [bp - 2], dx                
  09a0:03ff  895efc           mov word ptr [bp - 4], bx                
  09a0:0402  c45efc           les bx, ptr [bp - 4]                     
  09a0:0405  268a07           mov al, byte ptr es:[bx]                 
  09a0:0408  8846eb           mov byte ptr [bp - 0x15], al             
  09a0:040b  bacf03           mov dx, 0x3cf                            
  09a0:040e  8a46f2           mov al, byte ptr [bp - 0xe]              
  09a0:0411  ee               out dx, al                               
  09a0:0412  c45efc           les bx, ptr [bp - 4]                     
  09a0:0415  8a46f4           mov al, byte ptr [bp - 0xc]              
  09a0:0418  268807           mov byte ptr es:[bx], al                 
  09a0:041b  ff46fc           inc word ptr [bp - 4]                    
  09a0:041e  bacf03           mov dx, 0x3cf                            
  09a0:0421  b0ff             mov al, 0xff                             
  09a0:0423  ee               out dx, al                               
  09a0:0424  8b56f0           mov dx, word ptr [bp - 0x10]             
  09a0:0427  eb0c             jmp 0x435                                
  09a0:0429  c45efc           les bx, ptr [bp - 4]                     
  09a0:042c  8a46f4           mov al, byte ptr [bp - 0xc]              
  09a0:042f  268807           mov byte ptr es:[bx], al                 
  09a0:0432  ff46fc           inc word ptr [bp - 4]                    
  09a0:0435  8bc2             mov ax, dx                               
  09a0:0437  4a               dec dx                                   
  09a0:0438  0bc0             or ax, ax                                
  09a0:043a  75ed             jne 0x429                                
  09a0:043c  0bc9             or cx, cx                                
  09a0:043e  7418             je 0x458                                 
  09a0:0440  c45efc           les bx, ptr [bp - 4]                     
  09a0:0443  268a07           mov al, byte ptr es:[bx]                 
  09a0:0446  8846eb           mov byte ptr [bp - 0x15], al             
  09a0:0449  bacf03           mov dx, 0x3cf                            
  09a0:044c  8ac1             mov al, cl                               
  09a0:044e  ee               out dx, al                               
  09a0:044f  c45efc           les bx, ptr [bp - 4]                     
  09a0:0452  8a46f4           mov al, byte ptr [bp - 0xc]              
  09a0:0455  268807           mov byte ptr es:[bx], al                 
  09a0:0458  ff46f6           inc word ptr [bp - 0xa]                  
  09a0:045b  46               inc si                                   
  09a0:045c  c45e06           les bx, ptr [bp + 6]                     
  09a0:045f  26397706         cmp word ptr es:[bx + 6], si             
  09a0:0463  7f8a             jg 0x3ef                                 
  09a0:0465  bace03           mov dx, 0x3ce                            
  09a0:0468  b008             mov al, 8                                
  09a0:046a  ee               out dx, al                               
  09a0:046b  bacf03           mov dx, 0x3cf                            
  09a0:046e  b0ff             mov al, 0xff                             
  09a0:0470  ee               out dx, al                               
  09a0:0471  bace03           mov dx, 0x3ce                            
  09a0:0474  b005             mov al, 5                                
  09a0:0476  ee               out dx, al                               
  09a0:0477  bacf03           mov dx, 0x3cf                            
  09a0:047a  b000             mov al, 0                                
  09a0:047c  ee               out dx, al                               
  09a0:047d  5f               pop di                                   
  09a0:047e  5e               pop si                                   
  09a0:047f  c9               leave                                    
