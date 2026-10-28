; ovl45 stub 3064 file_off 0x66d70 size 0x2078

ovl45_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  57               push di                                  
  0005  8b7e06           mov di, word ptr [bp + 6]                
  0008  8b5608           mov dx, word ptr [bp + 8]                
  000b  8b5e0a           mov bx, word ptr [bp + 0xa]              
  000e  c706940e0000     mov word ptr [0xe94], 0                  
  0014  83ff04           cmp di, 4                                
  0017  7403             je 0x1c                                  
  0019  e98400           jmp 0xa0                                 
  001c  6a01             push 1                                   
  001e  53               push bx                                  
  001f  52               push dx                                  
  0020  9a4300e830       lcall 0x30e8, 0x43                       -> ovl62:06fd
  0025  83c406           add sp, 6                                
  0028  8bf0             mov si, ax                               
  002a  8bde             mov bx, si                               
  002c  6bdb1f           imul bx, bx, 0x1f                        
  002f  b8042c           mov ax, 0x2c04                           
  0032  8ec0             mov es, ax                               
  0034  26ffb71308       push word ptr es:[bx + 0x813]            
  0039  8bde             mov bx, si                               
  003b  6bdb1f           imul bx, bx, 0x1f                        
  003e  b8042c           mov ax, 0x2c04                           
  0041  8ec0             mov es, ax                               
  0043  26ffb71108       push word ptr es:[bx + 0x811]            
  0048  6a01             push 1                                   
  004a  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  004f  83c406           add sp, 6                                
  0052  0bc0             or ax, ax                                
  0054  7503             jne 0x59                                 
  0056  e98402           jmp 0x2dd                                
  0059  393e920e         cmp word ptr [0xe92], di                 
  005d  7515             jne 0x74                                 
  005f  3936980e         cmp word ptr [0xe98], si                 
  0063  750f             jne 0x74                                 
  0065  833e6a1600       cmp word ptr [0x166a], 0                 
  006a  7408             je 0x74                                  
  006c  90               nop                                      
  006d  0e               push cs                                  
  006e  e83803           call 0x3a9                               
  0071  e96902           jmp 0x2dd                                
  0074  8936980e         mov word ptr [0xe98], si                 
  0078  8b1e980e         mov bx, word ptr [0xe98]                 
  007c  6bdb1f           imul bx, bx, 0x1f                        
  007f  b8042c           mov ax, 0x2c04                           
  0082  8ec0             mov es, ax                               
  0084  268b871108       mov ax, word ptr es:[bx + 0x811]         
  0089  a39a0e           mov word ptr [0xe9a], ax                 
  008c  8b1e980e         mov bx, word ptr [0xe98]                 
  0090  6bdb1f           imul bx, bx, 0x1f                        
  0093  b8042c           mov ax, 0x2c04                           
  0096  8ec0             mov es, ax                               
  0098  268b871308       mov ax, word ptr es:[bx + 0x813]         
  009d  e97d01           jmp 0x21d                                
  00a0  0bff             or di, di                                
  00a2  7403             je 0xa7                                  
  00a4  e9ec00           jmp 0x193                                
  00a7  66680e000100     push 0x1000e                             
  00ad  53               push bx                                  
  00ae  52               push dx                                  
  00af  9a5c00e830       lcall 0x30e8, 0x5c                       -> ovl62:04fa
  00b4  83c408           add sp, 8                                
  00b7  8bf0             mov si, ax                               
  00b9  8bde             mov bx, si                               
  00bb  6bdb41           imul bx, bx, 0x41                        
  00be  b8042c           mov ax, 0x2c04                           
  00c1  8ec0             mov es, ax                               
  00c3  26ffb77f15       push word ptr es:[bx + 0x157f]           
  00c8  8bde             mov bx, si                               
  00ca  6bdb41           imul bx, bx, 0x41                        
  00cd  b8042c           mov ax, 0x2c04                           
  00d0  8ec0             mov es, ax                               
  00d2  26ffb77d15       push word ptr es:[bx + 0x157d]           
  00d7  6a01             push 1                                   
  00d9  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  00de  83c406           add sp, 6                                
  00e1  0bc0             or ax, ax                                
  00e3  7403             je 0xe8                                  
  00e5  e98f00           jmp 0x177                                
  00e8  8bde             mov bx, si                               
  00ea  6bdb41           imul bx, bx, 0x41                        
  00ed  b8042c           mov ax, 0x2c04                           
  00f0  8ec0             mov es, ax                               
  00f2  26ffb77f15       push word ptr es:[bx + 0x157f]           
  00f7  8bde             mov bx, si                               
  00f9  6bdb41           imul bx, bx, 0x41                        
  00fc  b8042c           mov ax, 0x2c04                           
  00ff  8ec0             mov es, ax                               
  0101  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0106  40               inc ax                                   
  0107  50               push ax                                  
  0108  6a01             push 1                                   
  010a  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  010f  83c406           add sp, 6                                
  0112  0bc0             or ax, ax                                
  0114  7561             jne 0x177                                
  0116  8bde             mov bx, si                               
  0118  6bdb41           imul bx, bx, 0x41                        
  011b  b8042c           mov ax, 0x2c04                           
  011e  8ec0             mov es, ax                               
  0120  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0125  40               inc ax                                   
  0126  50               push ax                                  
  0127  8bde             mov bx, si                               
  0129  6bdb41           imul bx, bx, 0x41                        
  012c  b8042c           mov ax, 0x2c04                           
  012f  8ec0             mov es, ax                               
  0131  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0136  6a01             push 1                                   
  0138  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  013d  83c406           add sp, 6                                
  0140  0bc0             or ax, ax                                
  0142  7533             jne 0x177                                
  0144  8bde             mov bx, si                               
  0146  6bdb41           imul bx, bx, 0x41                        
  0149  b8042c           mov ax, 0x2c04                           
  014c  8ec0             mov es, ax                               
  014e  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0153  40               inc ax                                   
  0154  50               push ax                                  
  0155  8bde             mov bx, si                               
  0157  6bdb41           imul bx, bx, 0x41                        
  015a  b8042c           mov ax, 0x2c04                           
  015d  8ec0             mov es, ax                               
  015f  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0164  40               inc ax                                   
  0165  50               push ax                                  
  0166  6a01             push 1                                   
  0168  9aa200f930       lcall 0x30f9, 0xa2                       -> ovl64:15ff
  016d  83c406           add sp, 6                                
  0170  0bc0             or ax, ax                                
  0172  7503             jne 0x177                                
  0174  e96601           jmp 0x2dd                                
  0177  393e920e         cmp word ptr [0xe92], di                 
  017b  7510             jne 0x18d                                
  017d  3936980e         cmp word ptr [0xe98], si                 
  0181  750a             jne 0x18d                                
  0183  833e6a1600       cmp word ptr [0x166a], 0                 
  0188  7403             je 0x18d                                 
  018a  e9dffe           jmp 0x6c                                 
  018d  8936980e         mov word ptr [0xe98], si                 
  0191  eb65             jmp 0x1f8                                
  0193  6a01             push 1                                   
  0195  b8042c           mov ax, 0x2c04                           
  0198  8ec0             mov es, ax                               
  019a  26ff361001       push word ptr es:[0x110]                 
  019f  53               push bx                                  
  01a0  52               push dx                                  
  01a1  9a5c00e830       lcall 0x30e8, 0x5c                       -> ovl62:04fa
  01a6  83c408           add sp, 8                                
  01a9  8bf0             mov si, ax                               
  01ab  393e920e         cmp word ptr [0xe92], di                 
  01af  7515             jne 0x1c6                                
  01b1  3936980e         cmp word ptr [0xe98], si                 
  01b5  750f             jne 0x1c6                                
  01b7  833e6a1600       cmp word ptr [0x166a], 0                 
  01bc  7408             je 0x1c6                                 
  01be  83ff01           cmp di, 1                                
  01c1  7403             je 0x1c6                                 
  01c3  e9a6fe           jmp 0x6c                                 
  01c6  8936980e         mov word ptr [0xe98], si                 
  01ca  8b1e980e         mov bx, word ptr [0xe98]                 
  01ce  6bdb41           imul bx, bx, 0x41                        
  01d1  b8042c           mov ax, 0x2c04                           
  01d4  8ec0             mov es, ax                               
  01d6  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  01dc  7e14             jle 0x1f2                                
  01de  8b1e980e         mov bx, word ptr [0xe98]                 
  01e2  6bdb41           imul bx, bx, 0x41                        
  01e5  b8042c           mov ax, 0x2c04                           
  01e8  8ec0             mov es, ax                               
  01ea  268a87a915       mov al, byte ptr es:[bx + 0x15a9]        
  01ef  98               cwde                                     
  01f0  eb03             jmp 0x1f5                                
  01f2  b8ffff           mov ax, 0xffff                           
  01f5  a39e0e           mov word ptr [0xe9e], ax                 
  01f8  8b1e980e         mov bx, word ptr [0xe98]                 
  01fc  6bdb41           imul bx, bx, 0x41                        
  01ff  b8042c           mov ax, 0x2c04                           
  0202  8ec0             mov es, ax                               
  0204  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0209  a39a0e           mov word ptr [0xe9a], ax                 
  020c  8b1e980e         mov bx, word ptr [0xe98]                 
  0210  6bdb41           imul bx, bx, 0x41                        
  0213  b8042c           mov ax, 0x2c04                           
  0216  8ec0             mov es, ax                               
  0218  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  021d  a39c0e           mov word ptr [0xe9c], ax                 
  0220  833e980e00       cmp word ptr [0xe98], 0                  
  0225  7d03             jge 0x22a                                
  0227  e9b300           jmp 0x2dd                                
  022a  893e920e         mov word ptr [0xe92], di                 
  022e  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0233  6a01             push 1                                   
  0235  90               nop                                      
  0236  0e               push cs                                  
  0237  e8a404           call 0x6de                               
  023a  59               pop cx                                   
  023b  90               nop                                      
  023c  0e               push cs                                  
  023d  e85b18           call 0x1a9b                              
  0240  6a06             push 6                                   
  0242  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0247  59               pop cx                                   
  0248  c7066a160100     mov word ptr [0x166a], 1                 
  024e  90               nop                                      
  024f  0e               push cs                                  
  0250  e85601           call 0x3a9                               
  0253  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0258  b8042c           mov ax, 0x2c04                           
  025b  8ec0             mov es, ax                               
  025d  26833e2e0100     cmp word ptr es:[0x12e], 0               
  0263  7478             je 0x2dd                                 
  0265  8ec0             mov es, ax                               
  0267  26a03401         mov al, byte ptr es:[0x134]              
  026b  d1e8             shr ax, 1                                
  026d  250100           and ax, 1                                
  0270  0bc0             or ax, ax                                
  0272  7523             jne 0x297                                
  0274  b8042c           mov ax, 0x2c04                           
  0277  8ec0             mov es, ax                               
  0279  26800e340102     or byte ptr es:[0x134], 2                
  027f  666819000100     push 0x10019                             
  0285  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  028a  83c404           add sp, 4                                
  028d  52               push dx                                  
  028e  50               push ax                                  
  028f  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  0294  83c404           add sp, 4                                
  0297  b8042c           mov ax, 0x2c04                           
  029a  8ec0             mov es, ax                               
  029c  26a03401         mov al, byte ptr es:[0x134]              
  02a0  c1e805           shr ax, 5                                
  02a3  250100           and ax, 1                                
  02a6  0bc0             or ax, ax                                
  02a8  7533             jne 0x2dd                                
  02aa  b8042c           mov ax, 0x2c04                           
  02ad  8ec0             mov es, ax                               
  02af  268b1e1001       mov bx, word ptr es:[0x110]              
  02b4  d1e3             shl bx, 1                                
  02b6  83bfea5d02       cmp word ptr [bx + 0x5dea], 2            
  02bb  7c20             jl 0x2dd                                 
  02bd  8ec0             mov es, ax                               
  02bf  26800e340120     or byte ptr es:[0x134], 0x20             
  02c5  666819000600     push 0x60019                             
  02cb  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  02d0  83c404           add sp, 4                                
  02d3  52               push dx                                  
  02d4  50               push ax                                  
  02d5  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  02da  83c404           add sp, 4                                
  02dd  5f               pop di                                   
  02de  5e               pop si                                   
  02df  5d               pop bp                                   
  02e0  cb               retf                                     

ovl45_02e1:  ; ENTRY
  02e1  55               push bp                                  
  02e2  8bec             mov bp, sp                               
  02e4  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  02e9  666801000100     push 0x10001                             
  02ef  6a01             push 1                                   
  02f1  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  02f6  83c406           add sp, 6                                
  02f9  b8042c           mov ax, 0x2c04                           
  02fc  8ec0             mov es, ax                               
  02fe  26833e2e0100     cmp word ptr es:[0x12e], 0               
  0304  7433             je 0x339                                 
  0306  8ec0             mov es, ax                               
  0308  26a03401         mov al, byte ptr es:[0x134]              
  030c  c1e802           shr ax, 2                                
  030f  250100           and ax, 1                                
  0312  0bc0             or ax, ax                                
  0314  7523             jne 0x339                                
  0316  b8042c           mov ax, 0x2c04                           
  0319  8ec0             mov es, ax                               
  031b  26800e340104     or byte ptr es:[0x134], 4                
  0321  666819000200     push 0x20019                             
  0327  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  032c  83c404           add sp, 4                                
  032f  52               push dx                                  
  0330  50               push ax                                  
  0331  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  0336  83c404           add sp, 4                                
  0339  5d               pop bp                                   
  033a  cb               retf                                     

ovl45_033b:  ; ENTRY
  033b  55               push bp                                  
  033c  8bec             mov bp, sp                               
  033e  ff369c0e         push word ptr [0xe9c]                    
  0342  ff369a0e         push word ptr [0xe9a]                    
  0346  6a00             push 0                                   
  0348  0e               push cs                                  
  0349  e8b4fc           call 0                                   
  034c  83c406           add sp, 6                                
  034f  5d               pop bp                                   
  0350  cb               retf                                     

ovl45_0351:  ; ENTRY
  0351  55               push bp                                  
  0352  8bec             mov bp, sp                               
  0354  ff369c0e         push word ptr [0xe9c]                    
  0358  ff369a0e         push word ptr [0xe9a]                    
  035c  6a04             push 4                                   
  035e  0e               push cs                                  
  035f  e89efc           call 0                                   
  0362  83c406           add sp, 6                                
  0365  5d               pop bp                                   
  0366  cb               retf                                     

ovl45_0367:  ; ENTRY
  0367  55               push bp                                  
  0368  8bec             mov bp, sp                               
  036a  ff369c0e         push word ptr [0xe9c]                    
  036e  ff369a0e         push word ptr [0xe9a]                    
  0372  6a02             push 2                                   
  0374  0e               push cs                                  
  0375  e888fc           call 0                                   
  0378  83c406           add sp, 6                                
  037b  5d               pop bp                                   
  037c  cb               retf                                     

ovl45_037d:  ; ENTRY
  037d  55               push bp                                  
  037e  8bec             mov bp, sp                               
  0380  ff369c0e         push word ptr [0xe9c]                    
  0384  ff369a0e         push word ptr [0xe9a]                    
  0388  6a03             push 3                                   
  038a  0e               push cs                                  
  038b  e872fc           call 0                                   
  038e  83c406           add sp, 6                                
  0391  5d               pop bp                                   
  0392  cb               retf                                     

ovl45_0393:  ; ENTRY
  0393  55               push bp                                  
  0394  8bec             mov bp, sp                               
  0396  ff369c0e         push word ptr [0xe9c]                    
  039a  ff369a0e         push word ptr [0xe9a]                    
  039e  6a01             push 1                                   
  03a0  0e               push cs                                  
  03a1  e85cfc           call 0                                   
  03a4  83c406           add sp, 6                                
  03a7  5d               pop bp                                   
  03a8  cb               retf                                     

