; seg 0966  img 0x9660..0x9a00  file off 0xa260
  0966:0000  c408             les cx, ptr [bx + si]                    
  0966:0002  9a221b0000       lcall 0, 0x1b22                          -> 0000:1b22 [reloc]
  0966:0007  ebe2             jmp 0xffffffeb                           
  0966:0009  c9               leave                                    
  0966:000a  cb               retf                                     

proc_0966_000b:
  0966:000b  55               push bp                                  
  0966:000c  8bec             mov bp, sp                               
  0966:000e  8b4606           mov ax, word ptr [bp + 6]                
  0966:0011  a3bc19           mov word ptr [0x19bc], ax                
  0966:0014  8b4608           mov ax, word ptr [bp + 8]                
  0966:0017  a3ba19           mov word ptr [0x19ba], ax                
  0966:001a  5d               pop bp                                   
  0966:001b  cb               retf                                     

proc_0966_001c:
  0966:001c  55               push bp                                  
  0966:001d  8bec             mov bp, sp                               
  0966:001f  8b4606           mov ax, word ptr [bp + 6]                
  0966:0022  0106bc19         add word ptr [0x19bc], ax                
  0966:0026  8b4608           mov ax, word ptr [bp + 8]                
  0966:0029  0106ba19         add word ptr [0x19ba], ax                
  0966:002d  5d               pop bp                                   
  0966:002e  cb               retf                                     

proc_0966_002f:
  0966:002f  55               push bp                                  
  0966:0030  8bec             mov bp, sp                               
  0966:0032  56               push si                                  
  0966:0033  57               push di                                  
  0966:0034  8b7606           mov si, word ptr [bp + 6]                
  0966:0037  8b7e08           mov di, word ptr [bp + 8]                
  0966:003a  6a00             push 0                                   
  0966:003c  6a00             push 0                                   
  0966:003e  57               push di                                  
  0966:003f  56               push si                                  
  0966:0040  ff36ba19         push word ptr [0x19ba]                   
  0966:0044  ff36bc19         push word ptr [0x19bc]                   
  0966:0048  90               nop                                      
  0966:0049  0e               push cs                                  
  0966:004a  e84600           call 0x93                                -> 0966:0093
  0966:004d  83c40c           add sp, 0xc                              
  0966:0050  8936bc19         mov word ptr [0x19bc], si                
  0966:0054  893eba19         mov word ptr [0x19ba], di                
  0966:0058  5f               pop di                                   
  0966:0059  5e               pop si                                   
  0966:005a  5d               pop bp                                   
  0966:005b  cb               retf                                     

proc_0966_005c:
  0966:005c  55               push bp                                  
  0966:005d  8bec             mov bp, sp                               
  0966:005f  56               push si                                  
  0966:0060  57               push di                                  
  0966:0061  8b7606           mov si, word ptr [bp + 6]                
  0966:0064  8b7e08           mov di, word ptr [bp + 8]                
  0966:0067  6a00             push 0                                   
  0966:0069  6a00             push 0                                   
  0966:006b  a1ba19           mov ax, word ptr [0x19ba]                
  0966:006e  03c7             add ax, di                               
  0966:0070  50               push ax                                  
  0966:0071  a1bc19           mov ax, word ptr [0x19bc]                
  0966:0074  03c6             add ax, si                               
  0966:0076  50               push ax                                  
  0966:0077  ff36ba19         push word ptr [0x19ba]                   
  0966:007b  ff36bc19         push word ptr [0x19bc]                   
  0966:007f  90               nop                                      
  0966:0080  0e               push cs                                  
  0966:0081  e80f00           call 0x93                                -> 0966:0093
  0966:0084  83c40c           add sp, 0xc                              
  0966:0087  0136bc19         add word ptr [0x19bc], si                
  0966:008b  013eba19         add word ptr [0x19ba], di                
  0966:008f  5f               pop di                                   
  0966:0090  5e               pop si                                   
  0966:0091  5d               pop bp                                   
  0966:0092  cb               retf                                     

