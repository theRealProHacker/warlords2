; res_0555 file_off 0x7550

res_0555_000a:  ; ENTRY
  000a  55               push bp                                  
  000b  8bec             mov bp, sp                               
  000d  83ec06           sub sp, 6                                
  0010  56               push si                                  
  0011  57               push di                                  
  0012  33ff             xor di, di                               
  0014  c45e06           les bx, ptr [bp + 6]                     
  0017  26ff7702         push word ptr es:[bx + 2]                
  001b  26ff37           push word ptr es:[bx]                    
  001e  26ff7706         push word ptr es:[bx + 6]                
  0022  26ff7704         push word ptr es:[bx + 4]                
  0026  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  002b  83c408           add sp, 8                                
  002e  8946fc           mov word ptr [bp - 4], ax                
  0031  c45e06           les bx, ptr [bp + 6]                     
  0034  26837f0400       cmp word ptr es:[bx + 4], 0              
  0039  7c16             jl 0x51                                  
  003b  26837f0600       cmp word ptr es:[bx + 6], 0              
  0040  7c0f             jl 0x51                                  
  0042  26837f0470       cmp word ptr es:[bx + 4], 0x70           
  0047  7d08             jge 0x51                                 
  0049  26817f069c00     cmp word ptr es:[bx + 6], 0x9c           
  004f  7c06             jl 0x57                                  
  0051  8bc7             mov ax, di                               
  0053  5f               pop di                                   
  0054  5e               pop si                                   
  0055  c9               leave                                    
  0056  cb               retf                                     
  0057  833ede0000       cmp word ptr [0xde], 0                   
  005c  7505             jne 0x63                                 
  005e  90               nop                                      
  005f  0e               push cs                                  
  0060  e88f02           call 0x2f2                               
  0063  bac800           mov dx, 0xc8                              ; "Quest"
  0066  eb0d             jmp 0x75                                 
  0068  c45e06           les bx, ptr [bp + 6]                     
  006b  26c45f0c         les bx, ptr es:[bx + 0xc]                
  006f  03da             add bx, dx                               
  0071  26c607ff         mov byte ptr es:[bx], 0xff               
  0075  8bc2             mov ax, dx                               
  0077  4a               dec dx                                   
  0078  0bc0             or ax, ax                                
  007a  75ec             jne 0x68                                 
  007c  c45e06           les bx, ptr [bp + 6]                     
  007f  26f747081000     test word ptr es:[bx + 8], 0x10          
  0085  7555             jne 0xdc                                 
  0087  6a00             push 0                                   
  0089  ff7608           push word ptr [bp + 8]                   
  008c  53               push bx                                  
  008d  90               nop                                      
  008e  0e               push cs                                  
  008f  e87614           call 0x1508                              
  0092  83c406           add sp, 6                                
  0095  0bc0             or ax, ax                                
  0097  7407             je 0xa0                                  
  0099  b80100           mov ax, 1                                
  009c  5f               pop di                                   
  009d  5e               pop si                                   
  009e  c9               leave                                    
  009f  cb               retf                                     
  00a0  837efc0f         cmp word ptr [bp - 4], 0xf               
  00a4  7c19             jl 0xbf                                  
  00a6  6a01             push 1                                   
  00a8  66ff7606         push dword ptr [bp + 6]                  
  00ac  90               nop                                      
  00ad  0e               push cs                                  
  00ae  e85714           call 0x1508                              
  00b1  83c406           add sp, 6                                
  00b4  0bc0             or ax, ax                                
  00b6  7407             je 0xbf                                  
  00b8  b80100           mov ax, 1                                
  00bb  5f               pop di                                   
  00bc  5e               pop si                                   
  00bd  c9               leave                                    
  00be  cb               retf                                     
  00bf  837efc01         cmp word ptr [bp - 4], 1                 
  00c3  7517             jne 0xdc                                 
  00c5  66ff7606         push dword ptr [bp + 6]                  
  00c9  90               nop                                      
  00ca  0e               push cs                                  
  00cb  e84001           call 0x20e                               
  00ce  83c404           add sp, 4                                
  00d1  0bc0             or ax, ax                                
  00d3  7407             je 0xdc                                  
  00d5  b80100           mov ax, 1                                
  00d8  5f               pop di                                   
  00d9  5e               pop si                                   
  00da  c9               leave                                    
  00db  cb               retf                                     
  00dc  66ff36863f       push dword ptr [0x3f86]                  
  00e1  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  00e6  83c404           add sp, 4                                
  00e9  89167c3f         mov word ptr [0x3f7c], dx                
  00ed  a37a3f           mov word ptr [0x3f7a], ax                
  00f0  66ff36823f       push dword ptr [0x3f82]                  
  00f5  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  00fa  83c404           add sp, 4                                
  00fd  8916783f         mov word ptr [0x3f78], dx                
  0101  a3763f           mov word ptr [0x3f76], ax                
  0104  66ff7606         push dword ptr [bp + 6]                  
  0108  90               nop                                      
  0109  0e               push cs                                  
  010a  e8b207           call 0x8bf                               
  010d  83c404           add sp, 4                                
  0110  c45e06           les bx, ptr [bp + 6]                     
  0113  268b4704         mov ax, word ptr es:[bx + 4]             
  0117  ba3801           mov dx, 0x138                            
  011a  f7ea             imul dx                                  
  011c  c41e7a3f         les bx, ptr [0x3f7a]                     
  0120  03d8             add bx, ax                               
  0122  06               push es                                  
  0123  c47606           les si, ptr [bp + 6]                     
  0126  268b4406         mov ax, word ptr es:[si + 6]             
  012a  d1e0             shl ax, 1                                
  012c  03d8             add bx, ax                               
  012e  895efa           mov word ptr [bp - 6], bx                
  0131  07               pop es                                   
  0132  26813f3175       cmp word ptr es:[bx], 0x7531             
  0137  7526             jne 0x15f                                
  0139  c45e06           les bx, ptr [bp + 6]                     
  013c  268b4704         mov ax, word ptr es:[bx + 4]             
  0140  ba9c00           mov dx, 0x9c                             
  0143  f7ea             imul dx                                  
  0145  c416763f         les dx, ptr [0x3f76]                     
  0149  03d0             add dx, ax                               
  014b  06               push es                                  
  014c  8e4608           mov es, word ptr [bp + 8]                
  014f  26035706         add dx, word ptr es:[bx + 6]             
  0153  8bda             mov bx, dx                               
  0155  07               pop es                                   
  0156  26f60780         test byte ptr es:[bx], 0x80              
  015a  7503             jne 0x15f                                
  015c  e98100           jmp 0x1e0                                
  015f  33f6             xor si, si                               
  0161  8e067c3f         mov es, word ptr [0x3f7c]                
  0165  8b5efa           mov bx, word ptr [bp - 6]                
  0168  26c707ffff       mov word ptr es:[bx], 0xffff             
  016d  eb10             jmp 0x17f                                
  016f  56               push si                                  
  0170  66ff7606         push dword ptr [bp + 6]                  
  0174  90               nop                                      
  0175  0e               push cs                                  
  0176  e8fa01           call 0x373                               
  0179  83c406           add sp, 6                                
  017c  8bf8             mov di, ax                               
  017e  46               inc si                                   
  017f  0bff             or di, di                                
  0181  7505             jne 0x188                                
  0183  83fe02           cmp si, 2                                
  0186  7ce7             jl 0x16f                                 
  0188  83ff01           cmp di, 1                                
  018b  7553             jne 0x1e0                                
  018d  c45e06           les bx, ptr [bp + 6]                     
  0190  26f747081000     test word ptr es:[bx + 8], 0x10          
  0196  7548             jne 0x1e0                                
  0198  ff7608           push word ptr [bp + 8]                   
  019b  53               push bx                                  
  019c  90               nop                                      
  019d  0e               push cs                                  
  019e  e8da0f           call 0x117b                              
  01a1  83c404           add sp, 4                                
  01a4  837efe0d         cmp word ptr [bp - 2], 0xd               
  01a8  750c             jne 0x1b6                                
  01aa  66ff7606         push dword ptr [bp + 6]                  
  01ae  90               nop                                      
  01af  0e               push cs                                  
  01b0  e83112           call 0x13e4                              
  01b3  83c404           add sp, 4                                
  01b6  837efc0f         cmp word ptr [bp - 4], 0xf               
  01ba  7c13             jl 0x1cf                                 
  01bc  6a01             push 1                                   
  01be  66ff7606         push dword ptr [bp + 6]                  
  01c2  ff76fc           push word ptr [bp - 4]                   
  01c5  90               nop                                      
  01c6  0e               push cs                                  
  01c7  e82615           call 0x16f0                              
  01ca  83c408           add sp, 8                                
  01cd  eb11             jmp 0x1e0                                
  01cf  6a00             push 0                                   
  01d1  66ff7606         push dword ptr [bp + 6]                  
  01d5  ff76fc           push word ptr [bp - 4]                   
  01d8  90               nop                                      
  01d9  0e               push cs                                  
  01da  e81315           call 0x16f0                              
  01dd  83c408           add sp, 8                                
  01e0  6a00             push 0                                   
  01e2  66ff7606         push dword ptr [bp + 6]                  
  01e6  90               nop                                      
  01e7  0e               push cs                                  
  01e8  e8f309           call 0xbde                               
  01eb  83c406           add sp, 6                                
  01ee  66ff36863f       push dword ptr [0x3f86]                  
  01f3  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  01f8  83c404           add sp, 4                                
  01fb  66ff36823f       push dword ptr [0x3f82]                  
  0200  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0205  83c404           add sp, 4                                
  0208  8bc7             mov ax, di                               
  020a  5f               pop di                                   
  020b  5e               pop si                                   
  020c  c9               leave                                    
  020d  cb               retf                                     

res_0555_020e:  ; ENTRY
  020e  55               push bp                                  
  020f  8bec             mov bp, sp                               
  0211  56               push si                                  
  0212  c45e06           les bx, ptr [bp + 6]                     
  0215  268b4702         mov ax, word ptr es:[bx + 2]             
  0219  bae000           mov dx, 0xe0                             
  021c  f7ea             imul dx                                  
  021e  268b17           mov dx, word ptr es:[bx]                 
  0221  d1e2             shl dx, 1                                
  0223  03c2             add ax, dx                               
  0225  ba1d1e           mov dx, 0x1e1d                           
  0228  8bd8             mov bx, ax                               
  022a  8ec2             mov es, dx                               
  022c  268a9f0000       mov bl, byte ptr es:[bx]                 
  0231  81e3ff00         and bx, 0xff                             
  0235  b8042c           mov ax, 0x2c04                           
  0238  8ec0             mov es, ax                               
  023a  268a871007       mov al, byte ptr es:[bx + 0x710]         
  023f  98               cwde                                     
  0240  8bc8             mov cx, ax                               
  0242  c45e06           les bx, ptr [bp + 6]                     
  0245  268b4706         mov ax, word ptr es:[bx + 6]             
  0249  bae000           mov dx, 0xe0                             
  024c  f7ea             imul dx                                  
  024e  268b5704         mov dx, word ptr es:[bx + 4]             
  0252  d1e2             shl dx, 1                                
  0254  03c2             add ax, dx                               
  0256  ba1d1e           mov dx, 0x1e1d                           
  0259  8bd8             mov bx, ax                               
  025b  8ec2             mov es, dx                               
  025d  268a9f0000       mov bl, byte ptr es:[bx]                 
  0262  81e3ff00         and bx, 0xff                             
  0266  b8042c           mov ax, 0x2c04                           
  0269  8ec0             mov es, ax                               
  026b  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0270  98               cwde                                     
  0271  8bd0             mov dx, ax                               
  0273  83f902           cmp cx, 2                                
  0276  7405             je 0x27d                                 
  0278  83f903           cmp cx, 3                                
  027b  7505             jne 0x282                                
  027d  b80100           mov ax, 1                                
  0280  eb02             jmp 0x284                                
  0282  33c0             xor ax, ax                               
  0284  8bc8             mov cx, ax                               
  0286  83fa02           cmp dx, 2                                
  0289  7405             je 0x290                                 
  028b  83fa03           cmp dx, 3                                
  028e  7505             jne 0x295                                
  0290  b80100           mov ax, 1                                
  0293  eb02             jmp 0x297                                
  0295  33c0             xor ax, ax                               
  0297  8bf0             mov si, ax                               
  0299  c45e06           les bx, ptr [bp + 6]                     
  029c  26837f0a02       cmp word ptr es:[bx + 0xa], 2            
  02a1  7425             je 0x2c8                                 
  02a3  0bc9             or cx, cx                                
  02a5  7404             je 0x2ab                                 
  02a7  0bf6             or si, si                                
  02a9  7408             je 0x2b3                                 
  02ab  0bc9             or cx, cx                                
  02ad  7509             jne 0x2b8                                
  02af  0bf6             or si, si                                
  02b1  7405             je 0x2b8                                 
  02b3  33c0             xor ax, ax                               
  02b5  5e               pop si                                   
  02b6  5d               pop bp                                   
  02b7  cb               retf                                     
  02b8  8bda             mov bx, dx                               
  02ba  d1e3             shl bx, 1                                
  02bc  83bf741200       cmp word ptr [bx + 0x1274], 0            
  02c1  7505             jne 0x2c8                                
  02c3  33c0             xor ax, ax                               
  02c5  5e               pop si                                   
  02c6  5d               pop bp                                   
  02c7  cb               retf                                     
  02c8  c45e06           les bx, ptr [bp + 6]                     
  02cb  26ff7706         push word ptr es:[bx + 6]                
  02cf  26ff7704         push word ptr es:[bx + 4]                
  02d3  26ff7702         push word ptr es:[bx + 2]                
  02d7  26ff37           push word ptr es:[bx]                    
  02da  9ae40a8b0a       lcall 0xa8b, 0xae4                       -> 0a8b:0ae4
  02df  83c408           add sp, 8                                
  02e2  c45e06           les bx, ptr [bp + 6]                     
  02e5  26c45f0c         les bx, ptr es:[bx + 0xc]                
  02e9  268807           mov byte ptr es:[bx], al                 
  02ec  b80100           mov ax, 1                                
  02ef  5e               pop si                                   
  02f0  5d               pop bp                                   
  02f1  cb               retf                                     

res_0555_02f2:  ; ENTRY
  02f2  55               push bp                                  
  02f3  8bec             mov bp, sp                               
  02f5  666a00           push 0                                   
  02f8  6a00             push 0                                   
  02fa  666880880000     push 0x8880                              
  0300  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0305  83c40a           add sp, 0xa                              
  0308  8916883f         mov word ptr [0x3f88], dx                
  030c  a3863f           mov word ptr [0x3f86], ax                
  030f  666a00           push 0                                   
  0312  6a00             push 0                                   
  0314  666840440000     push 0x4440                              
  031a  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  031f  83c40a           add sp, 0xa                              
  0322  8916843f         mov word ptr [0x3f84], dx                
  0326  a3823f           mov word ptr [0x3f82], ax                
  0329  666a00           push 0                                   
  032c  6a00             push 0                                   
  032e  6668b8100000     push 0x10b8                              
  0334  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0339  83c40a           add sp, 0xa                              
  033c  8916803f         mov word ptr [0x3f80], dx                
  0340  a37e3f           mov word ptr [0x3f7e], ax                
  0343  c706de000100     mov word ptr [0xde], 1                   
  0349  90               nop                                      
  034a  0e               push cs                                  
  034b  e80200           call 0x350                               
  034e  5d               pop bp                                   
  034f  cb               retf                                     

res_0555_0350:  ; ENTRY
  0350  55               push bp                                  
  0351  8bec             mov bp, sp                               
  0353  56               push si                                  
  0354  833ede0000       cmp word ptr [0xde], 0                   
  0359  7415             je 0x370                                 
  035b  be1400           mov si, 0x14                             
  035e  eb09             jmp 0x369                                
  0360  56               push si                                  
  0361  90               nop                                      
  0362  0e               push cs                                  
  0363  e80611           call 0x146c                              
  0366  83c402           add sp, 2                                
  0369  8bc6             mov ax, si                               
  036b  4e               dec si                                   
  036c  0bc0             or ax, ax                                
  036e  75f0             jne 0x360                                
  0370  5e               pop si                                   
  0371  5d               pop bp                                   
  0372  cb               retf                                     