ovl45_03a9:  ; ENTRY
  03a9  55               push bp                                  
  03aa  8bec             mov bp, sp                               
  03ac  83ec10           sub sp, 0x10                             
  03af  56               push si                                  
  03b0  57               push di                                  
  03b1  c746fe0100       mov word ptr [bp - 2], 1                 
  03b6  bf0100           mov di, 1                                
  03b9  c746fc0100       mov word ptr [bp - 4], 1                 
  03be  c746fa0100       mov word ptr [bp - 6], 1                 
  03c3  833e920e00       cmp word ptr [0xe92], 0                  
  03c8  7509             jne 0x3d3                                
  03ca  6a0e             push 0xe                                 
  03cc  9aed07a908       lcall 0x8a9, 0x7ed                       -> 08a9:07ed
  03d1  eb07             jmp 0x3da                                
  03d3  6a0e             push 0xe                                 
  03d5  9a3908a908       lcall 0x8a9, 0x839                       -> 08a9:0839
  03da  59               pop cx                                   
  03db  833e920e04       cmp word ptr [0xe92], 4                  
  03e0  7526             jne 0x408                                
  03e2  68c100           push 0xc1                                
  03e5  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03ea  59               pop cx                                   
  03eb  68c200           push 0xc2                                
  03ee  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03f3  59               pop cx                                   
  03f4  68c300           push 0xc3                                
  03f7  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03fc  59               pop cx                                   
  03fd  68c400           push 0xc4                                
  0400  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0405  59               pop cx                                   
  0406  eb33             jmp 0x43b                                
  0408  833e920e00       cmp word ptr [0xe92], 0                  
  040d  7507             jne 0x416                                
  040f  c746fe0000       mov word ptr [bp - 2], 0                 
  0414  eb25             jmp 0x43b                                
  0416  833e920e01       cmp word ptr [0xe92], 1                  
  041b  7504             jne 0x421                                
  041d  33ff             xor di, di                               
  041f  eb1a             jmp 0x43b                                
  0421  833e920e02       cmp word ptr [0xe92], 2                  
  0426  7507             jne 0x42f                                
  0428  c746fc0000       mov word ptr [bp - 4], 0                 
  042d  eb0c             jmp 0x43b                                
  042f  833e920e03       cmp word ptr [0xe92], 3                  
  0434  7505             jne 0x43b                                
  0436  c746fa0000       mov word ptr [bp - 6], 0                 
  043b  b8042c           mov ax, 0x2c04                           
  043e  8ec0             mov es, ax                               
  0440  268b1e1001       mov bx, word ptr es:[0x110]              
  0445  d1e3             shl bx, 1                                
  0447  83bfea5d00       cmp word ptr [bx + 0x5dea], 0            
  044c  7e1e             jle 0x46c                                
  044e  8b1e980e         mov bx, word ptr [0xe98]                 
  0452  6bdb41           imul bx, bx, 0x41                        
  0455  b8042c           mov ax, 0x2c04                           
  0458  8ec0             mov es, ax                               
  045a  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  045f  98               cwde                                     
  0460  ba042c           mov dx, 0x2c04                           
  0463  8ec2             mov es, dx                               
  0465  263b061001       cmp ax, word ptr es:[0x110]              
  046a  740d             je 0x479                                 
  046c  bf0200           mov di, 2                                
  046f  c746fc0200       mov word ptr [bp - 4], 2                 
  0474  c746fa0200       mov word ptr [bp - 6], 2                 
  0479  833e920e02       cmp word ptr [0xe92], 2                  
  047e  7558             jne 0x4d8                                
  0480  33f6             xor si, si                               
  0482  eb11             jmp 0x495                                
  0484  6a01             push 1                                   
  0486  8bc6             mov ax, si                               
  0488  05c500           add ax, 0xc5                             
  048b  50               push ax                                  
  048c  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0491  83c404           add sp, 4                                
  0494  46               inc si                                   
  0495  83fe04           cmp si, 4                                
  0498  7cea             jl 0x484                                 
  049a  6668c9000100     push 0x100c9                             
  04a0  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04a5  83c404           add sp, 4                                
  04a8  8b1e980e         mov bx, word ptr [0xe98]                 
  04ac  6bdb41           imul bx, bx, 0x41                        
  04af  b8042c           mov ax, 0x2c04                           
  04b2  8ec0             mov es, ax                               
  04b4  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  04ba  7e04             jle 0x4c0                                
  04bc  6a01             push 1                                   
  04be  eb02             jmp 0x4c2                                
  04c0  6a02             push 2                                   
  04c2  68ca00           push 0xca                                
  04c5  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  04ca  83c404           add sp, 4                                
  04cd  68c000           push 0xc0                                
  04d0  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  04d5  59               pop cx                                   
  04d6  eb36             jmp 0x50e                                
  04d8  6668c0000100     push 0x100c0                             
  04de  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04e3  83c404           add sp, 4                                
  04e6  68c900           push 0xc9                                
  04e9  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  04ee  59               pop cx                                   
  04ef  68ca00           push 0xca                                
  04f2  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  04f7  59               pop cx                                   
  04f8  33f6             xor si, si                               
  04fa  eb0d             jmp 0x509                                
  04fc  8bc6             mov ax, si                               
  04fe  05c500           add ax, 0xc5                             
  0501  50               push ax                                  
  0502  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0507  59               pop cx                                   
  0508  46               inc si                                   
  0509  83fe04           cmp si, 4                                
  050c  7cee             jl 0x4fc                                 
  050e  833e920e03       cmp word ptr [0xe92], 3                  
  0513  7403             je 0x518                                 
  0515  e92101           jmp 0x639                                
  0518  833e960e00       cmp word ptr [0xe96], 0                  
  051d  7413             je 0x532                                 
  051f  6668d8000100     push 0x100d8                             
  0525  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  052a  83c404           add sp, 4                                
  052d  68d400           push 0xd4                                
  0530  eb11             jmp 0x543                                
  0532  6668d4000100     push 0x100d4                             
  0538  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  053d  83c404           add sp, 4                                
  0540  68d800           push 0xd8                                
  0543  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0548  59               pop cx                                   
  0549  16               push ss                                  
  054a  8d46f0           lea ax, [bp - 0x10]                      
  054d  50               push ax                                  
  054e  16               push ss                                  
  054f  8d46f2           lea ax, [bp - 0xe]                       
  0552  50               push ax                                  
  0553  ff36980e         push word ptr [0xe98]                    
  0557  9a48005830       lcall 0x3058, 0x48                       -> ovl44:0410
  055c  83c40a           add sp, 0xa                              
  055f  8b1e980e         mov bx, word ptr [0xe98]                 
  0563  6bdb41           imul bx, bx, 0x41                        
  0566  b8042c           mov ax, 0x2c04                           
  0569  8ec0             mov es, ax                               
  056b  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  0571  7e05             jle 0x578                                
  0573  b80100           mov ax, 1                                
  0576  eb02             jmp 0x57a                                
  0578  33c0             xor ax, ax                               
  057a  8bd0             mov dx, ax                               
  057c  833e940e00       cmp word ptr [0xe94], 0                  
  0581  7547             jne 0x5ca                                
  0583  0bd2             or dx, dx                                
  0585  7405             je 0x58c                                 
  0587  b80100           mov ax, 1                                
  058a  eb03             jmp 0x58f                                
  058c  b80200           mov ax, 2                                
  058f  50               push ax                                  
  0590  68d200           push 0xd2                                
  0593  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  0598  83c404           add sp, 4                                
  059b  837ef000         cmp word ptr [bp - 0x10], 0              
  059f  7e05             jle 0x5a6                                
  05a1  b80100           mov ax, 1                                
  05a4  eb03             jmp 0x5a9                                
  05a6  b80200           mov ax, 2                                
  05a9  50               push ax                                  
  05aa  68d300           push 0xd3                                
  05ad  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  05b2  83c404           add sp, 4                                
  05b5  68d600           push 0xd6                                
  05b8  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  05bd  59               pop cx                                   
  05be  68d700           push 0xd7                                
  05c1  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  05c6  59               pop cx                                   
  05c7  e98500           jmp 0x64f                                
  05ca  833e940e01       cmp word ptr [0xe94], 1                  
  05cf  752d             jne 0x5fe                                
  05d1  6668d6000100     push 0x100d6                             
  05d7  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  05dc  83c404           add sp, 4                                
  05df  837ef000         cmp word ptr [bp - 0x10], 0              
  05e3  7e05             jle 0x5ea                                
  05e5  b80100           mov ax, 1                                
  05e8  eb03             jmp 0x5ed                                
  05ea  b80200           mov ax, 2                                
  05ed  50               push ax                                  
  05ee  68d300           push 0xd3                                
  05f1  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  05f6  83c404           add sp, 4                                
  05f9  68d200           push 0xd2                                
  05fc  ebba             jmp 0x5b8                                
  05fe  833e940e02       cmp word ptr [0xe94], 2                  
  0603  754a             jne 0x64f                                
  0605  0bd2             or dx, dx                                
  0607  7405             je 0x60e                                 
  0609  b80100           mov ax, 1                                
  060c  eb03             jmp 0x611                                
  060e  b80200           mov ax, 2                                
  0611  50               push ax                                  
  0612  68d200           push 0xd2                                
  0615  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  061a  83c404           add sp, 4                                
  061d  6668d7000100     push 0x100d7                             
  0623  9af005a908       lcall 0x8a9, 0x5f0                       -> 08a9:05f0
  0628  83c404           add sp, 4                                
  062b  68d600           push 0xd6                                
  062e  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0633  59               pop cx                                   
  0634  68d300           push 0xd3                                
  0637  eb88             jmp 0x5c1                                
  0639  33f6             xor si, si                               
  063b  eb0d             jmp 0x64a                                
  063d  8bc6             mov ax, si                               
  063f  05d200           add ax, 0xd2                             
  0642  50               push ax                                  
  0643  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0648  59               pop cx                                   
  0649  46               inc si                                   
  064a  83fe03           cmp si, 3                                
  064d  7cee             jl 0x63d                                 
  064f  833e920e01       cmp word ptr [0xe92], 1                  
  0654  752c             jne 0x682                                
  0656  6668cb000100     push 0x100cb                             
  065c  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0661  83c404           add sp, 4                                
  0664  6668cd000100     push 0x100cd                             
  066a  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  066f  83c404           add sp, 4                                
  0672  6668cc000100     push 0x100cc                             
  0678  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  067d  83c404           add sp, 4                                
  0680  eb1b             jmp 0x69d                                
  0682  68cb00           push 0xcb                                
  0685  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  068a  59               pop cx                                   
  068b  68cd00           push 0xcd                                
  068e  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0693  59               pop cx                                   
  0694  68cc00           push 0xcc                                
  0697  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  069c  59               pop cx                                   
  069d  833e920e04       cmp word ptr [0xe92], 4                  
  06a2  7436             je 0x6da                                 
  06a4  ff76fe           push word ptr [bp - 2]                   
  06a7  68c100           push 0xc1                                
  06aa  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  06af  83c404           add sp, 4                                
  06b2  57               push di                                  
  06b3  68c200           push 0xc2                                
  06b6  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  06bb  83c404           add sp, 4                                
  06be  ff76fc           push word ptr [bp - 4]                   
  06c1  68c300           push 0xc3                                
  06c4  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  06c9  83c404           add sp, 4                                
  06cc  ff76fa           push word ptr [bp - 6]                   
  06cf  68c400           push 0xc4                                
  06d2  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  06d7  83c404           add sp, 4                                
  06da  5f               pop di                                   
  06db  5e               pop si                                   
  06dc  c9               leave                                    
  06dd  cb               retf                                     

ovl45_06de:  ; ENTRY
  06de  55               push bp                                  
  06df  8bec             mov bp, sp                               
  06e1  81ec2c01         sub sp, 0x12c                            
  06e5  56               push si                                  
  06e6  57               push di                                  
  06e7  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  06ec  837e0600         cmp word ptr [bp + 6], 0                 
  06f0  7422             je 0x714                                 
  06f2  833e6a1600       cmp word ptr [0x166a], 0                 
  06f7  7413             je 0x70c                                 
  06f9  666800003200     push 0x320000                            
  06ff  666a00           push 0                                   
  0702  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  0707  83c408           add sp, 8                                
  070a  eb08             jmp 0x714                                
  070c  6a02             push 2                                   
  070e  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0713  59               pop cx                                   
  0714  8b1e920e         mov bx, word ptr [0xe92]                 
  0718  83fb04           cmp bx, 4                                
  071b  7603             jbe 0x720                                
  071d  e96813           jmp 0x1a88                               
  0720  d1e3             shl bx, 1                                
  0722  2effa7911a       jmp word ptr cs:[bx + 0x1a91]            