proc_0966_0093:
  0966:0093  55               push bp                                  
  0966:0094  8bec             mov bp, sp                               
  0966:0096  ff7610           push word ptr [bp + 0x10]                
  0966:0099  ff760e           push word ptr [bp + 0xe]                 
  0966:009c  ff760c           push word ptr [bp + 0xc]                 
  0966:009f  ff760a           push word ptr [bp + 0xa]                 
  0966:00a2  ff7608           push word ptr [bp + 8]                   
  0966:00a5  ff7606           push word ptr [bp + 6]                   
  0966:00a8  1e               push ds                                  
  0966:00a9  684c07           push 0x74c                               
  0966:00ac  90               nop                                      
  0966:00ad  0e               push cs                                  
  0966:00ae  e80500           call 0xb6                                -> 0966:00b6
  0966:00b1  83c410           add sp, 0x10                             
  0966:00b4  5d               pop bp                                   
  0966:00b5  cb               retf                                     
  0966:00b6  c8100000         enter 0x10, 0                            
  0966:00ba  56               push si                                  
  0966:00bb  57               push di                                  
  0966:00bc  c746f00000       mov word ptr [bp - 0x10], 0              
  0966:00c1  8b460a           mov ax, word ptr [bp + 0xa]              
  0966:00c4  3b460e           cmp ax, word ptr [bp + 0xe]              
  0966:00c7  750b             jne 0xd4                                 
  0966:00c9  8b460c           mov ax, word ptr [bp + 0xc]              
  0966:00cc  3b4610           cmp ax, word ptr [bp + 0x10]             
  0966:00cf  7503             jne 0xd4                                 
  0966:00d1  e92402           jmp 0x2f8                                
  0966:00d4  8b460c           mov ax, word ptr [bp + 0xc]              
  0966:00d7  3b4610           cmp ax, word ptr [bp + 0x10]             
  0966:00da  7e24             jle 0x100                                
  0966:00dc  16               push ss                                  
  0966:00dd  8d4610           lea ax, [bp + 0x10]                      
  0966:00e0  50               push ax                                  
  0966:00e1  16               push ss                                  
  0966:00e2  8d460c           lea ax, [bp + 0xc]                       
  0966:00e5  50               push ax                                  
  0966:00e6  90               nop                                      
  0966:00e7  0e               push cs                                  
  0966:00e8  e89d02           call 0x388                               -> 0966:0388
  0966:00eb  83c408           add sp, 8                                
  0966:00ee  16               push ss                                  
  0966:00ef  8d460e           lea ax, [bp + 0xe]                       
  0966:00f2  50               push ax                                  
  0966:00f3  16               push ss                                  
  0966:00f4  8d460a           lea ax, [bp + 0xa]                       
  0966:00f7  50               push ax                                  
  0966:00f8  90               nop                                      
  0966:00f9  0e               push cs                                  
  0966:00fa  e88b02           call 0x388                               -> 0966:0388
  0966:00fd  83c408           add sp, 8                                
  0966:0100  8b460a           mov ax, word ptr [bp + 0xa]              
  0966:0103  3b460e           cmp ax, word ptr [bp + 0xe]              
  0966:0106  7e24             jle 0x12c                                
  0966:0108  16               push ss                                  
  0966:0109  8d460e           lea ax, [bp + 0xe]                       
  0966:010c  50               push ax                                  
  0966:010d  16               push ss                                  
  0966:010e  8d460a           lea ax, [bp + 0xa]                       
  0966:0111  50               push ax                                  
  0966:0112  90               nop                                      
  0966:0113  0e               push cs                                  
  0966:0114  e87102           call 0x388                               -> 0966:0388
  0966:0117  83c408           add sp, 8                                
  0966:011a  16               push ss                                  
  0966:011b  8d4610           lea ax, [bp + 0x10]                      
  0966:011e  50               push ax                                  
  0966:011f  16               push ss                                  
  0966:0120  8d460c           lea ax, [bp + 0xc]                       
  0966:0123  50               push ax                                  
  0966:0124  90               nop                                      
  0966:0125  0e               push cs                                  
  0966:0126  e85f02           call 0x388                               -> 0966:0388
  0966:0129  83c408           add sp, 8                                
  0966:012c  8cd8             mov ax, ds                               
  0966:012e  394608           cmp word ptr [bp + 8], ax                
  0966:0131  750c             jne 0x13f                                
  0966:0133  817e064c07       cmp word ptr [bp + 6], 0x74c             
  0966:0138  7505             jne 0x13f                                
  0966:013a  9aa907a30a       lcall 0xaa3, 0x7a9                       -> 0aa3:07a9 [reloc]
  0966:013f  8b460e           mov ax, word ptr [bp + 0xe]              
  0966:0142  2b460a           sub ax, word ptr [bp + 0xa]              
  0966:0145  8bd0             mov dx, ax                               
  0966:0147  8b4610           mov ax, word ptr [bp + 0x10]             
  0966:014a  2b460c           sub ax, word ptr [bp + 0xc]              
  0966:014d  8bd8             mov bx, ax                               
  0966:014f  0bd2             or dx, dx                                
  0966:0151  7e05             jle 0x158                                
  0966:0153  b80100           mov ax, 1                                
  0966:0156  eb0b             jmp 0x163                                
  0966:0158  0bd2             or dx, dx                                
  0966:015a  7504             jne 0x160                                
  0966:015c  33c0             xor ax, ax                               
  0966:015e  eb03             jmp 0x163                                
  0966:0160  b8ffff           mov ax, 0xffff                           
  0966:0163  8946f8           mov word ptr [bp - 8], ax                
  0966:0166  0bdb             or bx, bx                                
  0966:0168  7e05             jle 0x16f                                
  0966:016a  b80100           mov ax, 1                                
  0966:016d  eb0b             jmp 0x17a                                
  0966:016f  0bdb             or bx, bx                                
  0966:0171  7504             jne 0x177                                
  0966:0173  33c0             xor ax, ax                               
  0966:0175  eb03             jmp 0x17a                                
  0966:0177  b8ffff           mov ax, 0xffff                           
  0966:017a  8946f6           mov word ptr [bp - 0xa], ax              
  0966:017d  8bc2             mov ax, dx                               
  0966:017f  99               cdq                                      
  0966:0180  33c2             xor ax, dx                               
  0966:0182  2bc2             sub ax, dx                               
  0966:0184  8946fe           mov word ptr [bp - 2], ax                
  0966:0187  8bc3             mov ax, bx                               
  0966:0189  99               cdq                                      
  0966:018a  33c2             xor ax, dx                               
  0966:018c  2bc2             sub ax, dx                               
  0966:018e  8946fc           mov word ptr [bp - 4], ax                
  0966:0191  33c0             xor ax, ax                               
  0966:0193  8946f2           mov word ptr [bp - 0xe], ax              
  0966:0196  8946f4           mov word ptr [bp - 0xc], ax              
  0966:0199  8b760a           mov si, word ptr [bp + 0xa]              
  0966:019c  8b7e0c           mov di, word ptr [bp + 0xc]              
  0966:019f  8b46fe           mov ax, word ptr [bp - 2]                
  0966:01a2  3b46fc           cmp ax, word ptr [bp - 4]                
  0966:01a5  7d03             jge 0x1aa                                
  0966:01a7  e99f00           jmp 0x249                                
  0966:01aa  c746fa0000       mov word ptr [bp - 6], 0                 
  0966:01af  e98900           jmp 0x23b                                
  0966:01b2  8b46fc           mov ax, word ptr [bp - 4]                
  0966:01b5  0146f2           add word ptr [bp - 0xe], ax              
  0966:01b8  8b46f2           mov ax, word ptr [bp - 0xe]              
  0966:01bb  3b46fe           cmp ax, word ptr [bp - 2]                
  0966:01be  7c09             jl 0x1c9                                 
  0966:01c0  8b46fe           mov ax, word ptr [bp - 2]                
  0966:01c3  2946f2           sub word ptr [bp - 0xe], ax              
  0966:01c6  037ef6           add di, word ptr [bp - 0xa]              
  0966:01c9  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:01cd  26837f5dff       cmp word ptr es:[bx + 0x5d], -1          
  0966:01d2  7528             jne 0x1fc                                
  0966:01d4  66837e1200       cmp dword ptr [bp + 0x12], 0             
  0966:01d9  741f             je 0x1fa                                 
  0966:01db  8b46f0           mov ax, word ptr [bp - 0x10]             
  0966:01de  ff46f0           inc word ptr [bp - 0x10]                 
  0966:01e1  c45e12           les bx, ptr [bp + 0x12]                  
  0966:01e4  03d8             add bx, ax                               
  0966:01e6  268a07           mov al, byte ptr es:[bx]                 
  0966:01e9  98               cwde                                     
  0966:01ea  50               push ax                                  
  0966:01eb  57               push di                                  
  0966:01ec  56               push si                                  
  0966:01ed  ff7608           push word ptr [bp + 8]                   
  0966:01f0  ff7606           push word ptr [bp + 6]                   
  0966:01f3  ff1ef215         lcall [0x15f2]                           
  0966:01f7  83c40a           add sp, 0xa                              
  0966:01fa  eb39             jmp 0x235                                
  0966:01fc  66837e1200       cmp dword ptr [bp + 0x12], 0             
  0966:0201  741b             je 0x21e                                 
  0966:0203  57               push di                                  
  0966:0204  56               push si                                  
  0966:0205  ff7608           push word ptr [bp + 8]                   
  0966:0208  ff7606           push word ptr [bp + 6]                   
  0966:020b  ff1eee15         lcall [0x15ee]                           
  0966:020f  83c408           add sp, 8                                
  0966:0212  c45e12           les bx, ptr [bp + 0x12]                  
  0966:0215  035ef0           add bx, word ptr [bp - 0x10]             
  0966:0218  268807           mov byte ptr es:[bx], al                 
  0966:021b  ff46f0           inc word ptr [bp - 0x10]                 
  0966:021e  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:0222  26ff775d         push word ptr es:[bx + 0x5d]             
  0966:0226  57               push di                                  
  0966:0227  56               push si                                  
  0966:0228  ff7608           push word ptr [bp + 8]                   
  0966:022b  ff7606           push word ptr [bp + 6]                   
  0966:022e  ff1ef215         lcall [0x15f2]                           
  0966:0232  83c40a           add sp, 0xa                              
  0966:0235  0376f8           add si, word ptr [bp - 8]                
  0966:0238  ff46fa           inc word ptr [bp - 6]                    
  0966:023b  8b46fa           mov ax, word ptr [bp - 6]                
  0966:023e  3b46fe           cmp ax, word ptr [bp - 2]                
  0966:0241  7f03             jg 0x246                                 
  0966:0243  e96cff           jmp 0x1b2                                
  0966:0246  e99c00           jmp 0x2e5                                
  0966:0249  c746fa0000       mov word ptr [bp - 6], 0                 
  0966:024e  e98900           jmp 0x2da                                
  0966:0251  8b46fe           mov ax, word ptr [bp - 2]                
  0966:0254  0146f4           add word ptr [bp - 0xc], ax              
  0966:0257  8b46f4           mov ax, word ptr [bp - 0xc]              
  0966:025a  3b46fc           cmp ax, word ptr [bp - 4]                
  0966:025d  7c09             jl 0x268                                 
  0966:025f  8b46fc           mov ax, word ptr [bp - 4]                
  0966:0262  2946f4           sub word ptr [bp - 0xc], ax              
  0966:0265  0376f8           add si, word ptr [bp - 8]                
  0966:0268  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:026c  26837f5dff       cmp word ptr es:[bx + 0x5d], -1          
  0966:0271  7528             jne 0x29b                                
  0966:0273  66837e1200       cmp dword ptr [bp + 0x12], 0             
  0966:0278  741f             je 0x299                                 
  0966:027a  8b46f0           mov ax, word ptr [bp - 0x10]             
  0966:027d  ff46f0           inc word ptr [bp - 0x10]                 
  0966:0280  c45e12           les bx, ptr [bp + 0x12]                  
  0966:0283  03d8             add bx, ax                               
  0966:0285  268a07           mov al, byte ptr es:[bx]                 
  0966:0288  98               cwde                                     
  0966:0289  50               push ax                                  
  0966:028a  57               push di                                  
  0966:028b  56               push si                                  
  0966:028c  ff7608           push word ptr [bp + 8]                   
  0966:028f  ff7606           push word ptr [bp + 6]                   
  0966:0292  ff1ef215         lcall [0x15f2]                           
  0966:0296  83c40a           add sp, 0xa                              
  0966:0299  eb39             jmp 0x2d4                                
  0966:029b  66837e1200       cmp dword ptr [bp + 0x12], 0             
  0966:02a0  741b             je 0x2bd                                 
  0966:02a2  57               push di                                  
  0966:02a3  56               push si                                  
  0966:02a4  ff7608           push word ptr [bp + 8]                   
  0966:02a7  ff7606           push word ptr [bp + 6]                   
  0966:02aa  ff1eee15         lcall [0x15ee]                           
  0966:02ae  83c408           add sp, 8                                
  0966:02b1  c45e12           les bx, ptr [bp + 0x12]                  
  0966:02b4  035ef0           add bx, word ptr [bp - 0x10]             
  0966:02b7  268807           mov byte ptr es:[bx], al                 
  0966:02ba  ff46f0           inc word ptr [bp - 0x10]                 
  0966:02bd  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:02c1  26ff775d         push word ptr es:[bx + 0x5d]             
  0966:02c5  57               push di                                  
  0966:02c6  56               push si                                  
  0966:02c7  ff7608           push word ptr [bp + 8]                   
  0966:02ca  ff7606           push word ptr [bp + 6]                   
  0966:02cd  ff1ef215         lcall [0x15f2]                           
  0966:02d1  83c40a           add sp, 0xa                              
  0966:02d4  037ef6           add di, word ptr [bp - 0xa]              
  0966:02d7  ff46fa           inc word ptr [bp - 6]                    
  0966:02da  8b46fa           mov ax, word ptr [bp - 6]                
  0966:02dd  3b46fc           cmp ax, word ptr [bp - 4]                
  0966:02e0  7f03             jg 0x2e5                                 
  0966:02e2  e96cff           jmp 0x251                                
  0966:02e5  8cd8             mov ax, ds                               
  0966:02e7  394608           cmp word ptr [bp + 8], ax                
  0966:02ea  750c             jne 0x2f8                                
  0966:02ec  817e064c07       cmp word ptr [bp + 6], 0x74c             
  0966:02f1  7505             jne 0x2f8                                
  0966:02f3  9a5b07a30a       lcall 0xaa3, 0x75b                       -> 0aa3:075b [reloc]
  0966:02f8  5f               pop di                                   
  0966:02f9  5e               pop si                                   
  0966:02fa  c9               leave                                    
  0966:02fb  cb               retf                                     