res_0555_0373:  ; ENTRY
  0373  55               push bp                                  
  0374  8bec             mov bp, sp                               
  0376  83ec36           sub sp, 0x36                             
  0379  56               push si                                  
  037a  57               push di                                  
  037b  8b760a           mov si, word ptr [bp + 0xa]              
  037e  666a00           push 0                                   
  0381  6a00             push 0                                   
  0383  9ab61b0000       lcall 0, 0x1bb6                          -> 0000:1bb6
  0388  66c1e010         shl eax, 0x10                            
  038c  660facd010       shrd eax, edx, 0x10                      
  0391  83c406           add sp, 6                                
  0394  668946fc         mov dword ptr [bp - 4], eax              
  0398  c746ec0100       mov word ptr [bp - 0x14], 1              
  039d  c746ea0100       mov word ptr [bp - 0x16], 1              
  03a2  c746de6f00       mov word ptr [bp - 0x22], 0x6f           
  03a7  c746dc9b00       mov word ptr [bp - 0x24], 0x9b           
  03ac  833ee00000       cmp word ptr [0xe0], 0                   
  03b1  740a             je 0x3bd                                 
  03b3  0bf6             or si, si                                
  03b5  7406             je 0x3bd                                 
  03b7  33c0             xor ax, ax                               
  03b9  5f               pop di                                   
  03ba  5e               pop si                                   
  03bb  c9               leave                                    
  03bc  cb               retf                                     
  03bd  c45e06           les bx, ptr [bp + 6]                     
  03c0  26f747081000     test word ptr es:[bx + 8], 0x10          
  03c6  740e             je 0x3d6                                 
  03c8  c706683f0000     mov word ptr [0x3f68], 0                 
  03ce  a1703f           mov ax, word ptr [0x3f70]                
  03d1  8946e0           mov word ptr [bp - 0x20], ax             
  03d4  eb29             jmp 0x3ff                                
  03d6  0bf6             or si, si                                
  03d8  7405             je 0x3df                                 
  03da  a1683f           mov ax, word ptr [0x3f68]                
  03dd  eb02             jmp 0x3e1                                
  03df  33c0             xor ax, ax                               
  03e1  a3683f           mov word ptr [0x3f68], ax                
  03e4  0bf6             or si, si                                
  03e6  7411             je 0x3f9                                 
  03e8  833ee00000       cmp word ptr [0xe0], 0                   
  03ed  7405             je 0x3f4                                 
  03ef  b81400           mov ax, 0x14                             
  03f2  eb03             jmp 0x3f7                                
  03f4  b83200           mov ax, 0x32                             
  03f7  eb03             jmp 0x3fc                                
  03f9  b80600           mov ax, 6                                
  03fc  8946e0           mov word ptr [bp - 0x20], ax             
  03ff  c45e06           les bx, ptr [bp + 6]                     
  0402  268b4704         mov ax, word ptr es:[bx + 4]             
  0406  8bd0             mov dx, ax                               
  0408  263b07           cmp ax, word ptr es:[bx]                 
  040b  7d02             jge 0x40f                                
  040d  eb06             jmp 0x415                                
  040f  c45e06           les bx, ptr [bp + 6]                     
  0412  268b07           mov ax, word ptr es:[bx]                 
  0415  2b46e0           sub ax, word ptr [bp - 0x20]             
  0418  7d04             jge 0x41e                                
  041a  33c0             xor ax, ax                               
  041c  eb15             jmp 0x433                                
  041e  c45e06           les bx, ptr [bp + 6]                     
  0421  263b17           cmp dx, word ptr es:[bx]                 
  0424  7d04             jge 0x42a                                
  0426  8bc2             mov ax, dx                               
  0428  eb06             jmp 0x430                                
  042a  c45e06           les bx, ptr [bp + 6]                     
  042d  268b07           mov ax, word ptr es:[bx]                 
  0430  2b46e0           sub ax, word ptr [bp - 0x20]             
  0433  8946e4           mov word ptr [bp - 0x1c], ax             
  0436  c45e06           les bx, ptr [bp + 6]                     
  0439  268b4706         mov ax, word ptr es:[bx + 6]             
  043d  8bc8             mov cx, ax                               
  043f  263b4702         cmp ax, word ptr es:[bx + 2]             
  0443  7d02             jge 0x447                                
  0445  eb07             jmp 0x44e                                
  0447  c45e06           les bx, ptr [bp + 6]                     
  044a  268b4702         mov ax, word ptr es:[bx + 2]             
  044e  2b46e0           sub ax, word ptr [bp - 0x20]             
  0451  7d04             jge 0x457                                
  0453  33c0             xor ax, ax                               
  0455  eb17             jmp 0x46e                                
  0457  c45e06           les bx, ptr [bp + 6]                     
  045a  263b4f02         cmp cx, word ptr es:[bx + 2]             
  045e  7d04             jge 0x464                                
  0460  8bc1             mov ax, cx                               
  0462  eb07             jmp 0x46b                                
  0464  c45e06           les bx, ptr [bp + 6]                     
  0467  268b4702         mov ax, word ptr es:[bx + 2]             
  046b  2b46e0           sub ax, word ptr [bp - 0x20]             
  046e  8946e2           mov word ptr [bp - 0x1e], ax             
  0471  c45e06           les bx, ptr [bp + 6]                     
  0474  263b17           cmp dx, word ptr es:[bx]                 
  0477  7e04             jle 0x47d                                
  0479  8bc2             mov ax, dx                               
  047b  eb06             jmp 0x483                                
  047d  c45e06           les bx, ptr [bp + 6]                     
  0480  268b07           mov ax, word ptr es:[bx]                 
  0483  0346e0           add ax, word ptr [bp - 0x20]             
  0486  3b46de           cmp ax, word ptr [bp - 0x22]             
  0489  7e05             jle 0x490                                
  048b  8b46de           mov ax, word ptr [bp - 0x22]             
  048e  eb15             jmp 0x4a5                                
  0490  c45e06           les bx, ptr [bp + 6]                     
  0493  263b17           cmp dx, word ptr es:[bx]                 
  0496  7e04             jle 0x49c                                
  0498  8bc2             mov ax, dx                               
  049a  eb06             jmp 0x4a2                                
  049c  c45e06           les bx, ptr [bp + 6]                     
  049f  268b07           mov ax, word ptr es:[bx]                 
  04a2  0346e0           add ax, word ptr [bp - 0x20]             
  04a5  8946e8           mov word ptr [bp - 0x18], ax             
  04a8  c45e06           les bx, ptr [bp + 6]                     
  04ab  263b4f02         cmp cx, word ptr es:[bx + 2]             
  04af  7e04             jle 0x4b5                                
  04b1  8bc1             mov ax, cx                               
  04b3  eb07             jmp 0x4bc                                
  04b5  c45e06           les bx, ptr [bp + 6]                     
  04b8  268b4702         mov ax, word ptr es:[bx + 2]             
  04bc  0346e0           add ax, word ptr [bp - 0x20]             
  04bf  3b46dc           cmp ax, word ptr [bp - 0x24]             
  04c2  7e05             jle 0x4c9                                
  04c4  8b46dc           mov ax, word ptr [bp - 0x24]             
  04c7  eb17             jmp 0x4e0                                
  04c9  c45e06           les bx, ptr [bp + 6]                     
  04cc  263b4f02         cmp cx, word ptr es:[bx + 2]             
  04d0  7e04             jle 0x4d6                                
  04d2  8bc1             mov ax, cx                               
  04d4  eb07             jmp 0x4dd                                
  04d6  c45e06           les bx, ptr [bp + 6]                     
  04d9  268b4702         mov ax, word ptr es:[bx + 2]             
  04dd  0346e0           add ax, word ptr [bp - 0x20]             
  04e0  8946e6           mov word ptr [bp - 0x1a], ax             
  04e3  e9c903           jmp 0x8af                                
  04e6  c746f40000       mov word ptr [bp - 0xc], 0               
  04eb  c45e06           les bx, ptr [bp + 6]                     
  04ee  26f747081000     test word ptr es:[bx + 8], 0x10          
  04f4  740b             je 0x501                                 
  04f6  a1683f           mov ax, word ptr [0x3f68]                
  04f9  3b46e0           cmp ax, word ptr [bp - 0x20]             
  04fc  7503             jne 0x501                                
  04fe  e9b703           jmp 0x8b8                                
  0501  c45e06           les bx, ptr [bp + 6]                     
  0504  268b4704         mov ax, word ptr es:[bx + 4]             
  0508  8bd0             mov dx, ax                               
  050a  0306683f         add ax, word ptr [0x3f68]                
  050e  8bd8             mov bx, ax                               
  0510  3b46de           cmp ax, word ptr [bp - 0x22]             
  0513  7e05             jle 0x51a                                
  0515  8b46de           mov ax, word ptr [bp - 0x22]             
  0518  eb02             jmp 0x51c                                
  051a  8bc3             mov ax, bx                               
  051c  8946f2           mov word ptr [bp - 0xe], ax              
  051f  c45e06           les bx, ptr [bp + 6]                     
  0522  268b4706         mov ax, word ptr es:[bx + 6]             
  0526  0306683f         add ax, word ptr [0x3f68]                
  052a  8bd8             mov bx, ax                               
  052c  3b46dc           cmp ax, word ptr [bp - 0x24]             
  052f  7e05             jle 0x536                                
  0531  8b46dc           mov ax, word ptr [bp - 0x24]             
  0534  eb02             jmp 0x538                                
  0536  8bc3             mov ax, bx                               
  0538  8946f0           mov word ptr [bp - 0x10], ax             
  053b  8bc2             mov ax, dx                               
  053d  2b06683f         sub ax, word ptr [0x3f68]                
  0541  8bd0             mov dx, ax                               
  0543  7d04             jge 0x549                                
  0545  33c0             xor ax, ax                               
  0547  eb02             jmp 0x54b                                
  0549  8bc2             mov ax, dx                               
  054b  8bf8             mov di, ax                               
  054d  ba3801           mov dx, 0x138                            
  0550  f7ea             imul dx                                  
  0552  8946d6           mov word ptr [bp - 0x2a], ax             
  0555  8bc7             mov ax, di                               
  0557  ba9c00           mov dx, 0x9c                             
  055a  f7ea             imul dx                                  
  055c  8946d4           mov word ptr [bp - 0x2c], ax             
  055f  e93103           jmp 0x893                                
  0562  c45e06           les bx, ptr [bp + 6]                     
  0565  268b4706         mov ax, word ptr es:[bx + 6]             
  0569  2b06683f         sub ax, word ptr [0x3f68]                
  056d  8bd0             mov dx, ax                               
  056f  7d04             jge 0x575                                
  0571  33c0             xor ax, ax                               
  0573  eb02             jmp 0x577                                
  0575  8bc2             mov ax, dx                               
  0577  8bf0             mov si, ax                               
  0579  d1e0             shl ax, 1                                
  057b  8946d8           mov word ptr [bp - 0x28], ax             
  057e  e9ff02           jmp 0x880                                
  0581  3b7ee4           cmp di, word ptr [bp - 0x1c]             
  0584  7d03             jge 0x589                                
  0586  e9f202           jmp 0x87b                                
  0589  3b7ee8           cmp di, word ptr [bp - 0x18]             
  058c  7e03             jle 0x591                                
  058e  e9ea02           jmp 0x87b                                
  0591  3b76e2           cmp si, word ptr [bp - 0x1e]             
  0594  7d03             jge 0x599                                
  0596  e9e202           jmp 0x87b                                
  0599  3b76e6           cmp si, word ptr [bp - 0x1a]             
  059c  7e03             jle 0x5a1                                
  059e  e9da02           jmp 0x87b                                
  05a1  c41e7a3f         les bx, ptr [0x3f7a]                     
  05a5  035ed6           add bx, word ptr [bp - 0x2a]             
  05a8  035ed8           add bx, word ptr [bp - 0x28]             
  05ab  8bd3             mov dx, bx                               
  05ad  26833f00         cmp word ptr es:[bx], 0                  
  05b1  7e03             jle 0x5b6                                
  05b3  e9c502           jmp 0x87b                                
  05b6  c746f40100       mov word ptr [bp - 0xc], 1               
  05bb  c41e763f         les bx, ptr [0x3f76]                     
  05bf  035ed4           add bx, word ptr [bp - 0x2c]             
  05c2  03de             add bx, si                               
  05c4  268a07           mov al, byte ptr es:[bx]                 
  05c7  b400             mov ah, 0                                
  05c9  8bd8             mov bx, ax                               
  05cb  251000           and ax, 0x10                             
  05ce  8946d0           mov word ptr [bp - 0x30], ax             
  05d1  8bc3             mov ax, bx                               
  05d3  250800           and ax, 8                                
  05d6  8946d2           mov word ptr [bp - 0x2e], ax             
  05d9  8e067c3f         mov es, word ptr [0x3f7c]                
  05dd  8bda             mov bx, dx                               
  05df  268b07           mov ax, word ptr es:[bx]                 
  05e2  f7d8             neg ax                                   
  05e4  268907           mov word ptr es:[bx], ax                 
  05e7  8946fa           mov word ptr [bp - 6], ax                
  05ea  833ee00000       cmp word ptr [0xe0], 0                   
  05ef  7405             je 0x5f6                                 
  05f1  b80900           mov ax, 9                                
  05f4  eb02             jmp 0x5f8                                
  05f6  33c0             xor ax, ax                               
  05f8  8946ee           mov word ptr [bp - 0x12], ax             
  05fb  0bf6             or si, si                                
  05fd  751e             jne 0x61d                                
  05ff  0bff             or di, di                                
  0601  7507             jne 0x60a                                
  0603  c746ee0100       mov word ptr [bp - 0x12], 1              
  0608  eb4b             jmp 0x655                                
  060a  3b7ede           cmp di, word ptr [bp - 0x22]             
  060d  7507             jne 0x616                                
  060f  c746ee0300       mov word ptr [bp - 0x12], 3              
  0614  eb3f             jmp 0x655                                
  0616  c746ee0200       mov word ptr [bp - 0x12], 2              
  061b  eb38             jmp 0x655                                
  061d  3b76dc           cmp si, word ptr [bp - 0x24]             
  0620  751e             jne 0x640                                
  0622  0bff             or di, di                                
  0624  7507             jne 0x62d                                
  0626  c746ee0600       mov word ptr [bp - 0x12], 6              
  062b  eb28             jmp 0x655                                
  062d  3b7ede           cmp di, word ptr [bp - 0x22]             
  0630  7507             jne 0x639                                
  0632  c746ee0800       mov word ptr [bp - 0x12], 8              
  0637  eb1c             jmp 0x655                                
  0639  c746ee0700       mov word ptr [bp - 0x12], 7              
  063e  eb15             jmp 0x655                                
  0640  0bff             or di, di                                
  0642  7507             jne 0x64b                                
  0644  c746ee0400       mov word ptr [bp - 0x12], 4              
  0649  eb0a             jmp 0x655                                
  064b  3b7ede           cmp di, word ptr [bp - 0x22]             
  064e  7505             jne 0x655                                
  0650  c746ee0500       mov word ptr [bp - 0x12], 5              
  0655  8b5eee           mov bx, word ptr [bp - 0x12]             
  0658  d1e3             shl bx, 1                                
  065a  8b87e200         mov ax, word ptr [bx + 0xe2]             
  065e  8946ce           mov word ptr [bp - 0x32], ax             
  0661  d1e0             shl ax, 1                                
  0663  8946da           mov word ptr [bp - 0x26], ax             
  0666  e9ea01           jmp 0x853                                
  0669  8b5eda           mov bx, word ptr [bp - 0x26]             
  066c  8bc7             mov ax, di                               
  066e  0387f600         add ax, word ptr [bx + 0xf6]             
  0672  8946f8           mov word ptr [bp - 8], ax                
  0675  8bc6             mov ax, si                               
  0677  03876201         add ax, word ptr [bx + 0x162]            
  067b  8946f6           mov word ptr [bp - 0xa], ax              
  067e  8346da02         add word ptr [bp - 0x26], 2              
  0682  ff46ce           inc word ptr [bp - 0x32]                 
  0685  8b46f8           mov ax, word ptr [bp - 8]                
  0688  ba3801           mov dx, 0x138                            
  068b  f7ea             imul dx                                  
  068d  8b167c3f         mov dx, word ptr [0x3f7c]                
  0691  8b1e7a3f         mov bx, word ptr [0x3f7a]                
  0695  03d8             add bx, ax                               
  0697  8b46f6           mov ax, word ptr [bp - 0xa]              
  069a  d1e0             shl ax, 1                                
  069c  03d8             add bx, ax                               
  069e  8956cc           mov word ptr [bp - 0x34], dx             
  06a1  895eca           mov word ptr [bp - 0x36], bx             
  06a4  0bff             or di, di                                
  06a6  7c27             jl 0x6cf                                 
  06a8  0bf6             or si, si                                
  06aa  7c23             jl 0x6cf                                 
  06ac  83ff70           cmp di, 0x70                             
  06af  7d1e             jge 0x6cf                                
  06b1  81fe9c00         cmp si, 0x9c                             
  06b5  7d18             jge 0x6cf                                
  06b7  837ef800         cmp word ptr [bp - 8], 0                 
  06bb  7c12             jl 0x6cf                                 
  06bd  837ef600         cmp word ptr [bp - 0xa], 0               
  06c1  7c0c             jl 0x6cf                                 
  06c3  837ef870         cmp word ptr [bp - 8], 0x70              
  06c7  7d06             jge 0x6cf                                
  06c9  81fe9c00         cmp si, 0x9c                             
  06cd  7c30             jl 0x6ff                                 
  06cf  ff76ce           push word ptr [bp - 0x32]                
  06d2  ff76ee           push word ptr [bp - 0x12]                
  06d5  ff76f6           push word ptr [bp - 0xa]                 
  06d8  ff76f8           push word ptr [bp - 8]                   
  06db  56               push si                                  
  06dc  57               push di                                  
  06dd  1e               push ds                                  
  06de  684202           push 0x242                                ; "ERROR - (%d, %d) (%d, %d) %d %d"
  06e1  1e               push ds                                  
  06e2  68885c           push 0x5c88                              
  06e5  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  06ea  83c414           add sp, 0x14                             
  06ed  666800000100     push 0x10000                             
  06f3  1e               push ds                                  
  06f4  68885c           push 0x5c88                              
  06f7  9a3e00d12f       lcall 0x2fd1, 0x3e                       -> ovl23:0478
  06fc  83c408           add sp, 8                                
  06ff  c45eca           les bx, ptr [bp - 0x36]                  
  0702  26813f3175       cmp word ptr es:[bx], 0x7531             
  0707  7503             jne 0x70c                                
  0709  e94701           jmp 0x853                                
  070c  8b46f8           mov ax, word ptr [bp - 8]                
  070f  ba9c00           mov dx, 0x9c                             
  0712  f7ea             imul dx                                  
  0714  c41e763f         les bx, ptr [0x3f76]                     
  0718  03d8             add bx, ax                               
  071a  035ef6           add bx, word ptr [bp - 0xa]              
  071d  268a17           mov dl, byte ptr es:[bx]                 
  0720  8ac2             mov al, dl                               
  0722  b400             mov ah, 0                                
  0724  250700           and ax, 7                                
  0727  8bc8             mov cx, ax                               
  0729  c45e06           les bx, ptr [bp + 6]                     
  072c  268b07           mov ax, word ptr es:[bx]                 
  072f  3b46f8           cmp ax, word ptr [bp - 8]                
  0732  7532             jne 0x766                                
  0734  268b4702         mov ax, word ptr es:[bx + 2]             
  0738  3b46f6           cmp ax, word ptr [bp - 0xa]              
  073b  7529             jne 0x766                                
  073d  26837f0a01       cmp word ptr es:[bx + 0xa], 1            
  0742  751c             jne 0x760                                
  0744  837ed000         cmp word ptr [bp - 0x30], 0              
  0748  7516             jne 0x760                                
  074a  8ac2             mov al, dl                               
  074c  b400             mov ah, 0                                
  074e  8bd8             mov bx, ax                               
  0750  a91000           test ax, 0x10                            
  0753  750b             jne 0x760                                
  0755  250800           and ax, 8                                
  0758  3b46d2           cmp ax, word ptr [bp - 0x2e]             
  075b  7403             je 0x760                                 
  075d  e9f300           jmp 0x853                                
  0760  b90100           mov cx, 1                                
  0763  e9cf00           jmp 0x835                                
  0766  c45e06           les bx, ptr [bp + 6]                     
  0769  26837f0a02       cmp word ptr es:[bx + 0xa], 2            
  076e  7539             jne 0x7a9                                
  0770  f6c208           test dl, 8                               
  0773  740f             je 0x784                                 
  0775  8ac2             mov al, dl                               
  0777  b400             mov ah, 0                                
  0779  a91000           test ax, 0x10                            
  077c  7506             jne 0x784                                
  077e  b90200           mov cx, 2                                
  0781  e9b100           jmp 0x835                                
  0784  0bc9             or cx, cx                                
  0786  7404             je 0x78c                                 
  0788  8bc1             mov ax, cx                               
  078a  eb03             jmp 0x78f                                
  078c  b80200           mov ax, 2                                
  078f  3d0200           cmp ax, 2                                
  0792  7e05             jle 0x799                                
  0794  b80200           mov ax, 2                                
  0797  eb0b             jmp 0x7a4                                
  0799  0bc9             or cx, cx                                
  079b  7404             je 0x7a1                                 
  079d  8bc1             mov ax, cx                               
  079f  eb03             jmp 0x7a4                                
  07a1  b80200           mov ax, 2                                
  07a4  8bc8             mov cx, ax                               
  07a6  e98c00           jmp 0x835                                
  07a9  c45e06           les bx, ptr [bp + 6]                     
  07ac  26837f0a00       cmp word ptr es:[bx + 0xa], 0            
  07b1  751c             jne 0x7cf                                
  07b3  8ac2             mov al, dl                               
  07b5  b400             mov ah, 0                                
  07b7  8bd8             mov bx, ax                               
  07b9  a90800           test ax, 8                               
  07bc  7577             jne 0x835                                
  07be  f7c38000         test bx, 0x80                            
  07c2  7571             jne 0x835                                
  07c4  c45eca           les bx, ptr [bp - 0x36]                  
  07c7  26c7073175       mov word ptr es:[bx], 0x7531             
  07cc  e98400           jmp 0x853                                
  07cf  837ed000         cmp word ptr [bp - 0x30], 0              
  07d3  7513             jne 0x7e8                                
  07d5  8ac2             mov al, dl                               
  07d7  b400             mov ah, 0                                
  07d9  8bd8             mov bx, ax                               
  07db  a91000           test ax, 0x10                            
  07de  7508             jne 0x7e8                                
  07e0  250800           and ax, 8                                
  07e3  3b46d2           cmp ax, word ptr [bp - 0x2e]             
  07e6  756b             jne 0x853                                
  07e8  c45e06           les bx, ptr [bp + 6]                     
  07eb  26837f0800       cmp word ptr es:[bx + 8], 0              
  07f0  7425             je 0x817                                 
  07f2  83f902           cmp cx, 2                                
  07f5  7e20             jle 0x817                                
  07f7  26f747080100     test word ptr es:[bx + 8], 1             
  07fd  7405             je 0x804                                 
  07ff  f6c220           test dl, 0x20                            
  0802  7510             jne 0x814                                
  0804  c45e06           les bx, ptr [bp + 6]                     
  0807  26f747080200     test word ptr es:[bx + 8], 2             
  080d  7408             je 0x817                                 
  080f  f6c240           test dl, 0x40                            
  0812  7403             je 0x817                                 
  0814  b90200           mov cx, 2                                
  0817  837ed200         cmp word ptr [bp - 0x2e], 0              
  081b  7406             je 0x823                                 
  081d  837ed000         cmp word ptr [bp - 0x30], 0              
  0821  7412             je 0x835                                 
  0823  f6c208           test dl, 8                               
  0826  740d             je 0x835                                 
  0828  8ac2             mov al, dl                               
  082a  b400             mov ah, 0                                
  082c  a91000           test ax, 0x10                            
  082f  7504             jne 0x835                                
  0831  030e6e3f         add cx, word ptr [0x3f6e]                
  0835  c45eca           les bx, ptr [bp - 0x36]                  
  0838  268b07           mov ax, word ptr es:[bx]                 
  083b  99               cdq                                      
  083c  33c2             xor ax, dx                               
  083e  2bc2             sub ax, dx                               
  0840  8b56fa           mov dx, word ptr [bp - 6]                
  0843  03d1             add dx, cx                               
  0845  3bc2             cmp ax, dx                               
  0847  7e0a             jle 0x853                                
  0849  8b46fa           mov ax, word ptr [bp - 6]                
  084c  f7d8             neg ax                                   
  084e  2bc1             sub ax, cx                               
  0850  268907           mov word ptr es:[bx], ax                 
  0853  8b5eda           mov bx, word ptr [bp - 0x26]             
  0856  83bff600f6       cmp word ptr [bx + 0xf6], -0xa           
  085b  7403             je 0x860                                 
  085d  e909fe           jmp 0x669                                
  0860  c45e06           les bx, ptr [bp + 6]                     
  0863  26393f           cmp word ptr es:[bx], di                 
  0866  7513             jne 0x87b                                
  0868  26397702         cmp word ptr es:[bx + 2], si             
  086c  750d             jne 0x87b                                
  086e  26f747081000     test word ptr es:[bx + 8], 0x10          
  0874  7505             jne 0x87b                                
  0876  c746ea0000       mov word ptr [bp - 0x16], 0              
  087b  8346d802         add word ptr [bp - 0x28], 2              
  087f  46               inc si                                   
  0880  3b76f0           cmp si, word ptr [bp - 0x10]             
  0883  7f03             jg 0x888                                 
  0885  e9f9fc           jmp 0x581                                
  0888  8146d63801       add word ptr [bp - 0x2a], 0x138          
  088d  8146d49c00       add word ptr [bp - 0x2c], 0x9c           
  0892  47               inc di                                   
  0893  3b7ef2           cmp di, word ptr [bp - 0xe]              
  0896  7f03             jg 0x89b                                 
  0898  e9c7fc           jmp 0x562                                
  089b  ff06683f         inc word ptr [0x3f68]                    
  089f  837ef400         cmp word ptr [bp - 0xc], 0               
  08a3  750a             jne 0x8af                                
  08a5  c746ea0000       mov word ptr [bp - 0x16], 0              
  08aa  c746ec0000       mov word ptr [bp - 0x14], 0              
  08af  837eea00         cmp word ptr [bp - 0x16], 0              
  08b3  7403             je 0x8b8                                 
  08b5  e92efc           jmp 0x4e6                                
  08b8  8b46ec           mov ax, word ptr [bp - 0x14]             
  08bb  5f               pop di                                   
  08bc  5e               pop si                                   
  08bd  c9               leave                                    
  08be  cb               retf                                     