ovl45_0727:  ; case
  0727  666800000300     push 0x30000                             
  072d  666801000f00     push 0xf0001                             
  0733  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0738  83c408           add sp, 8                                
  073b  a1980e           mov ax, word ptr [0xe98]                 
  073e  6bc041           imul ax, ax, 0x41                        
  0741  058115           add ax, 0x1581                           
  0744  68042c           push 0x2c04                              
  0747  50               push ax                                  
  0748  6668b0013e00     push 0x3e01b0                            
  074e  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0753  83c408           add sp, 8                                
  0756  66ff36a00e       push dword ptr [0xea0]                   
  075b  1e               push ds                                  
  075c  682a34           push 0x342a                              
  075f  6a00             push 0                                   
  0761  8b1e980e         mov bx, word ptr [0xe98]                 
  0765  6bdb41           imul bx, bx, 0x41                        
  0768  b8042c           mov ax, 0x2c04                           
  076b  8ec0             mov es, ax                               
  076d  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0772  98               cwde                                     
  0773  50               push ax                                  
  0774  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0779  83c40c           add sp, 0xc                              
  077c  66ff36a40e       push dword ptr [0xea4]                   
  0781  1e               push ds                                  
  0782  682a34           push 0x342a                              
  0785  6a00             push 0                                   
  0787  8b1e980e         mov bx, word ptr [0xe98]                 
  078b  6bdb41           imul bx, bx, 0x41                        
  078e  b8042c           mov ax, 0x2c04                           
  0791  8ec0             mov es, ax                               
  0793  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0798  98               cwde                                     
  0799  50               push ax                                  
  079a  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  079f  83c40c           add sp, 0xc                              
  07a2  666800000300     push 0x30000                             
  07a8  666802000f00     push 0xf0002                             
  07ae  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  07b3  83c408           add sp, 8                                
  07b6  8b1e980e         mov bx, word ptr [0xe98]                 
  07ba  6bdb41           imul bx, bx, 0x41                        
  07bd  b8042c           mov ax, 0x2c04                           
  07c0  8ec0             mov es, ax                               
  07c2  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  07c7  69dbe000         imul bx, bx, 0xe0                        
  07cb  8b36980e         mov si, word ptr [0xe98]                 
  07cf  6bf641           imul si, si, 0x41                        
  07d2  b8042c           mov ax, 0x2c04                           
  07d5  8ec0             mov es, ax                               
  07d7  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  07dc  d1e0             shl ax, 1                                
  07de  03d8             add bx, ax                               
  07e0  b81d1e           mov ax, 0x1e1d                           
  07e3  8ec0             mov es, ax                               
  07e5  268a9f0000       mov bl, byte ptr es:[bx]                 
  07ea  81e3ff00         and bx, 0xff                             
  07ee  b8042c           mov ax, 0x2c04                           
  07f1  8ec0             mov es, ax                               
  07f3  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  07f9  7404             je 0x7ff                                 
  07fb  33c0             xor ax, ax                               
  07fd  eb11             jmp 0x810                                
  07ff  8b1e980e         mov bx, word ptr [0xe98]                 
  0803  6bdb41           imul bx, bx, 0x41                        
  0806  b8042c           mov ax, 0x2c04                           
  0809  8ec0             mov es, ax                               
  080b  268b87a715       mov ax, word ptr es:[bx + 0x15a7]        
  0810  50               push ax                                  
  0811  666a74           push 0x74                                
  0814  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0819  83c404           add sp, 4                                
  081c  52               push dx                                  
  081d  50               push ax                                  
  081e  16               push ss                                  
  081f  8d4696           lea ax, [bp - 0x6a]                      
  0822  50               push ax                                  
  0823  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0828  83c40a           add sp, 0xa                              
  082b  16               push ss                                  
  082c  8d4696           lea ax, [bp - 0x6a]                      
  082f  50               push ax                                  
  0830  66ff36a80e       push dword ptr [0xea8]                   
  0835  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  083a  83c408           add sp, 8                                
  083d  8b1e980e         mov bx, word ptr [0xe98]                 
  0841  6bdb41           imul bx, bx, 0x41                        
  0844  b8042c           mov ax, 0x2c04                           
  0847  8ec0             mov es, ax                               
  0849  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  084e  69dbe000         imul bx, bx, 0xe0                        
  0852  8b36980e         mov si, word ptr [0xe98]                 
  0856  6bf641           imul si, si, 0x41                        
  0859  b8042c           mov ax, 0x2c04                           
  085c  8ec0             mov es, ax                               
  085e  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0863  d1e0             shl ax, 1                                
  0865  03d8             add bx, ax                               
  0867  b81d1e           mov ax, 0x1e1d                           
  086a  8ec0             mov es, ax                               
  086c  268a9f0000       mov bl, byte ptr es:[bx]                 
  0871  81e3ff00         and bx, 0xff                             
  0875  b8042c           mov ax, 0x2c04                           
  0878  8ec0             mov es, ax                               
  087a  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0880  7404             je 0x886                                 
  0882  33c0             xor ax, ax                               
  0884  eb12             jmp 0x898                                
  0886  8b1e980e         mov bx, word ptr [0xe98]                 
  088a  6bdb41           imul bx, bx, 0x41                        
  088d  b8042c           mov ax, 0x2c04                           
  0890  8ec0             mov es, ax                               
  0892  268a879115       mov al, byte ptr es:[bx + 0x1591]        
  0897  98               cwde                                     
  0898  50               push ax                                  
  0899  666874000100     push 0x10074                             
  089f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  08a4  83c404           add sp, 4                                
  08a7  52               push dx                                  
  08a8  50               push ax                                  
  08a9  16               push ss                                  
  08aa  8d4696           lea ax, [bp - 0x6a]                      
  08ad  50               push ax                                  
  08ae  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  08b3  83c40a           add sp, 0xa                              
  08b6  16               push ss                                  
  08b7  8d4696           lea ax, [bp - 0x6a]                      
  08ba  50               push ax                                  
  08bb  66ff36ac0e       push dword ptr [0xeac]                   
  08c0  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  08c5  83c408           add sp, 8                                
  08c8  8b1e980e         mov bx, word ptr [0xe98]                 
  08cc  6bdb41           imul bx, bx, 0x41                        
  08cf  b8042c           mov ax, 0x2c04                           
  08d2  8ec0             mov es, ax                               
  08d4  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  08d9  69dbe000         imul bx, bx, 0xe0                        
  08dd  8b36980e         mov si, word ptr [0xe98]                 
  08e1  6bf641           imul si, si, 0x41                        
  08e4  b8042c           mov ax, 0x2c04                           
  08e7  8ec0             mov es, ax                               
  08e9  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  08ee  d1e0             shl ax, 1                                
  08f0  03d8             add bx, ax                               
  08f2  b81d1e           mov ax, 0x1e1d                           
  08f5  8ec0             mov es, ax                               
  08f7  268a9f0000       mov bl, byte ptr es:[bx]                 
  08fc  81e3ff00         and bx, 0xff                             
  0900  b8042c           mov ax, 0x2c04                           
  0903  8ec0             mov es, ax                               
  0905  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  090b  741d             je 0x92a                                 
  090d  6a02             push 2                                   
  090f  6a74             push 0x74                                
  0911  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0916  83c404           add sp, 4                                
  0919  52               push dx                                  
  091a  50               push ax                                  
  091b  16               push ss                                  
  091c  8d4696           lea ax, [bp - 0x6a]                      
  091f  50               push ax                                  
  0920  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0925  83c408           add sp, 8                                
  0928  eb51             jmp 0x97b                                
  092a  8b1e980e         mov bx, word ptr [0xe98]                 
  092e  6bdb41           imul bx, bx, 0x41                        
  0931  b8042c           mov ax, 0x2c04                           
  0934  8ec0             mov es, ax                               
  0936  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  093c  7504             jne 0x942                                
  093e  6a03             push 3                                   
  0940  ebcd             jmp 0x90f                                
  0942  8b1e980e         mov bx, word ptr [0xe98]                 
  0946  6bdb41           imul bx, bx, 0x41                        
  0949  b8042c           mov ax, 0x2c04                           
  094c  8ec0             mov es, ax                               
  094e  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0953  98               cwde                                     
  0954  6bc014           imul ax, ax, 0x14                        
  0957  050000           add ax, 0                                
  095a  68042c           push 0x2c04                              
  095d  50               push ax                                  
  095e  666874000400     push 0x40074                             
  0964  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0969  83c404           add sp, 4                                
  096c  52               push dx                                  
  096d  50               push ax                                  
  096e  16               push ss                                  
  096f  8d4696           lea ax, [bp - 0x6a]                      
  0972  50               push ax                                  
  0973  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0978  83c40c           add sp, 0xc                              
  097b  16               push ss                                  
  097c  8d4696           lea ax, [bp - 0x6a]                      
  097f  50               push ax                                  
  0980  66ff36b00e       push dword ptr [0xeb0]                   
  0985  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  098a  83c408           add sp, 8                                
  098d  8b1e980e         mov bx, word ptr [0xe98]                 
  0991  6bdb41           imul bx, bx, 0x41                        
  0994  b8042c           mov ax, 0x2c04                           
  0997  8ec0             mov es, ax                               
  0999  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  099e  69dbe000         imul bx, bx, 0xe0                        
  09a2  8b36980e         mov si, word ptr [0xe98]                 
  09a6  6bf641           imul si, si, 0x41                        
  09a9  b8042c           mov ax, 0x2c04                           
  09ac  8ec0             mov es, ax                               
  09ae  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  09b3  d1e0             shl ax, 1                                
  09b5  03d8             add bx, ax                               
  09b7  b81d1e           mov ax, 0x1e1d                           
  09ba  8ec0             mov es, ax                               
  09bc  268a9f0000       mov bl, byte ptr es:[bx]                 
  09c1  81e3ff00         and bx, 0xff                             
  09c5  b8042c           mov ax, 0x2c04                           
  09c8  8ec0             mov es, ax                               
  09ca  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  09d0  7403             je 0x9d5                                 
  09d2  e99100           jmp 0xa66                                
  09d5  b8042c           mov ax, 0x2c04                           
  09d8  8ec0             mov es, ax                               
  09da  26833e320100     cmp word ptr es:[0x132], 0               
  09e0  741e             je 0xa00                                 
  09e2  8b1e980e         mov bx, word ptr [0xe98]                 
  09e6  6bdb41           imul bx, bx, 0x41                        
  09e9  b8042c           mov ax, 0x2c04                           
  09ec  8ec0             mov es, ax                               
  09ee  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  09f3  98               cwde                                     
  09f4  ba042c           mov dx, 0x2c04                           
  09f7  8ec2             mov es, dx                               
  09f9  263b061001       cmp ax, word ptr es:[0x110]              
  09fe  7566             jne 0xa66                                
  0a00  33f6             xor si, si                               
  0a02  33ff             xor di, di                               
  0a04  eb58             jmp 0xa5e                                
  0a06  8b1e980e         mov bx, word ptr [0xe98]                 
  0a0a  6bdb41           imul bx, bx, 0x41                        
  0a0d  03de             add bx, si                               
  0a0f  b8042c           mov ax, 0x2c04                           
  0a12  8ec0             mov es, ax                               
  0a14  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  0a19  98               cwde                                     
  0a1a  8bd0             mov dx, ax                               
  0a1c  666a00           push 0                                   
  0a1f  666800000100     push 0x10000                             
  0a25  666a00           push 0                                   
  0a28  6a00             push 0                                   
  0a2a  8bdf             mov bx, di                               
  0a2c  c1e302           shl bx, 2                                
  0a2f  ffb71a0f         push word ptr [bx + 0xf1a]               
  0a33  8bdf             mov bx, di                               
  0a35  c1e302           shl bx, 2                                
  0a38  ffb7180f         push word ptr [bx + 0xf18]               
  0a3c  1e               push ds                                  
  0a3d  682a34           push 0x342a                              
  0a40  8b1e980e         mov bx, word ptr [0xe98]                 
  0a44  6bdb41           imul bx, bx, 0x41                        
  0a47  b8042c           mov ax, 0x2c04                           
  0a4a  8ec0             mov es, ax                               
  0a4c  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0a51  98               cwde                                     
  0a52  50               push ax                                  
  0a53  52               push dx                                  
  0a54  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  0a59  83c41a           add sp, 0x1a                             
  0a5c  47               inc di                                   
  0a5d  46               inc si                                   
  0a5e  83fe04           cmp si, 4                                
  0a61  7ca3             jl 0xa06                                 
  0a63  e9c001           jmp 0xc26                                
  0a66  6a00             push 0                                   
  0a68  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0a6d  59               pop cx                                   
  0a6e  6668f2005800     push 0x5800f2                            
  0a74  66683701a900     push 0xa90137                            
  0a7a  16               push ss                                  
  0a7b  8d46e0           lea ax, [bp - 0x20]                      
  0a7e  50               push ax                                  
  0a7f  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0a84  83c40c           add sp, 0xc                              
  0a87  52               push dx                                  
  0a88  50               push ax                                  
  0a89  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0a8e  83c404           add sp, 4                                
  0a91  666804000200     push 0x20004                             
  0a97  6668f4005a00     push 0x5a00f4                            
  0a9d  66683601a800     push 0xa80136                            
  0aa3  16               push ss                                  
  0aa4  8d46e0           lea ax, [bp - 0x20]                      
  0aa7  50               push ax                                  
  0aa8  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0aad  83c40c           add sp, 0xc                              
  0ab0  52               push dx                                  
  0ab1  50               push ax                                  
  0ab2  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  0ab7  83c408           add sp, 8                                
  0aba  6668f0005600     push 0x5600f0                            
  0ac0  666a00           push 0                                   
  0ac3  16               push ss                                  
  0ac4  8d46e0           lea ax, [bp - 0x20]                      
  0ac7  50               push ax                                  
  0ac8  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0acd  83c40c           add sp, 0xc                              
  0ad0  66683801aa00     push 0xaa0138                            
  0ad6  16               push ss                                  
  0ad7  8d46dc           lea ax, [bp - 0x24]                      
  0ada  50               push ax                                  
  0adb  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0ae0  83c408           add sp, 8                                
  0ae3  66ff76dc         push dword ptr [bp - 0x24]               
  0ae7  8d46e0           lea ax, [bp - 0x20]                      
  0aea  8cd2             mov dx, ss                               
  0aec  b90800           mov cx, 8                                
  0aef  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0af4  6a37             push 0x37                                
  0af6  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0afb  83c40e           add sp, 0xe                              
  0afe  66688801b000     push 0xb00188                            
  0b04  1e               push ds                                  
  0b05  682a34           push 0x342a                              
  0b08  8b1e980e         mov bx, word ptr [0xe98]                 
  0b0c  6bdb41           imul bx, bx, 0x41                        
  0b0f  b8042c           mov ax, 0x2c04                           
  0b12  8ec0             mov es, ax                               
  0b14  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0b19  69dbe000         imul bx, bx, 0xe0                        
  0b1d  8b36980e         mov si, word ptr [0xe98]                 
  0b21  6bf641           imul si, si, 0x41                        
  0b24  b8042c           mov ax, 0x2c04                           
  0b27  8ec0             mov es, ax                               
  0b29  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0b2e  d1e0             shl ax, 1                                
  0b30  03d8             add bx, ax                               
  0b32  b81d1e           mov ax, 0x1e1d                           
  0b35  8ec0             mov es, ax                               
  0b37  268a870000       mov al, byte ptr es:[bx]                 
  0b3c  25ff00           and ax, 0xff                             
  0b3f  50               push ax                                  
  0b40  9a5c00f930       lcall 0x30f9, 0x5c                       -> ovl64:0860
  0b45  83c40a           add sp, 0xa                              
  0b48  66688801d800     push 0xd80188                            
  0b4e  1e               push ds                                  
  0b4f  682a34           push 0x342a                              
  0b52  8b1e980e         mov bx, word ptr [0xe98]                 
  0b56  6bdb41           imul bx, bx, 0x41                        
  0b59  b8042c           mov ax, 0x2c04                           
  0b5c  8ec0             mov es, ax                               
  0b5e  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0b63  69dbe000         imul bx, bx, 0xe0                        
  0b67  8b36980e         mov si, word ptr [0xe98]                 
  0b6b  6bf641           imul si, si, 0x41                        
  0b6e  b8042c           mov ax, 0x2c04                           
  0b71  8ec0             mov es, ax                               
  0b73  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0b78  d1e0             shl ax, 1                                
  0b7a  03d8             add bx, ax                               
  0b7c  b81d1e           mov ax, 0x1e1d                           
  0b7f  8ec0             mov es, ax                               
  0b81  268a87e000       mov al, byte ptr es:[bx + 0xe0]          
  0b86  25ff00           and ax, 0xff                             
  0b89  50               push ax                                  
  0b8a  9a5c00f930       lcall 0x30f9, 0x5c                       -> ovl64:0860
  0b8f  83c40a           add sp, 0xa                              
  0b92  6668b001b000     push 0xb001b0                            
  0b98  1e               push ds                                  
  0b99  682a34           push 0x342a                              
  0b9c  8b1e980e         mov bx, word ptr [0xe98]                 
  0ba0  6bdb41           imul bx, bx, 0x41                        
  0ba3  b8042c           mov ax, 0x2c04                           
  0ba6  8ec0             mov es, ax                               
  0ba8  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0bad  69dbe000         imul bx, bx, 0xe0                        
  0bb1  8b36980e         mov si, word ptr [0xe98]                 
  0bb5  6bf641           imul si, si, 0x41                        
  0bb8  b8042c           mov ax, 0x2c04                           
  0bbb  8ec0             mov es, ax                               
  0bbd  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0bc2  d1e0             shl ax, 1                                
  0bc4  03d8             add bx, ax                               
  0bc6  b81d1e           mov ax, 0x1e1d                           
  0bc9  8ec0             mov es, ax                               
  0bcb  268a870200       mov al, byte ptr es:[bx + 2]             
  0bd0  25ff00           and ax, 0xff                             
  0bd3  50               push ax                                  
  0bd4  9a5c00f930       lcall 0x30f9, 0x5c                       -> ovl64:0860
  0bd9  83c40a           add sp, 0xa                              
  0bdc  6668b001d800     push 0xd801b0                            
  0be2  1e               push ds                                  
  0be3  682a34           push 0x342a                              
  0be6  8b1e980e         mov bx, word ptr [0xe98]                 
  0bea  6bdb41           imul bx, bx, 0x41                        
  0bed  b8042c           mov ax, 0x2c04                           
  0bf0  8ec0             mov es, ax                               
  0bf2  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0bf7  69dbe000         imul bx, bx, 0xe0                        
  0bfb  8b36980e         mov si, word ptr [0xe98]                 
  0bff  6bf641           imul si, si, 0x41                        
  0c02  b8042c           mov ax, 0x2c04                           
  0c05  8ec0             mov es, ax                               
  0c07  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0c0c  d1e0             shl ax, 1                                
  0c0e  03d8             add bx, ax                               
  0c10  b81d1e           mov ax, 0x1e1d                           
  0c13  8ec0             mov es, ax                               
  0c15  268a87e200       mov al, byte ptr es:[bx + 0xe2]          
  0c1a  25ff00           and ax, 0xff                             
  0c1d  50               push ax                                  
  0c1e  9a5c00f930       lcall 0x30f9, 0x5c                       -> ovl64:0860
  0c23  83c40a           add sp, 0xa                              
  0c26  33f6             xor si, si                               
  0c28  eb5c             jmp 0xc86                                
  0c2a  8b1e980e         mov bx, word ptr [0xe98]                 
  0c2e  6bdb41           imul bx, bx, 0x41                        
  0c31  b8042c           mov ax, 0x2c04                           
  0c34  8ec0             mov es, ax                               
  0c36  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0c3b  8bde             mov bx, si                               
  0c3d  6bdb14           imul bx, bx, 0x14                        
  0c40  ba042c           mov dx, 0x2c04                           
  0c43  8ec2             mov es, dx                               
  0c45  263b879301       cmp ax, word ptr es:[bx + 0x193]         
  0c4a  7539             jne 0xc85                                
  0c4c  8b1e980e         mov bx, word ptr [0xe98]                 
  0c50  6bdb41           imul bx, bx, 0x41                        
  0c53  b8042c           mov ax, 0x2c04                           
  0c56  8ec0             mov es, ax                               
  0c58  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0c5d  8bde             mov bx, si                               
  0c5f  6bdb14           imul bx, bx, 0x14                        
  0c62  ba042c           mov dx, 0x2c04                           
  0c65  8ec2             mov es, dx                               
  0c67  263b879501       cmp ax, word ptr es:[bx + 0x195]         
  0c6c  7517             jne 0xc85                                
  0c6e  66689801aa00     push 0xaa0198                            
  0c74  1e               push ds                                  
  0c75  682a34           push 0x342a                              
  0c78  6a04             push 4                                   
  0c7a  56               push si                                  
  0c7b  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0c80  83c40c           add sp, 0xc                              
  0c83  eb06             jmp 0xc8b                                
  0c85  46               inc si                                   
  0c86  83fe08           cmp si, 8                                
  0c89  7c9f             jl 0xc2a                                 
  0c8b  16               push ss                                  
  0c8c  8d863cff         lea ax, [bp - 0xc4]                      
  0c90  50               push ax                                  
  0c91  16               push ss                                  
  0c92  8d8614ff         lea ax, [bp - 0xec]                      
  0c96  50               push ax                                  
  0c97  16               push ss                                  
  0c98  8d86ecfe         lea ax, [bp - 0x114]                     
  0c9c  50               push ax                                  
  0c9d  ff36980e         push word ptr [0xe98]                    
  0ca1  6a01             push 1                                   
  0ca3  90               nop                                      
  0ca4  0e               push cs                                  
  0ca5  e85e12           call 0x1f06                              
  0ca8  83c410           add sp, 0x10                             
  0cab  33f6             xor si, si                               
  0cad  eb28             jmp 0xcd7                                
  0caf  8bc6             mov ax, si                               
  0cb1  6bc028           imul ax, ax, 0x28                        
  0cb4  8d96ecfe         lea dx, [bp - 0x114]                     
  0cb8  03c2             add ax, dx                               
  0cba  16               push ss                                  
  0cbb  50               push ax                                  
  0cbc  8bde             mov bx, si                               
  0cbe  c1e302           shl bx, 2                                
  0cc1  ffb7ca0e         push word ptr [bx + 0xeca]               
  0cc5  8bde             mov bx, si                               
  0cc7  c1e302           shl bx, 2                                
  0cca  ffb7c80e         push word ptr [bx + 0xec8]               
  0cce  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0cd3  83c408           add sp, 8                                
  0cd6  46               inc si                                   
  0cd7  83fe03           cmp si, 3                                
  0cda  7cd3             jl 0xcaf                                 
  0cdc  e9a90d           jmp 0x1a88                               