proc_0966_02fc:
  0966:02fc  55               push bp                                  
  0966:02fd  8bec             mov bp, sp                               
  0966:02ff  9aa907a30a       lcall 0xaa3, 0x7a9                       -> 0aa3:07a9 [reloc]
  0966:0304  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:0308  26ff775d         push word ptr es:[bx + 0x5d]             
  0966:030c  ff760a           push word ptr [bp + 0xa]                 
  0966:030f  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:0313  8b4608           mov ax, word ptr [bp + 8]                
  0966:0316  2603470a         add ax, word ptr es:[bx + 0xa]           
  0966:031a  50               push ax                                  
  0966:031b  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:031f  8b4606           mov ax, word ptr [bp + 6]                
  0966:0322  26034708         add ax, word ptr es:[bx + 8]             
  0966:0326  50               push ax                                  
  0966:0327  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:032b  26ff7706         push word ptr es:[bx + 6]                
  0966:032f  26ff7704         push word ptr es:[bx + 4]                
  0966:0333  9a350c3d08       lcall 0x83d, 0xc35                       -> 083d:0c35 [reloc]
  0966:0338  83c40c           add sp, 0xc                              
  0966:033b  9a5b07a30a       lcall 0xaa3, 0x75b                       -> 0aa3:075b [reloc]
  0966:0340  5d               pop bp                                   
  0966:0341  cb               retf                                     

