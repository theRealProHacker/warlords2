; res_14b0 file_off 0x16b00

res_14b0_000a:  ; ENTRY
  000a  8c1eea6f         mov word ptr [0x6fea], ds                
  000e  c706e86f2a34     mov word ptr [0x6fe8], 0x342a            
  0014  6a08             push 8                                   
  0016  1e               push ds                                  
  0017  682a34           push 0x342a                              
  001a  1e               push ds                                  
  001b  68ec6f           push 0x6fec                              
  001e  9a45430000       lcall 0, 0x4345                          -> 0000:4345
  0023  83c40a           add sp, 0xa                              
  0026  6a08             push 8                                   
  0028  1e               push ds                                  
  0029  682a34           push 0x342a                              
  002c  1e               push ds                                  
  002d  68f46f           push 0x6ff4                              
  0030  9a45430000       lcall 0, 0x4345                          -> 0000:4345
  0035  83c40a           add sp, 0xa                              
  0038  c706fc6f0800     mov word ptr [0x6ffc], 8                 
  003e  c70641700000     mov word ptr [0x7041], 0                 
  0044  c70643700f00     mov word ptr [0x7043], 0xf               
  004a  8c1e4b70         mov word ptr [0x704b], ds                
  004e  c7064970e46f     mov word ptr [0x7049], 0x6fe4            
  0054  cb               retf                                     
  0055  55               push bp                                  
  0056  8bec             mov bp, sp                               
  0058  66837e0600       cmp dword ptr [bp + 6], 0                
  005d  7503             jne 0x62                                 
  005f  e98f00           jmp 0xf1                                 
  0062  c45e06           les bx, ptr [bp + 6]                     
  0065  26f747180100     test word ptr es:[bx + 0x18], 1          
  006b  744e             je 0xbb                                  
  006d  c45e06           les bx, ptr [bp + 6]                     
  0070  26ff7757         push word ptr es:[bx + 0x57]             
  0074  c45e06           les bx, ptr [bp + 6]                     
  0077  26ff7755         push word ptr es:[bx + 0x55]             
  007b  c45e06           les bx, ptr [bp + 6]                     
  007e  26ff7706         push word ptr es:[bx + 6]                
  0082  26ff7704         push word ptr es:[bx + 4]                
  0086  c45e06           les bx, ptr [bp + 6]                     
  0089  26ff775b         push word ptr es:[bx + 0x5b]             
  008d  c45e06           les bx, ptr [bp + 6]                     
  0090  26ff7759         push word ptr es:[bx + 0x59]             
  0094  6a00             push 0                                   
  0096  6a00             push 0                                   
  0098  8b4606           mov ax, word ptr [bp + 6]                
  009b  051a00           add ax, 0x1a                             
  009e  ff7608           push word ptr [bp + 8]                   
  00a1  50               push ax                                  
  00a2  ff1ed469         lcall [0x69d4]                           
  00a6  83c414           add sp, 0x14                             
  00a9  8b4606           mov ax, word ptr [bp + 6]                
  00ac  051a00           add ax, 0x1a                             
  00af  ff7608           push word ptr [bp + 8]                   
  00b2  50               push ax                                  
  00b3  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  00b8  83c404           add sp, 4                                
  00bb  c45e06           les bx, ptr [bp + 6]                     
  00be  26f747180200     test word ptr es:[bx + 0x18], 2          
  00c4  7412             je 0xd8                                  
  00c6  8b4606           mov ax, word ptr [bp + 6]                
  00c9  050400           add ax, 4                                
  00cc  ff7608           push word ptr [bp + 8]                   
  00cf  50               push ax                                  
  00d0  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  00d5  83c404           add sp, 4                                
  00d8  c45e06           les bx, ptr [bp + 6]                     
  00db  26f747180400     test word ptr es:[bx + 0x18], 4          
  00e1  740e             je 0xf1                                  
  00e3  ff7608           push word ptr [bp + 8]                   
  00e6  ff7606           push word ptr [bp + 6]                   
  00e9  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  00ee  83c404           add sp, 4                                
  00f1  5d               pop bp                                   
  00f2  cb               retf                                     
  00f3  55               push bp                                  
  00f4  8bec             mov bp, sp                               
  00f6  c41e4970         les bx, ptr [0x7049]                     
  00fa  268b4708         mov ax, word ptr es:[bx + 8]             
  00fe  c45e06           les bx, ptr [bp + 6]                     
  0101  260107           add word ptr es:[bx], ax                 
  0104  c41e4970         les bx, ptr [0x7049]                     
  0108  268b470a         mov ax, word ptr es:[bx + 0xa]           
  010c  c45e06           les bx, ptr [bp + 6]                     
  010f  26014702         add word ptr es:[bx + 2], ax             
  0113  5d               pop bp                                   
  0114  cb               retf                                     
  0115  55               push bp                                  
  0116  8bec             mov bp, sp                               
  0118  c41e4970         les bx, ptr [0x7049]                     
  011c  268b4708         mov ax, word ptr es:[bx + 8]             
  0120  c45e06           les bx, ptr [bp + 6]                     
  0123  262907           sub word ptr es:[bx], ax                 
  0126  c41e4970         les bx, ptr [0x7049]                     
  012a  268b470a         mov ax, word ptr es:[bx + 0xa]           
  012e  c45e06           les bx, ptr [bp + 6]                     
  0131  26294702         sub word ptr es:[bx + 2], ax             
  0135  5d               pop bp                                   
  0136  cb               retf                                     