ovl45_0cdf:  ; case
  0cdf  666800000300     push 0x30000                             
  0ce5  666801000f00     push 0xf0001                             
  0ceb  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0cf0  83c408           add sp, 8                                
  0cf3  a1980e           mov ax, word ptr [0xe98]                 
  0cf6  6bc01f           imul ax, ax, 0x1f                        
  0cf9  051508           add ax, 0x815                            
  0cfc  68042c           push 0x2c04                              
  0cff  50               push ax                                  
  0d00  6668b0013e00     push 0x3e01b0                            
  0d06  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0d0b  83c408           add sp, 8                                
  0d0e  666804000200     push 0x20004                             
  0d14  1e               push ds                                  
  0d15  68dc0e           push 0xedc                               
  0d18  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  0d1d  83c408           add sp, 8                                
  0d20  6a00             push 0                                   
  0d22  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0d27  59               pop cx                                   
  0d28  1e               push ds                                  
  0d29  68d40e           push 0xed4                               
  0d2c  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0d31  83c404           add sp, 4                                
  0d34  8b1e980e         mov bx, word ptr [0xe98]                 
  0d38  6bdb1f           imul bx, bx, 0x1f                        
  0d3b  b8042c           mov ax, 0x2c04                           
  0d3e  8ec0             mov es, ax                               
  0d40  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  0d46  7504             jne 0xd4c                                
  0d48  33c0             xor ax, ax                               
  0d4a  eb0c             jmp 0xd58                                
  0d4c  a1980e           mov ax, word ptr [0xe98]                 
  0d4f  bb0500           mov bx, 5                                
  0d52  99               cdq                                      
  0d53  f7fb             idiv bx                                  
  0d55  42               inc dx                                   
  0d56  8bc2             mov ax, dx                               
  0d58  8946fc           mov word ptr [bp - 4], ax                
  0d5b  66ff36e40e       push dword ptr [0xee4]                   
  0d60  c1e003           shl ax, 3                                
  0d63  8cda             mov dx, ds                               
  0d65  05e80e           add ax, 0xee8                            
  0d68  b90800           mov cx, 8                                
  0d6b  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0d70  6a06             push 6                                   
  0d72  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0d77  83c40e           add sp, 0xe                              
  0d7a  666800000300     push 0x30000                             
  0d80  666802000f00     push 0xf0002                             
  0d86  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0d8b  83c408           add sp, 8                                
  0d8e  8b1e980e         mov bx, word ptr [0xe98]                 
  0d92  6bdb1f           imul bx, bx, 0x1f                        
  0d95  b8042c           mov ax, 0x2c04                           
  0d98  8ec0             mov es, ax                               
  0d9a  268a872908       mov al, byte ptr es:[bx + 0x829]         
  0d9f  98               cwde                                     
  0da0  50               push ax                                  
  0da1  6a71             push 0x71                                
  0da3  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0da8  83c404           add sp, 4                                
  0dab  52               push dx                                  
  0dac  50               push ax                                  
  0dad  16               push ss                                  
  0dae  8d4696           lea ax, [bp - 0x6a]                      
  0db1  50               push ax                                  
  0db2  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0db7  83c408           add sp, 8                                
  0dba  16               push ss                                  
  0dbb  8d4696           lea ax, [bp - 0x6a]                      
  0dbe  50               push ax                                  
  0dbf  66ff36b40e       push dword ptr [0xeb4]                   
  0dc4  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0dc9  83c408           add sp, 8                                
  0dcc  8b1e9c0e         mov bx, word ptr [0xe9c]                 
  0dd0  69dbe000         imul bx, bx, 0xe0                        
  0dd4  a19a0e           mov ax, word ptr [0xe9a]                 
  0dd7  d1e0             shl ax, 1                                
  0dd9  03d8             add bx, ax                               
  0ddb  b81d1e           mov ax, 0x1e1d                           
  0dde  8ec0             mov es, ax                               
  0de0  268a870100       mov al, byte ptr es:[bx + 1]             
  0de5  c1e806           shr ax, 6                                
  0de8  250100           and ax, 1                                
  0deb  0bc0             or ax, ax                                
  0ded  7405             je 0xdf4                                 
  0def  b80100           mov ax, 1                                
  0df2  eb02             jmp 0xdf6                                
  0df4  33c0             xor ax, ax                               
  0df6  8946fe           mov word ptr [bp - 2], ax                
  0df9  50               push ax                                  
  0dfa  6a72             push 0x72                                
  0dfc  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0e01  83c404           add sp, 4                                
  0e04  52               push dx                                  
  0e05  50               push ax                                  
  0e06  16               push ss                                  
  0e07  8d4696           lea ax, [bp - 0x6a]                      
  0e0a  50               push ax                                  
  0e0b  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0e10  83c408           add sp, 8                                
  0e13  16               push ss                                  
  0e14  8d4696           lea ax, [bp - 0x6a]                      
  0e17  50               push ax                                  
  0e18  66ff36b80e       push dword ptr [0xeb8]                   
  0e1d  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0e22  83c408           add sp, 8                                
  0e25  6a02             push 2                                   
  0e27  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0e2c  59               pop cx                                   
  0e2d  1e               push ds                                  
  0e2e  68500f           push 0xf50                               
  0e31  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0e36  83c404           add sp, 4                                
  0e39  6a00             push 0                                   
  0e3b  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0e40  59               pop cx                                   
  0e41  1e               push ds                                  
  0e42  68500f           push 0xf50                               
  0e45  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0e4a  83c404           add sp, 4                                
  0e4d  33f6             xor si, si                               
  0e4f  eb4e             jmp 0xe9f                                
  0e51  8bde             mov bx, si                               
  0e53  c1e302           shl bx, 2                                
  0e56  66ffb7580f       push dword ptr [bx + 0xf58]              
  0e5b  8bc6             mov ax, si                               
  0e5d  c1e003           shl ax, 3                                
  0e60  8cda             mov dx, ds                               
  0e62  05280f           add ax, 0xf28                            
  0e65  b90800           mov cx, 8                                
  0e68  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0e6d  6a09             push 9                                   
  0e6f  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  0e74  83c40e           add sp, 0xe                              
  0e77  56               push si                                  
  0e78  6a73             push 0x73                                
  0e7a  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0e7f  83c404           add sp, 4                                
  0e82  52               push dx                                  
  0e83  50               push ax                                  
  0e84  8bde             mov bx, si                               
  0e86  c1e302           shl bx, 2                                
  0e89  ffb76a0f         push word ptr [bx + 0xf6a]               
  0e8d  8bde             mov bx, si                               
  0e8f  c1e302           shl bx, 2                                
  0e92  ffb7680f         push word ptr [bx + 0xf68]               
  0e96  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0e9b  83c408           add sp, 8                                
  0e9e  46               inc si                                   
  0e9f  83fe04           cmp si, 4                                
  0ea2  7cad             jl 0xe51                                 
  0ea4  16               push ss                                  
  0ea5  8d863cff         lea ax, [bp - 0xc4]                      
  0ea9  50               push ax                                  
  0eaa  16               push ss                                  
  0eab  8d8614ff         lea ax, [bp - 0xec]                      
  0eaf  50               push ax                                  
  0eb0  16               push ss                                  
  0eb1  8d86ecfe         lea ax, [bp - 0x114]                     
  0eb5  50               push ax                                  
  0eb6  ff36980e         push word ptr [0xe98]                    
  0eba  6a02             push 2                                   
  0ebc  90               nop                                      
  0ebd  0e               push cs                                  
  0ebe  e84510           call 0x1f06                              
  0ec1  83c410           add sp, 0x10                             
  0ec4  33f6             xor si, si                               
  0ec6  eb28             jmp 0xef0                                
  0ec8  8bc6             mov ax, si                               
  0eca  6bc028           imul ax, ax, 0x28                        
  0ecd  8d96ecfe         lea dx, [bp - 0x114]                     
  0ed1  03c2             add ax, dx                               
  0ed3  16               push ss                                  
  0ed4  50               push ax                                  
  0ed5  8bde             mov bx, si                               
  0ed7  c1e302           shl bx, 2                                
  0eda  ffb7ca0e         push word ptr [bx + 0xeca]               
  0ede  8bde             mov bx, si                               
  0ee0  c1e302           shl bx, 2                                
  0ee3  ffb7c80e         push word ptr [bx + 0xec8]               
  0ee7  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0eec  83c408           add sp, 8                                
  0eef  46               inc si                                   
  0ef0  83fe03           cmp si, 3                                
  0ef3  7cd3             jl 0xec8                                 
  0ef5  e9900b           jmp 0x1a88                               