res_0555_08bf:  ; ENTRY
  08bf  55               push bp                                  
  08c0  8bec             mov bp, sp                               
  08c2  83ec1a           sub sp, 0x1a                             
  08c5  56               push si                                  
  08c6  57               push di                                  
  08c7  c746fe0100       mov word ptr [bp - 2], 1                 
  08cc  c7066e3f0000     mov word ptr [0x3f6e], 0                 
  08d2  b8042c           mov ax, 0x2c04                           
  08d5  8ec0             mov es, ax                               
  08d7  26833e240100     cmp word ptr es:[0x124], 0               
  08dd  7409             je 0x8e8                                 
  08df  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  08e4  0bc0             or ax, ax                                
  08e6  7405             je 0x8ed                                 
  08e8  c746fe0000       mov word ptr [bp - 2], 0                 
  08ed  c45e06           les bx, ptr [bp + 6]                     
  08f0  268b4704         mov ax, word ptr es:[bx + 4]             
  08f4  ba9c00           mov dx, 0x9c                             
  08f7  f7ea             imul dx                                  
  08f9  c416763f         les dx, ptr [0x3f76]                     
  08fd  03d0             add dx, ax                               
  08ff  06               push es                                  
  0900  8e4608           mov es, word ptr [bp + 8]                
  0903  26035706         add dx, word ptr es:[bx + 6]             
  0907  8bfa             mov di, dx                               
  0909  8bda             mov bx, dx                               
  090b  07               pop es                                   
  090c  26f60780         test byte ptr es:[bx], 0x80              
  0910  741c             je 0x92e                                 
  0912  8e06783f         mov es, word ptr [0x3f78]                
  0916  268a05           mov al, byte ptr es:[di]                 
  0919  b400             mov ah, 0                                
  091b  a90700           test ax, 7                               
  091e  750e             jne 0x92e                                
  0920  6a01             push 1                                   
  0922  66ff7606         push dword ptr [bp + 6]                  
  0926  90               nop                                      
  0927  0e               push cs                                  
  0928  e8b302           call 0xbde                               
  092b  83c406           add sp, 6                                
  092e  c45e06           les bx, ptr [bp + 6]                     
  0931  26837f0a01       cmp word ptr es:[bx + 0xa], 1            
  0936  7403             je 0x93b                                 
  0938  e9f700           jmp 0xa32                                
  093b  c7066e3f0a00     mov word ptr [0x3f6e], 0xa               
  0941  268b4706         mov ax, word ptr es:[bx + 6]             
  0945  bae000           mov dx, 0xe0                             
  0948  f7ea             imul dx                                  
  094a  268b5704         mov dx, word ptr es:[bx + 4]             
  094e  d1e2             shl dx, 1                                
  0950  03c2             add ax, dx                               
  0952  ba1d1e           mov dx, 0x1e1d                           
  0955  8bd8             mov bx, ax                               
  0957  8ec2             mov es, dx                               
  0959  268a9f0000       mov bl, byte ptr es:[bx]                 
  095e  81e3ff00         and bx, 0xff                             
  0962  8bfb             mov di, bx                               
  0964  b8042c           mov ax, 0x2c04                           
  0967  8ec0             mov es, ax                               
  0969  2680bf100703     cmp byte ptr es:[bx + 0x710], 3          
  096f  740a             je 0x97b                                 
  0971  8ec0             mov es, ax                               
  0973  2680bd100702     cmp byte ptr es:[di + 0x710], 2          
  0979  7506             jne 0x981                                
  097b  c7066e3f1400     mov word ptr [0x3f6e], 0x14              
  0981  ba7000           mov dx, 0x70                             
  0984  c746fcb044       mov word ptr [bp - 4], 0x44b0            
  0989  c746fa8088       mov word ptr [bp - 6], 0x8880            
  098e  c746f84044       mov word ptr [bp - 8], 0x4440            
  0993  a1763f           mov ax, word ptr [0x3f76]                
  0996  054044           add ax, 0x4440                           
  0999  03c6             add ax, si                               
  099b  eb7a             jmp 0xa17                                
  099d  be9c00           mov si, 0x9c                             
  09a0  b93801           mov cx, 0x138                            
  09a3  8b7efc           mov di, word ptr [bp - 4]                
  09a6  a1763f           mov ax, word ptr [0x3f76]                
  09a9  0346f8           add ax, word ptr [bp - 8]                
  09ac  8946ea           mov word ptr [bp - 0x16], ax             
  09af  059c00           add ax, 0x9c                             
  09b2  eb56             jmp 0xa0a                                
  09b4  c41e7a3f         les bx, ptr [0x3f7a]                     
  09b8  035efa           add bx, word ptr [bp - 6]                
  09bb  03d9             add bx, cx                               
  09bd  26c7073075       mov word ptr es:[bx], 0x7530             
  09c2  837efe00         cmp word ptr [bp - 2], 0                 
  09c6  7421             je 0x9e9                                 
  09c8  b8d919           mov ax, 0x19d9                           
  09cb  8ec0             mov es, ax                               
  09cd  268a05           mov al, byte ptr es:[di]                 
  09d0  c1e805           shr ax, 5                                
  09d3  250100           and ax, 1                                
  09d6  0bc0             or ax, ax                                
  09d8  750f             jne 0x9e9                                
  09da  c45e06           les bx, ptr [bp + 6]                     
  09dd  26395704         cmp word ptr es:[bx + 4], dx             
  09e1  7519             jne 0x9fc                                
  09e3  26397706         cmp word ptr es:[bx + 6], si             
  09e7  7513             jne 0x9fc                                
  09e9  8e06783f         mov es, word ptr [0x3f78]                
  09ed  8b5eea           mov bx, word ptr [bp - 0x16]             
  09f0  03de             add bx, si                               
  09f2  268a07           mov al, byte ptr es:[bx]                 
  09f5  b400             mov ah, 0                                
  09f7  a90700           test ax, 7                               
  09fa  750e             jne 0xa0a                                
  09fc  c41e7a3f         les bx, ptr [0x3f7a]                     
  0a00  035efa           add bx, word ptr [bp - 6]                
  0a03  03d9             add bx, cx                               
  0a05  26c7073175       mov word ptr es:[bx], 0x7531             
  0a0a  83e902           sub cx, 2                                
  0a0d  83ef70           sub di, 0x70                             
  0a10  8bc6             mov ax, si                               
  0a12  4e               dec si                                   
  0a13  0bc0             or ax, ax                                
  0a15  759d             jne 0x9b4                                
  0a17  ff4efc           dec word ptr [bp - 4]                    
  0a1a  816efa3801       sub word ptr [bp - 6], 0x138             
  0a1f  816ef89c00       sub word ptr [bp - 8], 0x9c              
  0a24  8bc2             mov ax, dx                               
  0a26  4a               dec dx                                   
  0a27  0bc0             or ax, ax                                
  0a29  7403             je 0xa2e                                 
  0a2b  e96fff           jmp 0x99d                                
  0a2e  5f               pop di                                   
  0a2f  5e               pop si                                   
  0a30  c9               leave                                    
  0a31  cb               retf                                     
  0a32  c45e06           les bx, ptr [bp + 6]                     
  0a35  26837f0a00       cmp word ptr es:[bx + 0xa], 0            
  0a3a  7403             je 0xa3f                                 
  0a3c  e9c300           jmp 0xb02                                
  0a3f  ba7000           mov dx, 0x70                             
  0a42  c746f6b044       mov word ptr [bp - 0xa], 0x44b0          
  0a47  c746f48088       mov word ptr [bp - 0xc], 0x8880          
  0a4c  c746f24044       mov word ptr [bp - 0xe], 0x4440          
  0a51  a1763f           mov ax, word ptr [0x3f76]                
  0a54  0346f8           add ax, word ptr [bp - 8]                
  0a57  8946ea           mov word ptr [bp - 0x16], ax             
  0a5a  03c6             add ax, si                               
  0a5c  a1763f           mov ax, word ptr [0x3f76]                
  0a5f  054044           add ax, 0x4440                           
  0a62  03c6             add ax, si                               
  0a64  e98000           jmp 0xae7                                
  0a67  be9c00           mov si, 0x9c                             
  0a6a  b93801           mov cx, 0x138                            
  0a6d  8b7ef6           mov di, word ptr [bp - 0xa]              
  0a70  8b46ea           mov ax, word ptr [bp - 0x16]             
  0a73  059c00           add ax, 0x9c                             
  0a76  a1763f           mov ax, word ptr [0x3f76]                
  0a79  0346f2           add ax, word ptr [bp - 0xe]              
  0a7c  8946e8           mov word ptr [bp - 0x18], ax             
  0a7f  059c00           add ax, 0x9c                             
  0a82  eb56             jmp 0xada                                
  0a84  c41e7a3f         les bx, ptr [0x3f7a]                     
  0a88  035ef4           add bx, word ptr [bp - 0xc]              
  0a8b  03d9             add bx, cx                               
  0a8d  26c7073075       mov word ptr es:[bx], 0x7530             
  0a92  c45e06           les bx, ptr [bp + 6]                     
  0a95  26395704         cmp word ptr es:[bx + 4], dx             
  0a99  741e             je 0xab9                                 
  0a9b  26397706         cmp word ptr es:[bx + 6], si             
  0a9f  7418             je 0xab9                                 
  0aa1  837efe00         cmp word ptr [bp - 2], 0                 
  0aa5  7412             je 0xab9                                 
  0aa7  b8d919           mov ax, 0x19d9                           
  0aaa  8ec0             mov es, ax                               
  0aac  268a05           mov al, byte ptr es:[di]                 
  0aaf  c1e805           shr ax, 5                                
  0ab2  250100           and ax, 1                                
  0ab5  0bc0             or ax, ax                                
  0ab7  7413             je 0xacc                                 
  0ab9  8e06783f         mov es, word ptr [0x3f78]                
  0abd  8b5ee8           mov bx, word ptr [bp - 0x18]             
  0ac0  03de             add bx, si                               
  0ac2  268a07           mov al, byte ptr es:[bx]                 
  0ac5  b400             mov ah, 0                                
  0ac7  a90800           test ax, 8                               
  0aca  750e             jne 0xada                                
  0acc  c41e7a3f         les bx, ptr [0x3f7a]                     
  0ad0  035ef4           add bx, word ptr [bp - 0xc]              
  0ad3  03d9             add bx, cx                               
  0ad5  26c7073175       mov word ptr es:[bx], 0x7531             
  0ada  83e902           sub cx, 2                                
  0add  83ef70           sub di, 0x70                             
  0ae0  8bc6             mov ax, si                               
  0ae2  4e               dec si                                   
  0ae3  0bc0             or ax, ax                                
  0ae5  759d             jne 0xa84                                
  0ae7  ff4ef6           dec word ptr [bp - 0xa]                  
  0aea  816ef43801       sub word ptr [bp - 0xc], 0x138           
  0aef  816ef29c00       sub word ptr [bp - 0xe], 0x9c            
  0af4  8bc2             mov ax, dx                               
  0af6  4a               dec dx                                   
  0af7  0bc0             or ax, ax                                
  0af9  7403             je 0xafe                                 
  0afb  e969ff           jmp 0xa67                                
  0afe  5f               pop di                                   
  0aff  5e               pop si                                   
  0b00  c9               leave                                    
  0b01  cb               retf                                     
  0b02  ba7000           mov dx, 0x70                             
  0b05  c746f0b044       mov word ptr [bp - 0x10], 0x44b0         
  0b0a  c746ee8088       mov word ptr [bp - 0x12], 0x8880         
  0b0f  c746ec4044       mov word ptr [bp - 0x14], 0x4440         
  0b14  a1763f           mov ax, word ptr [0x3f76]                
  0b17  054044           add ax, 0x4440                           
  0b1a  03c6             add ax, si                               
  0b1c  a1763f           mov ax, word ptr [0x3f76]                
  0b1f  0346f8           add ax, word ptr [bp - 8]                
  0b22  8946ea           mov word ptr [bp - 0x16], ax             
  0b25  03c6             add ax, si                               
  0b27  a1763f           mov ax, word ptr [0x3f76]                
  0b2a  0346f2           add ax, word ptr [bp - 0xe]              
  0b2d  8946e8           mov word ptr [bp - 0x18], ax             
  0b30  03c6             add ax, si                               
  0b32  e98e00           jmp 0xbc3                                
  0b35  be9c00           mov si, 0x9c                             
  0b38  b93801           mov cx, 0x138                            
  0b3b  8b7ef0           mov di, word ptr [bp - 0x10]             
  0b3e  a1763f           mov ax, word ptr [0x3f76]                
  0b41  0346ec           add ax, word ptr [bp - 0x14]             
  0b44  8946e6           mov word ptr [bp - 0x1a], ax             
  0b47  059c00           add ax, 0x9c                             
  0b4a  8b46ea           mov ax, word ptr [bp - 0x16]             
  0b4d  059c00           add ax, 0x9c                             
  0b50  8b46e8           mov ax, word ptr [bp - 0x18]             
  0b53  059c00           add ax, 0x9c                             
  0b56  eb5e             jmp 0xbb6                                
  0b58  c41e7a3f         les bx, ptr [0x3f7a]                     
  0b5c  035eee           add bx, word ptr [bp - 0x12]             
  0b5f  03d9             add bx, cx                               
  0b61  26c7073075       mov word ptr es:[bx], 0x7530             
  0b66  c45e06           les bx, ptr [bp + 6]                     
  0b69  26395704         cmp word ptr es:[bx + 4], dx             
  0b6d  741e             je 0xb8d                                 
  0b6f  26397706         cmp word ptr es:[bx + 6], si             
  0b73  7418             je 0xb8d                                 
  0b75  837efe00         cmp word ptr [bp - 2], 0                 
  0b79  7412             je 0xb8d                                 
  0b7b  b8d919           mov ax, 0x19d9                           
  0b7e  8ec0             mov es, ax                               
  0b80  268a05           mov al, byte ptr es:[di]                 
  0b83  c1e805           shr ax, 5                                
  0b86  250100           and ax, 1                                
  0b89  0bc0             or ax, ax                                
  0b8b  741b             je 0xba8                                 
  0b8d  8e06783f         mov es, word ptr [0x3f78]                
  0b91  8b5ee6           mov bx, word ptr [bp - 0x1a]             
  0b94  03de             add bx, si                               
  0b96  8bc3             mov ax, bx                               
  0b98  26f60780         test byte ptr es:[bx], 0x80              
  0b9c  7418             je 0xbb6                                 
  0b9e  268a07           mov al, byte ptr es:[bx]                 
  0ba1  b400             mov ah, 0                                
  0ba3  a90700           test ax, 7                               
  0ba6  750e             jne 0xbb6                                
  0ba8  c41e7a3f         les bx, ptr [0x3f7a]                     
  0bac  035eee           add bx, word ptr [bp - 0x12]             
  0baf  03d9             add bx, cx                               
  0bb1  26c7073175       mov word ptr es:[bx], 0x7531             
  0bb6  83e902           sub cx, 2                                
  0bb9  83ef70           sub di, 0x70                             
  0bbc  8bc6             mov ax, si                               
  0bbe  4e               dec si                                   
  0bbf  0bc0             or ax, ax                                
  0bc1  7595             jne 0xb58                                
  0bc3  ff4ef0           dec word ptr [bp - 0x10]                 
  0bc6  816eee3801       sub word ptr [bp - 0x12], 0x138          
  0bcb  816eec9c00       sub word ptr [bp - 0x14], 0x9c           
  0bd0  8bc2             mov ax, dx                               
  0bd2  4a               dec dx                                   
  0bd3  0bc0             or ax, ax                                
  0bd5  7403             je 0xbda                                 
  0bd7  e95bff           jmp 0xb35                                
  0bda  5f               pop di                                   
  0bdb  5e               pop si                                   
  0bdc  c9               leave                                    
  0bdd  cb               retf                                     