proc_0966_0342:
  0966:0342  55               push bp                                  
  0966:0343  8bec             mov bp, sp                               
  0966:0345  9aa907a30a       lcall 0xaa3, 0x7a9                       -> 0aa3:07a9 [reloc]
  0966:034a  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:034e  26ff775d         push word ptr es:[bx + 0x5d]             
  0966:0352  ff760a           push word ptr [bp + 0xa]                 
  0966:0355  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:0359  8b4608           mov ax, word ptr [bp + 8]                
  0966:035c  2603470a         add ax, word ptr es:[bx + 0xa]           
  0966:0360  50               push ax                                  
  0966:0361  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:0365  8b4606           mov ax, word ptr [bp + 6]                
  0966:0368  26034708         add ax, word ptr es:[bx + 8]             
  0966:036c  50               push ax                                  
  0966:036d  c41e5b1a         les bx, ptr [0x1a5b]                     
  0966:0371  26ff7706         push word ptr es:[bx + 6]                
  0966:0375  26ff7704         push word ptr es:[bx + 4]                
  0966:0379  9a860f3d08       lcall 0x83d, 0xf86                       -> 083d:0f86 [reloc]
  0966:037e  83c40c           add sp, 0xc                              
  0966:0381  9a5b07a30a       lcall 0xaa3, 0x75b                       -> 0aa3:075b [reloc]
  0966:0386  5d               pop bp                                   
  0966:0387  cb               retf                                     
  0966:0388  c8020000         enter 2, 0                               
  0966:038c  c45e06           les bx, ptr [bp + 6]                     
  0966:038f  268b07           mov ax, word ptr es:[bx]                 
  0966:0392  8946fe           mov word ptr [bp - 2], ax                
  0966:0395  c45e0a           les bx, ptr [bp + 0xa]                   
  0966:0398  268b07           mov ax, word ptr es:[bx]                 
  0966:039b  c45e06           les bx, ptr [bp + 6]                     
  0966:039e  26               db 26
  0966:039f  89               db 89