ovl45_0ef8:  ; case
  0ef8  666800000300     push 0x30000                             
  0efe  666801000f00     push 0xf0001                             
  0f04  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0f09  83c408           add sp, 8                                
  0f0c  a1980e           mov ax, word ptr [0xe98]                 
  0f0f  6bc041           imul ax, ax, 0x41                        
  0f12  058115           add ax, 0x1581                           
  0f15  68042c           push 0x2c04                              
  0f18  50               push ax                                  
  0f19  6668b0013e00     push 0x3e01b0                            
  0f1f  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0f24  83c408           add sp, 8                                
  0f27  666800000300     push 0x30000                             
  0f2d  666802000f00     push 0xf0002                             
  0f33  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0f38  83c408           add sp, 8                                
  0f3b  c746e80000       mov word ptr [bp - 0x18], 0              
  0f40  8b1e980e         mov bx, word ptr [0xe98]                 
  0f44  6bdb41           imul bx, bx, 0x41                        
  0f47  b8042c           mov ax, 0x2c04                           
  0f4a  8ec0             mov es, ax                               
  0f4c  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  0f52  7431             je 0xf85                                 
  0f54  c746e80100       mov word ptr [bp - 0x18], 1              
  0f59  8b1e980e         mov bx, word ptr [0xe98]                 
  0f5d  6bdb41           imul bx, bx, 0x41                        
  0f60  b8042c           mov ax, 0x2c04                           
  0f63  8ec0             mov es, ax                               
  0f65  26ffb7b215       push word ptr es:[bx + 0x15b2]           
  0f6a  8b1e980e         mov bx, word ptr [0xe98]                 
  0f6e  6bdb41           imul bx, bx, 0x41                        
  0f71  b8042c           mov ax, 0x2c04                           
  0f74  8ec0             mov es, ax                               
  0f76  26ffb7b015       push word ptr es:[bx + 0x15b0]           
  0f7b  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0f80  83c404           add sp, 4                                
  0f83  8bf8             mov di, ax                               
  0f85  33f6             xor si, si                               
  0f87  eb5c             jmp 0xfe5                                
  0f89  8b1e980e         mov bx, word ptr [0xe98]                 
  0f8d  6bdb41           imul bx, bx, 0x41                        
  0f90  b8042c           mov ax, 0x2c04                           
  0f93  8ec0             mov es, ax                               
  0f95  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0f9a  8bde             mov bx, si                               
  0f9c  6bdb14           imul bx, bx, 0x14                        
  0f9f  ba042c           mov dx, 0x2c04                           
  0fa2  8ec2             mov es, dx                               
  0fa4  263b879301       cmp ax, word ptr es:[bx + 0x193]         
  0fa9  7539             jne 0xfe4                                
  0fab  8b1e980e         mov bx, word ptr [0xe98]                 
  0faf  6bdb41           imul bx, bx, 0x41                        
  0fb2  b8042c           mov ax, 0x2c04                           
  0fb5  8ec0             mov es, ax                               
  0fb7  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0fbc  8bde             mov bx, si                               
  0fbe  6bdb14           imul bx, bx, 0x14                        
  0fc1  ba042c           mov dx, 0x2c04                           
  0fc4  8ec2             mov es, dx                               
  0fc6  263b879501       cmp ax, word ptr es:[bx + 0x195]         
  0fcb  7517             jne 0xfe4                                
  0fcd  666838016e00     push 0x6e0138                            
  0fd3  1e               push ds                                  
  0fd4  682a34           push 0x342a                              
  0fd7  6a04             push 4                                   
  0fd9  56               push si                                  
  0fda  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0fdf  83c40c           add sp, 0xc                              
  0fe2  eb06             jmp 0xfea                                
  0fe4  46               inc si                                   
  0fe5  83fe08           cmp si, 8                                
  0fe8  7c9f             jl 0xf89                                 
  0fea  666a75           push 0x75                                
  0fed  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0ff2  83c404           add sp, 4                                
  0ff5  52               push dx                                  
  0ff6  50               push ax                                  
  0ff7  ff368e0f         push word ptr [0xf8e]                    
  0ffb  a18c0f           mov ax, word ptr [0xf8c]                 
  0ffe  050800           add ax, 8                                
  1001  50               push ax                                  
  1002  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  1007  83c408           add sp, 8                                
  100a  8b1e980e         mov bx, word ptr [0xe98]                 
  100e  6bdb41           imul bx, bx, 0x41                        
  1011  b8042c           mov ax, 0x2c04                           
  1014  8ec0             mov es, ax                               
  1016  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  101c  7e3a             jle 0x1058                               
  101e  8b1e980e         mov bx, word ptr [0xe98]                 
  1022  6bdb41           imul bx, bx, 0x41                        
  1025  b8042c           mov ax, 0x2c04                           
  1028  8ec0             mov es, ax                               
  102a  268a87a915       mov al, byte ptr es:[bx + 0x15a9]        
  102f  98               cwde                                     
  1030  8bf0             mov si, ax                               
  1032  8b1e980e         mov bx, word ptr [0xe98]                 
  1036  6bdb41           imul bx, bx, 0x41                        
  1039  b8042c           mov ax, 0x2c04                           
  103c  8ec0             mov es, ax                               
  103e  268a87aa15       mov al, byte ptr es:[bx + 0x15aa]        
  1043  98               cwde                                     
  1044  50               push ax                                  
  1045  1e               push ds                                  
  1046  68c40f           push 0xfc4                               
  1049  16               push ss                                  
  104a  8d4696           lea ax, [bp - 0x6a]                      
  104d  50               push ax                                  
  104e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1053  83c40a           add sp, 0xa                              
  1056  eb14             jmp 0x106c                               
  1058  beffff           mov si, 0xffff                           
  105b  1e               push ds                                  
  105c  68c80f           push 0xfc8                               
  105f  16               push ss                                  
  1060  8d4696           lea ax, [bp - 0x6a]                      
  1063  50               push ax                                  
  1064  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1069  83c408           add sp, 8                                
  106c  837ee800         cmp word ptr [bp - 0x18], 0              
  1070  7503             jne 0x1075                               
  1072  e98300           jmp 0x10f8                               
  1075  666875000100     push 0x10075                             
  107b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1080  83c404           add sp, 4                                
  1083  52               push dx                                  
  1084  50               push ax                                  
  1085  16               push ss                                  
  1086  8d4696           lea ax, [bp - 0x6a]                      
  1089  50               push ax                                  
  108a  9a014a0000       lcall 0, 0x4a01                          -> 0000:4a01
  108f  83c408           add sp, 8                                
  1092  8b1e980e         mov bx, word ptr [0xe98]                 
  1096  6bdb41           imul bx, bx, 0x41                        
  1099  b8042c           mov ax, 0x2c04                           
  109c  8ec0             mov es, ax                               
  109e  2683bfb015fe     cmp word ptr es:[bx + 0x15b0], -2        
  10a4  7538             jne 0x10de                               
  10a6  16               push ss                                  
  10a7  8d46f8           lea ax, [bp - 8]                         
  10aa  50               push ax                                  
  10ab  16               push ss                                  
  10ac  8d46fa           lea ax, [bp - 6]                         
  10af  50               push ax                                  
  10b0  b8042c           mov ax, 0x2c04                           
  10b3  8ec0             mov es, ax                               
  10b5  26ff361001       push word ptr es:[0x110]                 
  10ba  9a57007330       lcall 0x3073, 0x57                       -> ovl47:0b47
  10bf  83c40a           add sp, 0xa                              
  10c2  8946ea           mov word ptr [bp - 0x16], ax             
  10c5  837eea00         cmp word ptr [bp - 0x16], 0              
  10c9  740f             je 0x10da                                
  10cb  6a02             push 2                                   
  10cd  6a75             push 0x75                                
  10cf  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  10d4  83c404           add sp, 4                                
  10d7  52               push dx                                  
  10d8  eb0f             jmp 0x10e9                               
  10da  6a03             push 3                                   
  10dc  ebef             jmp 0x10cd                               
  10de  8bc7             mov ax, di                               
  10e0  6bc041           imul ax, ax, 0x41                        
  10e3  058115           add ax, 0x1581                           
  10e6  68042c           push 0x2c04                              
  10e9  50               push ax                                  
  10ea  16               push ss                                  
  10eb  8d8664ff         lea ax, [bp - 0x9c]                      
  10ef  50               push ax                                  
  10f0  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  10f5  83c408           add sp, 8                                
  10f8  666a00           push 0                                   
  10fb  666800000100     push 0x10000                             
  1101  666a00           push 0                                   
  1104  6a00             push 0                                   
  1106  66ff36900f       push dword ptr [0xf90]                   
  110b  1e               push ds                                  
  110c  682a34           push 0x342a                              
  110f  8b1e980e         mov bx, word ptr [0xe98]                 
  1113  6bdb41           imul bx, bx, 0x41                        
  1116  b8042c           mov ax, 0x2c04                           
  1119  8ec0             mov es, ax                               
  111b  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1120  98               cwde                                     
  1121  50               push ax                                  
  1122  56               push si                                  
  1123  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  1128  83c41a           add sp, 0x1a                             
  112b  837ee800         cmp word ptr [bp - 0x18], 0              
  112f  741f             je 0x1150                                
  1131  16               push ss                                  
  1132  8d4696           lea ax, [bp - 0x6a]                      
  1135  50               push ax                                  
  1136  66ff36980f       push dword ptr [0xf98]                   
  113b  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1140  83c408           add sp, 8                                
  1143  16               push ss                                  
  1144  8d8664ff         lea ax, [bp - 0x9c]                      
  1148  50               push ax                                  
  1149  66ff369c0f       push dword ptr [0xf9c]                   
  114e  eb0a             jmp 0x115a                               
  1150  16               push ss                                  
  1151  8d4696           lea ax, [bp - 0x6a]                      
  1154  50               push ax                                  
  1155  66ff36940f       push dword ptr [0xf94]                   
  115a  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  115f  83c408           add sp, 8                                
  1162  33f6             xor si, si                               
  1164  33ff             xor di, di                               
  1166  e9ca00           jmp 0x1233                               
  1169  8b1e980e         mov bx, word ptr [0xe98]                 
  116d  6bdb41           imul bx, bx, 0x41                        
  1170  03de             add bx, si                               
  1172  b8042c           mov ax, 0x2c04                           
  1175  8ec0             mov es, ax                               
  1177  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  117c  98               cwde                                     
  117d  8bd0             mov dx, ax                               
  117f  0bc0             or ax, ax                                
  1181  7d03             jge 0x1186                               
  1183  e9ac00           jmp 0x1232                               
  1186  39169e0e         cmp word ptr [0xe9e], dx                 
  118a  7503             jne 0x118f                               
  118c  8976ec           mov word ptr [bp - 0x14], si             
  118f  39169e0e         cmp word ptr [0xe9e], dx                 
  1193  750f             jne 0x11a4                               
  1195  b8042c           mov ax, 0x2c04                           
  1198  8ec0             mov es, ax                               
  119a  268b1e1001       mov bx, word ptr es:[0x110]              
  119f  83c302           add bx, 2                                
  11a2  eb03             jmp 0x11a7                               
  11a4  bb0100           mov bx, 1                                
  11a7  666a00           push 0                                   
  11aa  53               push bx                                  
  11ab  8b1e980e         mov bx, word ptr [0xe98]                 
  11af  6bdb41           imul bx, bx, 0x41                        
  11b2  03de             add bx, si                               
  11b4  b8042c           mov ax, 0x2c04                           
  11b7  8ec0             mov es, ax                               
  11b9  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  11be  98               cwde                                     
  11bf  50               push ax                                  
  11c0  8b1e980e         mov bx, word ptr [0xe98]                 
  11c4  6bdb41           imul bx, bx, 0x41                        
  11c7  03de             add bx, si                               
  11c9  b8042c           mov ax, 0x2c04                           
  11cc  8ec0             mov es, ax                               
  11ce  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  11d3  98               cwde                                     
  11d4  50               push ax                                  
  11d5  8b1e980e         mov bx, word ptr [0xe98]                 
  11d9  6bdb41           imul bx, bx, 0x41                        
  11dc  03de             add bx, si                               
  11de  b8042c           mov ax, 0x2c04                           
  11e1  8ec0             mov es, ax                               
  11e3  268a87a315       mov al, byte ptr es:[bx + 0x15a3]        
  11e8  98               cwde                                     
  11e9  50               push ax                                  
  11ea  8b1e980e         mov bx, word ptr [0xe98]                 
  11ee  6bdb41           imul bx, bx, 0x41                        
  11f1  03de             add bx, si                               
  11f3  b8042c           mov ax, 0x2c04                           
  11f6  8ec0             mov es, ax                               
  11f8  268a879715       mov al, byte ptr es:[bx + 0x1597]        
  11fd  98               cwde                                     
  11fe  50               push ax                                  
  11ff  8bdf             mov bx, di                               
  1201  c1e302           shl bx, 2                                
  1204  ffb77a0f         push word ptr [bx + 0xf7a]               
  1208  8bdf             mov bx, di                               
  120a  c1e302           shl bx, 2                                
  120d  ffb7780f         push word ptr [bx + 0xf78]               
  1211  1e               push ds                                  
  1212  682a34           push 0x342a                              
  1215  8b1e980e         mov bx, word ptr [0xe98]                 
  1219  6bdb41           imul bx, bx, 0x41                        
  121c  b8042c           mov ax, 0x2c04                           
  121f  8ec0             mov es, ax                               
  1221  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1226  98               cwde                                     
  1227  50               push ax                                  
  1228  52               push dx                                  
  1229  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  122e  83c41a           add sp, 0x1a                             
  1231  47               inc di                                   
  1232  46               inc si                                   
  1233  83fe04           cmp si, 4                                
  1236  7d03             jge 0x123b                               
  1238  e92eff           jmp 0x1169                               
  123b  833e9e0e00       cmp word ptr [0xe9e], 0                  
  1240  7d03             jge 0x1245                               
  1242  e94308           jmp 0x1a88                               
  1245  8b1e980e         mov bx, word ptr [0xe98]                 
  1249  6bdb41           imul bx, bx, 0x41                        
  124c  035eec           add bx, word ptr [bp - 0x14]             
  124f  b8042c           mov ax, 0x2c04                           
  1252  8ec0             mov es, ax                               
  1254  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  1259  98               cwde                                     
  125a  50               push ax                                  
  125b  8b1e980e         mov bx, word ptr [0xe98]                 
  125f  6bdb41           imul bx, bx, 0x41                        
  1262  035eec           add bx, word ptr [bp - 0x14]             
  1265  b8042c           mov ax, 0x2c04                           
  1268  8ec0             mov es, ax                               
  126a  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  126f  98               cwde                                     
  1270  50               push ax                                  
  1271  8b1e980e         mov bx, word ptr [0xe98]                 
  1275  6bdb41           imul bx, bx, 0x41                        
  1278  035eec           add bx, word ptr [bp - 0x14]             
  127b  b8042c           mov ax, 0x2c04                           
  127e  8ec0             mov es, ax                               
  1280  268a87a315       mov al, byte ptr es:[bx + 0x15a3]        
  1285  98               cwde                                     
  1286  50               push ax                                  
  1287  8b1e980e         mov bx, word ptr [0xe98]                 
  128b  6bdb41           imul bx, bx, 0x41                        
  128e  035eec           add bx, word ptr [bp - 0x14]             
  1291  b8042c           mov ax, 0x2c04                           
  1294  8ec0             mov es, ax                               
  1296  268a879715       mov al, byte ptr es:[bx + 0x1597]        
  129b  98               cwde                                     
  129c  50               push ax                                  
  129d  6a01             push 1                                   
  129f  ff369e0e         push word ptr [0xe9e]                    
  12a3  66ff36880f       push dword ptr [0xf88]                   
  12a8  1e               push ds                                  
  12a9  682a34           push 0x342a                              
  12ac  9a2000a92f       lcall 0x2fa9, 0x20                       -> ovl16:0000
  12b1  83c414           add sp, 0x14                             
  12b4  e9d107           jmp 0x1a88                               