res_0555_0bde:  ; ENTRY
  0bde  55               push bp                                  
  0bdf  8bec             mov bp, sp                               
  0be1  83ec04           sub sp, 4                                
  0be4  56               push si                                  
  0be5  57               push di                                  
  0be6  833ede0100       cmp word ptr [0x1de], 0                  
  0beb  7509             jne 0xbf6                                
  0bed  837e0a00         cmp word ptr [bp + 0xa], 0               
  0bf1  7503             jne 0xbf6                                
  0bf3  e9a401           jmp 0xd9a                                
  0bf6  837e0a00         cmp word ptr [bp + 0xa], 0               
  0bfa  7503             jne 0xbff                                
  0bfc  e99400           jmp 0xc93                                
  0bff  c7066a3fffff     mov word ptr [0x3f6a], 0xffff            
  0c05  c45e06           les bx, ptr [bp + 6]                     
  0c08  268b4706         mov ax, word ptr es:[bx + 6]             
  0c0c  bae000           mov dx, 0xe0                             
  0c0f  f7ea             imul dx                                  
  0c11  268b5704         mov dx, word ptr es:[bx + 4]             
  0c15  d1e2             shl dx, 1                                
  0c17  03c2             add ax, dx                               
  0c19  ba1d1e           mov dx, 0x1e1d                           
  0c1c  8bd8             mov bx, ax                               
  0c1e  8ec2             mov es, dx                               
  0c20  268a9f0000       mov bl, byte ptr es:[bx]                 
  0c25  81e3ff00         and bx, 0xff                             
  0c29  b8042c           mov ax, 0x2c04                           
  0c2c  8ec0             mov es, ax                               
  0c2e  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0c34  755d             jne 0xc93                                
  0c36  b8042c           mov ax, 0x2c04                           
  0c39  8ec0             mov es, ax                               
  0c3b  268b0e7b15       mov cx, word ptr es:[0x157b]             
  0c40  8bc1             mov ax, cx                               
  0c42  ba4100           mov dx, 0x41                             
  0c45  f7ea             imul dx                                  
  0c47  8bf0             mov si, ax                               
  0c49  eb3e             jmp 0xc89                                
  0c4b  b8042c           mov ax, 0x2c04                           
  0c4e  8ec0             mov es, ax                               
  0c50  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0c55  8bd0             mov dx, ax                               
  0c57  c45e06           les bx, ptr [bp + 6]                     
  0c5a  263b4704         cmp ax, word ptr es:[bx + 4]             
  0c5e  7f29             jg 0xc89                                 
  0c60  40               inc ax                                   
  0c61  263b4704         cmp ax, word ptr es:[bx + 4]             
  0c65  7c22             jl 0xc89                                 
  0c67  b8042c           mov ax, 0x2c04                           
  0c6a  8ec0             mov es, ax                               
  0c6c  268b847f15       mov ax, word ptr es:[si + 0x157f]        
  0c71  8bd0             mov dx, ax                               
  0c73  8e4608           mov es, word ptr [bp + 8]                
  0c76  263b4706         cmp ax, word ptr es:[bx + 6]             
  0c7a  7f0d             jg 0xc89                                 
  0c7c  40               inc ax                                   
  0c7d  263b4706         cmp ax, word ptr es:[bx + 6]             
  0c81  7c06             jl 0xc89                                 
  0c83  890e6a3f         mov word ptr [0x3f6a], cx                
  0c87  eb0a             jmp 0xc93                                
  0c89  83ee41           sub si, 0x41                             
  0c8c  8bc1             mov ax, cx                               
  0c8e  49               dec cx                                   
  0c8f  0bc0             or ax, ax                                
  0c91  75b8             jne 0xc4b                                
  0c93  833e6a3fff       cmp word ptr [0x3f6a], -1                
  0c98  7503             jne 0xc9d                                
  0c9a  e9fd00           jmp 0xd9a                                
  0c9d  8b460a           mov ax, word ptr [bp + 0xa]              
  0ca0  a3de01           mov word ptr [0x1de], ax                 
  0ca3  c746fe0400       mov word ptr [bp - 2], 4                 
  0ca8  c746fc0800       mov word ptr [bp - 4], 8                 
  0cad  e9d900           jmp 0xd89                                
  0cb0  a16a3f           mov ax, word ptr [0x3f6a]                
  0cb3  ba4100           mov dx, 0x41                             
  0cb6  f7ea             imul dx                                  
  0cb8  8bf0             mov si, ax                               
  0cba  ba042c           mov dx, 0x2c04                           
  0cbd  8bd8             mov bx, ax                               
  0cbf  8ec2             mov es, dx                               
  0cc1  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0cc6  8b5efc           mov bx, word ptr [bp - 4]                
  0cc9  0387ce01         add ax, word ptr [bx + 0x1ce]            
  0ccd  8bf8             mov di, ax                               
  0ccf  b8042c           mov ax, 0x2c04                           
  0cd2  8ec0             mov es, ax                               
  0cd4  268b847f15       mov ax, word ptr es:[si + 0x157f]        
  0cd9  0387d601         add ax, word ptr [bx + 0x1d6]            
  0cdd  8bf0             mov si, ax                               
  0cdf  8bc7             mov ax, di                               
  0ce1  ba9c00           mov dx, 0x9c                             
  0ce4  f7ea             imul dx                                  
  0ce6  8bc8             mov cx, ax                               
  0ce8  c41e763f         les bx, ptr [0x3f76]                     
  0cec  03d8             add bx, ax                               
  0cee  03de             add bx, si                               
  0cf0  a08812           mov al, byte ptr [0x1288]                
  0cf3  268807           mov byte ptr es:[bx], al                 
  0cf6  837e0a00         cmp word ptr [bp + 0xa], 0               
  0cfa  7423             je 0xd1f                                 
  0cfc  56               push si                                  
  0cfd  57               push di                                  
  0cfe  90               nop                                      
  0cff  0e               push cs                                  
  0d00  e89a03           call 0x109d                              
  0d03  83c404           add sp, 4                                
  0d06  0bc0             or ax, ax                                
  0d08  746c             je 0xd76                                 
  0d0a  8bc7             mov ax, di                               
  0d0c  ba9c00           mov dx, 0x9c                             
  0d0f  f7ea             imul dx                                  
  0d11  c41e763f         les bx, ptr [0x3f76]                     
  0d15  03d8             add bx, ax                               
  0d17  03de             add bx, si                               
  0d19  26800f18         or byte ptr es:[bx], 0x18                
  0d1d  eb57             jmp 0xd76                                
  0d1f  8bc6             mov ax, si                               
  0d21  bae000           mov dx, 0xe0                             
  0d24  f7ea             imul dx                                  
  0d26  8bd7             mov dx, di                               
  0d28  d1e2             shl dx, 1                                
  0d2a  03c2             add ax, dx                               
  0d2c  ba1d1e           mov dx, 0x1e1d                           
  0d2f  8bd8             mov bx, ax                               
  0d31  8ec2             mov es, dx                               
  0d33  268a870100       mov al, byte ptr es:[bx + 1]             
  0d38  250f00           and ax, 0xf                              
  0d3b  ba042c           mov dx, 0x2c04                           
  0d3e  8ec2             mov es, dx                               
  0d40  263b061001       cmp ax, word ptr es:[0x110]              
  0d45  740e             je 0xd55                                 
  0d47  c41e763f         les bx, ptr [0x3f76]                     
  0d4b  03d9             add bx, cx                               
  0d4d  03de             add bx, si                               
  0d4f  26c60700         mov byte ptr es:[bx], 0                  
  0d53  eb21             jmp 0xd76                                
  0d55  56               push si                                  
  0d56  57               push di                                  
  0d57  90               nop                                      
  0d58  0e               push cs                                  
  0d59  e84103           call 0x109d                              
  0d5c  83c404           add sp, 4                                
  0d5f  0bc0             or ax, ax                                
  0d61  7413             je 0xd76                                 
  0d63  8bc7             mov ax, di                               
  0d65  ba9c00           mov dx, 0x9c                             
  0d68  f7ea             imul dx                                  
  0d6a  c41e763f         les bx, ptr [0x3f76]                     
  0d6e  03d8             add bx, ax                               
  0d70  03de             add bx, si                               
  0d72  26800f18         or byte ptr es:[bx], 0x18                
  0d76  8bc7             mov ax, di                               
  0d78  ba9c00           mov dx, 0x9c                             
  0d7b  f7ea             imul dx                                  
  0d7d  c41e763f         les bx, ptr [0x3f76]                     
  0d81  03d8             add bx, ax                               
  0d83  03de             add bx, si                               
  0d85  26800f80         or byte ptr es:[bx], 0x80                
  0d89  836efc02         sub word ptr [bp - 4], 2                 
  0d8d  8b46fe           mov ax, word ptr [bp - 2]                
  0d90  ff4efe           dec word ptr [bp - 2]                    
  0d93  0bc0             or ax, ax                                
  0d95  7403             je 0xd9a                                 
  0d97  e916ff           jmp 0xcb0                                
  0d9a  5f               pop di                                   
  0d9b  5e               pop si                                   
  0d9c  c9               leave                                    
  0d9d  cb               retf                                     