res_14b0_0137:  ; ENTRY
  0137  55               push bp                                  
  0138  8bec             mov bp, sp                               
  013a  c41e4970         les bx, ptr [0x7049]                     
  013e  268b4708         mov ax, word ptr es:[bx + 8]             
  0142  c45e06           les bx, ptr [bp + 6]                     
  0145  260107           add word ptr es:[bx], ax                 
  0148  c41e4970         les bx, ptr [0x7049]                     
  014c  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0150  c45e06           les bx, ptr [bp + 6]                     
  0153  26014702         add word ptr es:[bx + 2], ax             
  0157  5d               pop bp                                   
  0158  cb               retf                                     
  0159  55               push bp                                  
  015a  8bec             mov bp, sp                               
  015c  c41e4970         les bx, ptr [0x7049]                     
  0160  268b4708         mov ax, word ptr es:[bx + 8]             
  0164  c45e06           les bx, ptr [bp + 6]                     
  0167  268907           mov word ptr es:[bx], ax                 
  016a  c41e4970         les bx, ptr [0x7049]                     
  016e  268b470a         mov ax, word ptr es:[bx + 0xa]           
  0172  c45e06           les bx, ptr [bp + 6]                     
  0175  26894702         mov word ptr es:[bx + 2], ax             
  0179  c41e4970         les bx, ptr [0x7049]                     
  017d  268b470c         mov ax, word ptr es:[bx + 0xc]           
  0181  c45e06           les bx, ptr [bp + 6]                     
  0184  26894704         mov word ptr es:[bx + 4], ax             
  0188  c41e4970         les bx, ptr [0x7049]                     
  018c  268b470e         mov ax, word ptr es:[bx + 0xe]           
  0190  c45e06           les bx, ptr [bp + 6]                     
  0193  26894706         mov word ptr es:[bx + 6], ax             
  0197  5d               pop bp                                   
  0198  cb               retf                                     
  0199  55               push bp                                  
  019a  8bec             mov bp, sp                               
  019c  56               push si                                  
  019d  c41e4970         les bx, ptr [0x7049]                     
  01a1  06               push es                                  
  01a2  c47606           les si, ptr [bp + 6]                     
  01a5  268b04           mov ax, word ptr es:[si]                 
  01a8  07               pop es                                   
  01a9  26894708         mov word ptr es:[bx + 8], ax             
  01ad  c45e06           les bx, ptr [bp + 6]                     
  01b0  268b4702         mov ax, word ptr es:[bx + 2]             
  01b4  c41e4970         les bx, ptr [0x7049]                     
  01b8  2689470a         mov word ptr es:[bx + 0xa], ax           
  01bc  c45e06           les bx, ptr [bp + 6]                     
  01bf  268b4704         mov ax, word ptr es:[bx + 4]             
  01c3  c41e4970         les bx, ptr [0x7049]                     
  01c7  2689470c         mov word ptr es:[bx + 0xc], ax           
  01cb  c45e06           les bx, ptr [bp + 6]                     
  01ce  268b4706         mov ax, word ptr es:[bx + 6]             
  01d2  c41e4970         les bx, ptr [0x7049]                     
  01d6  2689470e         mov word ptr es:[bx + 0xe], ax           
  01da  5e               pop si                                   
  01db  5d               pop bp                                   
  01dc  cb               retf                                     
  01dd  6a08             push 8                                   
  01df  1e               push ds                                  
  01e0  682a34           push 0x342a                              
  01e3  1e               push ds                                  
  01e4  68ec6f           push 0x6fec                              
  01e7  9a45430000       lcall 0, 0x4345                          -> 0000:4345
  01ec  83c40a           add sp, 0xa                              
  01ef  cb               retf                                     

res_14b0_01f0:  ; ENTRY
  01f0  55               push bp                                  
  01f1  8bec             mov bp, sp                               
  01f3  c41e4970         les bx, ptr [0x7049]                     
  01f7  668b4606         mov eax, dword ptr [bp + 6]              
  01fb  6626894761       mov dword ptr es:[bx + 0x61], eax        
  0200  5d               pop bp                                   
  0201  cb               retf                                     
  0202  c8               db c8                                    