ovl45_12b7:  ; case
  12b7  666800000300     push 0x30000                             
  12bd  666801000f00     push 0xf0001                             
  12c3  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  12c8  83c408           add sp, 8                                
  12cb  a1980e           mov ax, word ptr [0xe98]                 
  12ce  6bc041           imul ax, ax, 0x41                        
  12d1  058115           add ax, 0x1581                           
  12d4  68042c           push 0x2c04                              
  12d7  50               push ax                                  
  12d8  6668b0013e00     push 0x3e01b0                            
  12de  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  12e3  83c408           add sp, 8                                
  12e6  666800000300     push 0x30000                             
  12ec  666802000f00     push 0xf0002                             
  12f2  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  12f7  83c408           add sp, 8                                
  12fa  b8ffff           mov ax, 0xffff                           
  12fd  8986d6fe         mov word ptr [bp - 0x12a], ax            
  1301  8986d4fe         mov word ptr [bp - 0x12c], ax            
  1305  8b1e980e         mov bx, word ptr [0xe98]                 
  1309  6bdb41           imul bx, bx, 0x41                        
  130c  b8042c           mov ax, 0x2c04                           
  130f  8ec0             mov es, ax                               
  1311  2683bfae1500     cmp word ptr es:[bx + 0x15ae], 0         
  1317  7503             jne 0x131c                               
  1319  e91001           jmp 0x142c                               
  131c  8b1e980e         mov bx, word ptr [0xe98]                 
  1320  6bdb41           imul bx, bx, 0x41                        
  1323  b8042c           mov ax, 0x2c04                           
  1326  8ec0             mov es, ax                               
  1328  26ffb7b215       push word ptr es:[bx + 0x15b2]           
  132d  8b1e980e         mov bx, word ptr [0xe98]                 
  1331  6bdb41           imul bx, bx, 0x41                        
  1334  b8042c           mov ax, 0x2c04                           
  1337  8ec0             mov es, ax                               
  1339  26ffb7b015       push word ptr es:[bx + 0x15b0]           
  133e  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  1343  83c404           add sp, 4                                
  1346  8bf8             mov di, ax                               
  1348  0bff             or di, di                                
  134a  7d1c             jge 0x1368                               
  134c  16               push ss                                  
  134d  8d46f8           lea ax, [bp - 8]                         
  1350  50               push ax                                  
  1351  16               push ss                                  
  1352  8d46fa           lea ax, [bp - 6]                         
  1355  50               push ax                                  
  1356  b8042c           mov ax, 0x2c04                           
  1359  8ec0             mov es, ax                               
  135b  26ff361001       push word ptr es:[0x110]                 
  1360  9a57007330       lcall 0x3073, 0x57                       -> ovl47:0b47
  1365  83c40a           add sp, 0xa                              
  1368  b8042c           mov ax, 0x2c04                           
  136b  8ec0             mov es, ax                               
  136d  268b0e8101       mov cx, word ptr es:[0x181]              
  1372  e9ad00           jmp 0x1422                               
  1375  8bd9             mov bx, cx                               
  1377  6bdb16           imul bx, bx, 0x16                        
  137a  b81d1e           mov ax, 0x1e1d                           
  137d  8ec0             mov es, ax                               
  137f  268a878988       mov al, byte ptr es:[bx - 0x7777]        
  1384  98               cwde                                     
  1385  3b06980e         cmp ax, word ptr [0xe98]                 
  1389  7403             je 0x138e                                
  138b  e99400           jmp 0x1422                               
  138e  8bd9             mov bx, cx                               
  1390  6bdb16           imul bx, bx, 0x16                        
  1393  b81d1e           mov ax, 0x1e1d                           
  1396  8ec0             mov es, ax                               
  1398  2683bf8088ff     cmp word ptr es:[bx - 0x7780], -1        
  139e  7518             jne 0x13b8                               
  13a0  8bd9             mov bx, cx                               
  13a2  6bdb16           imul bx, bx, 0x16                        
  13a5  b81d1e           mov ax, 0x1e1d                           
  13a8  8ec0             mov es, ax                               
  13aa  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  13af  d1e8             shr ax, 1                                
  13b1  257f00           and ax, 0x7f                             
  13b4  3bc7             cmp ax, di                               
  13b6  7412             je 0x13ca                                
  13b8  8bd9             mov bx, cx                               
  13ba  6bdb16           imul bx, bx, 0x16                        
  13bd  b81d1e           mov ax, 0x1e1d                           
  13c0  8ec0             mov es, ax                               
  13c2  2683bf8088fe     cmp word ptr es:[bx - 0x7780], -2        
  13c8  7558             jne 0x1422                               
  13ca  8bd9             mov bx, cx                               
  13cc  6bdb16           imul bx, bx, 0x16                        
  13cf  b81d1e           mov ax, 0x1e1d                           
  13d2  8ec0             mov es, ax                               
  13d4  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  13d9  98               cwde                                     
  13da  ba042c           mov dx, 0x2c04                           
  13dd  8ec2             mov es, dx                               
  13df  263b061001       cmp ax, word ptr es:[0x110]              
  13e4  753c             jne 0x1422                               
  13e6  8bd9             mov bx, cx                               
  13e8  6bdb16           imul bx, bx, 0x16                        
  13eb  b81d1e           mov ax, 0x1e1d                           
  13ee  8ec0             mov es, ax                               
  13f0  2680bf908865     cmp byte ptr es:[bx - 0x7770], 0x65      
  13f6  7516             jne 0x140e                               
  13f8  8bd9             mov bx, cx                               
  13fa  6bdb16           imul bx, bx, 0x16                        
  13fd  b81d1e           mov ax, 0x1e1d                           
  1400  8ec0             mov es, ax                               
  1402  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  1407  98               cwde                                     
  1408  8986d4fe         mov word ptr [bp - 0x12c], ax            
  140c  eb14             jmp 0x1422                               
  140e  8bd9             mov bx, cx                               
  1410  6bdb16           imul bx, bx, 0x16                        
  1413  b81d1e           mov ax, 0x1e1d                           
  1416  8ec0             mov es, ax                               
  1418  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  141d  98               cwde                                     
  141e  8986d6fe         mov word ptr [bp - 0x12a], ax            
  1422  8bc1             mov ax, cx                               
  1424  49               dec cx                                   
  1425  0bc0             or ax, ax                                
  1427  7403             je 0x142c                                
  1429  e949ff           jmp 0x1375                               
  142c  66689a000000     push 0x9a                                
  1432  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1437  83c404           add sp, 4                                
  143a  52               push dx                                  
  143b  50               push ax                                  
  143c  666868016d00     push 0x6d0168                            
  1442  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  1447  83c408           add sp, 8                                
  144a  8b1e980e         mov bx, word ptr [0xe98]                 
  144e  6bdb41           imul bx, bx, 0x41                        
  1451  b8042c           mov ax, 0x2c04                           
  1454  8ec0             mov es, ax                               
  1456  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  145c  7e46             jle 0x14a4                               
  145e  8b1e980e         mov bx, word ptr [0xe98]                 
  1462  6bdb41           imul bx, bx, 0x41                        
  1465  b8042c           mov ax, 0x2c04                           
  1468  8ec0             mov es, ax                               
  146a  268a87a915       mov al, byte ptr es:[bx + 0x15a9]        
  146f  98               cwde                                     
  1470  8bf0             mov si, ax                               
  1472  8b1e980e         mov bx, word ptr [0xe98]                 
  1476  6bdb41           imul bx, bx, 0x41                        
  1479  b8042c           mov ax, 0x2c04                           
  147c  8ec0             mov es, ax                               
  147e  268a87aa15       mov al, byte ptr es:[bx + 0x15aa]        
  1483  98               cwde                                     
  1484  50               push ax                                  
  1485  66689a000100     push 0x1009a                             
  148b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1490  83c404           add sp, 4                                
  1493  52               push dx                                  
  1494  50               push ax                                  
  1495  16               push ss                                  
  1496  8d4696           lea ax, [bp - 0x6a]                      
  1499  50               push ax                                  
  149a  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  149f  83c40a           add sp, 0xa                              
  14a2  eb14             jmp 0x14b8                               
  14a4  beffff           mov si, 0xffff                           
  14a7  1e               push ds                                  
  14a8  68ca0f           push 0xfca                               
  14ab  16               push ss                                  
  14ac  8d4696           lea ax, [bp - 0x6a]                      
  14af  50               push ax                                  
  14b0  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  14b5  83c408           add sp, 8                                
  14b8  666a00           push 0                                   
  14bb  666800000100     push 0x10000                             
  14c1  666a00           push 0                                   
  14c4  666a67           push 0x67                                
  14c7  687001           push 0x170                               
  14ca  1e               push ds                                  
  14cb  682a34           push 0x342a                              
  14ce  8b1e980e         mov bx, word ptr [0xe98]                 
  14d2  6bdb41           imul bx, bx, 0x41                        
  14d5  b8042c           mov ax, 0x2c04                           
  14d8  8ec0             mov es, ax                               
  14da  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  14df  98               cwde                                     
  14e0  50               push ax                                  
  14e1  56               push si                                  
  14e2  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  14e7  83c41a           add sp, 0x1a                             
  14ea  16               push ss                                  
  14eb  8d4696           lea ax, [bp - 0x6a]                      
  14ee  50               push ax                                  
  14ef  666898016d00     push 0x6d0198                            
  14f5  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  14fa  83c408           add sp, 8                                
  14fd  666a00           push 0                                   
  1500  666800000100     push 0x10000                             
  1506  666a00           push 0                                   
  1509  666a67           push 0x67                                
  150c  68b001           push 0x1b0                               
  150f  1e               push ds                                  
  1510  682a34           push 0x342a                              
  1513  8b1e980e         mov bx, word ptr [0xe98]                 
  1517  6bdb41           imul bx, bx, 0x41                        
  151a  b8042c           mov ax, 0x2c04                           
  151d  8ec0             mov es, ax                               
  151f  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1524  98               cwde                                     
  1525  50               push ax                                  
  1526  ffb6d4fe         push word ptr [bp - 0x12c]               
  152a  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  152f  83c41a           add sp, 0x1a                             
  1532  666a00           push 0                                   
  1535  666800000100     push 0x10000                             
  153b  666a00           push 0                                   
  153e  666a67           push 0x67                                
  1541  68d801           push 0x1d8                               
  1544  1e               push ds                                  
  1545  682a34           push 0x342a                              
  1548  8b1e980e         mov bx, word ptr [0xe98]                 
  154c  6bdb41           imul bx, bx, 0x41                        
  154f  b8042c           mov ax, 0x2c04                           
  1552  8ec0             mov es, ax                               
  1554  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1559  98               cwde                                     
  155a  50               push ax                                  
  155b  ffb6d6fe         push word ptr [bp - 0x12a]               
  155f  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  1564  83c41a           add sp, 0x1a                             
  1567  16               push ss                                  
  1568  8d46ee           lea ax, [bp - 0x12]                      
  156b  50               push ax                                  
  156c  16               push ss                                  
  156d  8d46f0           lea ax, [bp - 0x10]                      
  1570  50               push ax                                  
  1571  ff36980e         push word ptr [0xe98]                    
  1575  9a48005830       lcall 0x3058, 0x48                       -> ovl44:0410
  157a  83c40a           add sp, 0xa                              
  157d  33c0             xor ax, ax                               
  157f  8946c8           mov word ptr [bp - 0x38], ax             
  1582  8946ca           mov word ptr [bp - 0x36], ax             
  1585  b8ffff           mov ax, 0xffff                           
  1588  8946da           mov word ptr [bp - 0x26], ax             
  158b  8946d8           mov word ptr [bp - 0x28], ax             
  158e  8946d6           mov word ptr [bp - 0x2a], ax             
  1591  8946d4           mov word ptr [bp - 0x2c], ax             
  1594  b8ffff           mov ax, 0xffff                           
  1597  8946d2           mov word ptr [bp - 0x2e], ax             
  159a  8946d0           mov word ptr [bp - 0x30], ax             
  159d  8946ce           mov word ptr [bp - 0x32], ax             
  15a0  8946cc           mov word ptr [bp - 0x34], ax             
  15a3  33f6             xor si, si                               
  15a5  e9e600           jmp 0x168e                               
  15a8  8bde             mov bx, si                               
  15aa  d1e3             shl bx, 1                                
  15ac  8d46f0           lea ax, [bp - 0x10]                      
  15af  03d8             add bx, ax                               
  15b1  368b3f           mov di, word ptr ss:[bx]                 
  15b4  b8042c           mov ax, 0x2c04                           
  15b7  8ec0             mov es, ax                               
  15b9  268b0e8101       mov cx, word ptr es:[0x181]              
  15be  e9b600           jmp 0x1677                               
  15c1  8bd9             mov bx, cx                               
  15c3  6bdb16           imul bx, bx, 0x16                        
  15c6  b81d1e           mov ax, 0x1e1d                           
  15c9  8ec0             mov es, ax                               
  15cb  268a878988       mov al, byte ptr es:[bx - 0x7777]        
  15d0  98               cwde                                     
  15d1  3bc7             cmp ax, di                               
  15d3  7403             je 0x15d8                                
  15d5  e99f00           jmp 0x1677                               
  15d8  8bd9             mov bx, cx                               
  15da  6bdb16           imul bx, bx, 0x16                        
  15dd  b81d1e           mov ax, 0x1e1d                           
  15e0  8ec0             mov es, ax                               
  15e2  2683bf8088ff     cmp word ptr es:[bx - 0x7780], -1        
  15e8  7403             je 0x15ed                                
  15ea  e98a00           jmp 0x1677                               
  15ed  8bd9             mov bx, cx                               
  15ef  6bdb16           imul bx, bx, 0x16                        
  15f2  b81d1e           mov ax, 0x1e1d                           
  15f5  8ec0             mov es, ax                               
  15f7  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  15fc  d1e8             shr ax, 1                                
  15fe  257f00           and ax, 0x7f                             
  1601  3b06980e         cmp ax, word ptr [0xe98]                 
  1605  7570             jne 0x1677                               
  1607  8bd9             mov bx, cx                               
  1609  6bdb16           imul bx, bx, 0x16                        
  160c  b81d1e           mov ax, 0x1e1d                           
  160f  8ec0             mov es, ax                               
  1611  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  1616  98               cwde                                     
  1617  ba042c           mov dx, 0x2c04                           
  161a  8ec2             mov es, dx                               
  161c  263b061001       cmp ax, word ptr es:[0x110]              
  1621  7554             jne 0x1677                               
  1623  8bd9             mov bx, cx                               
  1625  6bdb16           imul bx, bx, 0x16                        
  1628  b81d1e           mov ax, 0x1e1d                           
  162b  8ec0             mov es, ax                               
  162d  2680bf908865     cmp byte ptr es:[bx - 0x7770], 0x65      
  1633  7522             jne 0x1657                               
  1635  8bd9             mov bx, cx                               
  1637  6bdb16           imul bx, bx, 0x16                        
  163a  b81d1e           mov ax, 0x1e1d                           
  163d  8ec0             mov es, ax                               
  163f  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  1644  98               cwde                                     
  1645  8b5ec8           mov bx, word ptr [bp - 0x38]             
  1648  d1e3             shl bx, 1                                
  164a  8d56cc           lea dx, [bp - 0x34]                      
  164d  03da             add bx, dx                               
  164f  368907           mov word ptr ss:[bx], ax                 
  1652  ff46c8           inc word ptr [bp - 0x38]                 
  1655  eb20             jmp 0x1677                               
  1657  8bd9             mov bx, cx                               
  1659  6bdb16           imul bx, bx, 0x16                        
  165c  b81d1e           mov ax, 0x1e1d                           
  165f  8ec0             mov es, ax                               
  1661  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  1666  98               cwde                                     
  1667  8b5eca           mov bx, word ptr [bp - 0x36]             
  166a  d1e3             shl bx, 1                                
  166c  8d56d4           lea dx, [bp - 0x2c]                      
  166f  03da             add bx, dx                               
  1671  368907           mov word ptr ss:[bx], ax                 
  1674  ff46ca           inc word ptr [bp - 0x36]                 
  1677  8bc1             mov ax, cx                               
  1679  49               dec cx                                   
  167a  0bc0             or ax, ax                                
  167c  740f             je 0x168d                                
  167e  837eca04         cmp word ptr [bp - 0x36], 4              
  1682  7d09             jge 0x168d                               
  1684  837ec804         cmp word ptr [bp - 0x38], 4              
  1688  7d03             jge 0x168d                               
  168a  e934ff           jmp 0x15c1                               
  168d  46               inc si                                   
  168e  3b76ee           cmp si, word ptr [bp - 0x12]             
  1691  7d03             jge 0x1696                               
  1693  e912ff           jmp 0x15a8                               
  1696  66689a000200     push 0x2009a                             
  169c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  16a1  83c404           add sp, 4                                
  16a4  52               push dx                                  
  16a5  50               push ax                                  
  16a6  666888019b00     push 0x9b0188                            
  16ac  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  16b1  83c408           add sp, 8                                
  16b4  66689a000300     push 0x3009a                             
  16ba  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  16bf  83c404           add sp, 4                                
  16c2  52               push dx                                  
  16c3  50               push ax                                  
  16c4  66688801bc00     push 0xbc0188                            
  16ca  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  16cf  83c408           add sp, 8                                
  16d2  33f6             xor si, si                               
  16d4  eb7b             jmp 0x1751                               
  16d6  666a00           push 0                                   
  16d9  666800000100     push 0x10000                             
  16df  666a00           push 0                                   
  16e2  666895000000     push 0x95                                
  16e8  8bc6             mov ax, si                               
  16ea  6bc028           imul ax, ax, 0x28                        
  16ed  059001           add ax, 0x190                            
  16f0  50               push ax                                  
  16f1  1e               push ds                                  
  16f2  682a34           push 0x342a                              
  16f5  b8042c           mov ax, 0x2c04                           
  16f8  8ec0             mov es, ax                               
  16fa  26ff361001       push word ptr es:[0x110]                 
  16ff  8bde             mov bx, si                               
  1701  d1e3             shl bx, 1                                
  1703  8d46d4           lea ax, [bp - 0x2c]                      
  1706  03d8             add bx, ax                               
  1708  36ff37           push word ptr ss:[bx]                    
  170b  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  1710  83c41a           add sp, 0x1a                             
  1713  666a00           push 0                                   
  1716  666800000100     push 0x10000                             
  171c  666a00           push 0                                   
  171f  6668b6000000     push 0xb6                                
  1725  8bc6             mov ax, si                               
  1727  6bc028           imul ax, ax, 0x28                        
  172a  059001           add ax, 0x190                            
  172d  50               push ax                                  
  172e  1e               push ds                                  
  172f  682a34           push 0x342a                              
  1732  b8042c           mov ax, 0x2c04                           
  1735  8ec0             mov es, ax                               
  1737  26ff361001       push word ptr es:[0x110]                 
  173c  8bde             mov bx, si                               
  173e  d1e3             shl bx, 1                                
  1740  8d46cc           lea ax, [bp - 0x34]                      
  1743  03d8             add bx, ax                               
  1745  36ff37           push word ptr ss:[bx]                    
  1748  9a6100f930       lcall 0x30f9, 0x61                       -> ovl64:08be
  174d  83c41a           add sp, 0x1a                             
  1750  46               inc si                                   
  1751  83fe04           cmp si, 4                                
  1754  7c80             jl 0x16d6                                
  1756  6a00             push 0                                   
  1758  9aa7005830       lcall 0x3058, 0xa7                       -> ovl44:0638
  175d  59               pop cx                                   
  175e  6a01             push 1                                   
  1760  9aa7005830       lcall 0x3058, 0xa7                       -> ovl44:0638
  1765  59               pop cx                                   
  1766  e91f03           jmp 0x1a88                               