res_0555_0d9e:  ; ENTRY
  0d9e  55               push bp                                  
  0d9f  8bec             mov bp, sp                               
  0da1  83ec10           sub sp, 0x10                             
  0da4  56               push si                                  
  0da5  57               push di                                  
  0da6  833ede0000       cmp word ptr [0xde], 0                   
  0dab  7504             jne 0xdb1                                
  0dad  0e               push cs                                  
  0dae  e841f5           call 0x2f2                               
  0db1  837e0800         cmp word ptr [bp + 8], 0                 
  0db5  750c             jne 0xdc3                                
  0db7  a16c3f           mov ax, word ptr [0x3f6c]                
  0dba  3b4606           cmp ax, word ptr [bp + 6]                
  0dbd  7504             jne 0xdc3                                
  0dbf  5f               pop di                                   
  0dc0  5e               pop si                                   
  0dc1  c9               leave                                    
  0dc2  cb               retf                                     
  0dc3  8b4606           mov ax, word ptr [bp + 6]                
  0dc6  a36c3f           mov word ptr [0x3f6c], ax                
  0dc9  837e060e         cmp word ptr [bp + 6], 0xe               
  0dcd  7505             jne 0xdd4                                
  0dcf  b80100           mov ax, 1                                
  0dd2  eb02             jmp 0xdd6                                
  0dd4  33c0             xor ax, ax                               
  0dd6  a3e000           mov word ptr [0xe0], ax                  
  0dd9  66ff36863f       push dword ptr [0x3f86]                  
  0dde  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0de3  83c404           add sp, 4                                
  0de6  89167c3f         mov word ptr [0x3f7c], dx                
  0dea  a37a3f           mov word ptr [0x3f7a], ax                
  0ded  66ff36823f       push dword ptr [0x3f82]                  
  0df2  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0df7  83c404           add sp, 4                                
  0dfa  8916783f         mov word ptr [0x3f78], dx                
  0dfe  a3763f           mov word ptr [0x3f76], ax                
  0e01  c746fe7000       mov word ptr [bp - 2], 0x70              
  0e06  c746f66089       mov word ptr [bp - 0xa], 0x8960          
  0e0b  c746f4b044       mov word ptr [bp - 0xc], 0x44b0          
  0e10  bf4044           mov di, 0x4440                           
  0e13  e95301           jmp 0xf69                                
  0e16  be9c00           mov si, 0x9c                             
  0e19  8b46f6           mov ax, word ptr [bp - 0xa]              
  0e1c  8946fa           mov word ptr [bp - 6], ax                
  0e1f  8b46f4           mov ax, word ptr [bp - 0xc]              
  0e22  8946f8           mov word ptr [bp - 8], ax                
  0e25  e92e01           jmp 0xf56                                
  0e28  8b5efa           mov bx, word ptr [bp - 6]                
  0e2b  b81d1e           mov ax, 0x1e1d                           
  0e2e  8ec0             mov es, ax                               
  0e30  268a9f0000       mov bl, byte ptr es:[bx]                 
  0e35  81e3ff00         and bx, 0xff                             
  0e39  b8042c           mov ax, 0x2c04                           
  0e3c  8ec0             mov es, ax                               
  0e3e  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0e43  98               cwde                                     
  0e44  8bd0             mov dx, ax                               
  0e46  837e060e         cmp word ptr [bp + 6], 0xe               
  0e4a  752b             jne 0xe77                                
  0e4c  b8d919           mov ax, 0x19d9                           
  0e4f  8b5ef8           mov bx, word ptr [bp - 8]                
  0e52  8ec0             mov es, ax                               
  0e54  268a07           mov al, byte ptr es:[bx]                 
  0e57  251f00           and ax, 0x1f                             
  0e5a  0bc0             or ax, ax                                
  0e5c  7404             je 0xe62                                 
  0e5e  b001             mov al, 1                                
  0e60  eb08             jmp 0xe6a                                
  0e62  8bda             mov bx, dx                               
  0e64  d1e3             shl bx, 1                                
  0e66  8a87e001         mov al, byte ptr [bx + 0x1e0]            
  0e6a  c41e763f         les bx, ptr [0x3f76]                     
  0e6e  03df             add bx, di                               
  0e70  03de             add bx, si                               
  0e72  268807           mov byte ptr es:[bx], al                 
  0e75  eb29             jmp 0xea0                                
  0e77  b8d919           mov ax, 0x19d9                           
  0e7a  8b5ef8           mov bx, word ptr [bp - 8]                
  0e7d  8ec0             mov es, ax                               
  0e7f  268a07           mov al, byte ptr es:[bx]                 
  0e82  251f00           and ax, 0x1f                             
  0e85  0bc0             or ax, ax                                
  0e87  7404             je 0xe8d                                 
  0e89  b001             mov al, 1                                
  0e8b  eb08             jmp 0xe95                                
  0e8d  8bda             mov bx, dx                               
  0e8f  d1e3             shl bx, 1                                
  0e91  8a877412         mov al, byte ptr [bx + 0x1274]           
  0e95  c41e763f         les bx, ptr [0x3f76]                     
  0e99  03df             add bx, di                               
  0e9b  03de             add bx, si                               
  0e9d  268807           mov byte ptr es:[bx], al                 
  0ea0  8bda             mov bx, dx                               
  0ea2  4b               dec bx                                   
  0ea3  83fb09           cmp bx, 9                                
  0ea6  7603             jbe 0xeab                                
  0ea8  e98800           jmp 0xf33                                
  0eab  d1e3             shl bx, 1                                
  0ead  2effa78910       jmp word ptr cs:[bx + 0x1089]            
res_0555_0eb2:  ; case
  0eb2  8b5efa           mov bx, word ptr [bp - 6]                
  0eb5  b81d1e           mov ax, 0x1e1d                           
  0eb8  8ec0             mov es, ax                               
  0eba  268a870100       mov al, byte ptr es:[bx + 1]             
  0ebf  250f00           and ax, 0xf                              
  0ec2  3b4606           cmp ax, word ptr [bp + 6]                
  0ec5  740e             je 0xed5                                 
  0ec7  c41e763f         les bx, ptr [0x3f76]                     
  0ecb  03df             add bx, di                               
  0ecd  03de             add bx, si                               
  0ecf  26c60700         mov byte ptr es:[bx], 0                  
  0ed3  eb1c             jmp 0xef1                                
  0ed5  56               push si                                  
  0ed6  ff76fe           push word ptr [bp - 2]                   
  0ed9  90               nop                                      
  0eda  0e               push cs                                  
  0edb  e8bf01           call 0x109d                              
  0ede  83c404           add sp, 4                                
  0ee1  0bc0             or ax, ax                                
  0ee3  740c             je 0xef1                                 
  0ee5  c41e763f         les bx, ptr [0x3f76]                     
  0ee9  03df             add bx, di                               
  0eeb  03de             add bx, si                               
  0eed  26800f18         or byte ptr es:[bx], 0x18                
  0ef1  c41e763f         les bx, ptr [0x3f76]                     
  0ef5  03df             add bx, di                               
  0ef7  03de             add bx, si                               
  0ef9  26800f80         or byte ptr es:[bx], 0x80                
  0efd  eb34             jmp 0xf33                                
res_0555_0eff:  ; case
  0eff  c41e763f         les bx, ptr [0x3f76]                     
  0f03  03df             add bx, di                               
  0f05  03de             add bx, si                               
  0f07  26800f10         or byte ptr es:[bx], 0x10                
res_0555_0f0b:  ; case
  0f0b  c41e763f         les bx, ptr [0x3f76]                     
  0f0f  03df             add bx, di                               
  0f11  03de             add bx, si                               
  0f13  26800f08         or byte ptr es:[bx], 8                   
  0f17  eb1a             jmp 0xf33                                
res_0555_0f19:  ; case
  0f19  c41e763f         les bx, ptr [0x3f76]                     
  0f1d  03df             add bx, di                               
  0f1f  03de             add bx, si                               
  0f21  26800f40         or byte ptr es:[bx], 0x40                
  0f25  eb0c             jmp 0xf33                                
res_0555_0f27:  ; case
  0f27  c41e763f         les bx, ptr [0x3f76]                     
  0f2b  03df             add bx, di                               
  0f2d  03de             add bx, si                               
  0f2f  26800f20         or byte ptr es:[bx], 0x20                
res_0555_0f33:  ; case
  0f33  8b5efa           mov bx, word ptr [bp - 6]                
  0f36  b81d1e           mov ax, 0x1e1d                           
  0f39  8ec0             mov es, ax                               
  0f3b  268a870100       mov al, byte ptr es:[bx + 1]             
  0f40  c1e807           shr ax, 7                                
  0f43  250100           and ax, 1                                
  0f46  0bc0             or ax, ax                                
  0f48  740c             je 0xf56                                 
  0f4a  c41e763f         les bx, ptr [0x3f76]                     
  0f4e  03df             add bx, di                               
  0f50  03de             add bx, si                               
  0f52  26800f10         or byte ptr es:[bx], 0x10                
  0f56  816efae000       sub word ptr [bp - 6], 0xe0              
  0f5b  836ef870         sub word ptr [bp - 8], 0x70              
  0f5f  8bc6             mov ax, si                               
  0f61  4e               dec si                                   
  0f62  0bc0             or ax, ax                                
  0f64  7403             je 0xf69                                 
  0f66  e9bffe           jmp 0xe28                                
  0f69  836ef602         sub word ptr [bp - 0xa], 2               
  0f6d  ff4ef4           dec word ptr [bp - 0xc]                  
  0f70  81ef9c00         sub di, 0x9c                             
  0f74  8b46fe           mov ax, word ptr [bp - 2]                
  0f77  ff4efe           dec word ptr [bp - 2]                    
  0f7a  0bc0             or ax, ax                                
  0f7c  7403             je 0xf81                                 
  0f7e  e995fe           jmp 0xe16                                
  0f81  b8042c           mov ax, 0x2c04                           
  0f84  8ec0             mov es, ax                               
  0f86  26a17b15         mov ax, word ptr es:[0x157b]             
  0f8a  8946fc           mov word ptr [bp - 4], ax                
  0f8d  ba4100           mov dx, 0x41                             
  0f90  f7ea             imul dx                                  
  0f92  8946f0           mov word ptr [bp - 0x10], ax             
  0f95  057f15           add ax, 0x157f                           
  0f98  8bf8             mov di, ax                               
  0f9a  8b46f0           mov ax, word ptr [bp - 0x10]             
  0f9d  057d15           add ax, 0x157d                           
  0fa0  8946f2           mov word ptr [bp - 0xe], ax              
  0fa3  e9b100           jmp 0x1057                               
  0fa6  b8042c           mov ax, 0x2c04                           
  0fa9  8ec0             mov es, ax                               
  0fab  268b05           mov ax, word ptr es:[di]                 
  0fae  bae000           mov dx, 0xe0                             
  0fb1  f7ea             imul dx                                  
  0fb3  ba042c           mov dx, 0x2c04                           
  0fb6  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0fb9  8ec2             mov es, dx                               
  0fbb  268b17           mov dx, word ptr es:[bx]                 
  0fbe  d1e2             shl dx, 1                                
  0fc0  03c2             add ax, dx                               
  0fc2  ba1d1e           mov dx, 0x1e1d                           
  0fc5  8bd8             mov bx, ax                               
  0fc7  8ec2             mov es, dx                               
  0fc9  268a9f0000       mov bl, byte ptr es:[bx]                 
  0fce  81e3ff00         and bx, 0xff                             
  0fd2  b8042c           mov ax, 0x2c04                           
  0fd5  8ec0             mov es, ax                               
  0fd7  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0fdd  7502             jne 0xfe1                                
  0fdf  eb76             jmp 0x1057                               
  0fe1  b8042c           mov ax, 0x2c04                           
  0fe4  8ec0             mov es, ax                               
  0fe6  26ff35           push word ptr es:[di]                    
  0fe9  b8042c           mov ax, 0x2c04                           
  0fec  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0fef  8ec0             mov es, ax                               
  0ff1  26ff37           push word ptr es:[bx]                    
  0ff4  90               nop                                      
  0ff5  0e               push cs                                  
  0ff6  e8a400           call 0x109d                              
  0ff9  83c404           add sp, 4                                
  0ffc  0bc0             or ax, ax                                
  0ffe  7502             jne 0x1002                               
  1000  eb55             jmp 0x1057                               
  1002  b8042c           mov ax, 0x2c04                           
  1005  8b5ef2           mov bx, word ptr [bp - 0xe]              
  1008  8ec0             mov es, ax                               
  100a  268b07           mov ax, word ptr es:[bx]                 
  100d  8946fe           mov word ptr [bp - 2], ax                
  1010  b8042c           mov ax, 0x2c04                           
  1013  8ec0             mov es, ax                               
  1015  268b35           mov si, word ptr es:[di]                 
  1018  8b46fe           mov ax, word ptr [bp - 2]                
  101b  ba9c00           mov dx, 0x9c                             
  101e  f7ea             imul dx                                  
  1020  8bd0             mov dx, ax                               
  1022  c41e763f         les bx, ptr [0x3f76]                     
  1026  03d8             add bx, ax                               
  1028  03de             add bx, si                               
  102a  26800f18         or byte ptr es:[bx], 0x18                
  102e  8bda             mov bx, dx                               
  1030  031e763f         add bx, word ptr [0x3f76]                
  1034  03de             add bx, si                               
  1036  26808f9c0018     or byte ptr es:[bx + 0x9c], 0x18         
  103c  8b1e763f         mov bx, word ptr [0x3f76]                
  1040  03da             add bx, dx                               
  1042  03de             add bx, si                               
  1044  26804f0118       or byte ptr es:[bx + 1], 0x18            
  1049  8bda             mov bx, dx                               
  104b  031e763f         add bx, word ptr [0x3f76]                
  104f  03de             add bx, si                               
  1051  26808f9d0018     or byte ptr es:[bx + 0x9d], 0x18         
  1057  83ef41           sub di, 0x41                             
  105a  836ef241         sub word ptr [bp - 0xe], 0x41            
  105e  8b46fc           mov ax, word ptr [bp - 4]                
  1061  ff4efc           dec word ptr [bp - 4]                    
  1064  0bc0             or ax, ax                                
  1066  7403             je 0x106b                                
  1068  e93bff           jmp 0xfa6                                
  106b  66ff36863f       push dword ptr [0x3f86]                  
  1070  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1075  83c404           add sp, 4                                
  1078  66ff36823f       push dword ptr [0x3f82]                  
  107d  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1082  83c404           add sp, 4                                
  1085  5f               pop di                                   
  1086  5e               pop si                                   
  1087  c9               leave                                    
  1088  cb               retf                                     
  1089  ff0e0b0f0b0f190f dw 0eff,0f0b,0f0b,0f19,0f27,0f33,0f33,0f33,0f33,0eb2 jump table

res_0555_109d:  ; ENTRY
  109d  55               push bp                                  
  109e  8bec             mov bp, sp                               
  10a0  83ec02           sub sp, 2                                
  10a3  56               push si                                  
  10a4  57               push di                                  
  10a5  33ff             xor di, di                               
  10a7  33f6             xor si, si                               
  10a9  8b4608           mov ax, word ptr [bp + 8]                
  10ac  bae000           mov dx, 0xe0                             
  10af  f7ea             imul dx                                  
  10b1  8946fe           mov word ptr [bp - 2], ax                
  10b4  8b5606           mov dx, word ptr [bp + 6]                
  10b7  d1e2             shl dx, 1                                
  10b9  03c2             add ax, dx                               
  10bb  ba1d1e           mov dx, 0x1e1d                           
  10be  8bd8             mov bx, ax                               
  10c0  8ec2             mov es, dx                               
  10c2  268a9ffeff       mov bl, byte ptr es:[bx - 2]             
  10c7  81e3ff00         and bx, 0xff                             
  10cb  b8042c           mov ax, 0x2c04                           
  10ce  8ec0             mov es, ax                               
  10d0  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  10d6  7503             jne 0x10db                               
  10d8  ff4e06           dec word ptr [bp + 6]                    
  10db  8b5efe           mov bx, word ptr [bp - 2]                
  10de  8b4606           mov ax, word ptr [bp + 6]                
  10e1  d1e0             shl ax, 1                                
  10e3  03d8             add bx, ax                               
  10e5  b81d1e           mov ax, 0x1e1d                           
  10e8  8ec0             mov es, ax                               
  10ea  268a9f20ff       mov bl, byte ptr es:[bx - 0xe0]          
  10ef  81e3ff00         and bx, 0xff                             
  10f3  b8042c           mov ax, 0x2c04                           
  10f6  8ec0             mov es, ax                               
  10f8  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  10fe  7503             jne 0x1103                               
  1100  ff4e08           dec word ptr [bp + 8]                    
  1103  8bde             mov bx, si                               
  1105  d1e3             shl bx, 1                                
  1107  83bff801ff       cmp word ptr [bx + 0x1f8], -1            
  110c  7467             je 0x1175                                
  110e  0bff             or di, di                                
  1110  7563             jne 0x1175                               
  1112  8bde             mov bx, si                               
  1114  d1e3             shl bx, 1                                
  1116  ffb7f801         push word ptr [bx + 0x1f8]               
  111a  16               push ss                                  
  111b  8d4608           lea ax, [bp + 8]                         
  111e  50               push ax                                  
  111f  16               push ss                                  
  1120  8d4606           lea ax, [bp + 6]                         
  1123  50               push ax                                  
  1124  9a4d0b8b0a       lcall 0xa8b, 0xb4d                       -> 0a8b:0b4d
  1129  83c40a           add sp, 0xa                              
  112c  0bc0             or ax, ax                                
  112e  7506             jne 0x1136                               
  1130  33c0             xor ax, ax                               
  1132  5f               pop di                                   
  1133  5e               pop si                                   
  1134  c9               leave                                    
  1135  cb               retf                                     
  1136  8b4608           mov ax, word ptr [bp + 8]                
  1139  bae000           mov dx, 0xe0                             
  113c  f7ea             imul dx                                  
  113e  8b5606           mov dx, word ptr [bp + 6]                
  1141  d1e2             shl dx, 1                                
  1143  03c2             add ax, dx                               
  1145  ba1d1e           mov dx, 0x1e1d                           
  1148  8bd8             mov bx, ax                               
  114a  8ec2             mov es, dx                               
  114c  268a9f0000       mov bl, byte ptr es:[bx]                 
  1151  81e3ff00         and bx, 0xff                             
  1155  b8042c           mov ax, 0x2c04                           
  1158  8ec0             mov es, ax                               
  115a  268a871007       mov al, byte ptr es:[bx + 0x710]         
  115f  98               cwde                                     
  1160  3d0100           cmp ax, 1                                
  1163  740a             je 0x116f                                
  1165  3d0200           cmp ax, 2                                
  1168  7405             je 0x116f                                
  116a  3d0300           cmp ax, 3                                
  116d  7503             jne 0x1172                               
  116f  bf0100           mov di, 1                                
  1172  46               inc si                                   
  1173  eb8e             jmp 0x1103                               
  1175  8bc7             mov ax, di                               
  1177  5f               pop di                                   
  1178  5e               pop si                                   
  1179  c9               leave                                    
  117a  cb               retf                                     

res_0555_117b:  ; ENTRY
  117b  55               push bp                                  
  117c  8bec             mov bp, sp                               
  117e  83ec20           sub sp, 0x20                             
  1181  56               push si                                  
  1182  57               push di                                  
  1183  c45e06           les bx, ptr [bp + 6]                     
  1186  268b07           mov ax, word ptr es:[bx]                 
  1189  8946ec           mov word ptr [bp - 0x14], ax             
  118c  ba3801           mov dx, 0x138                            
  118f  f7ea             imul dx                                  
  1191  c41e7a3f         les bx, ptr [0x3f7a]                     
  1195  03d8             add bx, ax                               
  1197  06               push es                                  
  1198  c47606           les si, ptr [bp + 6]                     
  119b  268b4402         mov ax, word ptr es:[si + 2]             
  119f  8946ea           mov word ptr [bp - 0x16], ax             
  11a2  d1e0             shl ax, 1                                
  11a4  03d8             add bx, ax                               
  11a6  07               pop es                                   
  11a7  268b07           mov ax, word ptr es:[bx]                 
  11aa  99               cdq                                      
  11ab  33c2             xor ax, dx                               
  11ad  2bc2             sub ax, dx                               
  11af  8946fa           mov word ptr [bp - 6], ax                
  11b2  c746f20000       mov word ptr [bp - 0xe], 0               
  11b7  8b46ec           mov ax, word ptr [bp - 0x14]             
  11ba  8946fe           mov word ptr [bp - 2], ax                
  11bd  8b46ea           mov ax, word ptr [bp - 0x16]             
  11c0  8946fc           mov word ptr [bp - 4], ax                
  11c3  c746e20000       mov word ptr [bp - 0x1e], 0              
  11c8  c45e06           les bx, ptr [bp + 6]                     
  11cb  268b4704         mov ax, word ptr es:[bx + 4]             
  11cf  3b46fe           cmp ax, word ptr [bp - 2]                
  11d2  750c             jne 0x11e0                               
  11d4  268b4706         mov ax, word ptr es:[bx + 6]             
  11d8  3b46fc           cmp ax, word ptr [bp - 4]                
  11db  7503             jne 0x11e0                               
  11dd  e90002           jmp 0x13e0                               
  11e0  c45e06           les bx, ptr [bp + 6]                     
  11e3  26837f0a01       cmp word ptr es:[bx + 0xa], 1            
  11e8  7526             jne 0x1210                               
  11ea  8b46fe           mov ax, word ptr [bp - 2]                
  11ed  ba9c00           mov dx, 0x9c                             
  11f0  f7ea             imul dx                                  
  11f2  c41e763f         les bx, ptr [0x3f76]                     
  11f6  03d8             add bx, ax                               
  11f8  035efc           add bx, word ptr [bp - 4]                
  11fb  268a07           mov al, byte ptr es:[bx]                 
  11fe  b400             mov ah, 0                                
  1200  8bd0             mov dx, ax                               
  1202  250800           and ax, 8                                
  1205  8946e4           mov word ptr [bp - 0x1c], ax             
  1208  8bc2             mov ax, dx                               
  120a  251000           and ax, 0x10                             
  120d  8946e2           mov word ptr [bp - 0x1e], ax             
  1210  b8ffff           mov ax, 0xffff                           
  1213  8946f6           mov word ptr [bp - 0xa], ax              
  1216  8946f8           mov word ptr [bp - 8], ax                
  1219  c45e06           les bx, ptr [bp + 6]                     
  121c  26ff7706         push word ptr es:[bx + 6]                
  1220  26ff7704         push word ptr es:[bx + 4]                
  1224  51               push cx                                  
  1225  57               push di                                  
  1226  9ae40a8b0a       lcall 0xa8b, 0xae4                       -> 0a8b:0ae4
  122b  83c408           add sp, 8                                
  122e  8946ee           mov word ptr [bp - 0x12], ax             
  1231  c746f40000       mov word ptr [bp - 0xc], 0               
  1236  be1202           mov si, 0x212                            
  1239  8b46ee           mov ax, word ptr [bp - 0x12]             
  123c  0304             add ax, word ptr [si]                    
  123e  bb0800           mov bx, 8                                
  1241  99               cdq                                      
  1242  f7fb             idiv bx                                  
  1244  8956e0           mov word ptr [bp - 0x20], dx             
  1247  8b5ee0           mov bx, word ptr [bp - 0x20]             
  124a  d1e3             shl bx, 1                                
  124c  8b46fe           mov ax, word ptr [bp - 2]                
  124f  03872202         add ax, word ptr [bx + 0x222]            
  1253  8bf8             mov di, ax                               
  1255  8b5ee0           mov bx, word ptr [bp - 0x20]             
  1258  d1e3             shl bx, 1                                
  125a  8b4efc           mov cx, word ptr [bp - 4]                
  125d  038f3202         add cx, word ptr [bx + 0x232]            
  1261  833ee00000       cmp word ptr [0xe0], 0                   
  1266  744a             je 0x12b2                                
  1268  f746e00100       test word ptr [bp - 0x20], 1             
  126d  7443             je 0x12b2                                
  126f  ba9c00           mov dx, 0x9c                             
  1272  f7ea             imul dx                                  
  1274  c41e763f         les bx, ptr [0x3f76]                     
  1278  03d8             add bx, ax                               
  127a  03d9             add bx, cx                               
  127c  26f60708         test byte ptr es:[bx], 8                 
  1280  7503             jne 0x1285                               
  1282  e90901           jmp 0x138e                               
  1285  8bc1             mov ax, cx                               
  1287  bae000           mov dx, 0xe0                             
  128a  f7ea             imul dx                                  
  128c  8bd7             mov dx, di                               
  128e  d1e2             shl dx, 1                                
  1290  03c2             add ax, dx                               
  1292  ba1d1e           mov dx, 0x1e1d                           
  1295  8bd8             mov bx, ax                               
  1297  8ec2             mov es, dx                               
  1299  268a9f0000       mov bl, byte ptr es:[bx]                 
  129e  81e3ff00         and bx, 0xff                             
  12a2  b8042c           mov ax, 0x2c04                           
  12a5  8ec0             mov es, ax                               
  12a7  2680bf100701     cmp byte ptr es:[bx + 0x710], 1          
  12ad  7503             jne 0x12b2                               
  12af  e9dc00           jmp 0x138e                               
  12b2  0bff             or di, di                                
  12b4  7d03             jge 0x12b9                               
  12b6  e9d500           jmp 0x138e                               
  12b9  83ff70           cmp di, 0x70                             
  12bc  7c03             jl 0x12c1                                
  12be  e9cd00           jmp 0x138e                               
  12c1  0bc9             or cx, cx                                
  12c3  7d03             jge 0x12c8                               
  12c5  e9c600           jmp 0x138e                               
  12c8  81f99c00         cmp cx, 0x9c                             
  12cc  7c03             jl 0x12d1                                
  12ce  e9bd00           jmp 0x138e                               
  12d1  8bc7             mov ax, di                               
  12d3  ba3801           mov dx, 0x138                            
  12d6  f7ea             imul dx                                  
  12d8  c41e7a3f         les bx, ptr [0x3f7a]                     
  12dc  03d8             add bx, ax                               
  12de  895ee8           mov word ptr [bp - 0x18], bx             
  12e1  8bc1             mov ax, cx                               
  12e3  d1e0             shl ax, 1                                
  12e5  03d8             add bx, ax                               
  12e7  26813f3075       cmp word ptr es:[bx], 0x7530             
  12ec  7503             jne 0x12f1                               
  12ee  e99d00           jmp 0x138e                               
  12f1  8b5ee8           mov bx, word ptr [bp - 0x18]             
  12f4  8bc1             mov ax, cx                               
  12f6  d1e0             shl ax, 1                                
  12f8  03d8             add bx, ax                               
  12fa  26813f3175       cmp word ptr es:[bx], 0x7531             
  12ff  7503             jne 0x1304                               
  1301  e98a00           jmp 0x138e                               
  1304  837ee200         cmp word ptr [bp - 0x1e], 0              
  1308  7547             jne 0x1351                               
  130a  8bc7             mov ax, di                               
  130c  ba9c00           mov dx, 0x9c                             
  130f  f7ea             imul dx                                  
  1311  c41e763f         les bx, ptr [0x3f76]                     
  1315  03d8             add bx, ax                               
  1317  03d9             add bx, cx                               
  1319  8bd3             mov dx, bx                               
  131b  268a07           mov al, byte ptr es:[bx]                 
  131e  b400             mov ah, 0                                
  1320  8946e6           mov word ptr [bp - 0x1a], ax             
  1323  a91000           test ax, 0x10                            
  1326  7529             jne 0x1351                               
  1328  c45e06           les bx, ptr [bp + 6]                     
  132b  26837f0a01       cmp word ptr es:[bx + 0xa], 1            
  1330  751f             jne 0x1351                               
  1332  837ee400         cmp word ptr [bp - 0x1c], 0              
  1336  7407             je 0x133f                                
  1338  f746e60800       test word ptr [bp - 0x1a], 8             
  133d  744f             je 0x138e                                
  133f  837ee400         cmp word ptr [bp - 0x1c], 0              
  1343  750c             jne 0x1351                               
  1345  8e06783f         mov es, word ptr [0x3f78]                
  1349  8bda             mov bx, dx                               
  134b  26f60708         test byte ptr es:[bx], 8                 
  134f  753d             jne 0x138e                               
  1351  8e067c3f         mov es, word ptr [0x3f7c]                
  1355  8b5ee8           mov bx, word ptr [bp - 0x18]             
  1358  8bc1             mov ax, cx                               
  135a  d1e0             shl ax, 1                                
  135c  03d8             add bx, ax                               
  135e  268b07           mov ax, word ptr es:[bx]                 
  1361  99               cdq                                      
  1362  33c2             xor ax, dx                               
  1364  2bc2             sub ax, dx                               
  1366  8bd0             mov dx, ax                               
  1368  3b56fa           cmp dx, word ptr [bp - 6]                
  136b  7c12             jl 0x137f                                
  136d  833ee00000       cmp word ptr [0xe0], 0                   
  1372  741a             je 0x138e                                
  1374  837ef8ff         cmp word ptr [bp - 8], -1                
  1378  7514             jne 0x138e                               
  137a  3b56fa           cmp dx, word ptr [bp - 6]                
  137d  750f             jne 0x138e                               
  137f  8956fa           mov word ptr [bp - 6], dx                
  1382  897ef8           mov word ptr [bp - 8], di                
  1385  894ef6           mov word ptr [bp - 0xa], cx              
  1388  8b46e0           mov ax, word ptr [bp - 0x20]             
  138b  8946f0           mov word ptr [bp - 0x10], ax             
  138e  83c602           add si, 2                                
  1391  ff46f4           inc word ptr [bp - 0xc]                  
  1394  81fe2202         cmp si, 0x222                            
  1398  7403             je 0x139d                                
  139a  e99cfe           jmp 0x1239                               
  139d  817ef2c600       cmp word ptr [bp - 0xe], 0xc6            
  13a2  7d06             jge 0x13aa                               
  13a4  837ef8ff         cmp word ptr [bp - 8], -1                
  13a8  7514             jne 0x13be                               
  13aa  c45e06           les bx, ptr [bp + 6]                     
  13ad  8b46fe           mov ax, word ptr [bp - 2]                
  13b0  26894704         mov word ptr es:[bx + 4], ax             
  13b4  8b46fc           mov ax, word ptr [bp - 4]                
  13b7  26894706         mov word ptr es:[bx + 6], ax             
  13bb  e905fe           jmp 0x11c3                               
  13be  8b46f8           mov ax, word ptr [bp - 8]                
  13c1  8946fe           mov word ptr [bp - 2], ax                
  13c4  8b46f6           mov ax, word ptr [bp - 0xa]              
  13c7  8946fc           mov word ptr [bp - 4], ax                
  13ca  c45e06           les bx, ptr [bp + 6]                     
  13cd  26c45f0c         les bx, ptr es:[bx + 0xc]                
  13d1  035ef2           add bx, word ptr [bp - 0xe]              
  13d4  8a46f0           mov al, byte ptr [bp - 0x10]             
  13d7  268807           mov byte ptr es:[bx], al                 
  13da  ff46f2           inc word ptr [bp - 0xe]                  
  13dd  e9e3fd           jmp 0x11c3                               
  13e0  5f               pop di                                   
  13e1  5e               pop si                                   
  13e2  c9               leave                                    
  13e3  cb               retf                                     

res_0555_13e4:  ; ENTRY
  13e4  55               push bp                                  
  13e5  8bec             mov bp, sp                               
  13e7  83ec04           sub sp, 4                                
  13ea  56               push si                                  
  13eb  33f6             xor si, si                               
  13ed  c45e06           les bx, ptr [bp + 6]                     
  13f0  268b07           mov ax, word ptr es:[bx]                 
  13f3  8946fe           mov word ptr [bp - 2], ax                
  13f6  268b4702         mov ax, word ptr es:[bx + 2]             
  13fa  8946fc           mov word ptr [bp - 4], ax                
  13fd  b8042c           mov ax, 0x2c04                           
  1400  8b56fe           mov dx, word ptr [bp - 2]                
  1403  8ec0             mov es, ax                               
  1405  2689167d01       mov word ptr es:[0x17d], dx              
  140a  8b56fc           mov dx, word ptr [bp - 4]                
  140d  8ec0             mov es, ax                               
  140f  2689167f01       mov word ptr es:[0x17f], dx              
  1414  9a3900f930       lcall 0x30f9, 0x39                       -> ovl64:006c
  1419  666801000f00     push 0xf0001                             
  141f  ff76fc           push word ptr [bp - 4]                   
  1422  ff76fe           push word ptr [bp - 2]                   
  1425  9a20007b07       lcall 0x77b, 0x20                        -> 077b:0020
  142a  83c408           add sp, 8                                
  142d  9a5f007b07       lcall 0x77b, 0x5f                        -> 077b:005f
  1432  c45e06           les bx, ptr [bp + 6]                     
  1435  26c45f0c         les bx, ptr es:[bx + 0xc]                
  1439  03de             add bx, si                               
  143b  26803fff         cmp byte ptr es:[bx], 0xff               
  143f  7428             je 0x1469                                
  1441  c45e06           les bx, ptr [bp + 6]                     
  1444  26c45f0c         les bx, ptr es:[bx + 0xc]                
  1448  8bc6             mov ax, si                               
  144a  46               inc si                                   
  144b  03d8             add bx, ax                               
  144d  268a07           mov al, byte ptr es:[bx]                 
  1450  b400             mov ah, 0                                
  1452  50               push ax                                  
  1453  16               push ss                                  
  1454  8d46fc           lea ax, [bp - 4]                         
  1457  50               push ax                                  
  1458  16               push ss                                  
  1459  8d46fe           lea ax, [bp - 2]                         
  145c  50               push ax                                  
  145d  9a4d0b8b0a       lcall 0xa8b, 0xb4d                       -> 0a8b:0b4d
  1462  83c40a           add sp, 0xa                              
  1465  0bc0             or ax, ax                                
  1467  7594             jne 0x13fd                               
  1469  5e               pop si                                   
  146a  c9               leave                                    
  146b  cb               retf                                     