ovl45_1769:  ; case
  1769  666800000300     push 0x30000                             
  176f  666801000f00     push 0xf0001                             
  1775  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  177a  83c408           add sp, 8                                
  177d  a1980e           mov ax, word ptr [0xe98]                 
  1780  6bc041           imul ax, ax, 0x41                        
  1783  058115           add ax, 0x1581                           
  1786  68042c           push 0x2c04                              
  1789  50               push ax                                  
  178a  6668b0013e00     push 0x3e01b0                            
  1790  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1795  83c408           add sp, 8                                
  1798  66ff36a00e       push dword ptr [0xea0]                   
  179d  1e               push ds                                  
  179e  682a34           push 0x342a                              
  17a1  6a00             push 0                                   
  17a3  8b1e980e         mov bx, word ptr [0xe98]                 
  17a7  6bdb41           imul bx, bx, 0x41                        
  17aa  b8042c           mov ax, 0x2c04                           
  17ad  8ec0             mov es, ax                               
  17af  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  17b4  98               cwde                                     
  17b5  50               push ax                                  
  17b6  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  17bb  83c40c           add sp, 0xc                              
  17be  66ff36a40e       push dword ptr [0xea4]                   
  17c3  1e               push ds                                  
  17c4  682a34           push 0x342a                              
  17c7  6a00             push 0                                   
  17c9  8b1e980e         mov bx, word ptr [0xe98]                 
  17cd  6bdb41           imul bx, bx, 0x41                        
  17d0  b8042c           mov ax, 0x2c04                           
  17d3  8ec0             mov es, ax                               
  17d5  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  17da  98               cwde                                     
  17db  50               push ax                                  
  17dc  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  17e1  83c40c           add sp, 0xc                              
  17e4  666800000300     push 0x30000                             
  17ea  666802000f00     push 0xf0002                             
  17f0  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  17f5  83c408           add sp, 8                                
  17f8  8b1e980e         mov bx, word ptr [0xe98]                 
  17fc  6bdb41           imul bx, bx, 0x41                        
  17ff  b8042c           mov ax, 0x2c04                           
  1802  8ec0             mov es, ax                               
  1804  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  1809  69dbe000         imul bx, bx, 0xe0                        
  180d  8b36980e         mov si, word ptr [0xe98]                 
  1811  6bf641           imul si, si, 0x41                        
  1814  b8042c           mov ax, 0x2c04                           
  1817  8ec0             mov es, ax                               
  1819  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  181e  d1e0             shl ax, 1                                
  1820  03d8             add bx, ax                               
  1822  b81d1e           mov ax, 0x1e1d                           
  1825  8ec0             mov es, ax                               
  1827  268a9f0000       mov bl, byte ptr es:[bx]                 
  182c  81e3ff00         and bx, 0xff                             
  1830  b8042c           mov ax, 0x2c04                           
  1833  8ec0             mov es, ax                               
  1835  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  183b  7404             je 0x1841                                
  183d  33c0             xor ax, ax                               
  183f  eb11             jmp 0x1852                               
  1841  8b1e980e         mov bx, word ptr [0xe98]                 
  1845  6bdb41           imul bx, bx, 0x41                        
  1848  b8042c           mov ax, 0x2c04                           
  184b  8ec0             mov es, ax                               
  184d  268b87a715       mov ax, word ptr es:[bx + 0x15a7]        
  1852  50               push ax                                  
  1853  666a74           push 0x74                                
  1856  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  185b  83c404           add sp, 4                                
  185e  52               push dx                                  
  185f  50               push ax                                  
  1860  16               push ss                                  
  1861  8d4696           lea ax, [bp - 0x6a]                      
  1864  50               push ax                                  
  1865  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  186a  83c40a           add sp, 0xa                              
  186d  16               push ss                                  
  186e  8d4696           lea ax, [bp - 0x6a]                      
  1871  50               push ax                                  
  1872  66ff36a80e       push dword ptr [0xea8]                   
  1877  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  187c  83c408           add sp, 8                                
  187f  8b1e980e         mov bx, word ptr [0xe98]                 
  1883  6bdb41           imul bx, bx, 0x41                        
  1886  b8042c           mov ax, 0x2c04                           
  1889  8ec0             mov es, ax                               
  188b  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  1890  69dbe000         imul bx, bx, 0xe0                        
  1894  8b36980e         mov si, word ptr [0xe98]                 
  1898  6bf641           imul si, si, 0x41                        
  189b  b8042c           mov ax, 0x2c04                           
  189e  8ec0             mov es, ax                               
  18a0  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  18a5  d1e0             shl ax, 1                                
  18a7  03d8             add bx, ax                               
  18a9  b81d1e           mov ax, 0x1e1d                           
  18ac  8ec0             mov es, ax                               
  18ae  268a9f0000       mov bl, byte ptr es:[bx]                 
  18b3  81e3ff00         and bx, 0xff                             
  18b7  b8042c           mov ax, 0x2c04                           
  18ba  8ec0             mov es, ax                               
  18bc  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  18c2  7404             je 0x18c8                                
  18c4  33c0             xor ax, ax                               
  18c6  eb12             jmp 0x18da                               
  18c8  8b1e980e         mov bx, word ptr [0xe98]                 
  18cc  6bdb41           imul bx, bx, 0x41                        
  18cf  b8042c           mov ax, 0x2c04                           
  18d2  8ec0             mov es, ax                               
  18d4  268a879115       mov al, byte ptr es:[bx + 0x1591]        
  18d9  98               cwde                                     
  18da  50               push ax                                  
  18db  666874000100     push 0x10074                             
  18e1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  18e6  83c404           add sp, 4                                
  18e9  52               push dx                                  
  18ea  50               push ax                                  
  18eb  16               push ss                                  
  18ec  8d4696           lea ax, [bp - 0x6a]                      
  18ef  50               push ax                                  
  18f0  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  18f5  83c40a           add sp, 0xa                              
  18f8  16               push ss                                  
  18f9  8d4696           lea ax, [bp - 0x6a]                      
  18fc  50               push ax                                  
  18fd  66ff36ac0e       push dword ptr [0xeac]                   
  1902  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1907  83c408           add sp, 8                                
  190a  8b1e980e         mov bx, word ptr [0xe98]                 
  190e  6bdb41           imul bx, bx, 0x41                        
  1911  b8042c           mov ax, 0x2c04                           
  1914  8ec0             mov es, ax                               
  1916  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  191b  69dbe000         imul bx, bx, 0xe0                        
  191f  8b36980e         mov si, word ptr [0xe98]                 
  1923  6bf641           imul si, si, 0x41                        
  1926  b8042c           mov ax, 0x2c04                           
  1929  8ec0             mov es, ax                               
  192b  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  1930  d1e0             shl ax, 1                                
  1932  03d8             add bx, ax                               
  1934  b81d1e           mov ax, 0x1e1d                           
  1937  8ec0             mov es, ax                               
  1939  268a9f0000       mov bl, byte ptr es:[bx]                 
  193e  81e3ff00         and bx, 0xff                             
  1942  b8042c           mov ax, 0x2c04                           
  1945  8ec0             mov es, ax                               
  1947  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  194d  741d             je 0x196c                                
  194f  6a02             push 2                                   
  1951  6a74             push 0x74                                
  1953  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1958  83c404           add sp, 4                                
  195b  52               push dx                                  
  195c  50               push ax                                  
  195d  16               push ss                                  
  195e  8d4696           lea ax, [bp - 0x6a]                      
  1961  50               push ax                                  
  1962  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1967  83c408           add sp, 8                                
  196a  eb51             jmp 0x19bd                               
  196c  8b1e980e         mov bx, word ptr [0xe98]                 
  1970  6bdb41           imul bx, bx, 0x41                        
  1973  b8042c           mov ax, 0x2c04                           
  1976  8ec0             mov es, ax                               
  1978  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  197e  7504             jne 0x1984                               
  1980  6a03             push 3                                   
  1982  ebcd             jmp 0x1951                               
  1984  8b1e980e         mov bx, word ptr [0xe98]                 
  1988  6bdb41           imul bx, bx, 0x41                        
  198b  b8042c           mov ax, 0x2c04                           
  198e  8ec0             mov es, ax                               
  1990  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1995  98               cwde                                     
  1996  6bc014           imul ax, ax, 0x14                        
  1999  050000           add ax, 0                                
  199c  68042c           push 0x2c04                              
  199f  50               push ax                                  
  19a0  666874000400     push 0x40074                             
  19a6  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  19ab  83c404           add sp, 4                                
  19ae  52               push dx                                  
  19af  50               push ax                                  
  19b0  16               push ss                                  
  19b1  8d4696           lea ax, [bp - 0x6a]                      
  19b4  50               push ax                                  
  19b5  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  19ba  83c40c           add sp, 0xc                              
  19bd  16               push ss                                  
  19be  8d4696           lea ax, [bp - 0x6a]                      
  19c1  50               push ax                                  
  19c2  66ff36b00e       push dword ptr [0xeb0]                   
  19c7  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  19cc  83c408           add sp, 8                                
  19cf  666800000300     push 0x30000                             
  19d5  666802000f00     push 0xf0002                             
  19db  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  19e0  83c408           add sp, 8                                
  19e3  666a77           push 0x77                                
  19e6  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  19eb  83c404           add sp, 4                                
  19ee  52               push dx                                  
  19ef  50               push ax                                  
  19f0  66ff36a80f       push dword ptr [0xfa8]                   
  19f5  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  19fa  83c408           add sp, 8                                
  19fd  666877000100     push 0x10077                             
  1a03  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1a08  83c404           add sp, 4                                
  1a0b  52               push dx                                  
  1a0c  50               push ax                                  
  1a0d  66ff36ac0f       push dword ptr [0xfac]                   
  1a12  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1a17  83c408           add sp, 8                                
  1a1a  666a78           push 0x78                                
  1a1d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1a22  83c404           add sp, 4                                
  1a25  52               push dx                                  
  1a26  50               push ax                                  
  1a27  66ff36b00f       push dword ptr [0xfb0]                   
  1a2c  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1a31  83c408           add sp, 8                                
  1a34  666878000100     push 0x10078                             
  1a3a  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1a3f  83c404           add sp, 4                                
  1a42  52               push dx                                  
  1a43  50               push ax                                  
  1a44  66ff36b40f       push dword ptr [0xfb4]                   
  1a49  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1a4e  83c408           add sp, 8                                
  1a51  666a79           push 0x79                                
  1a54  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1a59  83c404           add sp, 4                                
  1a5c  52               push dx                                  
  1a5d  50               push ax                                  
  1a5e  66ff36b80f       push dword ptr [0xfb8]                   
  1a63  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1a68  83c408           add sp, 8                                
  1a6b  666879000100     push 0x10079                             
  1a71  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1a76  83c404           add sp, 4                                
  1a79  52               push dx                                  
  1a7a  50               push ax                                  
  1a7b  66ff36bc0f       push dword ptr [0xfbc]                   
  1a80  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1a85  83c408           add sp, 8                                
  1a88  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1a8d  5f               pop di                                   
  1a8e  5e               pop si                                   
  1a8f  c9               leave                                    
  1a90  cb               retf                                     
  1a91  27076917f80eb712 dw 0727,1769,0ef8,12b7,0cdf              jump table

ovl45_1a9b:  ; ENTRY
  1a9b  55               push bp                                  
  1a9c  8bec             mov bp, sp                               
  1a9e  8b1e920e         mov bx, word ptr [0xe92]                 
  1aa2  83fb04           cmp bx, 4                                
  1aa5  7747             ja 0x1aee                                
  1aa7  d1e3             shl bx, 1                                
  1aa9  2effa7f01a       jmp word ptr cs:[bx + 0x1af0]            
ovl45_1aae:  ; case
  1aae  666a00           push 0                                   
  1ab1  666801000100     push 0x10001                             
  1ab7  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  1abc  83c408           add sp, 8                                
  1abf  ff36980e         push word ptr [0xe98]                    
  1ac3  666a00           push 0                                   
  1ac6  9a2a00f230       lcall 0x30f2, 0x2a                       -> ovl63:0ed7
  1acb  83c406           add sp, 6                                
  1ace  666a00           push 0                                   
  1ad1  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  1ad6  83c404           add sp, 4                                
  1ad9  eb13             jmp 0x1aee                               
ovl45_1adb:  ; case
  1adb  ff36980e         push word ptr [0xe98]                    
  1adf  666a00           push 0                                   
  1ae2  9a3900f230       lcall 0x30f2, 0x39                       -> ovl63:05e4
  1ae7  ebe2             jmp 0x1acb                               
ovl45_1ae9:  ; case
  1ae9  9a3e005830       lcall 0x3058, 0x3e                       -> ovl44:08e4
  1aee  5d               pop bp                                   
  1aef  cb               retf                                     
  1af0  ae1aae1ae91ae91a dw 1aae,1aae,1ae9,1ae9,1adb              jump table

ovl45_1afa:  ; ENTRY
  1afa  55               push bp                                  
  1afb  8bec             mov bp, sp                               
  1afd  83ec04           sub sp, 4                                
  1b00  56               push si                                  
  1b01  57               push di                                  
  1b02  8b7e06           mov di, word ptr [bp + 6]                
  1b05  8b760a           mov si, word ptr [bp + 0xa]              
  1b08  16               push ss                                  
  1b09  8d46fc           lea ax, [bp - 4]                         
  1b0c  50               push ax                                  
  1b0d  9af40abf12       lcall 0x12bf, 0xaf4                      -> 12bf:0af4
  1b12  83c404           add sp, 4                                
  1b15  8b1e920e         mov bx, word ptr [0xe92]                 
  1b19  83fb04           cmp bx, 4                                
  1b1c  7603             jbe 0x1b21                               
  1b1e  e90601           jmp 0x1c27                               
  1b21  d1e3             shl bx, 1                                
  1b23  2effa72b1c       jmp word ptr cs:[bx + 0x1c2b]            
ovl45_1b28:  ; case
  1b28  83fe02           cmp si, 2                                
  1b2b  7544             jne 0x1b71                               
  1b2d  833e741100       cmp word ptr [0x1174], 0                 
  1b32  753d             jne 0x1b71                               
  1b34  6a00             push 0                                   
  1b36  66ff76fc         push dword ptr [bp - 4]                  
  1b3a  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  1b3f  83c406           add sp, 6                                
  1b42  66687a000100     push 0x1007a                             
  1b48  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1b4d  83c404           add sp, 4                                
  1b50  52               push dx                                  
  1b51  50               push ax                                  
  1b52  6a00             push 0                                   
  1b54  6a7a             push 0x7a                                
  1b56  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1b5b  83c404           add sp, 4                                
  1b5e  52               push dx                                  
  1b5f  50               push ax                                  
  1b60  9a34006c30       lcall 0x306c, 0x34                       -> ovl46:10e1
  1b65  83c408           add sp, 8                                
  1b68  c70674110100     mov word ptr [0x1174], 1                 
  1b6e  e9b600           jmp 0x1c27                               
  1b71  ff7608           push word ptr [bp + 8]                   
  1b74  57               push di                                  
  1b75  ff36920e         push word ptr [0xe92]                    
  1b79  0e               push cs                                  
  1b7a  e883e4           call 0                                   
  1b7d  e9a400           jmp 0x1c24                               
ovl45_1b80:  ; case
  1b80  83fe02           cmp si, 2                                
  1b83  75ec             jne 0x1b71                               
  1b85  833e741100       cmp word ptr [0x1174], 0                 
  1b8a  75e5             jne 0x1b71                               
  1b8c  6a00             push 0                                   
  1b8e  66ff76fc         push dword ptr [bp - 4]                  
  1b92  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  1b97  83c406           add sp, 6                                
  1b9a  66687a000300     push 0x3007a                             
  1ba0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1ba5  83c404           add sp, 4                                
  1ba8  52               push dx                                  
  1ba9  50               push ax                                  
  1baa  6a02             push 2                                   
  1bac  eba6             jmp 0x1b54                               
  1bae  ebc1             jmp 0x1b71                               
ovl45_1bb0:  ; case
  1bb0  83fe02           cmp si, 2                                
  1bb3  752a             jne 0x1bdf                               
  1bb5  833e741100       cmp word ptr [0x1174], 0                 
  1bba  7523             jne 0x1bdf                               
  1bbc  6a00             push 0                                   
  1bbe  66ff76fc         push dword ptr [bp - 4]                  
  1bc2  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  1bc7  83c406           add sp, 6                                
  1bca  66687a000500     push 0x5007a                             
  1bd0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1bd5  83c404           add sp, 4                                
  1bd8  52               push dx                                  
  1bd9  50               push ax                                  
  1bda  6a04             push 4                                   
  1bdc  e975ff           jmp 0x1b54                               
  1bdf  56               push si                                  
  1be0  ff7608           push word ptr [bp + 8]                   
  1be3  57               push di                                  
  1be4  9a39005830       lcall 0x3058, 0x39                       -> ovl44:028b
  1be9  eb39             jmp 0x1c24                               
ovl45_1beb:  ; case
  1beb  83fe02           cmp si, 2                                
  1bee  752a             jne 0x1c1a                               
  1bf0  833e741100       cmp word ptr [0x1174], 0                 
  1bf5  7523             jne 0x1c1a                               
  1bf7  6a00             push 0                                   
  1bf9  66ff76fc         push dword ptr [bp - 4]                  
  1bfd  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  1c02  83c406           add sp, 6                                
  1c05  66687a000700     push 0x7007a                             
  1c0b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1c10  83c404           add sp, 4                                
  1c13  52               push dx                                  
  1c14  50               push ax                                  
  1c15  6a06             push 6                                   
  1c17  e93aff           jmp 0x1b54                               
  1c1a  56               push si                                  
  1c1b  ff7608           push word ptr [bp + 8]                   
  1c1e  57               push di                                  
  1c1f  9a43005830       lcall 0x3058, 0x43                       -> ovl44:072e
  1c24  83c406           add sp, 6                                
  1c27  5f               pop di                                   
  1c28  5e               pop si                                   
  1c29  c9               leave                                    
  1c2a  cb               retf                                     
  1c2b  281b281bb01beb1b dw 1b28,1b28,1bb0,1beb,1b80              jump table