res_0555_146c:  ; ENTRY
  146c  55               push bp                                  
  146d  8bec             mov bp, sp                               
  146f  66ff367e3f       push dword ptr [0x3f7e]                  
  1474  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1479  83c404           add sp, 4                                
  147c  8916743f         mov word ptr [0x3f74], dx                
  1480  a3723f           mov word ptr [0x3f72], ax                
  1483  b9c800           mov cx, 0xc8                              ; "Quest"
  1486  8b4606           mov ax, word ptr [bp + 6]                
  1489  bad600           mov dx, 0xd6                             
  148c  f7ea             imul dx                                  
  148e  8bd0             mov dx, ax                               
  1490  eb0d             jmp 0x149f                               
  1492  c41e723f         les bx, ptr [0x3f72]                     
  1496  03da             add bx, dx                               
  1498  03d9             add bx, cx                               
  149a  26c6470e00       mov byte ptr es:[bx + 0xe], 0            
  149f  8bc1             mov ax, cx                               
  14a1  49               dec cx                                   
  14a2  0bc0             or ax, ax                                
  14a4  75ec             jne 0x1492                               
  14a6  c41e723f         les bx, ptr [0x3f72]                     
  14aa  03da             add bx, dx                               
  14ac  26c7070000       mov word ptr es:[bx], 0                  
  14b1  8b1e723f         mov bx, word ptr [0x3f72]                
  14b5  03da             add bx, dx                               
  14b7  26c747020000     mov word ptr es:[bx + 2], 0              
  14bd  8b1e723f         mov bx, word ptr [0x3f72]                
  14c1  03da             add bx, dx                               
  14c3  26c747040000     mov word ptr es:[bx + 4], 0              
  14c9  8b1e723f         mov bx, word ptr [0x3f72]                
  14cd  03da             add bx, dx                               
  14cf  26c747060000     mov word ptr es:[bx + 6], 0              
  14d5  8b1e723f         mov bx, word ptr [0x3f72]                
  14d9  03da             add bx, dx                               
  14db  26c747080000     mov word ptr es:[bx + 8], 0              
  14e1  8b1e723f         mov bx, word ptr [0x3f72]                
  14e5  03da             add bx, dx                               
  14e7  26c7470a0000     mov word ptr es:[bx + 0xa], 0            
  14ed  8b1e723f         mov bx, word ptr [0x3f72]                
  14f1  03da             add bx, dx                               
  14f3  26c7470c0000     mov word ptr es:[bx + 0xc], 0            
  14f9  66ff367e3f       push dword ptr [0x3f7e]                  
  14fe  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1503  83c404           add sp, 4                                
  1506  5d               pop bp                                   
  1507  cb               retf                                     

res_0555_1508:  ; ENTRY
  1508  55               push bp                                  
  1509  8bec             mov bp, sp                               
  150b  56               push si                                  
  150c  57               push di                                  
  150d  33ff             xor di, di                               
  150f  66ff367e3f       push dword ptr [0x3f7e]                  
  1514  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1519  83c404           add sp, 4                                
  151c  8916743f         mov word ptr [0x3f74], dx                
  1520  a3723f           mov word ptr [0x3f72], ax                
  1523  66ff36863f       push dword ptr [0x3f86]                  
  1528  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  152d  83c404           add sp, 4                                
  1530  89167c3f         mov word ptr [0x3f7c], dx                
  1534  a37a3f           mov word ptr [0x3f7a], ax                
  1537  837e0a00         cmp word ptr [bp + 0xa], 0               
  153b  7423             je 0x1560                                
  153d  be0100           mov si, 1                                
  1540  eb17             jmp 0x1559                               
  1542  56               push si                                  
  1543  66ff7606         push dword ptr [bp + 6]                  
  1547  90               nop                                      
  1548  0e               push cs                                  
  1549  e84900           call 0x1595                              
  154c  83c406           add sp, 6                                
  154f  0bc0             or ax, ax                                
  1551  7405             je 0x1558                                
  1553  bf0100           mov di, 1                                
  1556  eb1d             jmp 0x1575                               
  1558  46               inc si                                   
  1559  83fe14           cmp si, 0x14                             
  155c  7ce4             jl 0x1542                                
  155e  eb15             jmp 0x1575                               
  1560  6a00             push 0                                   
  1562  66ff7606         push dword ptr [bp + 6]                  
  1566  90               nop                                      
  1567  0e               push cs                                  
  1568  e82a00           call 0x1595                              
  156b  83c406           add sp, 6                                
  156e  0bc0             or ax, ax                                
  1570  7403             je 0x1575                                
  1572  bf0100           mov di, 1                                
  1575  66ff36863f       push dword ptr [0x3f86]                  
  157a  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  157f  83c404           add sp, 4                                
  1582  66ff367e3f       push dword ptr [0x3f7e]                  
  1587  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  158c  83c404           add sp, 4                                
  158f  8bc7             mov ax, di                               
  1591  5f               pop di                                   
  1592  5e               pop si                                   
  1593  5d               pop bp                                   
  1594  cb               retf                                     

res_0555_1595:  ; ENTRY
  1595  55               push bp                                  
  1596  8bec             mov bp, sp                               
  1598  83ec02           sub sp, 2                                
  159b  56               push si                                  
  159c  57               push di                                  
  159d  33ff             xor di, di                               
  159f  c45e06           les bx, ptr [bp + 6]                     
  15a2  268b4704         mov ax, word ptr es:[bx + 4]             
  15a6  50               push ax                                  
  15a7  8b460a           mov ax, word ptr [bp + 0xa]              
  15aa  bad600           mov dx, 0xd6                             
  15ad  f7ea             imul dx                                  
  15af  c41e723f         les bx, ptr [0x3f72]                     
  15b3  03d8             add bx, ax                               
  15b5  8bf3             mov si, bx                               
  15b7  58               pop ax                                   
  15b8  263b470a         cmp ax, word ptr es:[bx + 0xa]           
  15bc  7403             je 0x15c1                                
  15be  e99500           jmp 0x1656                               
  15c1  c45e06           les bx, ptr [bp + 6]                     
  15c4  268b4706         mov ax, word ptr es:[bx + 6]             
  15c8  8e06743f         mov es, word ptr [0x3f74]                
  15cc  263b440c         cmp ax, word ptr es:[si + 0xc]           
  15d0  7403             je 0x15d5                                
  15d2  e98100           jmp 0x1656                               
  15d5  8e4608           mov es, word ptr [bp + 8]                
  15d8  268b470a         mov ax, word ptr es:[bx + 0xa]           
  15dc  8e06743f         mov es, word ptr [0x3f74]                
  15e0  263b4402         cmp ax, word ptr es:[si + 2]             
  15e4  7570             jne 0x1656                               
  15e6  8e4608           mov es, word ptr [bp + 8]                
  15e9  268b4708         mov ax, word ptr es:[bx + 8]             
  15ed  8e06743f         mov es, word ptr [0x3f74]                
  15f1  263b4404         cmp ax, word ptr es:[si + 4]             
  15f5  755f             jne 0x1656                               
  15f7  ff760a           push word ptr [bp + 0xa]                 
  15fa  8e4608           mov es, word ptr [bp + 8]                
  15fd  26ff7702         push word ptr es:[bx + 2]                
  1601  26ff37           push word ptr es:[bx]                    
  1604  90               nop                                      
  1605  0e               push cs                                  
  1606  e85300           call 0x165c                              
  1609  83c406           add sp, 6                                
  160c  8946fe           mov word ptr [bp - 2], ax                
  160f  3dffff           cmp ax, 0xffff                           
  1612  7442             je 0x1656                                
  1614  8b4efe           mov cx, word ptr [bp - 2]                
  1617  33ff             xor di, di                               
  1619  a1723f           mov ax, word ptr [0x3f72]                
  161c  50               push ax                                  
  161d  8b460a           mov ax, word ptr [bp + 0xa]              
  1620  bad600           mov dx, 0xd6                             
  1623  f7ea             imul dx                                  
  1625  5a               pop dx                                   
  1626  03d0             add dx, ax                               
  1628  8bf2             mov si, dx                               
  162a  eb18             jmp 0x1644                               
  162c  8e06743f         mov es, word ptr [0x3f74]                
  1630  8bd9             mov bx, cx                               
  1632  268a400e         mov al, byte ptr es:[bx + si + 0xe]      
  1636  c45e06           les bx, ptr [bp + 6]                     
  1639  26c45f0c         les bx, ptr es:[bx + 0xc]                
  163d  03df             add bx, di                               
  163f  268807           mov byte ptr es:[bx], al                 
  1642  41               inc cx                                   
  1643  47               inc di                                   
  1644  81f9c800         cmp cx, 0xc8                              ; "Quest"
  1648  7ce2             jl 0x162c                                
  164a  8e06743f         mov es, word ptr [0x3f74]                
  164e  26c7040200       mov word ptr es:[si], 2                  
  1653  bf0100           mov di, 1                                
  1656  8bc7             mov ax, di                               
  1658  5f               pop di                                   
  1659  5e               pop si                                   
  165a  c9               leave                                    
  165b  cb               retf                                     

res_0555_165c:  ; ENTRY
  165c  55               push bp                                  
  165d  8bec             mov bp, sp                               
  165f  83ec04           sub sp, 4                                
  1662  56               push si                                  
  1663  57               push di                                  
  1664  8b460a           mov ax, word ptr [bp + 0xa]              
  1667  bad600           mov dx, 0xd6                             
  166a  f7ea             imul dx                                  
  166c  c41e723f         les bx, ptr [0x3f72]                     
  1670  03d8             add bx, ax                               
  1672  8bf3             mov si, bx                               
  1674  268b4706         mov ax, word ptr es:[bx + 6]             
  1678  8946fe           mov word ptr [bp - 2], ax                
  167b  268b4408         mov ax, word ptr es:[si + 8]             
  167f  8946fc           mov word ptr [bp - 4], ax                
  1682  33f6             xor si, si                               
  1684  8b460a           mov ax, word ptr [bp + 0xa]              
  1687  bad600           mov dx, 0xd6                             
  168a  f7ea             imul dx                                  
  168c  c41e723f         les bx, ptr [0x3f72]                     
  1690  03d8             add bx, ax                               
  1692  03de             add bx, si                               
  1694  8bfb             mov di, bx                               
  1696  26807f0eff       cmp byte ptr es:[bx + 0xe], 0xff         
  169b  7507             jne 0x16a4                               
  169d  b8ffff           mov ax, 0xffff                           
  16a0  5f               pop di                                   
  16a1  5e               pop si                                   
  16a2  c9               leave                                    
  16a3  cb               retf                                     
  16a4  8b46fe           mov ax, word ptr [bp - 2]                
  16a7  3b4606           cmp ax, word ptr [bp + 6]                
  16aa  750e             jne 0x16ba                               
  16ac  8b46fc           mov ax, word ptr [bp - 4]                
  16af  3b4608           cmp ax, word ptr [bp + 8]                
  16b2  7506             jne 0x16ba                               
  16b4  8bc6             mov ax, si                               
  16b6  5f               pop di                                   
  16b7  5e               pop si                                   
  16b8  c9               leave                                    
  16b9  cb               retf                                     
  16ba  8e06743f         mov es, word ptr [0x3f74]                
  16be  268a450e         mov al, byte ptr es:[di + 0xe]           
  16c2  b400             mov ah, 0                                
  16c4  50               push ax                                  
  16c5  16               push ss                                  
  16c6  8d46fc           lea ax, [bp - 4]                         
  16c9  50               push ax                                  
  16ca  16               push ss                                  
  16cb  8d46fe           lea ax, [bp - 2]                         
  16ce  50               push ax                                  
  16cf  9a4d0b8b0a       lcall 0xa8b, 0xb4d                       -> 0a8b:0b4d
  16d4  83c40a           add sp, 0xa                              
  16d7  0bc0             or ax, ax                                
  16d9  7507             jne 0x16e2                               
  16db  b8ffff           mov ax, 0xffff                           
  16de  5f               pop di                                   
  16df  5e               pop si                                   
  16e0  c9               leave                                    
  16e1  cb               retf                                     
  16e2  46               inc si                                   
  16e3  81fec800         cmp si, 0xc8                              ; "Quest"
  16e7  7c9b             jl 0x1684                                
  16e9  b8ffff           mov ax, 0xffff                           
  16ec  5f               pop di                                   
  16ed  5e               pop si                                   
  16ee  c9               leave                                    
  16ef  cb               retf                                     

res_0555_16f0:  ; ENTRY
  16f0  55               push bp                                  
  16f1  8bec             mov bp, sp                               
  16f3  83ec08           sub sp, 8                                
  16f6  56               push si                                  
  16f7  57               push di                                  
  16f8  c746feffff       mov word ptr [bp - 2], 0xffff            
  16fd  c746fc1027       mov word ptr [bp - 4], 0x2710            
  1702  c746faffff       mov word ptr [bp - 6], 0xffff            
  1707  c746f80100       mov word ptr [bp - 8], 1                 
  170c  66ff367e3f       push dword ptr [0x3f7e]                  
  1711  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1716  83c404           add sp, 4                                
  1719  8916743f         mov word ptr [0x3f74], dx                
  171d  a3723f           mov word ptr [0x3f72], ax                
  1720  837e0c00         cmp word ptr [bp + 0xc], 0               
  1724  7503             jne 0x1729                               
  1726  e98000           jmp 0x17a9                               
  1729  be0100           mov si, 1                                
  172c  eb44             jmp 0x1772                               
  172e  8bc6             mov ax, si                               
  1730  bad600           mov dx, 0xd6                             
  1733  f7ea             imul dx                                  
  1735  c41e723f         les bx, ptr [0x3f72]                     
  1739  03d8             add bx, ax                               
  173b  8bfb             mov di, bx                               
  173d  26833f00         cmp word ptr es:[bx], 0                  
  1741  7505             jne 0x1748                               
  1743  8976fe           mov word ptr [bp - 2], si                
  1746  eb2f             jmp 0x1777                               
  1748  8e06743f         mov es, word ptr [0x3f74]                
  174c  26ff7508         push word ptr es:[di + 8]                
  1750  26ff7506         push word ptr es:[di + 6]                
  1754  26ff750c         push word ptr es:[di + 0xc]              
  1758  26ff750a         push word ptr es:[di + 0xa]              
  175c  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1761  83c408           add sp, 8                                
  1764  8bd0             mov dx, ax                               
  1766  3b56fc           cmp dx, word ptr [bp - 4]                
  1769  7d06             jge 0x1771                               
  176b  8956fc           mov word ptr [bp - 4], dx                
  176e  8976fa           mov word ptr [bp - 6], si                
  1771  46               inc si                                   
  1772  83fe14           cmp si, 0x14                             
  1775  7cb7             jl 0x172e                                
  1777  837efeff         cmp word ptr [bp - 2], -1                
  177b  750b             jne 0x1788                               
  177d  837efaff         cmp word ptr [bp - 6], -1                
  1781  7505             jne 0x1788                               
  1783  c746f80000       mov word ptr [bp - 8], 0                 
  1788  837efeff         cmp word ptr [bp - 2], -1                
  178c  750e             jne 0x179c                               
  178e  8b46fc           mov ax, word ptr [bp - 4]                
  1791  3b4606           cmp ax, word ptr [bp + 6]                
  1794  7d06             jge 0x179c                               
  1796  8b46fa           mov ax, word ptr [bp - 6]                
  1799  8946fe           mov word ptr [bp - 2], ax                
  179c  837efeff         cmp word ptr [bp - 2], -1                
  17a0  750c             jne 0x17ae                               
  17a2  c746f80000       mov word ptr [bp - 8], 0                 
  17a7  eb05             jmp 0x17ae                               
  17a9  c746fe0000       mov word ptr [bp - 2], 0                 
  17ae  837ef800         cmp word ptr [bp - 8], 0                 
  17b2  7503             jne 0x17b7                               
  17b4  e9a000           jmp 0x1857                               
  17b7  bec800           mov si, 0xc8                              ; "Quest"
  17ba  8b46fe           mov ax, word ptr [bp - 2]                
  17bd  bad600           mov dx, 0xd6                             
  17c0  f7ea             imul dx                                  
  17c2  8bd0             mov dx, ax                               
  17c4  eb18             jmp 0x17de                               
  17c6  c45e08           les bx, ptr [bp + 8]                     
  17c9  26c45f0c         les bx, ptr es:[bx + 0xc]                
  17cd  03de             add bx, si                               
  17cf  268a07           mov al, byte ptr es:[bx]                 
  17d2  c41e723f         les bx, ptr [0x3f72]                     
  17d6  03da             add bx, dx                               
  17d8  03de             add bx, si                               
  17da  2688470e         mov byte ptr es:[bx + 0xe], al           
  17de  8bc6             mov ax, si                               
  17e0  4e               dec si                                   
  17e1  0bc0             or ax, ax                                
  17e3  75e1             jne 0x17c6                               
  17e5  c41e723f         les bx, ptr [0x3f72]                     
  17e9  03da             add bx, dx                               
  17eb  26c7070200       mov word ptr es:[bx], 2                  
  17f0  c45e08           les bx, ptr [bp + 8]                     
  17f3  268b470a         mov ax, word ptr es:[bx + 0xa]           
  17f7  c41e723f         les bx, ptr [0x3f72]                     
  17fb  03da             add bx, dx                               
  17fd  26894702         mov word ptr es:[bx + 2], ax             
  1801  c45e08           les bx, ptr [bp + 8]                     
  1804  268b4708         mov ax, word ptr es:[bx + 8]             
  1808  c41e723f         les bx, ptr [0x3f72]                     
  180c  03da             add bx, dx                               
  180e  26894704         mov word ptr es:[bx + 4], ax             
  1812  8b1e723f         mov bx, word ptr [0x3f72]                
  1816  03da             add bx, dx                               
  1818  06               push es                                  
  1819  c47608           les si, ptr [bp + 8]                     
  181c  268b04           mov ax, word ptr es:[si]                 
  181f  07               pop es                                   
  1820  26894706         mov word ptr es:[bx + 6], ax             
  1824  c45e08           les bx, ptr [bp + 8]                     
  1827  268b4702         mov ax, word ptr es:[bx + 2]             
  182b  c41e723f         les bx, ptr [0x3f72]                     
  182f  03da             add bx, dx                               
  1831  26894708         mov word ptr es:[bx + 8], ax             
  1835  c45e08           les bx, ptr [bp + 8]                     
  1838  268b4704         mov ax, word ptr es:[bx + 4]             
  183c  c41e723f         les bx, ptr [0x3f72]                     
  1840  03da             add bx, dx                               
  1842  2689470a         mov word ptr es:[bx + 0xa], ax           
  1846  c45e08           les bx, ptr [bp + 8]                     
  1849  268b4706         mov ax, word ptr es:[bx + 6]             
  184d  c41e723f         les bx, ptr [0x3f72]                     
  1851  03da             add bx, dx                               
  1853  2689470c         mov word ptr es:[bx + 0xc], ax           
  1857  66ff367e3f       push dword ptr [0x3f7e]                  
  185c  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1861  83c404           add sp, 4                                
  1864  5f               pop di                                   
  1865  5e               pop si                                   
  1866  c9               leave                                    
  1867  cb               retf                                     

res_0555_1868:  ; ENTRY
  1868  55               push bp                                  
  1869  8bec             mov bp, sp                               
  186b  c41e625e         les bx, ptr [0x5e62]                     
  186f  268b07           mov ax, word ptr es:[bx]                 
  1872  c45e06           les bx, ptr [bp + 6]                     
  1875  268907           mov word ptr es:[bx], ax                 
  1878  c41e625e         les bx, ptr [0x5e62]                     
  187c  268b4702         mov ax, word ptr es:[bx + 2]             
  1880  c45e06           les bx, ptr [bp + 6]                     
  1883  26894702         mov word ptr es:[bx + 2], ax             
  1887  c41e625e         les bx, ptr [0x5e62]                     
  188b  268b4712         mov ax, word ptr es:[bx + 0x12]          
  188f  c45e06           les bx, ptr [bp + 6]                     
  1892  26894704         mov word ptr es:[bx + 4], ax             
  1896  c41e625e         les bx, ptr [0x5e62]                     
  189a  268b4714         mov ax, word ptr es:[bx + 0x14]          
  189e  c45e06           les bx, ptr [bp + 6]                     
  18a1  26894706         mov word ptr es:[bx + 6], ax             
  18a5  668b460a         mov eax, dword ptr [bp + 0xa]            
  18a9  662689470c       mov dword ptr es:[bx + 0xc], eax         
  18ae  a1fc5d           mov ax, word ptr [0x5dfc]                
  18b1  2689470a         mov word ptr es:[bx + 0xa], ax           
  18b5  a1fa5d           mov ax, word ptr [0x5dfa]                
  18b8  26894708         mov word ptr es:[bx + 8], ax             
  18bc  5d               pop bp                                   
  18bd  cb               retf                                     

res_0555_18be:  ; ENTRY
  18be  55               push bp                                  
  18bf  8bec             mov bp, sp                               
  18c1  83ec0c           sub sp, 0xc                              
  18c4  56               push si                                  
  18c5  57               push di                                  
  18c6  c45e06           les bx, ptr [bp + 6]                     
  18c9  268b07           mov ax, word ptr es:[bx]                 
  18cc  8946fe           mov word ptr [bp - 2], ax                
  18cf  268b4702         mov ax, word ptr es:[bx + 2]             
  18d3  8946fc           mov word ptr [bp - 4], ax                
  18d6  c746fa0000       mov word ptr [bp - 6], 0                 
  18db  c746f80000       mov word ptr [bp - 8], 0                 
  18e0  268b4708         mov ax, word ptr es:[bx + 8]             
  18e4  250800           and ax, 8                                
  18e7  8946f6           mov word ptr [bp - 0xa], ax              
  18ea  c746f40000       mov word ptr [bp - 0xc], 0               
  18ef  66837e0c00       cmp dword ptr [bp + 0xc], 0              
  18f4  741a             je 0x1910                                
  18f6  ba6400           mov dx, 0x64                             
  18f9  8b760c           mov si, word ptr [bp + 0xc]              
  18fc  83c664           add si, 0x64                             
  18ff  eb07             jmp 0x1908                               
  1901  8e460e           mov es, word ptr [bp + 0xe]              
  1904  26c604ff         mov byte ptr es:[si], 0xff               
  1908  4e               dec si                                   
  1909  8bc2             mov ax, dx                               
  190b  4a               dec dx                                   
  190c  0bc0             or ax, ax                                
  190e  75f1             jne 0x1901                               
  1910  66ff36863f       push dword ptr [0x3f86]                  
  1915  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  191a  83c404           add sp, 4                                
  191d  89167c3f         mov word ptr [0x3f7c], dx                
  1921  a37a3f           mov word ptr [0x3f7a], ax                
  1924  66ff36823f       push dword ptr [0x3f82]                  
  1929  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  192e  83c404           add sp, 4                                
  1931  8916783f         mov word ptr [0x3f78], dx                
  1935  a3763f           mov word ptr [0x3f76], ax                
  1938  33f6             xor si, si                               
  193a  8b7e0c           mov di, word ptr [bp + 0xc]              
  193d  c45e06           les bx, ptr [bp + 6]                     
  1940  26c45f0c         les bx, ptr es:[bx + 0xc]                
  1944  03de             add bx, si                               
  1946  26803fff         cmp byte ptr es:[bx], 0xff               
  194a  7477             je 0x19c3                                
  194c  c45e06           les bx, ptr [bp + 6]                     
  194f  26c45f0c         les bx, ptr es:[bx + 0xc]                
  1953  03de             add bx, si                               
  1955  268a07           mov al, byte ptr es:[bx]                 
  1958  b400             mov ah, 0                                
  195a  50               push ax                                  
  195b  16               push ss                                  
  195c  8d46fc           lea ax, [bp - 4]                         
  195f  50               push ax                                  
  1960  16               push ss                                  
  1961  8d46fe           lea ax, [bp - 2]                         
  1964  50               push ax                                  
  1965  9a4d0b8b0a       lcall 0xa8b, 0xb4d                       -> 0a8b:0b4d
  196a  83c40a           add sp, 0xa                              
  196d  0bc0             or ax, ax                                
  196f  7452             je 0x19c3                                
  1971  16               push ss                                  
  1972  8d46f4           lea ax, [bp - 0xc]                       
  1975  50               push ax                                  
  1976  ff76f6           push word ptr [bp - 0xa]                 
  1979  ff76fc           push word ptr [bp - 4]                   
  197c  ff76fe           push word ptr [bp - 2]                   
  197f  66ff7606         push dword ptr [bp + 6]                  
  1983  90               nop                                      
  1984  0e               push cs                                  
  1985  e85c00           call 0x19e4                              
  1988  83c40e           add sp, 0xe                              
  198b  0146f8           add word ptr [bp - 8], ax                
  198e  66837e0c00       cmp dword ptr [bp + 0xc], 0              
  1993  7419             je 0x19ae                                
  1995  83fe64           cmp si, 0x64                             
  1998  7d14             jge 0x19ae                               
  199a  817ef8ff00       cmp word ptr [bp - 8], 0xff              
  199f  7d05             jge 0x19a6                               
  19a1  8a46f8           mov al, byte ptr [bp - 8]                
  19a4  eb02             jmp 0x19a8                               
  19a6  b0ff             mov al, 0xff                             
  19a8  8e460e           mov es, word ptr [bp + 0xe]              
  19ab  268805           mov byte ptr es:[di], al                 
  19ae  8b46f8           mov ax, word ptr [bp - 8]                
  19b1  3b460a           cmp ax, word ptr [bp + 0xa]              
  19b4  7f03             jg 0x19b9                                
  19b6  ff46fa           inc word ptr [bp - 6]                    
  19b9  47               inc di                                   
  19ba  46               inc si                                   
  19bb  83fe64           cmp si, 0x64                             
  19be  7d03             jge 0x19c3                               
  19c0  e97aff           jmp 0x193d                               
  19c3  66ff36863f       push dword ptr [0x3f86]                  
  19c8  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  19cd  83c404           add sp, 4                                
  19d0  66ff36823f       push dword ptr [0x3f82]                  
  19d5  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  19da  83c404           add sp, 4                                
  19dd  8b46fa           mov ax, word ptr [bp - 6]                
  19e0  5f               pop di                                   
  19e1  5e               pop si                                   
  19e2  c9               leave                                    
  19e3  cb               retf                                     

res_0555_19e4:  ; ENTRY
  19e4  55               push bp                                  
  19e5  8bec             mov bp, sp                               
  19e7  56               push si                                  
  19e8  8b760e           mov si, word ptr [bp + 0xe]              
  19eb  8b460a           mov ax, word ptr [bp + 0xa]              
  19ee  ba9c00           mov dx, 0x9c                             
  19f1  f7ea             imul dx                                  
  19f3  c41e763f         les bx, ptr [0x3f76]                     
  19f7  03d8             add bx, ax                               
  19f9  035e0c           add bx, word ptr [bp + 0xc]              
  19fc  268a07           mov al, byte ptr es:[bx]                 
  19ff  b400             mov ah, 0                                
  1a01  8bc8             mov cx, ax                               
  1a03  8bd0             mov dx, ax                               
  1a05  83e207           and dx, 7                                
  1a08  c45e10           les bx, ptr [bp + 0x10]                  
  1a0b  26833f00         cmp word ptr es:[bx], 0                  
  1a0f  7406             je 0x1a17                                
  1a11  b88000           mov ax, 0x80                             
  1a14  5e               pop si                                   
  1a15  5d               pop bp                                   
  1a16  cb               retf                                     
  1a17  c45e06           les bx, ptr [bp + 6]                     
  1a1a  26837f0a02       cmp word ptr es:[bx + 0xa], 2            
  1a1f  7536             jne 0x1a57                               
  1a21  f7c10800         test cx, 8                               
  1a25  740c             je 0x1a33                                
  1a27  f7c11000         test cx, 0x10                            
  1a2b  7506             jne 0x1a33                               
  1a2d  ba0200           mov dx, 2                                
  1a30  e98100           jmp 0x1ab4                               
  1a33  0bd2             or dx, dx                                
  1a35  7404             je 0x1a3b                                
  1a37  8bc2             mov ax, dx                               
  1a39  eb03             jmp 0x1a3e                               
  1a3b  b80200           mov ax, 2                                
  1a3e  3d0200           cmp ax, 2                                
  1a41  7e05             jle 0x1a48                               
  1a43  b80200           mov ax, 2                                
  1a46  eb0b             jmp 0x1a53                               
  1a48  0bd2             or dx, dx                                
  1a4a  7404             je 0x1a50                                
  1a4c  8bc2             mov ax, dx                               
  1a4e  eb03             jmp 0x1a53                               
  1a50  b80200           mov ax, 2                                
  1a53  8bd0             mov dx, ax                               
  1a55  eb5d             jmp 0x1ab4                               
  1a57  c45e06           les bx, ptr [bp + 6]                     
  1a5a  26837f0a01       cmp word ptr es:[bx + 0xa], 1            
  1a5f  7553             jne 0x1ab4                               
  1a61  f7c11000         test cx, 0x10                            
  1a65  751c             jne 0x1a83                               
  1a67  0bf6             or si, si                                
  1a69  7406             je 0x1a71                                
  1a6b  f7c10800         test cx, 8                               
  1a6f  740a             je 0x1a7b                                
  1a71  0bf6             or si, si                                
  1a73  750e             jne 0x1a83                               
  1a75  f7c10800         test cx, 8                               
  1a79  7408             je 0x1a83                                
  1a7b  c45e10           les bx, ptr [bp + 0x10]                  
  1a7e  26c7070100       mov word ptr es:[bx], 1                  
  1a83  c45e06           les bx, ptr [bp + 6]                     
  1a86  26837f0800       cmp word ptr es:[bx + 8], 0              
  1a8b  7427             je 0x1ab4                                
  1a8d  83fa02           cmp dx, 2                                
  1a90  7e22             jle 0x1ab4                               
  1a92  26f747080100     test word ptr es:[bx + 8], 1             
  1a98  7406             je 0x1aa0                                
  1a9a  f7c12000         test cx, 0x20                            
  1a9e  7511             jne 0x1ab1                               
  1aa0  c45e06           les bx, ptr [bp + 6]                     
  1aa3  26f747080200     test word ptr es:[bx + 8], 2             
  1aa9  7409             je 0x1ab4                                
  1aab  f7c14000         test cx, 0x40                            
  1aaf  7403             je 0x1ab4                                
  1ab1  ba0200           mov dx, 2                                
  1ab4  8bc2             mov ax, dx                               
  1ab6  5e               pop si                                   
  1ab7  5d               pop bp                                   
  1ab8  cb               retf                                     

res_0555_1ab9:  ; ENTRY
  1ab9  55               push bp                                  
  1aba  8bec             mov bp, sp                               
  1abc  81ecd800         sub sp, 0xd8                             
  1ac0  8b4606           mov ax, word ptr [bp + 6]                
  1ac3  a3703f           mov word ptr [0x3f70], ax                
  1ac6  8b4608           mov ax, word ptr [bp + 8]                
  1ac9  89862cff         mov word ptr [bp - 0xd4], ax             
  1acd  898628ff         mov word ptr [bp - 0xd8], ax             
  1ad1  8b460a           mov ax, word ptr [bp + 0xa]              
  1ad4  89862eff         mov word ptr [bp - 0xd2], ax             
  1ad8  89862aff         mov word ptr [bp - 0xd6], ax             
  1adc  8d8638ff         lea ax, [bp - 0xc8]                      
  1ae0  8c9636ff         mov word ptr [bp - 0xca], ss             
  1ae4  898634ff         mov word ptr [bp - 0xcc], ax             
  1ae8  8b460c           mov ax, word ptr [bp + 0xc]              
  1aeb  898632ff         mov word ptr [bp - 0xce], ax             
  1aef  8b460e           mov ax, word ptr [bp + 0xe]              
  1af2  898630ff         mov word ptr [bp - 0xd0], ax             
  1af6  838e30ff10       or word ptr [bp - 0xd0], 0x10            
  1afb  16               push ss                                  
  1afc  8d8628ff         lea ax, [bp - 0xd8]                      
  1b00  50               push ax                                  
  1b01  0e               push cs                                  
  1b02  e805e5           call 0xa                                 
  1b05  83c404           add sp, 4                                
  1b08  c9               leave                                    
  1b09  cb               retf                                     

res_0555_1b0a:  ; ENTRY
  1b0a  55               push bp                                  
  1b0b  8bec             mov bp, sp                               
  1b0d  833ede0000       cmp word ptr [0xde], 0                   
  1b12  7504             jne 0x1b18                               
  1b14  0e               push cs                                  
  1b15  e8dae7           call 0x2f2                               
  1b18  66ff36863f       push dword ptr [0x3f86]                  
  1b1d  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1b22  83c404           add sp, 4                                
  1b25  89167c3f         mov word ptr [0x3f7c], dx                
  1b29  a37a3f           mov word ptr [0x3f7a], ax                
  1b2c  5d               pop bp                                   
  1b2d  cb               retf                                     

res_0555_1b2e:  ; ENTRY
  1b2e  55               push bp                                  
  1b2f  8bec             mov bp, sp                               
  1b31  66ff36863f       push dword ptr [0x3f86]                  
  1b36  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1b3b  83c404           add sp, 4                                
  1b3e  5d               pop bp                                   
  1b3f  cb               retf                                     
  1b40  55               push bp                                  