ovl45_1c35:  ; ENTRY
  1c35  55               push bp                                  
  1c36  8bec             mov bp, sp                               
  1c38  83ec02           sub sp, 2                                
  1c3b  56               push si                                  
  1c3c  57               push di                                  
  1c3d  8b7e06           mov di, word ptr [bp + 6]                
  1c40  833e741100       cmp word ptr [0x1174], 0                 
  1c45  7403             je 0x1c4a                                
  1c47  e99601           jmp 0x1de0                               
  1c4a  8bc7             mov ax, di                               
  1c4c  05ccfe           add ax, 0xfecc                           
  1c4f  bb3800           mov bx, 0x38                             
  1c52  99               cdq                                      
  1c53  f7fb             idiv bx                                  
  1c55  8bc8             mov cx, ax                               
  1c57  0bc9             or cx, cx                                
  1c59  7d02             jge 0x1c5d                               
  1c5b  33c9             xor cx, cx                               
  1c5d  83f904           cmp cx, 4                                
  1c60  7c03             jl 0x1c65                                
  1c62  b90400           mov cx, 4                                
  1c65  8b1e980e         mov bx, word ptr [0xe98]                 
  1c69  6bdb41           imul bx, bx, 0x41                        
  1c6c  b8042c           mov ax, 0x2c04                           
  1c6f  8ec0             mov es, ax                               
  1c71  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  1c76  69dbe000         imul bx, bx, 0xe0                        
  1c7a  8b36980e         mov si, word ptr [0xe98]                 
  1c7e  6bf641           imul si, si, 0x41                        
  1c81  b8042c           mov ax, 0x2c04                           
  1c84  8ec0             mov es, ax                               
  1c86  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  1c8b  d1e0             shl ax, 1                                
  1c8d  03d8             add bx, ax                               
  1c8f  b81d1e           mov ax, 0x1e1d                           
  1c92  8ec0             mov es, ax                               
  1c94  268a9f0000       mov bl, byte ptr es:[bx]                 
  1c99  81e3ff00         and bx, 0xff                             
  1c9d  b8042c           mov ax, 0x2c04                           
  1ca0  8ec0             mov es, ax                               
  1ca2  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1ca8  7403             je 0x1cad                                
  1caa  e90601           jmp 0x1db3                               
  1cad  b8042c           mov ax, 0x2c04                           
  1cb0  8ec0             mov es, ax                               
  1cb2  26833e320100     cmp word ptr es:[0x132], 0               
  1cb8  7421             je 0x1cdb                                
  1cba  8b1e980e         mov bx, word ptr [0xe98]                 
  1cbe  6bdb41           imul bx, bx, 0x41                        
  1cc1  b8042c           mov ax, 0x2c04                           
  1cc4  8ec0             mov es, ax                               
  1cc6  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1ccb  98               cwde                                     
  1ccc  ba042c           mov dx, 0x2c04                           
  1ccf  8ec2             mov es, dx                               
  1cd1  263b061001       cmp ax, word ptr es:[0x110]              
  1cd6  7403             je 0x1cdb                                
  1cd8  e9d800           jmp 0x1db3                               
  1cdb  8b1e980e         mov bx, word ptr [0xe98]                 
  1cdf  6bdb41           imul bx, bx, 0x41                        
  1ce2  03d9             add bx, cx                               
  1ce4  b8042c           mov ax, 0x2c04                           
  1ce7  8ec0             mov es, ax                               
  1ce9  2680bf931500     cmp byte ptr es:[bx + 0x1593], 0         
  1cef  7d03             jge 0x1cf4                               
  1cf1  e9ab00           jmp 0x1d9f                               
  1cf4  b8042c           mov ax, 0x2c04                           
  1cf7  8ec0             mov es, ax                               
  1cf9  26a11001         mov ax, word ptr es:[0x110]              
  1cfd  8946fe           mov word ptr [bp - 2], ax                
  1d00  8b1e980e         mov bx, word ptr [0xe98]                 
  1d04  6bdb41           imul bx, bx, 0x41                        
  1d07  b8042c           mov ax, 0x2c04                           
  1d0a  8ec0             mov es, ax                               
  1d0c  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1d11  98               cwde                                     
  1d12  ba042c           mov dx, 0x2c04                           
  1d15  8ec2             mov es, dx                               
  1d17  26a31001         mov word ptr es:[0x110], ax              
  1d1b  ff7608           push word ptr [bp + 8]                   
  1d1e  57               push di                                  
  1d1f  8b1e980e         mov bx, word ptr [0xe98]                 
  1d23  6bdb41           imul bx, bx, 0x41                        
  1d26  03d9             add bx, cx                               
  1d28  b8042c           mov ax, 0x2c04                           
  1d2b  8ec0             mov es, ax                               
  1d2d  268a879f15       mov al, byte ptr es:[bx + 0x159f]        
  1d32  98               cwde                                     
  1d33  50               push ax                                  
  1d34  8b1e980e         mov bx, word ptr [0xe98]                 
  1d38  6bdb41           imul bx, bx, 0x41                        
  1d3b  03d9             add bx, cx                               
  1d3d  b8042c           mov ax, 0x2c04                           
  1d40  8ec0             mov es, ax                               
  1d42  268a87a315       mov al, byte ptr es:[bx + 0x15a3]        
  1d47  98               cwde                                     
  1d48  50               push ax                                  
  1d49  8b1e980e         mov bx, word ptr [0xe98]                 
  1d4d  6bdb41           imul bx, bx, 0x41                        
  1d50  03d9             add bx, cx                               
  1d52  b8042c           mov ax, 0x2c04                           
  1d55  8ec0             mov es, ax                               
  1d57  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  1d5c  98               cwde                                     
  1d5d  50               push ax                                  
  1d5e  8b1e980e         mov bx, word ptr [0xe98]                 
  1d62  6bdb41           imul bx, bx, 0x41                        
  1d65  03d9             add bx, cx                               
  1d67  b8042c           mov ax, 0x2c04                           
  1d6a  8ec0             mov es, ax                               
  1d6c  268a879715       mov al, byte ptr es:[bx + 0x1597]        
  1d71  98               cwde                                     
  1d72  50               push ax                                  
  1d73  8b1e980e         mov bx, word ptr [0xe98]                 
  1d77  6bdb41           imul bx, bx, 0x41                        
  1d7a  03d9             add bx, cx                               
  1d7c  b8042c           mov ax, 0x2c04                           
  1d7f  8ec0             mov es, ax                               
  1d81  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  1d86  98               cwde                                     
  1d87  50               push ax                                  
  1d88  9a3e006c30       lcall 0x306c, 0x3e                       -> ovl46:032a
  1d8d  83c40e           add sp, 0xe                              
  1d90  b8042c           mov ax, 0x2c04                           
  1d93  8b56fe           mov dx, word ptr [bp - 2]                
  1d96  8ec0             mov es, ax                               
  1d98  2689161001       mov word ptr es:[0x110], dx              
  1d9d  eb3b             jmp 0x1dda                               
  1d9f  6a00             push 0                                   
  1da1  ff7608           push word ptr [bp + 8]                   
  1da4  57               push di                                  
  1da5  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  1daa  83c406           add sp, 6                                
  1dad  1e               push ds                                  
  1dae  68cc0f           push 0xfcc                                ; "Info about city production"
  1db1  eb12             jmp 0x1dc5                               
  1db3  6a00             push 0                                   
  1db5  ff7608           push word ptr [bp + 8]                   
  1db8  57               push di                                  
  1db9  9a2a006c30       lcall 0x306c, 0x2a                       -> ovl46:1201
  1dbe  83c406           add sp, 6                                
  1dc1  1e               push ds                                  
  1dc2  68e70f           push 0xfe7                                ; "A picture of the city!"
  1dc5  a1980e           mov ax, word ptr [0xe98]                 
  1dc8  6bc041           imul ax, ax, 0x41                        
  1dcb  058115           add ax, 0x1581                           
  1dce  68042c           push 0x2c04                              
  1dd1  50               push ax                                  
  1dd2  9a34006c30       lcall 0x306c, 0x34                       -> ovl46:10e1
  1dd7  83c408           add sp, 8                                
  1dda  c70674110100     mov word ptr [0x1174], 1                 
  1de0  5f               pop di                                   
  1de1  5e               pop si                                   
  1de2  c9               leave                                    
  1de3  cb               retf                                     

ovl45_1de4:  ; ENTRY
  1de4  55               push bp                                  
  1de5  8bec             mov bp, sp                               
  1de7  c706c00f0000     mov word ptr [0xfc0], 0                  
  1ded  c706c20f0000     mov word ptr [0xfc2], 0                  
  1df3  66ff368444       push dword ptr [0x4484]                  
  1df8  9a8e04280d       lcall 0xd28, 0x48e                       -> 0d28:048e
  1dfd  83c404           add sp, 4                                
  1e00  5d               pop bp                                   
  1e01  cb               retf                                     

ovl45_1e02:  ; ENTRY
  1e02  55               push bp                                  
  1e03  8bec             mov bp, sp                               
  1e05  83ec64           sub sp, 0x64                             
  1e08  56               push si                                  
  1e09  8b7606           mov si, word ptr [bp + 6]                
  1e0c  3936c00f         cmp word ptr [0xfc0], si                 
  1e10  7503             jne 0x1e15                               
  1e12  e9ee00           jmp 0x1f03                               
  1e15  833ec20f00       cmp word ptr [0xfc2], 0                  
  1e1a  7523             jne 0x1e3f                               
  1e1c  c706c20f0100     mov word ptr [0xfc2], 1                  
  1e22  66689d020000     push 0x29d                               
  1e28  6a00             push 0                                   
  1e2a  6668401f0000     push 0x1f40                              
  1e30  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  1e35  83c40a           add sp, 0xa                              
  1e38  89168644         mov word ptr [0x4486], dx                
  1e3c  a38444           mov word ptr [0x4484], ax                
  1e3f  66ff368444       push dword ptr [0x4484]                  
  1e44  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1e49  83c404           add sp, 4                                
  1e4c  89168244         mov word ptr [0x4482], dx                
  1e50  a38044           mov word ptr [0x4480], ax                
  1e53  8936c00f         mov word ptr [0xfc0], si                 
  1e57  1e               push ds                                  
  1e58  68a05d           push 0x5da0                              
  1e5b  1e               push ds                                  
  1e5c  68a05d           push 0x5da0                              
  1e5f  a1c00f           mov ax, word ptr [0xfc0]                 
  1e62  48               dec ax                                   
  1e63  50               push ax                                  
  1e64  6a16             push 0x16                                
  1e66  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  1e6b  83c404           add sp, 4                                
  1e6e  52               push dx                                  
  1e6f  50               push ax                                  
  1e70  16               push ss                                  
  1e71  8d46ce           lea ax, [bp - 0x32]                      
  1e74  50               push ax                                  
  1e75  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1e7a  83c410           add sp, 0x10                             
  1e7d  6a02             push 2                                   
  1e7f  16               push ss                                  
  1e80  8d46ce           lea ax, [bp - 0x32]                      
  1e83  50               push ax                                  
  1e84  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  1e89  83c406           add sp, 6                                
  1e8c  8bf0             mov si, ax                               
  1e8e  0bf6             or si, si                                
  1e90  7d2c             jge 0x1ebe                               
  1e92  16               push ss                                  
  1e93  8d46ce           lea ax, [bp - 0x32]                      
  1e96  50               push ax                                  
  1e97  666a01           push 1                                   
  1e9a  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  1e9f  83c404           add sp, 4                                
  1ea2  52               push dx                                  
  1ea3  50               push ax                                  
  1ea4  16               push ss                                  
  1ea5  8d469c           lea ax, [bp - 0x64]                      
  1ea8  50               push ax                                  
  1ea9  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1eae  83c40c           add sp, 0xc                              
  1eb1  16               push ss                                  
  1eb2  8d469c           lea ax, [bp - 0x64]                      
  1eb5  50               push ax                                  
  1eb6  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  1ebb  83c404           add sp, 4                                
  1ebe  68401f           push 0x1f40                              
  1ec1  66ff368044       push dword ptr [0x4480]                  
  1ec6  56               push si                                  
  1ec7  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  1ecc  83c408           add sp, 8                                
  1ecf  56               push si                                  
  1ed0  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  1ed5  59               pop cx                                   
  1ed6  33c0             xor ax, ax                               
  1ed8  eb17             jmp 0x1ef1                               
  1eda  c41e8044         les bx, ptr [0x4480]                     
  1ede  03d8             add bx, ax                               
  1ee0  26803f7c         cmp byte ptr es:[bx], 0x7c               
  1ee4  750a             jne 0x1ef0                               
  1ee6  8b1e8044         mov bx, word ptr [0x4480]                
  1eea  03d8             add bx, ax                               
  1eec  26c60700         mov byte ptr es:[bx], 0                  
  1ef0  40               inc ax                                   
  1ef1  3d401f           cmp ax, 0x1f40                           
  1ef4  7ce4             jl 0x1eda                                
  1ef6  66ff368444       push dword ptr [0x4484]                  
  1efb  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  1f00  83c404           add sp, 4                                
  1f03  5e               pop si                                   
  1f04  c9               leave                                    
  1f05  cb               retf                                     

ovl45_1f06:  ; ENTRY
  1f06  55               push bp                                  
  1f07  8bec             mov bp, sp                               
  1f09  83ec0a           sub sp, 0xa                              
  1f0c  56               push si                                  
  1f0d  57               push di                                  
  1f0e  ff7606           push word ptr [bp + 6]                   
  1f11  0e               push cs                                  
  1f12  e8edfe           call 0x1e02                              
  1f15  59               pop cx                                   
  1f16  66ff368444       push dword ptr [0x4484]                  
  1f1b  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  1f20  83c404           add sp, 4                                
  1f23  89168244         mov word ptr [0x4482], dx                
  1f27  a38044           mov word ptr [0x4480], ax                
  1f2a  33ff             xor di, di                               
  1f2c  ff7608           push word ptr [bp + 8]                   
  1f2f  1e               push ds                                  
  1f30  68fe0f           push 0xffe                                ; "%03d"
  1f33  16               push ss                                  
  1f34  8d46f6           lea ax, [bp - 0xa]                       
  1f37  50               push ax                                  
  1f38  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1f3d  83c40a           add sp, 0xa                              
  1f40  33f6             xor si, si                               
  1f42  e9b400           jmp 0x1ff9                               
  1f45  c41e8044         les bx, ptr [0x4480]                     
  1f49  03de             add bx, si                               
  1f4b  26803f23         cmp byte ptr es:[bx], 0x23               
  1f4f  7403             je 0x1f54                                
  1f51  e9a400           jmp 0x1ff8                               
  1f54  16               push ss                                  
  1f55  8d46f6           lea ax, [bp - 0xa]                       
  1f58  50               push ax                                  
  1f59  8bc6             mov ax, si                               
  1f5b  03068044         add ax, word ptr [0x4480]                
  1f5f  40               inc ax                                   
  1f60  ff368244         push word ptr [0x4482]                   
  1f64  50               push ax                                  
  1f65  9a404a0000       lcall 0, 0x4a40                          -> 0000:4a40
  1f6a  83c408           add sp, 8                                
  1f6d  0bc0             or ax, ax                                
  1f6f  7403             je 0x1f74                                
  1f71  e98400           jmp 0x1ff8                               
  1f74  eb7a             jmp 0x1ff0                               
  1f76  c41e8044         les bx, ptr [0x4480]                     
  1f7a  03de             add bx, si                               
  1f7c  26803f00         cmp byte ptr es:[bx], 0                  
  1f80  751f             jne 0x1fa1                               
  1f82  0bff             or di, di                                
  1f84  751b             jne 0x1fa1                               
  1f86  8bc6             mov ax, si                               
  1f88  03068044         add ax, word ptr [0x4480]                
  1f8c  40               inc ax                                   
  1f8d  ff368244         push word ptr [0x4482]                   
  1f91  50               push ax                                  
  1f92  66ff760a         push dword ptr [bp + 0xa]                
  1f96  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1f9b  83c408           add sp, 8                                
  1f9e  47               inc di                                   
  1f9f  eb4e             jmp 0x1fef                               
  1fa1  c41e8044         les bx, ptr [0x4480]                     
  1fa5  03de             add bx, si                               
  1fa7  26803f00         cmp byte ptr es:[bx], 0                  
  1fab  7517             jne 0x1fc4                               
  1fad  83ff01           cmp di, 1                                
  1fb0  7512             jne 0x1fc4                               
  1fb2  8bc6             mov ax, si                               
  1fb4  03068044         add ax, word ptr [0x4480]                
  1fb8  40               inc ax                                   
  1fb9  ff368244         push word ptr [0x4482]                   
  1fbd  50               push ax                                  
  1fbe  66ff760e         push dword ptr [bp + 0xe]                
  1fc2  ebd2             jmp 0x1f96                               
  1fc4  c41e8044         les bx, ptr [0x4480]                     
  1fc8  03de             add bx, si                               
  1fca  26803f00         cmp byte ptr es:[bx], 0                  
  1fce  751f             jne 0x1fef                               
  1fd0  83ff02           cmp di, 2                                
  1fd3  751a             jne 0x1fef                               
  1fd5  8bc6             mov ax, si                               
  1fd7  03068044         add ax, word ptr [0x4480]                
  1fdb  40               inc ax                                   
  1fdc  ff368244         push word ptr [0x4482]                   
  1fe0  50               push ax                                  
  1fe1  66ff7612         push dword ptr [bp + 0x12]               
  1fe5  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1fea  83c408           add sp, 8                                
  1fed  eb13             jmp 0x2002                               
  1fef  46               inc si                                   
  1ff0  81fe401f         cmp si, 0x1f40                           
  1ff4  7c80             jl 0x1f76                                
  1ff6  eb0a             jmp 0x2002                               
  1ff8  46               inc si                                   
  1ff9  81fe401f         cmp si, 0x1f40                           
  1ffd  7d03             jge 0x2002                               
  1fff  e943ff           jmp 0x1f45                               
  2002  66ff368444       push dword ptr [0x4484]                  
  2007  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  200c  83c404           add sp, 4                                
  200f  5f               pop di                                   
  2010  5e               pop si                                   
  2011  c9               leave                                    
  2012  cb               retf                                     

ovl45_2013:  ; ENTRY
  2013  55               push bp                                  
  2014  8bec             mov bp, sp                               
  2016  66680f008000     push 0x80000f                            
  201c  6a01             push 1                                   
  201e  686430           push 0x3064                              
  2021  687500           push 0x75                                
  2024  686430           push 0x3064                              
  2027  687000           push 0x70                                
  202a  a1980e           mov ax, word ptr [0xe98]                 
  202d  6bc041           imul ax, ax, 0x41                        
  2030  058115           add ax, 0x1581                           
  2033  68042c           push 0x2c04                              
  2036  50               push ax                                  
  2037  1e               push ds                                  
  2038  682510           push 0x1025                               ; "this city"
  203b  1e               push ds                                  
  203c  680f10           push 0x100f                               ; "Type the new name for"
  203f  1e               push ds                                  
  2040  680310           push 0x1003                               ; "Rename City"
  2043  9a2000a530       lcall 0x30a5, 0x20                       -> ovl56:0000
  2048  83c41e           add sp, 0x1e                             
  204b  5d               pop bp                                   
  204c  cb               retf                                     

ovl45_204d:  ; ENTRY
  204d  55               push bp                                  
  204e  8bec             mov bp, sp                               
  2050  66ff7606         push dword ptr [bp + 6]                  
  2054  a1980e           mov ax, word ptr [0xe98]                 
  2057  6bc041           imul ax, ax, 0x41                        
  205a  058115           add ax, 0x1581                           
  205d  68042c           push 0x2c04                              
  2060  50               push ax                                  
  2061  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  2066  83c408           add sp, 8                                
  2069  0e               push cs                                  
  206a  e826e3           call 0x393                               
  206d  5d               pop bp                                   
  206e  cb               retf                                     

ovl45_206f:  ; ENTRY
  206f  55               push bp                                  
  2070  8bec             mov bp, sp                               
  2072  0e               push cs                                  
  2073  e81de3           call 0x393                               
  2076  5d               pop bp                                   
  2077  cb               retf                                     
