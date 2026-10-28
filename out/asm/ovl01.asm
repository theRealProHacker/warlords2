; ovl01 stub 2f5b file_off 0x3b900 size 0x2751

ovl01_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec52           sub sp, 0x52                             
  0006  6a05             push 5                                   
  0008  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  000d  59               pop cx                                   
  000e  c41e625e         les bx, ptr [0x5e62]                     
  0012  26ff7702         push word ptr es:[bx + 2]                
  0016  26ff37           push word ptr es:[bx]                    
  0019  9a3e00e830       lcall 0x30e8, 0x3e                       -> ovl62:04b5
  001e  83c404           add sp, 4                                
  0021  8946fe           mov word ptr [bp - 2], ax                
  0024  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0029  6a09             push 9                                   
  002b  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0030  59               pop cx                                   
  0031  666806000100     push 0x10006                             
  0037  666802000700     push 0x70002                             
  003d  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0042  83c408           add sp, 8                                
  0045  8b46fe           mov ax, word ptr [bp - 2]                
  0048  6bc01f           imul ax, ax, 0x1f                        
  004b  051508           add ax, 0x815                            
  004e  68042c           push 0x2c04                              
  0051  50               push ax                                  
  0052  666a13           push 0x13                                
  0055  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  005a  83c404           add sp, 4                                
  005d  52               push dx                                  
  005e  50               push ax                                  
  005f  16               push ss                                  
  0060  8d46ae           lea ax, [bp - 0x52]                      
  0063  50               push ax                                  
  0064  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0069  83c40c           add sp, 0xc                              
  006c  16               push ss                                  
  006d  8d46ae           lea ax, [bp - 0x52]                      
  0070  50               push ax                                  
  0071  666840010e01     push 0x10e0140                           
  0077  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  007c  83c408           add sp, 8                                
  007f  666813000100     push 0x10013                             
  0085  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  008a  83c404           add sp, 4                                
  008d  52               push dx                                  
  008e  50               push ax                                  
  008f  666840012201     push 0x1220140                           
  0095  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  009a  83c408           add sp, 8                                
  009d  666813000200     push 0x20013                             
  00a3  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  00a8  83c404           add sp, 4                                
  00ab  52               push dx                                  
  00ac  50               push ax                                  
  00ad  666840013601     push 0x1360140                           
  00b3  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  00b8  83c408           add sp, 8                                
  00bb  6a0f             push 0xf                                 
  00bd  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  00c2  59               pop cx                                   
  00c3  c7066a160100     mov word ptr [0x166a], 1                 
  00c9  666848010100     push 0x10148                             
  00cf  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  00d4  83c404           add sp, 4                                
  00d7  b8042c           mov ax, 0x2c04                           
  00da  8ec0             mov es, ax                               
  00dc  26833e1e0100     cmp word ptr es:[0x11e], 0               
  00e2  7423             je 0x107                                 
  00e4  8ec0             mov es, ax                               
  00e6  268b1e1001       mov bx, word ptr es:[0x110]              
  00eb  6bdb0c           imul bx, bx, 0xc                         
  00ee  b8042c           mov ax, 0x2c04                           
  00f1  8ec0             mov es, ax                               
  00f3  2683bf031100     cmp word ptr es:[bx + 0x1103], 0         
  00f9  750c             jne 0x107                                
  00fb  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  0101  7404             je 0x107                                 
  0103  6a01             push 1                                   
  0105  eb02             jmp 0x109                                
  0107  6a02             push 2                                   
  0109  684901           push 0x149                               
  010c  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0111  83c404           add sp, 4                                
  0114  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0119  c9               leave                                    
  011a  cb               retf                                     

ovl01_011b:  ; ENTRY
  011b  55               push bp                                  
  011c  8bec             mov bp, sp                               
  011e  6a00             push 0                                   
  0120  90               nop                                      
  0121  0e               push cs                                  
  0122  e8550c           call 0xd7a                               
  0125  59               pop cx                                   
  0126  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  012b  90               nop                                      
  012c  0e               push cs                                  
  012d  e83700           call 0x167                               
  0130  5d               pop bp                                   
  0131  cb               retf                                     

ovl01_0132:  ; ENTRY
  0132  55               push bp                                  
  0133  8bec             mov bp, sp                               
  0135  83ec02           sub sp, 2                                
  0138  c41e625e         les bx, ptr [0x5e62]                     
  013c  26ff7702         push word ptr es:[bx + 2]                
  0140  26ff37           push word ptr es:[bx]                    
  0143  9a3e00e830       lcall 0x30e8, 0x3e                       -> ovl62:04b5
  0148  83c404           add sp, 4                                
  014b  8946fe           mov word ptr [bp - 2], ax                
  014e  50               push ax                                  
  014f  9a2f001430       lcall 0x3014, 0x2f                       -> ovl34:08a1
  0154  59               pop cx                                   
  0155  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  015a  666a00           push 0                                   
  015d  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  0162  83c404           add sp, 4                                
  0165  c9               leave                                    
  0166  cb               retf                                     

ovl01_0167:  ; ENTRY
  0167  55               push bp                                  
  0168  8bec             mov bp, sp                               
  016a  56               push si                                  
  016b  be0100           mov si, 1                                
  016e  b8042c           mov ax, 0x2c04                           
  0171  8ec0             mov es, ax                               
  0173  268b1e1001       mov bx, word ptr es:[0x110]              
  0178  6bdb0c           imul bx, bx, 0xc                         
  017b  b8042c           mov ax, 0x2c04                           
  017e  8ec0             mov es, ax                               
  0180  2683bf031100     cmp word ptr es:[bx + 0x1103], 0         
  0186  7502             jne 0x18a                                
  0188  33f6             xor si, si                               
  018a  b8042c           mov ax, 0x2c04                           
  018d  8ec0             mov es, ax                               
  018f  268b1e1001       mov bx, word ptr es:[0x110]              
  0194  6bdb0c           imul bx, bx, 0xc                         
  0197  b8042c           mov ax, 0x2c04                           
  019a  8ec0             mov es, ax                               
  019c  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  01a1  6bdb16           imul bx, bx, 0x16                        
  01a4  b81d1e           mov ax, 0x1e1d                           
  01a7  8ec0             mov es, ax                               
  01a9  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  01af  7c4e             jl 0x1ff                                 
  01b1  b8042c           mov ax, 0x2c04                           
  01b4  8ec0             mov es, ax                               
  01b6  268b1e1001       mov bx, word ptr es:[0x110]              
  01bb  6bdb0c           imul bx, bx, 0xc                         
  01be  b8042c           mov ax, 0x2c04                           
  01c1  8ec0             mov es, ax                               
  01c3  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  01c8  6bdb16           imul bx, bx, 0x16                        
  01cb  b81d1e           mov ax, 0x1e1d                           
  01ce  8ec0             mov es, ax                               
  01d0  2683bf828800     cmp word ptr es:[bx - 0x777e], 0         
  01d6  7c27             jl 0x1ff                                 
  01d8  b8042c           mov ax, 0x2c04                           
  01db  8ec0             mov es, ax                               
  01dd  268b1e1001       mov bx, word ptr es:[0x110]              
  01e2  6bdb0c           imul bx, bx, 0xc                         
  01e5  b8042c           mov ax, 0x2c04                           
  01e8  8ec0             mov es, ax                               
  01ea  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  01ef  6bdb16           imul bx, bx, 0x16                        
  01f2  b81d1e           mov ax, 0x1e1d                           
  01f5  8ec0             mov es, ax                               
  01f7  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  01fd  7402             je 0x201                                 
  01ff  33f6             xor si, si                               
  0201  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0206  6a02             push 2                                   
  0208  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  020d  59               pop cx                                   
  020e  0bf6             or si, si                                
  0210  741e             je 0x230                                 
  0212  66ff369c00       push dword ptr [0x9c]                    
  0217  b89400           mov ax, 0x94                             
  021a  8cda             mov dx, ds                               
  021c  b90800           mov cx, 8                                
  021f  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0224  6a2d             push 0x2d                                
  0226  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  022b  83c40e           add sp, 0xe                              
  022e  eb32             jmp 0x262                                
  0230  666800000300     push 0x30000                             
  0236  666802000f00     push 0xf0002                             
  023c  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0241  83c408           add sp, 8                                
  0244  66681400ffff     push 0xffff0014                          
  024a  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  024f  83c404           add sp, 4                                
  0252  52               push dx                                  
  0253  50               push ax                                  
  0254  6668b0018600     push 0x8601b0                            
  025a  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  025f  83c408           add sp, 8                                
  0262  666800000300     push 0x30000                             
  0268  666801000f00     push 0xf0001                             
  026e  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0273  83c408           add sp, 8                                
  0276  1e               push ds                                  
  0277  68b400           push 0xb4                                 ; "Quest"
  027a  6668b0013e00     push 0x3e01b0                            
  0280  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0285  83c408           add sp, 8                                
  0288  6a10             push 0x10                                
  028a  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  028f  59               pop cx                                   
  0290  c7066a160100     mov word ptr [0x166a], 1                 
  0296  66684a010100     push 0x1014a                             
  029c  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  02a1  83c404           add sp, 4                                
  02a4  666a00           push 0                                   
  02a7  666a00           push 0                                   
  02aa  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  02af  83c408           add sp, 8                                
  02b2  0bf6             or si, si                                
  02b4  7462             je 0x318                                 
  02b6  90               nop                                      
  02b7  0e               push cs                                  
  02b8  e86500           call 0x320                               
  02bb  6a01             push 1                                   
  02bd  b8042c           mov ax, 0x2c04                           
  02c0  8ec0             mov es, ax                               
  02c2  268b1e1001       mov bx, word ptr es:[0x110]              
  02c7  6bdb0c           imul bx, bx, 0xc                         
  02ca  b8042c           mov ax, 0x2c04                           
  02cd  8ec0             mov es, ax                               
  02cf  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  02d4  6bdb16           imul bx, bx, 0x16                        
  02d7  b81d1e           mov ax, 0x1e1d                           
  02da  8ec0             mov es, ax                               
  02dc  26ffb78288       push word ptr es:[bx - 0x777e]           
  02e1  b8042c           mov ax, 0x2c04                           
  02e4  8ec0             mov es, ax                               
  02e6  268b1e1001       mov bx, word ptr es:[0x110]              
  02eb  6bdb0c           imul bx, bx, 0xc                         
  02ee  b8042c           mov ax, 0x2c04                           
  02f1  8ec0             mov es, ax                               
  02f3  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  02f8  6bdb16           imul bx, bx, 0x16                        
  02fb  b81d1e           mov ax, 0x1e1d                           
  02fe  8ec0             mov es, ax                               
  0300  26ffb78088       push word ptr es:[bx - 0x7780]           
  0305  9a4300f230       lcall 0x30f2, 0x43                       -> ovl63:1f5f
  030a  83c406           add sp, 6                                
  030d  666a00           push 0                                   
  0310  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  0315  83c404           add sp, 4                                
  0318  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  031d  5e               pop si                                   
  031e  5d               pop bp                                   
  031f  cb               retf                                     

ovl01_0320:  ; ENTRY
  0320  55               push bp                                  
  0321  8bec             mov bp, sp                               
  0323  83ec62           sub sp, 0x62                             
  0326  56               push si                                  
  0327  57               push di                                  
  0328  bfb801           mov di, 0x1b8                            
  032b  be9100           mov si, 0x91                             
  032e  c746fa0100       mov word ptr [bp - 6], 1                 
  0333  666807000100     push 0x10007                             
  0339  666a02           push 2                                   
  033c  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0341  83c408           add sp, 8                                
  0344  8d46ee           lea ax, [bp - 0x12]                      
  0347  16               push ss                                  
  0348  50               push ax                                  
  0349  b8042c           mov ax, 0x2c04                           
  034c  8ec0             mov es, ax                               
  034e  26a11001         mov ax, word ptr es:[0x110]              
  0352  6bc00c           imul ax, ax, 0xc                         
  0355  050311           add ax, 0x1103                           
  0358  68042c           push 0x2c04                              
  035b  50               push ax                                  
  035c  b90c00           mov cx, 0xc                              
  035f  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0364  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0367  6bdb16           imul bx, bx, 0x16                        
  036a  b81d1e           mov ax, 0x1e1d                           
  036d  8ec0             mov es, ax                               
  036f  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  0374  98               cwde                                     
  0375  6bc014           imul ax, ax, 0x14                        
  0378  052302           add ax, 0x223                            
  037b  68042c           push 0x2c04                              
  037e  50               push ax                                  
  037f  1e               push ds                                  
  0380  68ba00           push 0xba                                 ; "%s's Quest"
  0383  16               push ss                                  
  0384  8d469e           lea ax, [bp - 0x62]                      
  0387  50               push ax                                  
  0388  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  038d  83c40c           add sp, 0xc                              
  0390  16               push ss                                  
  0391  8d469e           lea ax, [bp - 0x62]                      
  0394  50               push ax                                  
  0395  56               push si                                  
  0396  57               push di                                  
  0397  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  039c  83c408           add sp, 8                                
  039f  83c61e           add si, 0x1e                             
  03a2  6a00             push 0                                   
  03a4  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  03a9  59               pop cx                                   
  03aa  6668a500a000     push 0xa000a5                            
  03b0  686801           push 0x168                               
  03b3  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  03b8  83c406           add sp, 6                                
  03bb  8b5ef0           mov bx, word ptr [bp - 0x10]             
  03be  83fb06           cmp bx, 6                                
  03c1  7603             jbe 0x3c6                                
  03c3  e98d09           jmp 0xd53                                
  03c6  d1e3             shl bx, 1                                
  03c8  2effa7570d       jmp word ptr cs:[bx + 0xd57]             
ovl01_03cd:  ; case
  03cd  666a15           push 0x15                                
  03d0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03d5  83c404           add sp, 4                                
  03d8  52               push dx                                  
  03d9  50               push ax                                  
  03da  56               push si                                  
  03db  57               push di                                  
  03dc  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  03e1  83c408           add sp, 8                                
  03e4  83c614           add si, 0x14                             
  03e7  666815000100     push 0x10015                             
  03ed  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03f2  83c404           add sp, 4                                
  03f5  52               push dx                                  
  03f6  50               push ax                                  
  03f7  56               push si                                  
  03f8  57               push di                                  
  03f9  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  03fe  83c408           add sp, 8                                
  0401  83c614           add si, 0x14                             
  0404  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0407  6bdb16           imul bx, bx, 0x16                        
  040a  b81d1e           mov ax, 0x1e1d                           
  040d  8ec0             mov es, ax                               
  040f  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0414  98               cwde                                     
  0415  6bc014           imul ax, ax, 0x14                        
  0418  050000           add ax, 0                                
  041b  68042c           push 0x2c04                              
  041e  50               push ax                                  
  041f  666815000200     push 0x20015                             
  0425  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  042a  83c404           add sp, 4                                
  042d  52               push dx                                  
  042e  50               push ax                                  
  042f  16               push ss                                  
  0430  8d469e           lea ax, [bp - 0x62]                      
  0433  50               push ax                                  
  0434  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0439  83c40c           add sp, 0xc                              
  043c  16               push ss                                  
  043d  8d469e           lea ax, [bp - 0x62]                      
  0440  50               push ax                                  
  0441  56               push si                                  
  0442  57               push di                                  
  0443  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0448  83c408           add sp, 8                                
  044b  83c614           add si, 0x14                             
  044e  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0451  6bdb16           imul bx, bx, 0x16                        
  0454  b81d1e           mov ax, 0x1e1d                           
  0457  8ec0             mov es, ax                               
  0459  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  045e  98               cwde                                     
  045f  6bc014           imul ax, ax, 0x14                        
  0462  052302           add ax, 0x223                            
  0465  68042c           push 0x2c04                              
  0468  50               push ax                                  
  0469  56               push si                                  
  046a  57               push di                                  
  046b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0470  83c408           add sp, 8                                
  0473  83c61e           add si, 0x1e                             
  0476  666815000300     push 0x30015                             
  047c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0481  83c404           add sp, 4                                
  0484  52               push dx                                  
  0485  50               push ax                                  
  0486  56               push si                                  
  0487  57               push di                                  
  0488  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  048d  83c408           add sp, 8                                
  0490  83c614           add si, 0x14                             
  0493  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0496  6bdb16           imul bx, bx, 0x16                        
  0499  b81d1e           mov ax, 0x1e1d                           
  049c  8ec0             mov es, ax                               
  049e  26ffb78288       push word ptr es:[bx - 0x777e]           
  04a3  8b5ef4           mov bx, word ptr [bp - 0xc]              
  04a6  6bdb16           imul bx, bx, 0x16                        
  04a9  b81d1e           mov ax, 0x1e1d                           
  04ac  ba0000           mov dx, 0                                
  04af  81c28088         add dx, 0x8880                           
  04b3  03da             add bx, dx                               
  04b5  8ec0             mov es, ax                               
  04b7  26ff37           push word ptr es:[bx]                    
  04ba  8b5ef2           mov bx, word ptr [bp - 0xe]              
  04bd  6bdb16           imul bx, bx, 0x16                        
  04c0  b81d1e           mov ax, 0x1e1d                           
  04c3  8ec0             mov es, ax                               
  04c5  26ffb78288       push word ptr es:[bx - 0x777e]           
  04ca  8b5ef2           mov bx, word ptr [bp - 0xe]              
  04cd  6bdb16           imul bx, bx, 0x16                        
  04d0  b81d1e           mov ax, 0x1e1d                           
  04d3  ba0000           mov dx, 0                                
  04d6  81c28088         add dx, 0x8880                           
  04da  03da             add bx, dx                               
  04dc  8ec0             mov es, ax                               
  04de  26ff37           push word ptr es:[bx]                    
  04e1  9a2000e830       lcall 0x30e8, 0x20                       -> ovl62:0b51
  04e6  83c408           add sp, 8                                
  04e9  8bd0             mov dx, ax                               
  04eb  8bda             mov bx, dx                               
  04ed  c1e302           shl bx, 2                                
  04f0  66ffb77c2b       push dword ptr [bx + 0x2b7c]             
  04f5  56               push si                                  
  04f6  57               push di                                  
  04f7  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  04fc  83c408           add sp, 8                                
  04ff  6a08             push 8                                   
  0501  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0504  6bdb16           imul bx, bx, 0x16                        
  0507  b81d1e           mov ax, 0x1e1d                           
  050a  8ec0             mov es, ax                               
  050c  26ffb78288       push word ptr es:[bx - 0x777e]           
  0511  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0514  6bdb16           imul bx, bx, 0x16                        
  0517  b81d1e           mov ax, 0x1e1d                           
  051a  8ec0             mov es, ax                               
  051c  26ffb78088       push word ptr es:[bx - 0x7780]           
  0521  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0524  6bdb16           imul bx, bx, 0x16                        
  0527  b81d1e           mov ax, 0x1e1d                           
  052a  8ec0             mov es, ax                               
  052c  26ffb78288       push word ptr es:[bx - 0x777e]           
  0531  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0534  6bdb16           imul bx, bx, 0x16                        
  0537  b81d1e           mov ax, 0x1e1d                           
  053a  8ec0             mov es, ax                               
  053c  26ffb78088       push word ptr es:[bx - 0x7780]           
  0541  9a7f00e830       lcall 0x30e8, 0x7f                       -> ovl62:0a3f
  0546  83c40a           add sp, 0xa                              
  0549  6a08             push 8                                   
  054b  8b46f4           mov ax, word ptr [bp - 0xc]              
  054e  6bc016           imul ax, ax, 0x16                        
  0551  ba0000           mov dx, 0                                
  0554  03d0             add dx, ax                               
  0556  81c28088         add dx, 0x8880                           
  055a  681d1e           push 0x1e1d                              
  055d  52               push dx                                  
  055e  9a6b00e830       lcall 0x30e8, 0x6b                       -> ovl62:0899
  0563  83c406           add sp, 6                                
  0566  6a08             push 8                                   
  0568  8b46f4           mov ax, word ptr [bp - 0xc]              
  056b  6bc016           imul ax, ax, 0x16                        
  056e  ba0000           mov dx, 0                                
  0571  03d0             add dx, ax                               
  0573  81c28088         add dx, 0x8880                           
  0577  681d1e           push 0x1e1d                              
  057a  52               push dx                                  
  057b  9a7000e830       lcall 0x30e8, 0x70                       -> ovl62:08b3
  0580  83c406           add sp, 6                                
  0583  666a00           push 0                                   
  0586  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  058b  83c404           add sp, 4                                
  058e  e9c207           jmp 0xd53                                
ovl01_0591:  ; case
  0591  666a16           push 0x16                                
  0594  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0599  83c404           add sp, 4                                
  059c  52               push dx                                  
  059d  50               push ax                                  
  059e  56               push si                                  
  059f  57               push di                                  
  05a0  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  05a5  83c408           add sp, 8                                
  05a8  83c614           add si, 0x14                             
  05ab  666816000100     push 0x10016                             
  05b1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  05b6  83c404           add sp, 4                                
  05b9  52               push dx                                  
  05ba  50               push ax                                  
  05bb  56               push si                                  
  05bc  57               push di                                  
  05bd  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  05c2  83c408           add sp, 8                                
  05c5  83c614           add si, 0x14                             
  05c8  8b46f4           mov ax, word ptr [bp - 0xc]              
  05cb  6bc01d           imul ax, ax, 0x1d                        
  05ce  05e90c           add ax, 0xce9                            
  05d1  68042c           push 0x2c04                              
  05d4  50               push ax                                  
  05d5  56               push si                                  
  05d6  57               push di                                  
  05d7  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  05dc  83c408           add sp, 8                                
  05df  83c61e           add si, 0x1e                             
  05e2  666816000200     push 0x20016                             
  05e8  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  05ed  83c404           add sp, 4                                
  05f0  52               push dx                                  
  05f1  50               push ax                                  
  05f2  56               push si                                  
  05f3  57               push di                                  
  05f4  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  05f9  83c408           add sp, 8                                
  05fc  83c614           add si, 0x14                             
  05ff  16               push ss                                  
  0600  8d46fc           lea ax, [bp - 4]                         
  0603  50               push ax                                  
  0604  16               push ss                                  
  0605  8d46fe           lea ax, [bp - 2]                         
  0608  50               push ax                                  
  0609  ff76f4           push word ptr [bp - 0xc]                 
  060c  9a3e001d30       lcall 0x301d, 0x3e                       -> ovl35:0b36
  0611  83c40a           add sp, 0xa                              
  0614  ff76fc           push word ptr [bp - 4]                   
  0617  ff76fe           push word ptr [bp - 2]                   
  061a  8b5ef2           mov bx, word ptr [bp - 0xe]              
  061d  6bdb16           imul bx, bx, 0x16                        
  0620  b81d1e           mov ax, 0x1e1d                           
  0623  8ec0             mov es, ax                               
  0625  26ffb78288       push word ptr es:[bx - 0x777e]           
  062a  8b5ef2           mov bx, word ptr [bp - 0xe]              
  062d  6bdb16           imul bx, bx, 0x16                        
  0630  b81d1e           mov ax, 0x1e1d                           
  0633  ba0000           mov dx, 0                                
  0636  81c28088         add dx, 0x8880                           
  063a  03da             add bx, dx                               
  063c  8ec0             mov es, ax                               
  063e  26ff37           push word ptr es:[bx]                    
  0641  9a2000e830       lcall 0x30e8, 0x20                       -> ovl62:0b51
  0646  83c408           add sp, 8                                
  0649  8bd0             mov dx, ax                               
  064b  8bda             mov bx, dx                               
  064d  c1e302           shl bx, 2                                
  0650  66ffb77c2b       push dword ptr [bx + 0x2b7c]             
  0655  56               push si                                  
  0656  57               push di                                  
  0657  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  065c  83c408           add sp, 8                                
  065f  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0662  6bdb1d           imul bx, bx, 0x1d                        
  0665  b8042c           mov ax, 0x2c04                           
  0668  8ec0             mov es, ax                               
  066a  268a87ff0c       mov al, byte ptr es:[bx + 0xcff]         
  066f  98               cwde                                     
  0670  3d0100           cmp ax, 1                                
  0673  7439             je 0x6ae                                 
  0675  3d0200           cmp ax, 2                                
  0678  7408             je 0x682                                 
  067a  3d0300           cmp ax, 3                                
  067d  742f             je 0x6ae                                 
  067f  e9d106           jmp 0xd53                                
  0682  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0685  6bdb1d           imul bx, bx, 0x1d                        
  0688  b8042c           mov ax, 0x2c04                           
  068b  8ec0             mov es, ax                               
  068d  268b9f000d       mov bx, word ptr es:[bx + 0xd00]         
  0692  6bdb1f           imul bx, bx, 0x1f                        
  0695  b8042c           mov ax, 0x2c04                           
  0698  ba042c           mov dx, 0x2c04                           
  069b  8ec2             mov es, dx                               
  069d  268a0e1001       mov cl, byte ptr es:[0x110]              
  06a2  ba0100           mov dx, 1                                
  06a5  d3e2             shl dx, cl                               
  06a7  8ec0             mov es, ax                               
  06a9  2609972e08       or word ptr es:[bx + 0x82e], dx          
  06ae  6a08             push 8                                   
  06b0  ff76fc           push word ptr [bp - 4]                   
  06b3  ff76fe           push word ptr [bp - 2]                   
  06b6  8b5ef2           mov bx, word ptr [bp - 0xe]              
  06b9  6bdb16           imul bx, bx, 0x16                        
  06bc  b81d1e           mov ax, 0x1e1d                           
  06bf  8ec0             mov es, ax                               
  06c1  26ffb78288       push word ptr es:[bx - 0x777e]           
  06c6  8b5ef2           mov bx, word ptr [bp - 0xe]              
  06c9  6bdb16           imul bx, bx, 0x16                        
  06cc  b81d1e           mov ax, 0x1e1d                           
  06cf  8ec0             mov es, ax                               
  06d1  26ffb78088       push word ptr es:[bx - 0x7780]           
  06d6  9a7f00e830       lcall 0x30e8, 0x7f                       -> ovl62:0a3f
  06db  83c40a           add sp, 0xa                              
  06de  6a08             push 8                                   
  06e0  ff76fc           push word ptr [bp - 4]                   
  06e3  ff76fe           push word ptr [bp - 2]                   
  06e6  9a7500e830       lcall 0x30e8, 0x75                       -> ovl62:08cd
  06eb  83c406           add sp, 6                                
  06ee  6a08             push 8                                   
  06f0  ff76fc           push word ptr [bp - 4]                   
  06f3  ff76fe           push word ptr [bp - 2]                   
  06f6  9a7a00e830       lcall 0x30e8, 0x7a                       -> ovl62:099e
  06fb  e982fe           jmp 0x580                                
ovl01_06fe:  ; case
  06fe  666a17           push 0x17                                
  0701  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0706  83c404           add sp, 4                                
  0709  52               push dx                                  
  070a  50               push ax                                  
  070b  56               push si                                  
  070c  57               push di                                  
  070d  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0712  83c408           add sp, 8                                
  0715  83c614           add si, 0x14                             
  0718  666817000100     push 0x10017                             
  071e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0723  83c404           add sp, 4                                
  0726  52               push dx                                  
  0727  50               push ax                                  
  0728  56               push si                                  
  0729  57               push di                                  
  072a  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  072f  83c408           add sp, 8                                
  0732  83c614           add si, 0x14                             
  0735  666817000200     push 0x20017                             
  073b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0740  83c404           add sp, 4                                
  0743  52               push dx                                  
  0744  50               push ax                                  
  0745  56               push si                                  
  0746  57               push di                                  
  0747  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  074c  83c408           add sp, 8                                
  074f  83c614           add si, 0x14                             
  0752  ff76f4           push word ptr [bp - 0xc]                 
  0755  9a89005830       lcall 0x3058, 0x89                       -> ovl44:14f4
  075a  59               pop cx                                   
  075b  52               push dx                                  
  075c  50               push ax                                  
  075d  1e               push ds                                  
  075e  68c500           push 0xc5                                
  0761  16               push ss                                  
  0762  8d469e           lea ax, [bp - 0x62]                      
  0765  50               push ax                                  
  0766  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  076b  83c40c           add sp, 0xc                              
  076e  16               push ss                                  
  076f  8d469e           lea ax, [bp - 0x62]                      
  0772  50               push ax                                  
  0773  56               push si                                  
  0774  57               push di                                  
  0775  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  077a  83c408           add sp, 8                                
  077d  666a01           push 1                                   
  0780  ff76f4           push word ptr [bp - 0xc]                 
  0783  6aff             push -1                                  
  0785  e9ba00           jmp 0x842                                
ovl01_0788:  ; case
  0788  666a18           push 0x18                                
  078b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0790  83c404           add sp, 4                                
  0793  52               push dx                                  
  0794  50               push ax                                  
  0795  56               push si                                  
  0796  57               push di                                  
  0797  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  079c  83c408           add sp, 8                                
  079f  83c614           add si, 0x14                             
  07a2  ff76f6           push word ptr [bp - 0xa]                 
  07a5  666818000100     push 0x10018                             
  07ab  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  07b0  83c404           add sp, 4                                
  07b3  52               push dx                                  
  07b4  50               push ax                                  
  07b5  16               push ss                                  
  07b6  8d469e           lea ax, [bp - 0x62]                      
  07b9  50               push ax                                  
  07ba  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  07bf  83c40a           add sp, 0xa                              
  07c2  16               push ss                                  
  07c3  8d469e           lea ax, [bp - 0x62]                      
  07c6  50               push ax                                  
  07c7  56               push si                                  
  07c8  57               push di                                  
  07c9  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  07ce  83c408           add sp, 8                                
  07d1  83c614           add si, 0x14                             
  07d4  8b46f4           mov ax, word ptr [bp - 0xc]              
  07d7  6bc014           imul ax, ax, 0x14                        
  07da  050000           add ax, 0                                
  07dd  68042c           push 0x2c04                              
  07e0  50               push ax                                  
  07e1  56               push si                                  
  07e2  57               push di                                  
  07e3  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  07e8  83c408           add sp, 8                                
  07eb  83c61e           add si, 0x1e                             
  07ee  666818000200     push 0x20018                             
  07f4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  07f9  83c404           add sp, 4                                
  07fc  52               push dx                                  
  07fd  50               push ax                                  
  07fe  56               push si                                  
  07ff  57               push di                                  
  0800  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0805  83c408           add sp, 8                                
  0808  83c614           add si, 0x14                             
  080b  ff76f8           push word ptr [bp - 8]                   
  080e  666818000300     push 0x30018                             
  0814  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0819  83c404           add sp, 4                                
  081c  52               push dx                                  
  081d  50               push ax                                  
  081e  16               push ss                                  
  081f  8d469e           lea ax, [bp - 0x62]                      
  0822  50               push ax                                  
  0823  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0828  83c40a           add sp, 0xa                              
  082b  16               push ss                                  
  082c  8d469e           lea ax, [bp - 0x62]                      
  082f  50               push ax                                  
  0830  56               push si                                  
  0831  57               push di                                  
  0832  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0837  83c408           add sp, 8                                
  083a  666a01           push 1                                   
  083d  6aff             push -1                                  
  083f  ff76f4           push word ptr [bp - 0xc]                 
  0842  666a00           push 0                                   
  0845  9a3400f230       lcall 0x30f2, 0x34                       -> ovl63:158d
  084a  83c40c           add sp, 0xc                              
  084d  e933fd           jmp 0x583                                
ovl01_0850:  ; case
  0850  b8042c           mov ax, 0x2c04                           
  0853  8ec0             mov es, ax                               
  0855  26833e240100     cmp word ptr es:[0x124], 0               
  085b  7503             jne 0x860                                
  085d  e9ec00           jmp 0x94c                                
  0860  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0863  6bdb41           imul bx, bx, 0x41                        
  0866  b8042c           mov ax, 0x2c04                           
  0869  8ec0             mov es, ax                               
  086b  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0870  6bc070           imul ax, ax, 0x70                        
  0873  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0876  6bdb41           imul bx, bx, 0x41                        
  0879  ba042c           mov dx, 0x2c04                           
  087c  8ec2             mov es, dx                               
  087e  2603877d15       add ax, word ptr es:[bx + 0x157d]        
  0883  bad919           mov dx, 0x19d9                           
  0886  8bd8             mov bx, ax                               
  0888  8ec2             mov es, dx                               
  088a  268a870000       mov al, byte ptr es:[bx]                 
  088f  c1e805           shr ax, 5                                
  0892  250100           and ax, 1                                
  0895  0bc0             or ax, ax                                
  0897  7403             je 0x89c                                 
  0899  e9b000           jmp 0x94c                                
  089c  8b5ef4           mov bx, word ptr [bp - 0xc]              
  089f  6bdb41           imul bx, bx, 0x41                        
  08a2  b8042c           mov ax, 0x2c04                           
  08a5  8ec0             mov es, ax                               
  08a7  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  08ac  6bc070           imul ax, ax, 0x70                        
  08af  8b5ef4           mov bx, word ptr [bp - 0xc]              
  08b2  6bdb41           imul bx, bx, 0x41                        
  08b5  ba042c           mov dx, 0x2c04                           
  08b8  8ec2             mov es, dx                               
  08ba  2603877d15       add ax, word ptr es:[bx + 0x157d]        
  08bf  bad919           mov dx, 0x19d9                           
  08c2  8bd8             mov bx, ax                               
  08c4  8ec2             mov es, dx                               
  08c6  268a870000       mov al, byte ptr es:[bx]                 
  08cb  c1e805           shr ax, 5                                
  08ce  250100           and ax, 1                                
  08d1  0bc0             or ax, ax                                
  08d3  7577             jne 0x94c                                
  08d5  8b5ef4           mov bx, word ptr [bp - 0xc]              
  08d8  6bdb41           imul bx, bx, 0x41                        
  08db  b8042c           mov ax, 0x2c04                           
  08de  8ec0             mov es, ax                               
  08e0  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  08e5  6bc070           imul ax, ax, 0x70                        
  08e8  8b5ef4           mov bx, word ptr [bp - 0xc]              
  08eb  6bdb41           imul bx, bx, 0x41                        
  08ee  ba042c           mov dx, 0x2c04                           
  08f1  8ec2             mov es, dx                               
  08f3  2603877d15       add ax, word ptr es:[bx + 0x157d]        
  08f8  bad919           mov dx, 0x19d9                           
  08fb  8bd8             mov bx, ax                               
  08fd  8ec2             mov es, dx                               
  08ff  268a877100       mov al, byte ptr es:[bx + 0x71]          
  0904  c1e805           shr ax, 5                                
  0907  250100           and ax, 1                                
  090a  0bc0             or ax, ax                                
  090c  753e             jne 0x94c                                
  090e  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0911  6bdb41           imul bx, bx, 0x41                        
  0914  b8042c           mov ax, 0x2c04                           
  0917  8ec0             mov es, ax                               
  0919  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  091e  6bc070           imul ax, ax, 0x70                        
  0921  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0924  6bdb41           imul bx, bx, 0x41                        
  0927  ba042c           mov dx, 0x2c04                           
  092a  8ec2             mov es, dx                               
  092c  2603877d15       add ax, word ptr es:[bx + 0x157d]        
  0931  bad919           mov dx, 0x19d9                           
  0934  8bd8             mov bx, ax                               
  0936  8ec2             mov es, dx                               
  0938  268a877000       mov al, byte ptr es:[bx + 0x70]          
  093d  c1e805           shr ax, 5                                
  0940  250100           and ax, 1                                
  0943  0bc0             or ax, ax                                
  0945  7505             jne 0x94c                                
  0947  c746fa0000       mov word ptr [bp - 6], 0                 
  094c  666a19           push 0x19                                
  094f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0954  83c404           add sp, 4                                
  0957  52               push dx                                  
  0958  50               push ax                                  
  0959  56               push si                                  
  095a  57               push di                                  
  095b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0960  83c408           add sp, 8                                
  0963  83c614           add si, 0x14                             
  0966  837efa00         cmp word ptr [bp - 6], 0                 
  096a  7411             je 0x97d                                 
  096c  8b46f4           mov ax, word ptr [bp - 0xc]              
  096f  6bc041           imul ax, ax, 0x41                        
  0972  058115           add ax, 0x1581                           
  0975  68042c           push 0x2c04                              
  0978  50               push ax                                  
  0979  6a01             push 1                                   
  097b  eb0f             jmp 0x98c                                
  097d  8b46f4           mov ax, word ptr [bp - 0xc]              
  0980  6bc041           imul ax, ax, 0x41                        
  0983  058115           add ax, 0x1581                           
  0986  68042c           push 0x2c04                              
  0989  50               push ax                                  
  098a  6a02             push 2                                   
  098c  6a19             push 0x19                                
  098e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0993  83c404           add sp, 4                                
  0996  52               push dx                                  
  0997  50               push ax                                  
  0998  16               push ss                                  
  0999  8d469e           lea ax, [bp - 0x62]                      
  099c  50               push ax                                  
  099d  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  09a2  83c40c           add sp, 0xc                              
  09a5  16               push ss                                  
  09a6  8d469e           lea ax, [bp - 0x62]                      
  09a9  50               push ax                                  
  09aa  56               push si                                  
  09ab  57               push di                                  
  09ac  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  09b1  83c408           add sp, 8                                
  09b4  83c614           add si, 0x14                             
  09b7  666819000300     push 0x30019                             
  09bd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  09c2  83c404           add sp, 4                                
  09c5  52               push dx                                  
  09c6  50               push ax                                  
  09c7  56               push si                                  
  09c8  57               push di                                  
  09c9  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  09ce  83c408           add sp, 8                                
  09d1  83c614           add si, 0x14                             
  09d4  666819000400     push 0x40019                             
  09da  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  09df  83c404           add sp, 4                                
  09e2  52               push dx                                  
  09e3  50               push ax                                  
  09e4  56               push si                                  
  09e5  57               push di                                  
  09e6  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  09eb  83c408           add sp, 8                                
  09ee  83c61e           add si, 0x1e                             
  09f1  666819000500     push 0x50019                             
  09f7  e9a701           jmp 0xba1                                
ovl01_09fa:  ; case
  09fa  b8042c           mov ax, 0x2c04                           
  09fd  8ec0             mov es, ax                               
  09ff  26833e240100     cmp word ptr es:[0x124], 0               
  0a05  7503             jne 0xa0a                                
  0a07  e9ec00           jmp 0xaf6                                
  0a0a  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0a0d  6bdb41           imul bx, bx, 0x41                        
  0a10  b8042c           mov ax, 0x2c04                           
  0a13  8ec0             mov es, ax                               
  0a15  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0a1a  6bc070           imul ax, ax, 0x70                        
  0a1d  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0a20  6bdb41           imul bx, bx, 0x41                        
  0a23  ba042c           mov dx, 0x2c04                           
  0a26  8ec2             mov es, dx                               
  0a28  2603877d15       add ax, word ptr es:[bx + 0x157d]        
  0a2d  bad919           mov dx, 0x19d9                           
  0a30  8bd8             mov bx, ax                               
  0a32  8ec2             mov es, dx                               
  0a34  268a870000       mov al, byte ptr es:[bx]                 
  0a39  c1e805           shr ax, 5                                
  0a3c  250100           and ax, 1                                
  0a3f  0bc0             or ax, ax                                
  0a41  7403             je 0xa46                                 
  0a43  e9b000           jmp 0xaf6                                
  0a46  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0a49  6bdb41           imul bx, bx, 0x41                        
  0a4c  b8042c           mov ax, 0x2c04                           
  0a4f  8ec0             mov es, ax                               
  0a51  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0a56  6bc070           imul ax, ax, 0x70                        
  0a59  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0a5c  6bdb41           imul bx, bx, 0x41                        
  0a5f  ba042c           mov dx, 0x2c04                           
  0a62  8ec2             mov es, dx                               
  0a64  2603877d15       add ax, word ptr es:[bx + 0x157d]        
  0a69  bad919           mov dx, 0x19d9                           
  0a6c  8bd8             mov bx, ax                               
  0a6e  8ec2             mov es, dx                               
  0a70  268a870000       mov al, byte ptr es:[bx]                 
  0a75  c1e805           shr ax, 5                                
  0a78  250100           and ax, 1                                
  0a7b  0bc0             or ax, ax                                
  0a7d  7577             jne 0xaf6                                
  0a7f  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0a82  6bdb41           imul bx, bx, 0x41                        
  0a85  b8042c           mov ax, 0x2c04                           
  0a88  8ec0             mov es, ax                               
  0a8a  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0a8f  6bc070           imul ax, ax, 0x70                        
  0a92  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0a95  6bdb41           imul bx, bx, 0x41                        
  0a98  ba042c           mov dx, 0x2c04                           
  0a9b  8ec2             mov es, dx                               
  0a9d  2603877d15       add ax, word ptr es:[bx + 0x157d]        
  0aa2  bad919           mov dx, 0x19d9                           
  0aa5  8bd8             mov bx, ax                               
  0aa7  8ec2             mov es, dx                               
  0aa9  268a877100       mov al, byte ptr es:[bx + 0x71]          
  0aae  c1e805           shr ax, 5                                
  0ab1  250100           and ax, 1                                
  0ab4  0bc0             or ax, ax                                
  0ab6  753e             jne 0xaf6                                
  0ab8  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0abb  6bdb41           imul bx, bx, 0x41                        
  0abe  b8042c           mov ax, 0x2c04                           
  0ac1  8ec0             mov es, ax                               
  0ac3  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0ac8  6bc070           imul ax, ax, 0x70                        
  0acb  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0ace  6bdb41           imul bx, bx, 0x41                        
  0ad1  ba042c           mov dx, 0x2c04                           
  0ad4  8ec2             mov es, dx                               
  0ad6  2603877d15       add ax, word ptr es:[bx + 0x157d]        
  0adb  bad919           mov dx, 0x19d9                           
  0ade  8bd8             mov bx, ax                               
  0ae0  8ec2             mov es, dx                               
  0ae2  268a877000       mov al, byte ptr es:[bx + 0x70]          
  0ae7  c1e805           shr ax, 5                                
  0aea  250100           and ax, 1                                
  0aed  0bc0             or ax, ax                                
  0aef  7505             jne 0xaf6                                
  0af1  c746fa0000       mov word ptr [bp - 6], 0                 
  0af6  666a1a           push 0x1a                                
  0af9  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0afe  83c404           add sp, 4                                
  0b01  52               push dx                                  
  0b02  50               push ax                                  
  0b03  56               push si                                  
  0b04  57               push di                                  
  0b05  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0b0a  83c408           add sp, 8                                
  0b0d  83c614           add si, 0x14                             
  0b10  837efa00         cmp word ptr [bp - 6], 0                 
  0b14  7411             je 0xb27                                 
  0b16  8b46f4           mov ax, word ptr [bp - 0xc]              
  0b19  6bc041           imul ax, ax, 0x41                        
  0b1c  058115           add ax, 0x1581                           
  0b1f  68042c           push 0x2c04                              
  0b22  50               push ax                                  
  0b23  6a01             push 1                                   
  0b25  eb0f             jmp 0xb36                                
  0b27  8b46f4           mov ax, word ptr [bp - 0xc]              
  0b2a  6bc041           imul ax, ax, 0x41                        
  0b2d  058115           add ax, 0x1581                           
  0b30  68042c           push 0x2c04                              
  0b33  50               push ax                                  
  0b34  6a02             push 2                                   
  0b36  6a1a             push 0x1a                                
  0b38  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0b3d  83c404           add sp, 4                                
  0b40  52               push dx                                  
  0b41  50               push ax                                  
  0b42  16               push ss                                  
  0b43  8d469e           lea ax, [bp - 0x62]                      
  0b46  50               push ax                                  
  0b47  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0b4c  83c40c           add sp, 0xc                              
  0b4f  16               push ss                                  
  0b50  8d469e           lea ax, [bp - 0x62]                      
  0b53  50               push ax                                  
  0b54  56               push si                                  
  0b55  57               push di                                  
  0b56  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0b5b  83c408           add sp, 8                                
  0b5e  83c614           add si, 0x14                             
  0b61  66681a000300     push 0x3001a                             
  0b67  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0b6c  83c404           add sp, 4                                
  0b6f  52               push dx                                  
  0b70  50               push ax                                  
  0b71  56               push si                                  
  0b72  57               push di                                  
  0b73  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0b78  83c408           add sp, 8                                
  0b7b  83c614           add si, 0x14                             
  0b7e  66681a000400     push 0x4001a                             
  0b84  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0b89  83c404           add sp, 4                                
  0b8c  52               push dx                                  
  0b8d  50               push ax                                  
  0b8e  56               push si                                  
  0b8f  57               push di                                  
  0b90  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0b95  83c408           add sp, 8                                
  0b98  83c61e           add si, 0x1e                             
  0b9b  66681a000500     push 0x5001a                             
  0ba1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0ba6  83c404           add sp, 4                                
  0ba9  52               push dx                                  
  0baa  50               push ax                                  
  0bab  56               push si                                  
  0bac  57               push di                                  
  0bad  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0bb2  83c408           add sp, 8                                
  0bb5  83c614           add si, 0x14                             
  0bb8  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0bbb  6bdb41           imul bx, bx, 0x41                        
  0bbe  b8042c           mov ax, 0x2c04                           
  0bc1  8ec0             mov es, ax                               
  0bc3  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0bc8  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0bcb  6bdb41           imul bx, bx, 0x41                        
  0bce  b8042c           mov ax, 0x2c04                           
  0bd1  8ec0             mov es, ax                               
  0bd3  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0bd8  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0bdb  6bdb16           imul bx, bx, 0x16                        
  0bde  b81d1e           mov ax, 0x1e1d                           
  0be1  8ec0             mov es, ax                               
  0be3  26ffb78288       push word ptr es:[bx - 0x777e]           
  0be8  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0beb  6bdb16           imul bx, bx, 0x16                        
  0bee  b81d1e           mov ax, 0x1e1d                           
  0bf1  ba0000           mov dx, 0                                
  0bf4  81c28088         add dx, 0x8880                           
  0bf8  03da             add bx, dx                               
  0bfa  8ec0             mov es, ax                               
  0bfc  26ff37           push word ptr es:[bx]                    
  0bff  9a2000e830       lcall 0x30e8, 0x20                       -> ovl62:0b51
  0c04  83c408           add sp, 8                                
  0c07  8bd0             mov dx, ax                               
  0c09  8bda             mov bx, dx                               
  0c0b  c1e302           shl bx, 2                                
  0c0e  66ffb77c2b       push dword ptr [bx + 0x2b7c]             
  0c13  56               push si                                  
  0c14  57               push di                                  
  0c15  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0c1a  83c408           add sp, 8                                
  0c1d  6a08             push 8                                   
  0c1f  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0c22  6bdb41           imul bx, bx, 0x41                        
  0c25  b8042c           mov ax, 0x2c04                           
  0c28  8ec0             mov es, ax                               
  0c2a  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0c2f  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0c32  6bdb41           imul bx, bx, 0x41                        
  0c35  b8042c           mov ax, 0x2c04                           
  0c38  8ec0             mov es, ax                               
  0c3a  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0c3f  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0c42  6bdb16           imul bx, bx, 0x16                        
  0c45  b81d1e           mov ax, 0x1e1d                           
  0c48  8ec0             mov es, ax                               
  0c4a  26ffb78288       push word ptr es:[bx - 0x777e]           
  0c4f  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0c52  6bdb16           imul bx, bx, 0x16                        
  0c55  b81d1e           mov ax, 0x1e1d                           
  0c58  8ec0             mov es, ax                               
  0c5a  26ffb78088       push word ptr es:[bx - 0x7780]           
  0c5f  9a7f00e830       lcall 0x30e8, 0x7f                       -> ovl62:0a3f
  0c64  83c40a           add sp, 0xa                              
  0c67  6a08             push 8                                   
  0c69  ff76f4           push word ptr [bp - 0xc]                 
  0c6c  9a5200e830       lcall 0x30e8, 0x52                       -> ovl62:07bf
  0c71  83c404           add sp, 4                                
  0c74  6a08             push 8                                   
  0c76  ff76f4           push word ptr [bp - 0xc]                 
  0c79  9a6100e830       lcall 0x30e8, 0x61                       -> ovl62:0837
  0c7e  e90af9           jmp 0x58b                                
ovl01_0c81:  ; case
  0c81  666a1b           push 0x1b                                
  0c84  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0c89  83c404           add sp, 4                                
  0c8c  52               push dx                                  
  0c8d  50               push ax                                  
  0c8e  56               push si                                  
  0c8f  57               push di                                  
  0c90  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0c95  83c408           add sp, 8                                
  0c98  83c614           add si, 0x14                             
  0c9b  ff76f6           push word ptr [bp - 0xa]                 
  0c9e  66681b000100     push 0x1001b                             
  0ca4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0ca9  83c404           add sp, 4                                
  0cac  52               push dx                                  
  0cad  50               push ax                                  
  0cae  16               push ss                                  
  0caf  8d469e           lea ax, [bp - 0x62]                      
  0cb2  50               push ax                                  
  0cb3  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0cb8  83c40a           add sp, 0xa                              
  0cbb  16               push ss                                  
  0cbc  8d469e           lea ax, [bp - 0x62]                      
  0cbf  50               push ax                                  
  0cc0  56               push si                                  
  0cc1  57               push di                                  
  0cc2  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0cc7  83c408           add sp, 8                                
  0cca  83c614           add si, 0x14                             
  0ccd  66681b000200     push 0x2001b                             
  0cd3  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0cd8  83c404           add sp, 4                                
  0cdb  52               push dx                                  
  0cdc  50               push ax                                  
  0cdd  56               push si                                  
  0cde  57               push di                                  
  0cdf  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0ce4  83c408           add sp, 8                                
  0ce7  83c614           add si, 0x14                             
  0cea  66681b000300     push 0x3001b                             
  0cf0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0cf5  83c404           add sp, 4                                
  0cf8  52               push dx                                  
  0cf9  50               push ax                                  
  0cfa  56               push si                                  
  0cfb  57               push di                                  
  0cfc  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0d01  83c408           add sp, 8                                
  0d04  83c61e           add si, 0x1e                             
  0d07  66681b000400     push 0x4001b                             
  0d0d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0d12  83c404           add sp, 4                                
  0d15  52               push dx                                  
  0d16  50               push ax                                  
  0d17  56               push si                                  
  0d18  57               push di                                  
  0d19  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0d1e  83c408           add sp, 8                                
  0d21  83c614           add si, 0x14                             
  0d24  ff76f8           push word ptr [bp - 8]                   
  0d27  66681b000500     push 0x5001b                             
  0d2d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0d32  83c404           add sp, 4                                
  0d35  52               push dx                                  
  0d36  50               push ax                                  
  0d37  16               push ss                                  
  0d38  8d469e           lea ax, [bp - 0x62]                      
  0d3b  50               push ax                                  
  0d3c  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0d41  83c40a           add sp, 0xa                              
  0d44  16               push ss                                  
  0d45  8d469e           lea ax, [bp - 0x62]                      
  0d48  50               push ax                                  
  0d49  56               push si                                  
  0d4a  57               push di                                  
  0d4b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0d50  83c408           add sp, 8                                
  0d53  5f               pop di                                   
  0d54  5e               pop si                                   
  0d55  c9               leave                                    
  0d56  cb               retf                                     
  0d57  cd039105fe068807 dw 03cd,0591,06fe,0788,0850,09fa,0c81    jump table

ovl01_0d65:  ; ENTRY
  0d65  55               push bp                                  
  0d66  8bec             mov bp, sp                               
  0d68  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0d6d  666a00           push 0                                   
  0d70  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  0d75  83c404           add sp, 4                                
  0d78  5d               pop bp                                   
  0d79  cb               retf                                     

ovl01_0d7a:  ; ENTRY
  0d7a  55               push bp                                  
  0d7b  8bec             mov bp, sp                               
  0d7d  83ec14           sub sp, 0x14                             
  0d80  56               push si                                  
  0d81  57               push di                                  
  0d82  c746f40000       mov word ptr [bp - 0xc], 0               
  0d87  c746ee0a00       mov word ptr [bp - 0x12], 0xa            
  0d8c  c41e5e5e         les bx, ptr [0x5e5e]                     
  0d90  268a470a         mov al, byte ptr es:[bx + 0xa]           
  0d94  98               cwde                                     
  0d95  6bc014           imul ax, ax, 0x14                        
  0d98  052302           add ax, 0x223                            
  0d9b  68042c           push 0x2c04                              
  0d9e  50               push ax                                  
  0d9f  666a00           push 0                                   
  0da2  6a03             push 3                                   
  0da4  b8042c           mov ax, 0x2c04                           
  0da7  8ec0             mov es, ax                               
  0da9  26ff361001       push word ptr es:[0x110]                 
  0dae  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  0db3  83c40c           add sp, 0xc                              
  0db6  ff46f4           inc word ptr [bp - 0xc]                  
  0db9  66ff365e5e       push dword ptr [0x5e5e]                  
  0dbe  9a4400620b       lcall 0xb62, 0x44                        -> 0b62:0044
  0dc3  83c404           add sp, 4                                
  0dc6  8bf0             mov si, ax                               
  0dc8  837e0600         cmp word ptr [bp + 6], 0                 
  0dcc  7444             je 0xe12                                 
  0dce  8b46f4           mov ax, word ptr [bp - 0xc]              
  0dd1  3d0100           cmp ax, 1                                
  0dd4  740c             je 0xde2                                 
  0dd6  3d0200           cmp ax, 2                                
  0dd9  7429             je 0xe04                                 
  0ddb  3d0300           cmp ax, 3                                
  0dde  742b             je 0xe0b                                 
  0de0  eb4a             jmp 0xe2c                                
  0de2  66680500ffff     push 0xffff0005                          
  0de8  6a01             push 1                                   
  0dea  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0def  83c406           add sp, 6                                
  0df2  0bc0             or ax, ax                                
  0df4  7407             je 0xdfd                                 
  0df6  c746fe0400       mov word ptr [bp - 2], 4                 
  0dfb  eb2f             jmp 0xe2c                                
  0dfd  c746fe0500       mov word ptr [bp - 2], 5                 
  0e02  eb28             jmp 0xe2c                                
  0e04  c746fe0300       mov word ptr [bp - 2], 3                 
  0e09  eb21             jmp 0xe2c                                
  0e0b  c746fe0600       mov word ptr [bp - 2], 6                 
  0e10  eb1a             jmp 0xe2c                                
  0e12  6aff             push -1                                  
  0e14  ff76ee           push word ptr [bp - 0x12]                
  0e17  6a01             push 1                                   
  0e19  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0e1e  83c406           add sp, 6                                
  0e21  d1e0             shl ax, 1                                
  0e23  8bd8             mov bx, ax                               
  0e25  8b87a000         mov ax, word ptr [bx + 0xa0]             
  0e29  8946fe           mov word ptr [bp - 2], ax                
  0e2c  b8042c           mov ax, 0x2c04                           
  0e2f  8ec0             mov es, ax                               
  0e31  268b1e1001       mov bx, word ptr es:[0x110]              
  0e36  6bdb0c           imul bx, bx, 0xc                         
  0e39  b8042c           mov ax, 0x2c04                           
  0e3c  8ec0             mov es, ax                               
  0e3e  26c78703110100   mov word ptr es:[bx + 0x1103], 1         
  0e45  b8042c           mov ax, 0x2c04                           
  0e48  8ec0             mov es, ax                               
  0e4a  268b1e1001       mov bx, word ptr es:[0x110]              
  0e4f  6bdb0c           imul bx, bx, 0xc                         
  0e52  b8042c           mov ax, 0x2c04                           
  0e55  8ec0             mov es, ax                               
  0e57  2689b70711       mov word ptr es:[bx + 0x1107], si        
  0e5c  b8042c           mov ax, 0x2c04                           
  0e5f  8ec0             mov es, ax                               
  0e61  268b1e1001       mov bx, word ptr es:[0x110]              
  0e66  6bdb0c           imul bx, bx, 0xc                         
  0e69  b8042c           mov ax, 0x2c04                           
  0e6c  8b56fe           mov dx, word ptr [bp - 2]                
  0e6f  8ec0             mov es, ax                               
  0e71  2689970511       mov word ptr es:[bx + 0x1105], dx        
  0e76  8b5efe           mov bx, word ptr [bp - 2]                
  0e79  83fb06           cmp bx, 6                                
  0e7c  7603             jbe 0xe81                                
  0e7e  e98d06           jmp 0x150e                               
  0e81  d1e3             shl bx, 1                                
  0e83  2effa71215       jmp word ptr cs:[bx + 0x1512]            
ovl01_0e88:  ; case
  0e88  c746f20000       mov word ptr [bp - 0xe], 0               
  0e8d  b8042c           mov ax, 0x2c04                           
  0e90  8ec0             mov es, ax                               
  0e92  268b368101       mov si, word ptr es:[0x181]              
  0e97  eb31             jmp 0xeca                                
  0e99  8bde             mov bx, si                               
  0e9b  6bdb16           imul bx, bx, 0x16                        
  0e9e  b81d1e           mov ax, 0x1e1d                           
  0ea1  8ec0             mov es, ax                               
  0ea3  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0ea9  751f             jne 0xeca                                
  0eab  8bde             mov bx, si                               
  0ead  6bdb16           imul bx, bx, 0x16                        
  0eb0  b81d1e           mov ax, 0x1e1d                           
  0eb3  8ec0             mov es, ax                               
  0eb5  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0eba  98               cwde                                     
  0ebb  ba042c           mov dx, 0x2c04                           
  0ebe  8ec2             mov es, dx                               
  0ec0  263b061001       cmp ax, word ptr es:[0x110]              
  0ec5  7403             je 0xeca                                 
  0ec7  ff46f2           inc word ptr [bp - 0xe]                  
  0eca  8bc6             mov ax, si                               
  0ecc  4e               dec si                                   
  0ecd  0bc0             or ax, ax                                
  0ecf  75c8             jne 0xe99                                
  0ed1  837ef200         cmp word ptr [bp - 0xe], 0               
  0ed5  7f03             jg 0xeda                                 
  0ed7  e9dcfe           jmp 0xdb6                                
  0eda  6a00             push 0                                   
  0edc  ff76f2           push word ptr [bp - 0xe]                 
  0edf  6a01             push 1                                   
  0ee1  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0ee6  83c406           add sp, 6                                
  0ee9  8bf8             mov di, ax                               
  0eeb  c746f20000       mov word ptr [bp - 0xe], 0               
  0ef0  b8042c           mov ax, 0x2c04                           
  0ef3  8ec0             mov es, ax                               
  0ef5  268b368101       mov si, word ptr es:[0x181]              
  0efa  eb36             jmp 0xf32                                
  0efc  8bde             mov bx, si                               
  0efe  6bdb16           imul bx, bx, 0x16                        
  0f01  b81d1e           mov ax, 0x1e1d                           
  0f04  8ec0             mov es, ax                               
  0f06  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0f0c  7524             jne 0xf32                                
  0f0e  8bde             mov bx, si                               
  0f10  6bdb16           imul bx, bx, 0x16                        
  0f13  b81d1e           mov ax, 0x1e1d                           
  0f16  8ec0             mov es, ax                               
  0f18  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0f1d  98               cwde                                     
  0f1e  ba042c           mov dx, 0x2c04                           
  0f21  8ec2             mov es, dx                               
  0f23  263b061001       cmp ax, word ptr es:[0x110]              
  0f28  7408             je 0xf32                                 
  0f2a  ff46f2           inc word ptr [bp - 0xe]                  
  0f2d  397ef2           cmp word ptr [bp - 0xe], di              
  0f30  7407             je 0xf39                                 
  0f32  8bc6             mov ax, si                               
  0f34  4e               dec si                                   
  0f35  0bc0             or ax, ax                                
  0f37  75c3             jne 0xefc                                
  0f39  b8042c           mov ax, 0x2c04                           
  0f3c  8ec0             mov es, ax                               
  0f3e  268b1e1001       mov bx, word ptr es:[0x110]              
  0f43  6bdb0c           imul bx, bx, 0xc                         
  0f46  b8042c           mov ax, 0x2c04                           
  0f49  8ec0             mov es, ax                               
  0f4b  2689b70911       mov word ptr es:[bx + 0x1109], si        
  0f50  e9bb05           jmp 0x150e                               
ovl01_0f53:  ; case
  0f53  c746fc0000       mov word ptr [bp - 4], 0                 
  0f58  c746f20000       mov word ptr [bp - 0xe], 0               
  0f5d  e98100           jmp 0xfe1                                
  0f60  837e0600         cmp word ptr [bp + 6], 0                 
  0f64  7405             je 0xf6b                                 
  0f66  b81e00           mov ax, 0x1e                             
  0f69  eb03             jmp 0xf6e                                
  0f6b  b83200           mov ax, 0x32                             
  0f6e  8bf0             mov si, ax                               
  0f70  16               push ss                                  
  0f71  8d46f8           lea ax, [bp - 8]                         
  0f74  50               push ax                                  
  0f75  16               push ss                                  
  0f76  8d46fa           lea ax, [bp - 6]                         
  0f79  50               push ax                                  
  0f7a  ff76fc           push word ptr [bp - 4]                   
  0f7d  9a3e001d30       lcall 0x301d, 0x3e                       -> ovl35:0b36
  0f82  83c40a           add sp, 0xa                              
  0f85  8b5efc           mov bx, word ptr [bp - 4]                
  0f88  6bdb1d           imul bx, bx, 0x1d                        
  0f8b  b8042c           mov ax, 0x2c04                           
  0f8e  8ec0             mov es, ax                               
  0f90  2680bfff0c02     cmp byte ptr es:[bx + 0xcff], 2          
  0f96  7546             jne 0xfde                                
  0f98  8b46fc           mov ax, word ptr [bp - 4]                
  0f9b  6bc01d           imul ax, ax, 0x1d                        
  0f9e  ba042c           mov dx, 0x2c04                           
  0fa1  05e90c           add ax, 0xce9                            
  0fa4  b91e00           mov cx, 0x1e                             
  0fa7  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0fac  9a34001d30       lcall 0x301d, 0x34                       -> ovl35:08f4
  0fb1  83c41e           add sp, 0x1e                             
  0fb4  0bc0             or ax, ax                                
  0fb6  7526             jne 0xfde                                
  0fb8  c41e5e5e         les bx, ptr [0x5e5e]                     
  0fbc  268b07           mov ax, word ptr es:[bx]                 
  0fbf  2b46fa           sub ax, word ptr [bp - 6]                
  0fc2  99               cdq                                      
  0fc3  33c2             xor ax, dx                               
  0fc5  2bc2             sub ax, dx                               
  0fc7  3bc6             cmp ax, si                               
  0fc9  7d13             jge 0xfde                                
  0fcb  268b4702         mov ax, word ptr es:[bx + 2]             
  0fcf  2b46f8           sub ax, word ptr [bp - 8]                
  0fd2  99               cdq                                      
  0fd3  33c2             xor ax, dx                               
  0fd5  2bc2             sub ax, dx                               
  0fd7  3bc6             cmp ax, si                               
  0fd9  7d03             jge 0xfde                                
  0fdb  ff46f2           inc word ptr [bp - 0xe]                  
  0fde  ff46fc           inc word ptr [bp - 4]                    
  0fe1  837efc16         cmp word ptr [bp - 4], 0x16              
  0fe5  7d03             jge 0xfea                                
  0fe7  e976ff           jmp 0xf60                                
  0fea  837ef200         cmp word ptr [bp - 0xe], 0               
  0fee  7f03             jg 0xff3                                 
  0ff0  e9c3fd           jmp 0xdb6                                
  0ff3  6a00             push 0                                   
  0ff5  ff76f2           push word ptr [bp - 0xe]                 
  0ff8  6a01             push 1                                   
  0ffa  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0fff  83c406           add sp, 6                                
  1002  8bf8             mov di, ax                               
  1004  c746fc0000       mov word ptr [bp - 4], 0                 
  1009  c746f20000       mov word ptr [bp - 0xe], 0               
  100e  e98600           jmp 0x1097                               
  1011  837e0600         cmp word ptr [bp + 6], 0                 
  1015  7405             je 0x101c                                
  1017  b81e00           mov ax, 0x1e                             
  101a  eb03             jmp 0x101f                               
  101c  b83200           mov ax, 0x32                             
  101f  8bf0             mov si, ax                               
  1021  16               push ss                                  
  1022  8d46f8           lea ax, [bp - 8]                         
  1025  50               push ax                                  
  1026  16               push ss                                  
  1027  8d46fa           lea ax, [bp - 6]                         
  102a  50               push ax                                  
  102b  ff76fc           push word ptr [bp - 4]                   
  102e  9a3e001d30       lcall 0x301d, 0x3e                       -> ovl35:0b36
  1033  83c40a           add sp, 0xa                              
  1036  8b5efc           mov bx, word ptr [bp - 4]                
  1039  6bdb1d           imul bx, bx, 0x1d                        
  103c  b8042c           mov ax, 0x2c04                           
  103f  8ec0             mov es, ax                               
  1041  2680bfff0c00     cmp byte ptr es:[bx + 0xcff], 0          
  1047  744b             je 0x1094                                
  1049  8b46fc           mov ax, word ptr [bp - 4]                
  104c  6bc01d           imul ax, ax, 0x1d                        
  104f  ba042c           mov dx, 0x2c04                           
  1052  05e90c           add ax, 0xce9                            
  1055  b91e00           mov cx, 0x1e                             
  1058  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  105d  9a34001d30       lcall 0x301d, 0x34                       -> ovl35:08f4
  1062  83c41e           add sp, 0x1e                             
  1065  0bc0             or ax, ax                                
  1067  752b             jne 0x1094                               
  1069  c41e5e5e         les bx, ptr [0x5e5e]                     
  106d  268b07           mov ax, word ptr es:[bx]                 
  1070  2b46fa           sub ax, word ptr [bp - 6]                
  1073  99               cdq                                      
  1074  33c2             xor ax, dx                               
  1076  2bc2             sub ax, dx                               
  1078  3bc6             cmp ax, si                               
  107a  7d18             jge 0x1094                               
  107c  268b4702         mov ax, word ptr es:[bx + 2]             
  1080  2b46f8           sub ax, word ptr [bp - 8]                
  1083  99               cdq                                      
  1084  33c2             xor ax, dx                               
  1086  2bc2             sub ax, dx                               
  1088  3bc6             cmp ax, si                               
  108a  7d08             jge 0x1094                               
  108c  ff46f2           inc word ptr [bp - 0xe]                  
  108f  397ef2           cmp word ptr [bp - 0xe], di              
  1092  740c             je 0x10a0                                
  1094  ff46fc           inc word ptr [bp - 4]                    
  1097  837efc16         cmp word ptr [bp - 4], 0x16              
  109b  7d03             jge 0x10a0                               
  109d  e971ff           jmp 0x1011                               
  10a0  b8042c           mov ax, 0x2c04                           
  10a3  8ec0             mov es, ax                               
  10a5  268b1e1001       mov bx, word ptr es:[0x110]              
  10aa  6bdb0c           imul bx, bx, 0xc                         
  10ad  b8042c           mov ax, 0x2c04                           
  10b0  8b56fc           mov dx, word ptr [bp - 4]                
  10b3  8ec0             mov es, ax                               
  10b5  2689970911       mov word ptr es:[bx + 0x1109], dx        
  10ba  16               push ss                                  
  10bb  8d46f8           lea ax, [bp - 8]                         
  10be  50               push ax                                  
  10bf  16               push ss                                  
  10c0  8d46fa           lea ax, [bp - 6]                         
  10c3  50               push ax                                  
  10c4  52               push dx                                  
  10c5  9a3e001d30       lcall 0x301d, 0x3e                       -> ovl35:0b36
  10ca  83c40a           add sp, 0xa                              
  10cd  ff76f8           push word ptr [bp - 8]                   
  10d0  ff76fa           push word ptr [bp - 6]                   
  10d3  b8042c           mov ax, 0x2c04                           
  10d6  8ec0             mov es, ax                               
  10d8  26ff361001       push word ptr es:[0x110]                 
  10dd  9a8e00f930       lcall 0x30f9, 0x8e                       -> ovl64:1298
  10e2  83c406           add sp, 6                                
  10e5  ff76f8           push word ptr [bp - 8]                   
  10e8  ff76fa           push word ptr [bp - 6]                   
  10eb  9a3e00e830       lcall 0x30e8, 0x3e                       -> ovl62:04b5
  10f0  83c404           add sp, 4                                
  10f3  8bd0             mov dx, ax                               
  10f5  0bd2             or dx, dx                                
  10f7  7c2e             jl 0x1127                                
  10f9  8bda             mov bx, dx                               
  10fb  6bdb1f           imul bx, bx, 0x1f                        
  10fe  b8042c           mov ax, 0x2c04                           
  1101  ba042c           mov dx, 0x2c04                           
  1104  8ec2             mov es, dx                               
  1106  268a0e1001       mov cl, byte ptr es:[0x110]              
  110b  ba0100           mov dx, 1                                
  110e  d3e2             shl dx, cl                               
  1110  8ec0             mov es, ax                               
  1112  2609972e08       or word ptr es:[bx + 0x82e], dx          
  1117  ff76f8           push word ptr [bp - 8]                   
  111a  ff76fa           push word ptr [bp - 6]                   
  111d  6a01             push 1                                   
  111f  9a5c00f230       lcall 0x30f2, 0x5c                       -> ovl63:2785
  1124  83c406           add sp, 6                                
  1127  b8042c           mov ax, 0x2c04                           
  112a  8ec0             mov es, ax                               
  112c  26ff361001       push word ptr es:[0x110]                 
  1131  9a5200f230       lcall 0x30f2, 0x52                       -> ovl63:2200
  1136  59               pop cx                                   
  1137  e9d403           jmp 0x150e                               
ovl01_113a:  ; case
  113a  c746f00000       mov word ptr [bp - 0x10], 0              
  113f  c746fc0000       mov word ptr [bp - 4], 0                 
  1144  eb7d             jmp 0x11c3                               
  1146  9a75007330       lcall 0x3073, 0x75                       -> ovl47:1a9b
  114b  8bf8             mov di, ax                               
  114d  c746f00000       mov word ptr [bp - 0x10], 0              
  1152  b8042c           mov ax, 0x2c04                           
  1155  8ec0             mov es, ax                               
  1157  268b368101       mov si, word ptr es:[0x181]              
  115c  eb5b             jmp 0x11b9                               
  115e  8bde             mov bx, si                               
  1160  6bdb16           imul bx, bx, 0x16                        
  1163  b81d1e           mov ax, 0x1e1d                           
  1166  8ec0             mov es, ax                               
  1168  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  116d  98               cwde                                     
  116e  3bc7             cmp ax, di                               
  1170  7547             jne 0x11b9                               
  1172  8bde             mov bx, si                               
  1174  6bdb16           imul bx, bx, 0x16                        
  1177  b81d1e           mov ax, 0x1e1d                           
  117a  8ec0             mov es, ax                               
  117c  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  1181  98               cwde                                     
  1182  ba042c           mov dx, 0x2c04                           
  1185  8ec2             mov es, dx                               
  1187  263b061001       cmp ax, word ptr es:[0x110]              
  118c  742b             je 0x11b9                                
  118e  8bde             mov bx, si                               
  1190  6bdb16           imul bx, bx, 0x16                        
  1193  b81d1e           mov ax, 0x1e1d                           
  1196  8ec0             mov es, ax                               
  1198  2683bf808800     cmp word ptr es:[bx - 0x7780], 0         
  119e  7c19             jl 0x11b9                                
  11a0  8bde             mov bx, si                               
  11a2  6bdb16           imul bx, bx, 0x16                        
  11a5  b81d1e           mov ax, 0x1e1d                           
  11a8  8ec0             mov es, ax                               
  11aa  2683bf828800     cmp word ptr es:[bx - 0x777e], 0         
  11b0  7c07             jl 0x11b9                                
  11b2  c746f00100       mov word ptr [bp - 0x10], 1              
  11b7  eb07             jmp 0x11c0                               
  11b9  8bc6             mov ax, si                               
  11bb  4e               dec si                                   
  11bc  0bc0             or ax, ax                                
  11be  759e             jne 0x115e                               
  11c0  ff46fc           inc word ptr [bp - 4]                    
  11c3  837efc05         cmp word ptr [bp - 4], 5                 
  11c7  7d09             jge 0x11d2                               
  11c9  837ef000         cmp word ptr [bp - 0x10], 0              
  11cd  7503             jne 0x11d2                               
  11cf  e974ff           jmp 0x1146                               
  11d2  837ef000         cmp word ptr [bp - 0x10], 0              
  11d6  7503             jne 0x11db                               
  11d8  e9dbfb           jmp 0xdb6                                
  11db  e9be02           jmp 0x149c                               
ovl01_11de:  ; case
  11de  b8042c           mov ax, 0x2c04                           
  11e1  8ec0             mov es, ax                               
  11e3  26833e5b0100     cmp word ptr es:[0x15b], 0               
  11e9  7403             je 0x11ee                                
  11eb  e9c8fb           jmp 0xdb6                                
  11ee  c746f00000       mov word ptr [bp - 0x10], 0              
  11f3  c746f60000       mov word ptr [bp - 0xa], 0               
  11f8  eb37             jmp 0x1231                               
  11fa  66680800ffff     push 0xffff0008                          
  1200  6a01             push 1                                   
  1202  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1207  83c406           add sp, 6                                
  120a  8bf8             mov di, ax                               
  120c  b8042c           mov ax, 0x2c04                           
  120f  8ec0             mov es, ax                               
  1211  26393e1001       cmp word ptr es:[0x110], di              
  1216  7416             je 0x122e                                
  1218  8bdf             mov bx, di                               
  121a  d1e3             shl bx, 1                                
  121c  b8042c           mov ax, 0x2c04                           
  121f  8ec0             mov es, ax                               
  1221  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1227  7405             je 0x122e                                
  1229  c746f00100       mov word ptr [bp - 0x10], 1              
  122e  ff46f6           inc word ptr [bp - 0xa]                  
  1231  837ef000         cmp word ptr [bp - 0x10], 0              
  1235  7507             jne 0x123e                               
  1237  817ef6c800       cmp word ptr [bp - 0xa], 0xc8             ; "Quest"
  123c  7cbc             jl 0x11fa                                
  123e  817ef6c800       cmp word ptr [bp - 0xa], 0xc8             ; "Quest"
  1243  7c03             jl 0x1248                                
  1245  e96efb           jmp 0xdb6                                
  1248  b8042c           mov ax, 0x2c04                           
  124b  8ec0             mov es, ax                               
  124d  268b1e1001       mov bx, word ptr es:[0x110]              
  1252  6bdb0c           imul bx, bx, 0xc                         
  1255  b8042c           mov ax, 0x2c04                           
  1258  8ec0             mov es, ax                               
  125a  2689bf0911       mov word ptr es:[bx + 0x1109], di        
  125f  66680c000a00     push 0xa000c                             
  1265  6a01             push 1                                   
  1267  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  126c  83c406           add sp, 6                                
  126f  ba042c           mov dx, 0x2c04                           
  1272  8ec2             mov es, dx                               
  1274  268b1e1001       mov bx, word ptr es:[0x110]              
  1279  6bdb0c           imul bx, bx, 0xc                         
  127c  ba042c           mov dx, 0x2c04                           
  127f  8ec2             mov es, dx                               
  1281  2689870b11       mov word ptr es:[bx + 0x110b], ax        
  1286  b8042c           mov ax, 0x2c04                           
  1289  8ec0             mov es, ax                               
  128b  268b1e1001       mov bx, word ptr es:[0x110]              
  1290  6bdb0c           imul bx, bx, 0xc                         
  1293  b8042c           mov ax, 0x2c04                           
  1296  8ec0             mov es, ax                               
  1298  26c7870d110000   mov word ptr es:[bx + 0x110d], 0         
  129f  e96c02           jmp 0x150e                               
ovl01_12a2:  ; case
  12a2  b8042c           mov ax, 0x2c04                           
  12a5  8ec0             mov es, ax                               
  12a7  26833e5b0100     cmp word ptr es:[0x15b], 0               
  12ad  7403             je 0x12b2                                
  12af  e904fb           jmp 0xdb6                                
  12b2  c746f00000       mov word ptr [bp - 0x10], 0              
  12b7  c746f60000       mov word ptr [bp - 0xa], 0               
  12bc  e9cd00           jmp 0x138c                               
  12bf  837e0600         cmp word ptr [bp + 6], 0                 
  12c3  7405             je 0x12ca                                
  12c5  b82800           mov ax, 0x28                             
  12c8  eb03             jmp 0x12cd                               
  12ca  b83c00           mov ax, 0x3c                             
  12cd  8946ec           mov word ptr [bp - 0x14], ax             
  12d0  6aff             push -1                                  
  12d2  b8042c           mov ax, 0x2c04                           
  12d5  8ec0             mov es, ax                               
  12d7  26ff367b15       push word ptr es:[0x157b]                
  12dc  6a01             push 1                                   
  12de  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  12e3  83c406           add sp, 6                                
  12e6  8bf8             mov di, ax                               
  12e8  8bdf             mov bx, di                               
  12ea  6bdb41           imul bx, bx, 0x41                        
  12ed  b8042c           mov ax, 0x2c04                           
  12f0  8ec0             mov es, ax                               
  12f2  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  12f7  98               cwde                                     
  12f8  ba042c           mov dx, 0x2c04                           
  12fb  8ec2             mov es, dx                               
  12fd  263b061001       cmp ax, word ptr es:[0x110]              
  1302  7503             jne 0x1307                               
  1304  e98200           jmp 0x1389                               
  1307  8bdf             mov bx, di                               
  1309  6bdb41           imul bx, bx, 0x41                        
  130c  b8042c           mov ax, 0x2c04                           
  130f  8ec0             mov es, ax                               
  1311  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  1316  69dbe000         imul bx, bx, 0xe0                        
  131a  8bf7             mov si, di                               
  131c  6bf641           imul si, si, 0x41                        
  131f  b8042c           mov ax, 0x2c04                           
  1322  8ec0             mov es, ax                               
  1324  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  1329  d1e0             shl ax, 1                                
  132b  03d8             add bx, ax                               
  132d  b81d1e           mov ax, 0x1e1d                           
  1330  8ec0             mov es, ax                               
  1332  268a9f0000       mov bl, byte ptr es:[bx]                 
  1337  81e3ff00         and bx, 0xff                             
  133b  b8042c           mov ax, 0x2c04                           
  133e  8ec0             mov es, ax                               
  1340  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1346  7541             jne 0x1389                               
  1348  8bdf             mov bx, di                               
  134a  6bdb41           imul bx, bx, 0x41                        
  134d  b8042c           mov ax, 0x2c04                           
  1350  8ec0             mov es, ax                               
  1352  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1357  8bdf             mov bx, di                               
  1359  6bdb41           imul bx, bx, 0x41                        
  135c  b8042c           mov ax, 0x2c04                           
  135f  8ec0             mov es, ax                               
  1361  26ffb77d15       push word ptr es:[bx + 0x157d]           
  1366  c41e5e5e         les bx, ptr [0x5e5e]                     
  136a  26ff7702         push word ptr es:[bx + 2]                
  136e  26ff37           push word ptr es:[bx]                    
  1371  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1376  83c408           add sp, 8                                
  1379  3b46ec           cmp ax, word ptr [bp - 0x14]             
  137c  7e06             jle 0x1384                               
  137e  837ef664         cmp word ptr [bp - 0xa], 0x64            
  1382  7c05             jl 0x1389                                
  1384  c746f00100       mov word ptr [bp - 0x10], 1              
  1389  ff46f6           inc word ptr [bp - 0xa]                  
  138c  837ef000         cmp word ptr [bp - 0x10], 0              
  1390  750a             jne 0x139c                               
  1392  817ef6c800       cmp word ptr [bp - 0xa], 0xc8             ; "Quest"
  1397  7d03             jge 0x139c                               
  1399  e923ff           jmp 0x12bf                               
  139c  817ef6c800       cmp word ptr [bp - 0xa], 0xc8             ; "Quest"
  13a1  7c03             jl 0x13a6                                
  13a3  e910fa           jmp 0xdb6                                
  13a6  e9f300           jmp 0x149c                               
ovl01_13a9:  ; case
  13a9  b8042c           mov ax, 0x2c04                           
  13ac  8ec0             mov es, ax                               
  13ae  26833e5b0100     cmp word ptr es:[0x15b], 0               
  13b4  7403             je 0x13b9                                
  13b6  e9fdf9           jmp 0xdb6                                
  13b9  c746f00000       mov word ptr [bp - 0x10], 0              
  13be  c746f60000       mov word ptr [bp - 0xa], 0               
  13c3  e9bc00           jmp 0x1482                               
  13c6  6aff             push -1                                  
  13c8  b8042c           mov ax, 0x2c04                           
  13cb  8ec0             mov es, ax                               
  13cd  26ff367b15       push word ptr es:[0x157b]                
  13d2  6a01             push 1                                   
  13d4  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  13d9  83c406           add sp, 6                                
  13dc  8bf8             mov di, ax                               
  13de  8bdf             mov bx, di                               
  13e0  6bdb41           imul bx, bx, 0x41                        
  13e3  b8042c           mov ax, 0x2c04                           
  13e6  8ec0             mov es, ax                               
  13e8  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  13ed  98               cwde                                     
  13ee  ba042c           mov dx, 0x2c04                           
  13f1  8ec2             mov es, dx                               
  13f3  263b061001       cmp ax, word ptr es:[0x110]              
  13f8  7503             jne 0x13fd                               
  13fa  e98200           jmp 0x147f                               
  13fd  8bdf             mov bx, di                               
  13ff  6bdb41           imul bx, bx, 0x41                        
  1402  b8042c           mov ax, 0x2c04                           
  1405  8ec0             mov es, ax                               
  1407  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  140c  69dbe000         imul bx, bx, 0xe0                        
  1410  8bf7             mov si, di                               
  1412  6bf641           imul si, si, 0x41                        
  1415  b8042c           mov ax, 0x2c04                           
  1418  8ec0             mov es, ax                               
  141a  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  141f  d1e0             shl ax, 1                                
  1421  03d8             add bx, ax                               
  1423  b81d1e           mov ax, 0x1e1d                           
  1426  8ec0             mov es, ax                               
  1428  268a9f0000       mov bl, byte ptr es:[bx]                 
  142d  81e3ff00         and bx, 0xff                             
  1431  b8042c           mov ax, 0x2c04                           
  1434  8ec0             mov es, ax                               
  1436  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  143c  7541             jne 0x147f                               
  143e  8bdf             mov bx, di                               
  1440  6bdb41           imul bx, bx, 0x41                        
  1443  b8042c           mov ax, 0x2c04                           
  1446  8ec0             mov es, ax                               
  1448  26ffb77f15       push word ptr es:[bx + 0x157f]           
  144d  8bdf             mov bx, di                               
  144f  6bdb41           imul bx, bx, 0x41                        
  1452  b8042c           mov ax, 0x2c04                           
  1455  8ec0             mov es, ax                               
  1457  26ffb77d15       push word ptr es:[bx + 0x157d]           
  145c  c41e5e5e         les bx, ptr [0x5e5e]                     
  1460  26ff7702         push word ptr es:[bx + 2]                
  1464  26ff37           push word ptr es:[bx]                    
  1467  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  146c  83c408           add sp, 8                                
  146f  3d3c00           cmp ax, 0x3c                             
  1472  7e06             jle 0x147a                               
  1474  837ef664         cmp word ptr [bp - 0xa], 0x64            
  1478  7c05             jl 0x147f                                
  147a  c746f00100       mov word ptr [bp - 0x10], 1              
  147f  ff46f6           inc word ptr [bp - 0xa]                  
  1482  837ef000         cmp word ptr [bp - 0x10], 0              
  1486  750a             jne 0x1492                               
  1488  817ef6c800       cmp word ptr [bp - 0xa], 0xc8             ; "Quest"
  148d  7d03             jge 0x1492                               
  148f  e934ff           jmp 0x13c6                               
  1492  817ef6c800       cmp word ptr [bp - 0xa], 0xc8             ; "Quest"
  1497  7c03             jl 0x149c                                
  1499  e91af9           jmp 0xdb6                                
  149c  b8042c           mov ax, 0x2c04                           
  149f  8ec0             mov es, ax                               
  14a1  268b1e1001       mov bx, word ptr es:[0x110]              
  14a6  6bdb0c           imul bx, bx, 0xc                         
  14a9  b8042c           mov ax, 0x2c04                           
  14ac  8ec0             mov es, ax                               
  14ae  2689bf0911       mov word ptr es:[bx + 0x1109], di        
  14b3  eb59             jmp 0x150e                               
ovl01_14b5:  ; case
  14b5  b8042c           mov ax, 0x2c04                           
  14b8  8ec0             mov es, ax                               
  14ba  268b1e1001       mov bx, word ptr es:[0x110]              
  14bf  6bdb0c           imul bx, bx, 0xc                         
  14c2  b8042c           mov ax, 0x2c04                           
  14c5  8ec0             mov es, ax                               
  14c7  26c78709110000   mov word ptr es:[bx + 0x1109], 0         
  14ce  b8042c           mov ax, 0x2c04                           
  14d1  8ec0             mov es, ax                               
  14d3  268b1e1001       mov bx, word ptr es:[0x110]              
  14d8  6bdb0c           imul bx, bx, 0xc                         
  14db  b8042c           mov ax, 0x2c04                           
  14de  8ec0             mov es, ax                               
  14e0  26c7870d110000   mov word ptr es:[bx + 0x110d], 0         
  14e7  66682c01f401     push 0x1f4012c                           
  14ed  6a03             push 3                                   
  14ef  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  14f4  83c406           add sp, 6                                
  14f7  ba042c           mov dx, 0x2c04                           
  14fa  8ec2             mov es, dx                               
  14fc  268b1e1001       mov bx, word ptr es:[0x110]              
  1501  6bdb0c           imul bx, bx, 0xc                         
  1504  ba042c           mov dx, 0x2c04                           
  1507  8ec2             mov es, dx                               
  1509  2689870b11       mov word ptr es:[bx + 0x110b], ax        
  150e  5f               pop di                                   
  150f  5e               pop si                                   
  1510  c9               leave                                    
  1511  cb               retf                                     
  1512  880e530f3a11de11 dw 0e88,0f53,113a,11de,12a2,13a9,14b5    jump table

ovl01_1520:  ; ENTRY
  1520  55               push bp                                  
  1521  8bec             mov bp, sp                               
  1523  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1528  6a02             push 2                                   
  152a  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  152f  59               pop cx                                   
  1530  66ff369c00       push dword ptr [0x9c]                    
  1535  b89400           mov ax, 0x94                             
  1538  8cda             mov dx, ds                               
  153a  b90800           mov cx, 8                                
  153d  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1542  6a2d             push 0x2d                                
  1544  9a7e029709       lcall 0x997, 0x27e                       -> 0997:027e
  1549  83c40e           add sp, 0xe                              
  154c  666800000300     push 0x30000                             
  1552  666801000f00     push 0xf0001                             
  1558  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  155d  83c408           add sp, 8                                
  1560  1e               push ds                                  
  1561  68c800           push 0xc8                                 ; "Quest"
  1564  6668b0014000     push 0x4001b0                            
  156a  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  156f  83c408           add sp, 8                                
  1572  6a11             push 0x11                                
  1574  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  1579  59               pop cx                                   
  157a  c7066a160100     mov word ptr [0x166a], 1                 
  1580  66684b010100     push 0x1014b                             
  1586  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  158b  83c404           add sp, 4                                
  158e  666a00           push 0                                   
  1591  666a00           push 0                                   
  1594  9a2000f230       lcall 0x30f2, 0x20                       -> ovl63:0000
  1599  83c408           add sp, 8                                
  159c  ff7608           push word ptr [bp + 8]                   
  159f  ff7606           push word ptr [bp + 6]                   
  15a2  90               nop                                      
  15a3  0e               push cs                                  
  15a4  e86700           call 0x160e                              
  15a7  83c404           add sp, 4                                
  15aa  6a01             push 1                                   
  15ac  b8042c           mov ax, 0x2c04                           
  15af  8ec0             mov es, ax                               
  15b1  268b1e1001       mov bx, word ptr es:[0x110]              
  15b6  6bdb0c           imul bx, bx, 0xc                         
  15b9  b8042c           mov ax, 0x2c04                           
  15bc  8ec0             mov es, ax                               
  15be  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  15c3  6bdb16           imul bx, bx, 0x16                        
  15c6  b81d1e           mov ax, 0x1e1d                           
  15c9  8ec0             mov es, ax                               
  15cb  26ffb78288       push word ptr es:[bx - 0x777e]           
  15d0  b8042c           mov ax, 0x2c04                           
  15d3  8ec0             mov es, ax                               
  15d5  268b1e1001       mov bx, word ptr es:[0x110]              
  15da  6bdb0c           imul bx, bx, 0xc                         
  15dd  b8042c           mov ax, 0x2c04                           
  15e0  8ec0             mov es, ax                               
  15e2  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  15e7  6bdb16           imul bx, bx, 0x16                        
  15ea  b81d1e           mov ax, 0x1e1d                           
  15ed  8ec0             mov es, ax                               
  15ef  26ffb78088       push word ptr es:[bx - 0x7780]           
  15f4  9a4300f230       lcall 0x30f2, 0x43                       -> ovl63:1f5f
  15f9  83c406           add sp, 6                                
  15fc  666a00           push 0                                   
  15ff  9a2500f230       lcall 0x30f2, 0x25                       -> ovl63:04d3
  1604  83c404           add sp, 4                                
  1607  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  160c  5d               pop bp                                   
  160d  cb               retf                                     

ovl01_160e:  ; ENTRY
  160e  55               push bp                                  
  160f  8bec             mov bp, sp                               
  1611  83ec5c           sub sp, 0x5c                             
  1614  56               push si                                  
  1615  57               push di                                  
  1616  bfb801           mov di, 0x1b8                            
  1619  be9100           mov si, 0x91                             
  161c  666807000100     push 0x10007                             
  1622  666a02           push 2                                   
  1625  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  162a  83c408           add sp, 8                                
  162d  8d46f4           lea ax, [bp - 0xc]                       
  1630  16               push ss                                  
  1631  50               push ax                                  
  1632  b8042c           mov ax, 0x2c04                           
  1635  8ec0             mov es, ax                               
  1637  26a11001         mov ax, word ptr es:[0x110]              
  163b  6bc00c           imul ax, ax, 0xc                         
  163e  050311           add ax, 0x1103                           
  1641  68042c           push 0x2c04                              
  1644  50               push ax                                  
  1645  b90c00           mov cx, 0xc                              
  1648  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  164d  8b5ef8           mov bx, word ptr [bp - 8]                
  1650  6bdb16           imul bx, bx, 0x16                        
  1653  b81d1e           mov ax, 0x1e1d                           
  1656  8ec0             mov es, ax                               
  1658  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  165d  98               cwde                                     
  165e  6bc014           imul ax, ax, 0x14                        
  1661  052302           add ax, 0x223                            
  1664  68042c           push 0x2c04                              
  1667  50               push ax                                  
  1668  1e               push ds                                  
  1669  68ce00           push 0xce                                 ; "%s's Quest"
  166c  16               push ss                                  
  166d  8d46a4           lea ax, [bp - 0x5c]                      
  1670  50               push ax                                  
  1671  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1676  83c40c           add sp, 0xc                              
  1679  16               push ss                                  
  167a  8d46a4           lea ax, [bp - 0x5c]                      
  167d  50               push ax                                  
  167e  56               push si                                  
  167f  57               push di                                  
  1680  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1685  83c408           add sp, 8                                
  1688  83c61e           add si, 0x1e                             
  168b  6a00             push 0                                   
  168d  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1692  59               pop cx                                   
  1693  6668a500a000     push 0xa000a5                            
  1699  686801           push 0x168                               
  169c  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  16a1  83c406           add sp, 6                                
  16a4  666a1c           push 0x1c                                
  16a7  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  16ac  83c404           add sp, 4                                
  16af  52               push dx                                  
  16b0  50               push ax                                  
  16b1  56               push si                                  
  16b2  57               push di                                  
  16b3  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  16b8  83c408           add sp, 8                                
  16bb  83c614           add si, 0x14                             
  16be  66681c000100     push 0x1001c                             
  16c4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  16c9  83c404           add sp, 4                                
  16cc  52               push dx                                  
  16cd  50               push ax                                  
  16ce  56               push si                                  
  16cf  57               push di                                  
  16d0  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  16d5  83c408           add sp, 8                                
  16d8  83c61e           add si, 0x1e                             
  16db  8b5e06           mov bx, word ptr [bp + 6]                
  16de  83fb03           cmp bx, 3                                
  16e1  7603             jbe 0x16e6                               
  16e3  e9af01           jmp 0x1895                               
  16e6  d1e3             shl bx, 1                                
  16e8  2effa79918       jmp word ptr cs:[bx + 0x1899]            
ovl01_16ed:  ; case
  16ed  666a1d           push 0x1d                                
  16f0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  16f5  83c404           add sp, 4                                
  16f8  52               push dx                                  
  16f9  50               push ax                                  
  16fa  56               push si                                  
  16fb  57               push di                                  
  16fc  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1701  83c408           add sp, 8                                
  1704  83c614           add si, 0x14                             
  1707  66681d000100     push 0x1001d                             
  170d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1712  83c404           add sp, 4                                
  1715  52               push dx                                  
  1716  50               push ax                                  
  1717  56               push si                                  
  1718  57               push di                                  
  1719  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  171e  83c408           add sp, 8                                
  1721  83c614           add si, 0x14                             
  1724  8b4608           mov ax, word ptr [bp + 8]                
  1727  6bc01f           imul ax, ax, 0x1f                        
  172a  051508           add ax, 0x815                            
  172d  68042c           push 0x2c04                              
  1730  50               push ax                                  
  1731  56               push si                                  
  1732  57               push di                                  
  1733  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1738  83c408           add sp, 8                                
  173b  6a08             push 8                                   
  173d  8b5e08           mov bx, word ptr [bp + 8]                
  1740  6bdb1f           imul bx, bx, 0x1f                        
  1743  b8042c           mov ax, 0x2c04                           
  1746  8ec0             mov es, ax                               
  1748  26ffb71308       push word ptr es:[bx + 0x813]            
  174d  8b5e08           mov bx, word ptr [bp + 8]                
  1750  6bdb1f           imul bx, bx, 0x1f                        
  1753  b8042c           mov ax, 0x2c04                           
  1756  8ec0             mov es, ax                               
  1758  26ffb71108       push word ptr es:[bx + 0x811]            
  175d  8b5ef8           mov bx, word ptr [bp - 8]                
  1760  6bdb16           imul bx, bx, 0x16                        
  1763  b81d1e           mov ax, 0x1e1d                           
  1766  8ec0             mov es, ax                               
  1768  26ffb78288       push word ptr es:[bx - 0x777e]           
  176d  8b5ef8           mov bx, word ptr [bp - 8]                
  1770  6bdb16           imul bx, bx, 0x16                        
  1773  b81d1e           mov ax, 0x1e1d                           
  1776  8ec0             mov es, ax                               
  1778  26ffb78088       push word ptr es:[bx - 0x7780]           
  177d  9a7f00e830       lcall 0x30e8, 0x7f                       -> ovl62:0a3f
  1782  83c40a           add sp, 0xa                              
  1785  6a08             push 8                                   
  1787  ff7608           push word ptr [bp + 8]                   
  178a  9a5700e830       lcall 0x30e8, 0x57                       -> ovl62:0806
  178f  83c404           add sp, 4                                
  1792  6a08             push 8                                   
  1794  ff7608           push word ptr [bp + 8]                   
  1797  9a6600e830       lcall 0x30e8, 0x66                       -> ovl62:0868
  179c  83c404           add sp, 4                                
  179f  e9f300           jmp 0x1895                               
ovl01_17a2:  ; case
  17a2  666a1e           push 0x1e                                
  17a5  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  17aa  83c404           add sp, 4                                
  17ad  52               push dx                                  
  17ae  50               push ax                                  
  17af  56               push si                                  
  17b0  57               push di                                  
  17b1  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  17b6  83c408           add sp, 8                                
  17b9  83c614           add si, 0x14                             
  17bc  66681e000100     push 0x1001e                             
  17c2  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  17c7  83c404           add sp, 4                                
  17ca  52               push dx                                  
  17cb  50               push ax                                  
  17cc  56               push si                                  
  17cd  57               push di                                  
  17ce  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  17d3  83c408           add sp, 8                                
  17d6  83c614           add si, 0x14                             
  17d9  8b4608           mov ax, word ptr [bp + 8]                
  17dc  6bc01d           imul ax, ax, 0x1d                        
  17df  05e90c           add ax, 0xce9                            
  17e2  68042c           push 0x2c04                              
  17e5  e9a200           jmp 0x188a                               
ovl01_17e8:  ; case
  17e8  666a1f           push 0x1f                                
  17eb  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  17f0  83c404           add sp, 4                                
  17f3  52               push dx                                  
  17f4  50               push ax                                  
  17f5  56               push si                                  
  17f6  57               push di                                  
  17f7  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  17fc  83c408           add sp, 8                                
  17ff  83c614           add si, 0x14                             
  1802  66681f000100     push 0x1001f                             
  1808  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  180d  83c404           add sp, 4                                
  1810  52               push dx                                  
  1811  50               push ax                                  
  1812  56               push si                                  
  1813  57               push di                                  
  1814  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1819  83c408           add sp, 8                                
  181c  83c614           add si, 0x14                             
  181f  6a13             push 0x13                                
  1821  9a89005830       lcall 0x3058, 0x89                       -> ovl44:14f4
  1826  59               pop cx                                   
  1827  52               push dx                                  
  1828  50               push ax                                  
  1829  eb3b             jmp 0x1866                               
ovl01_182b:  ; case
  182b  666a1f           push 0x1f                                
  182e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1833  83c404           add sp, 4                                
  1836  52               push dx                                  
  1837  50               push ax                                  
  1838  56               push si                                  
  1839  57               push di                                  
  183a  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  183f  83c408           add sp, 8                                
  1842  83c614           add si, 0x14                             
  1845  66681f000100     push 0x1001f                             
  184b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1850  83c404           add sp, 4                                
  1853  52               push dx                                  
  1854  50               push ax                                  
  1855  56               push si                                  
  1856  57               push di                                  
  1857  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  185c  83c408           add sp, 8                                
  185f  83c614           add si, 0x14                             
  1862  1e               push ds                                  
  1863  68d900           push 0xd9                                 ; "gold"
  1866  ff7608           push word ptr [bp + 8]                   
  1869  66681f000200     push 0x2001f                             
  186f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1874  83c404           add sp, 4                                
  1877  52               push dx                                  
  1878  50               push ax                                  
  1879  16               push ss                                  
  187a  8d46a4           lea ax, [bp - 0x5c]                      
  187d  50               push ax                                  
  187e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1883  83c40e           add sp, 0xe                              
  1886  16               push ss                                  
  1887  8d46a4           lea ax, [bp - 0x5c]                      
  188a  50               push ax                                  
  188b  56               push si                                  
  188c  57               push di                                  
  188d  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1892  83c408           add sp, 8                                
  1895  5f               pop di                                   
  1896  5e               pop si                                   
  1897  c9               leave                                    
  1898  cb               retf                                     
  1899  a217ed162b18e817 dw 17a2,16ed,182b,17e8                   jump table

ovl01_18a1:  ; ENTRY
  18a1  55               push bp                                  
  18a2  8bec             mov bp, sp                               
  18a4  83ec02           sub sp, 2                                
  18a7  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  18ac  16               push ss                                  
  18ad  8d46fe           lea ax, [bp - 2]                         
  18b0  50               push ax                                  
  18b1  c41e5e5e         les bx, ptr [0x5e5e]                     
  18b5  26ff7702         push word ptr es:[bx + 2]                
  18b9  26ff37           push word ptr es:[bx]                    
  18bc  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  18c1  83c408           add sp, 8                                
  18c4  8916645e         mov word ptr [0x5e64], dx                
  18c8  a3625e           mov word ptr [0x5e62], ax                
  18cb  837efe00         cmp word ptr [bp - 2], 0                 
  18cf  7e1a             jle 0x18eb                               
  18d1  6a00             push 0                                   
  18d3  ff76fe           push word ptr [bp - 2]                   
  18d6  9aec09620b       lcall 0xb62, 0x9ec                       -> 0b62:09ec
  18db  83c404           add sp, 4                                
  18de  66ff36625e       push dword ptr [0x5e62]                  
  18e3  9a3e001931       lcall 0x3119, 0x3e                       -> ovl67:06eb
  18e8  83c404           add sp, 4                                
  18eb  666801000100     push 0x10001                             
  18f1  6a01             push 1                                   
  18f3  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  18f8  83c406           add sp, 6                                
  18fb  66833e643f00     cmp dword ptr [0x3f64], 0                
  1901  7404             je 0x1907                                
  1903  ff1e643f         lcall [0x3f64]                           
  1907  c9               leave                                    
  1908  cb               retf                                     

ovl01_1909:  ; ENTRY
  1909  55               push bp                                  
  190a  8bec             mov bp, sp                               
  190c  83ec08           sub sp, 8                                
  190f  56               push si                                  
  1910  57               push di                                  
  1911  b8042c           mov ax, 0x2c04                           
  1914  8ec0             mov es, ax                               
  1916  268b1e1001       mov bx, word ptr es:[0x110]              
  191b  d1e3             shl bx, 1                                
  191d  83bfea5d0a       cmp word ptr [bx + 0x5dea], 0xa          
  1922  7d26             jge 0x194a                               
  1924  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  1929  3d0f00           cmp ax, 0xf                              
  192c  7e1c             jle 0x194a                               
  192e  6a05             push 5                                   
  1930  666801000300     push 0x30001                             
  1936  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  193b  83c406           add sp, 6                                
  193e  c45e06           les bx, ptr [bp + 6]                     
  1941  268907           mov word ptr es:[bx], ax                 
  1944  b80300           mov ax, 3                                
  1947  e9b402           jmp 0x1bfe                               
  194a  b8042c           mov ax, 0x2c04                           
  194d  8ec0             mov es, ax                               
  194f  268b1e1001       mov bx, word ptr es:[0x110]              
  1954  6bdb14           imul bx, bx, 0x14                        
  1957  b8042c           mov ax, 0x2c04                           
  195a  8ec0             mov es, ax                               
  195c  2683bf850164     cmp word ptr es:[bx + 0x185], 0x64       
  1962  7d03             jge 0x1967                               
  1964  e97e02           jmp 0x1be5                               
  1967  33ff             xor di, di                               
  1969  33f6             xor si, si                               
  196b  eb44             jmp 0x19b1                               
  196d  8bdf             mov bx, di                               
  196f  6bdb1d           imul bx, bx, 0x1d                        
  1972  b8042c           mov ax, 0x2c04                           
  1975  8ec0             mov es, ax                               
  1977  2680bfff0c00     cmp byte ptr es:[bx + 0xcff], 0          
  197d  7531             jne 0x19b0                               
  197f  8bc7             mov ax, di                               
  1981  6bc01d           imul ax, ax, 0x1d                        
  1984  ba042c           mov dx, 0x2c04                           
  1987  05e90c           add ax, 0xce9                            
  198a  b91e00           mov cx, 0x1e                             
  198d  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1992  9a34001d30       lcall 0x301d, 0x34                       -> ovl35:08f4
  1997  83c41e           add sp, 0x1e                             
  199a  0bc0             or ax, ax                                
  199c  7412             je 0x19b0                                
  199e  83ff08           cmp di, 8                                
  19a1  7d0c             jge 0x19af                               
  19a3  b8042c           mov ax, 0x2c04                           
  19a6  8ec0             mov es, ax                               
  19a8  26393e1001       cmp word ptr es:[0x110], di              
  19ad  7501             jne 0x19b0                               
  19af  46               inc si                                   
  19b0  47               inc di                                   
  19b1  83ff16           cmp di, 0x16                             
  19b4  7cb7             jl 0x196d                                
  19b6  33ff             xor di, di                               
  19b8  c746fc0000       mov word ptr [bp - 4], 0                 
  19bd  eb48             jmp 0x1a07                               
  19bf  8bdf             mov bx, di                               
  19c1  6bdb1f           imul bx, bx, 0x1f                        
  19c4  b8042c           mov ax, 0x2c04                           
  19c7  8ec0             mov es, ax                               
  19c9  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  19cf  7435             je 0x1a06                                
  19d1  8bdf             mov bx, di                               
  19d3  6bdb1f           imul bx, bx, 0x1f                        
  19d6  b8042c           mov ax, 0x2c04                           
  19d9  ba042c           mov dx, 0x2c04                           
  19dc  8ec2             mov es, dx                               
  19de  268a0e1001       mov cl, byte ptr es:[0x110]              
  19e3  ba0100           mov dx, 1                                
  19e6  d3e2             shl dx, cl                               
  19e8  8ec0             mov es, ax                               
  19ea  2685972e08       test word ptr es:[bx + 0x82e], dx        
  19ef  7515             jne 0x1a06                               
  19f1  8bdf             mov bx, di                               
  19f3  6bdb1f           imul bx, bx, 0x1f                        
  19f6  b8042c           mov ax, 0x2c04                           
  19f9  8ec0             mov es, ax                               
  19fb  2680bf290800     cmp byte ptr es:[bx + 0x829], 0          
  1a01  7403             je 0x1a06                                
  1a03  ff46fc           inc word ptr [bp - 4]                    
  1a06  47               inc di                                   
  1a07  b8042c           mov ax, 0x2c04                           
  1a0a  8ec0             mov es, ax                               
  1a0c  26393e0f08       cmp word ptr es:[0x80f], di              
  1a11  7fac             jg 0x19bf                                
  1a13  0bf6             or si, si                                
  1a15  7f03             jg 0x1a1a                                
  1a17  e98100           jmp 0x1a9b                               
  1a1a  666a03           push 3                                   
  1a1d  6a01             push 1                                   
  1a1f  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1a24  83c406           add sp, 6                                
  1a27  3d0100           cmp ax, 1                                
  1a2a  756f             jne 0x1a9b                               
  1a2c  6a00             push 0                                   
  1a2e  56               push si                                  
  1a2f  6a01             push 1                                   
  1a31  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1a36  83c406           add sp, 6                                
  1a39  8946fe           mov word ptr [bp - 2], ax                
  1a3c  33ff             xor di, di                               
  1a3e  33f6             xor si, si                               
  1a40  eb49             jmp 0x1a8b                               
  1a42  8bdf             mov bx, di                               
  1a44  6bdb1d           imul bx, bx, 0x1d                        
  1a47  b8042c           mov ax, 0x2c04                           
  1a4a  8ec0             mov es, ax                               
  1a4c  2680bfff0c00     cmp byte ptr es:[bx + 0xcff], 0          
  1a52  7536             jne 0x1a8a                               
  1a54  8bc7             mov ax, di                               
  1a56  6bc01d           imul ax, ax, 0x1d                        
  1a59  ba042c           mov dx, 0x2c04                           
  1a5c  05e90c           add ax, 0xce9                            
  1a5f  b91e00           mov cx, 0x1e                             
  1a62  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1a67  9a34001d30       lcall 0x301d, 0x34                       -> ovl35:08f4
  1a6c  83c41e           add sp, 0x1e                             
  1a6f  0bc0             or ax, ax                                
  1a71  7417             je 0x1a8a                                
  1a73  83ff08           cmp di, 8                                
  1a76  7d0c             jge 0x1a84                               
  1a78  b8042c           mov ax, 0x2c04                           
  1a7b  8ec0             mov es, ax                               
  1a7d  26393e1001       cmp word ptr es:[0x110], di              
  1a82  7506             jne 0x1a8a                               
  1a84  46               inc si                                   
  1a85  3b76fe           cmp si, word ptr [bp - 2]                
  1a88  7406             je 0x1a90                                
  1a8a  47               inc di                                   
  1a8b  83ff16           cmp di, 0x16                             
  1a8e  7cb2             jl 0x1a42                                
  1a90  c45e06           les bx, ptr [bp + 6]                     
  1a93  26893f           mov word ptr es:[bx], di                 
  1a96  33c0             xor ax, ax                               
  1a98  e96301           jmp 0x1bfe                               
  1a9b  0bf6             or si, si                                
  1a9d  7e03             jle 0x1aa2                               
  1a9f  e92c01           jmp 0x1bce                               
  1aa2  837efc00         cmp word ptr [bp - 4], 0                 
  1aa6  7f03             jg 0x1aab                                
  1aa8  e92301           jmp 0x1bce                               
  1aab  666a03           push 3                                   
  1aae  6a01             push 1                                   
  1ab0  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1ab5  83c406           add sp, 6                                
  1ab8  3d0200           cmp ax, 2                                
  1abb  7e03             jle 0x1ac0                               
  1abd  e90e01           jmp 0x1bce                               
  1ac0  c746fa1027       mov word ptr [bp - 6], 0x2710            
  1ac5  c746f80000       mov word ptr [bp - 8], 0                 
  1aca  33ff             xor di, di                               
  1acc  e9e200           jmp 0x1bb1                               
  1acf  8bdf             mov bx, di                               
  1ad1  6bdb1f           imul bx, bx, 0x1f                        
  1ad4  b8042c           mov ax, 0x2c04                           
  1ad7  8ec0             mov es, ax                               
  1ad9  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  1adf  7503             jne 0x1ae4                               
  1ae1  e9cc00           jmp 0x1bb0                               
  1ae4  8bdf             mov bx, di                               
  1ae6  6bdb1f           imul bx, bx, 0x1f                        
  1ae9  b8042c           mov ax, 0x2c04                           
  1aec  ba042c           mov dx, 0x2c04                           
  1aef  8ec2             mov es, dx                               
  1af1  268a0e1001       mov cl, byte ptr es:[0x110]              
  1af6  ba0100           mov dx, 1                                
  1af9  d3e2             shl dx, cl                               
  1afb  8ec0             mov es, ax                               
  1afd  2685972e08       test word ptr es:[bx + 0x82e], dx        
  1b02  7403             je 0x1b07                                
  1b04  e9a900           jmp 0x1bb0                               
  1b07  8bdf             mov bx, di                               
  1b09  6bdb1f           imul bx, bx, 0x1f                        
  1b0c  b8042c           mov ax, 0x2c04                           
  1b0f  8ec0             mov es, ax                               
  1b11  2680bf290800     cmp byte ptr es:[bx + 0x829], 0          
  1b17  7503             jne 0x1b1c                               
  1b19  e99400           jmp 0x1bb0                               
  1b1c  b8042c           mov ax, 0x2c04                           
  1b1f  8ec0             mov es, ax                               
  1b21  268b1e1001       mov bx, word ptr es:[0x110]              
  1b26  6bdb0c           imul bx, bx, 0xc                         
  1b29  b8042c           mov ax, 0x2c04                           
  1b2c  8ec0             mov es, ax                               
  1b2e  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  1b33  6bdb16           imul bx, bx, 0x16                        
  1b36  b81d1e           mov ax, 0x1e1d                           
  1b39  ba0000           mov dx, 0                                
  1b3c  81c28088         add dx, 0x8880                           
  1b40  03da             add bx, dx                               
  1b42  8bf7             mov si, di                               
  1b44  6bf61f           imul si, si, 0x1f                        
  1b47  ba042c           mov dx, 0x2c04                           
  1b4a  8ec2             mov es, dx                               
  1b4c  50               push ax                                  
  1b4d  268b841108       mov ax, word ptr es:[si + 0x811]         
  1b52  07               pop es                                   
  1b53  262b07           sub ax, word ptr es:[bx]                 
  1b56  99               cdq                                      
  1b57  33c2             xor ax, dx                               
  1b59  2bc2             sub ax, dx                               
  1b5b  8bc8             mov cx, ax                               
  1b5d  b8042c           mov ax, 0x2c04                           
  1b60  8ec0             mov es, ax                               
  1b62  268b1e1001       mov bx, word ptr es:[0x110]              
  1b67  6bdb0c           imul bx, bx, 0xc                         
  1b6a  b8042c           mov ax, 0x2c04                           
  1b6d  8ec0             mov es, ax                               
  1b6f  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  1b74  6bdb16           imul bx, bx, 0x16                        
  1b77  b81d1e           mov ax, 0x1e1d                           
  1b7a  8bf7             mov si, di                               
  1b7c  6bf61f           imul si, si, 0x1f                        
  1b7f  ba042c           mov dx, 0x2c04                           
  1b82  8ec2             mov es, dx                               
  1b84  53               push bx                                  
  1b85  50               push ax                                  
  1b86  268b841308       mov ax, word ptr es:[si + 0x813]         
  1b8b  07               pop es                                   
  1b8c  5b               pop bx                                   
  1b8d  262b878288       sub ax, word ptr es:[bx - 0x777e]        
  1b92  99               cdq                                      
  1b93  33c2             xor ax, dx                               
  1b95  2bc2             sub ax, dx                               
  1b97  8bd0             mov dx, ax                               
  1b99  3bca             cmp cx, dx                               
  1b9b  7e04             jle 0x1ba1                               
  1b9d  8bc1             mov ax, cx                               
  1b9f  eb02             jmp 0x1ba3                               
  1ba1  8bc2             mov ax, dx                               
  1ba3  8bd0             mov dx, ax                               
  1ba5  3b56fa           cmp dx, word ptr [bp - 6]                
  1ba8  7d06             jge 0x1bb0                               
  1baa  8956fa           mov word ptr [bp - 6], dx                
  1bad  897ef8           mov word ptr [bp - 8], di                
  1bb0  47               inc di                                   
  1bb1  b8042c           mov ax, 0x2c04                           
  1bb4  8ec0             mov es, ax                               
  1bb6  26393e0f08       cmp word ptr es:[0x80f], di              
  1bbb  7e03             jle 0x1bc0                               
  1bbd  e90fff           jmp 0x1acf                               
  1bc0  c45e06           les bx, ptr [bp + 6]                     
  1bc3  8b46f8           mov ax, word ptr [bp - 8]                
  1bc6  268907           mov word ptr es:[bx], ax                 
  1bc9  b80100           mov ax, 1                                
  1bcc  eb30             jmp 0x1bfe                               
  1bce  666a02           push 2                                   
  1bd1  6a01             push 1                                   
  1bd3  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1bd8  83c406           add sp, 6                                
  1bdb  3d0100           cmp ax, 1                                
  1bde  7505             jne 0x1be5                               
  1be0  6a02             push 2                                   
  1be2  e94bfd           jmp 0x1930                               
  1be5  6668e803e803     push 0x3e803e8                           
  1beb  6a02             push 2                                   
  1bed  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1bf2  83c406           add sp, 6                                
  1bf5  c45e06           les bx, ptr [bp + 6]                     
  1bf8  268907           mov word ptr es:[bx], ax                 
  1bfb  b80200           mov ax, 2                                
  1bfe  5f               pop di                                   
  1bff  5e               pop si                                   
  1c00  c9               leave                                    
  1c01  cb               retf                                     

ovl01_1c02:  ; ENTRY
  1c02  55               push bp                                  
  1c03  8bec             mov bp, sp                               
  1c05  56               push si                                  
  1c06  57               push di                                  
  1c07  8b7608           mov si, word ptr [bp + 8]                
  1c0a  8b5e06           mov bx, word ptr [bp + 6]                
  1c0d  83fb03           cmp bx, 3                                
  1c10  7603             jbe 0x1c15                               
  1c12  e95501           jmp 0x1d6a                               
  1c15  d1e3             shl bx, 1                                
  1c17  2effa7e51d       jmp word ptr cs:[bx + 0x1de5]            
ovl01_1c1c:  ; case
  1c1c  b8042c           mov ax, 0x2c04                           
  1c1f  8ec0             mov es, ax                               
  1c21  268b1e1001       mov bx, word ptr es:[0x110]              
  1c26  6bdb14           imul bx, bx, 0x14                        
  1c29  b8042c           mov ax, 0x2c04                           
  1c2c  8ec0             mov es, ax                               
  1c2e  2601b78501       add word ptr es:[bx + 0x185], si         
  1c33  e93401           jmp 0x1d6a                               
ovl01_1c36:  ; case
  1c36  8bde             mov bx, si                               
  1c38  6bdb1d           imul bx, bx, 0x1d                        
  1c3b  b8042c           mov ax, 0x2c04                           
  1c3e  8ec0             mov es, ax                               
  1c40  26c687ff0c03     mov byte ptr es:[bx + 0xcff], 3          
  1c46  b8042c           mov ax, 0x2c04                           
  1c49  8ec0             mov es, ax                               
  1c4b  268b1e1001       mov bx, word ptr es:[0x110]              
  1c50  6bdb0c           imul bx, bx, 0xc                         
  1c53  b8042c           mov ax, 0x2c04                           
  1c56  8ec0             mov es, ax                               
  1c58  268b870711       mov ax, word ptr es:[bx + 0x1107]        
  1c5d  8bde             mov bx, si                               
  1c5f  6bdb1d           imul bx, bx, 0x1d                        
  1c62  ba042c           mov dx, 0x2c04                           
  1c65  8ec2             mov es, dx                               
  1c67  268987000d       mov word ptr es:[bx + 0xd00], ax         
  1c6c  e9fb00           jmp 0x1d6a                               
ovl01_1c6f:  ; case
  1c6f  8bde             mov bx, si                               
  1c71  6bdb1f           imul bx, bx, 0x1f                        
  1c74  b8042c           mov ax, 0x2c04                           
  1c77  ba042c           mov dx, 0x2c04                           
  1c7a  8ec2             mov es, dx                               
  1c7c  268a0e1001       mov cl, byte ptr es:[0x110]              
  1c81  ba0100           mov dx, 1                                
  1c84  d3e2             shl dx, cl                               
  1c86  8ec0             mov es, ax                               
  1c88  2609972e08       or word ptr es:[bx + 0x82e], dx          
  1c8d  b8042c           mov ax, 0x2c04                           
  1c90  8ec0             mov es, ax                               
  1c92  26833e590100     cmp word ptr es:[0x159], 0               
  1c98  7407             je 0x1ca1                                
  1c9a  833e543200       cmp word ptr [0x3254], 0                 
  1c9f  741c             je 0x1cbd                                
  1ca1  b8042c           mov ax, 0x2c04                           
  1ca4  8ec0             mov es, ax                               
  1ca6  268b1e1001       mov bx, word ptr es:[0x110]              
  1cab  d1e3             shl bx, 1                                
  1cad  b8042c           mov ax, 0x2c04                           
  1cb0  8ec0             mov es, ax                               
  1cb2  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1cb8  7403             je 0x1cbd                                
  1cba  e9ad00           jmp 0x1d6a                               
  1cbd  8bde             mov bx, si                               
  1cbf  6bdb1f           imul bx, bx, 0x1f                        
  1cc2  b8042c           mov ax, 0x2c04                           
  1cc5  8ec0             mov es, ax                               
  1cc7  26ffb71308       push word ptr es:[bx + 0x813]            
  1ccc  8bde             mov bx, si                               
  1cce  6bdb1f           imul bx, bx, 0x1f                        
  1cd1  b8042c           mov ax, 0x2c04                           
  1cd4  8ec0             mov es, ax                               
  1cd6  26ffb71108       push word ptr es:[bx + 0x811]            
  1cdb  b8042c           mov ax, 0x2c04                           
  1cde  8ec0             mov es, ax                               
  1ce0  26ff361001       push word ptr es:[0x110]                 
  1ce5  9a8e00f930       lcall 0x30f9, 0x8e                       -> ovl64:1298
  1cea  83c406           add sp, 6                                
  1ced  b8042c           mov ax, 0x2c04                           
  1cf0  8ec0             mov es, ax                               
  1cf2  26ff361001       push word ptr es:[0x110]                 
  1cf7  9a5200f230       lcall 0x30f2, 0x52                       -> ovl63:2200
  1cfc  59               pop cx                                   
  1cfd  b8042c           mov ax, 0x2c04                           
  1d00  8ec0             mov es, ax                               
  1d02  26ff361001       push word ptr es:[0x110]                 
  1d07  9a39001d30       lcall 0x301d, 0x39                       -> ovl35:09f2
  1d0c  59               pop cx                                   
  1d0d  eb5b             jmp 0x1d6a                               
ovl01_1d0f:  ; case
  1d0f  33ff             xor di, di                               
  1d11  eb53             jmp 0x1d66                               
  1d13  b8042c           mov ax, 0x2c04                           
  1d16  8ec0             mov es, ax                               
  1d18  268b1e1001       mov bx, word ptr es:[0x110]              
  1d1d  6bdb0c           imul bx, bx, 0xc                         
  1d20  b8042c           mov ax, 0x2c04                           
  1d23  8ec0             mov es, ax                               
  1d25  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  1d2a  6bdb16           imul bx, bx, 0x16                        
  1d2d  b81d1e           mov ax, 0x1e1d                           
  1d30  8ec0             mov es, ax                               
  1d32  26ffb78288       push word ptr es:[bx - 0x777e]           
  1d37  b8042c           mov ax, 0x2c04                           
  1d3a  8ec0             mov es, ax                               
  1d3c  268b1e1001       mov bx, word ptr es:[0x110]              
  1d41  6bdb0c           imul bx, bx, 0xc                         
  1d44  b8042c           mov ax, 0x2c04                           
  1d47  8ec0             mov es, ax                               
  1d49  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  1d4e  6bdb16           imul bx, bx, 0x16                        
  1d51  b81d1e           mov ax, 0x1e1d                           
  1d54  8ec0             mov es, ax                               
  1d56  26ffb78088       push word ptr es:[bx - 0x7780]           
  1d5b  6a13             push 0x13                                
  1d5d  9a34001430       lcall 0x3014, 0x34                       -> ovl34:12e6
  1d62  83c406           add sp, 6                                
  1d65  47               inc di                                   
  1d66  3bfe             cmp di, si                               
  1d68  7ca9             jl 0x1d13                                
  1d6a  b8042c           mov ax, 0x2c04                           
  1d6d  8ec0             mov es, ax                               
  1d6f  268b1e1001       mov bx, word ptr es:[0x110]              
  1d74  6bdb0c           imul bx, bx, 0xc                         
  1d77  b8042c           mov ax, 0x2c04                           
  1d7a  8ec0             mov es, ax                               
  1d7c  268b9f0711       mov bx, word ptr es:[bx + 0x1107]        
  1d81  6bdb16           imul bx, bx, 0x16                        
  1d84  b81d1e           mov ax, 0x1e1d                           
  1d87  8ec0             mov es, ax                               
  1d89  268a878a88       mov al, byte ptr es:[bx - 0x7776]        
  1d8e  98               cwde                                     
  1d8f  6bc014           imul ax, ax, 0x14                        
  1d92  052302           add ax, 0x223                            
  1d95  68042c           push 0x2c04                              
  1d98  50               push ax                                  
  1d99  666a00           push 0                                   
  1d9c  6a02             push 2                                   
  1d9e  b8042c           mov ax, 0x2c04                           
  1da1  8ec0             mov es, ax                               
  1da3  26ff361001       push word ptr es:[0x110]                 
  1da8  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  1dad  83c40c           add sp, 0xc                              
  1db0  6a0a             push 0xa                                 
  1db2  b8042c           mov ax, 0x2c04                           
  1db5  8ec0             mov es, ax                               
  1db7  268b1e1001       mov bx, word ptr es:[0x110]              
  1dbc  6bdb0c           imul bx, bx, 0xc                         
  1dbf  b8042c           mov ax, 0x2c04                           
  1dc2  8ec0             mov es, ax                               
  1dc4  268b870711       mov ax, word ptr es:[bx + 0x1107]        
  1dc9  6bc016           imul ax, ax, 0x16                        
  1dcc  ba0000           mov dx, 0                                
  1dcf  03d0             add dx, ax                               
  1dd1  81c28088         add dx, 0x8880                           
  1dd5  681d1e           push 0x1e1d                              
  1dd8  52               push dx                                  
  1dd9  9a61007330       lcall 0x3073, 0x61                       -> ovl47:04f1
  1dde  83c406           add sp, 6                                
  1de1  5f               pop di                                   
  1de2  5e               pop si                                   
  1de3  5d               pop bp                                   
  1de4  cb               retf                                     
  1de5  361c6f1c1c1c0f1d dw 1c36,1c6f,1c1c,1d0f                   jump table

ovl01_1ded:  ; ENTRY
  1ded  55               push bp                                  
  1dee  8bec             mov bp, sp                               
  1df0  83ec12           sub sp, 0x12                             
  1df3  56               push si                                  
  1df4  57               push di                                  
  1df5  33ff             xor di, di                               
  1df7  c746fe0000       mov word ptr [bp - 2], 0                 
  1dfc  8d46ee           lea ax, [bp - 0x12]                      
  1dff  16               push ss                                  
  1e00  50               push ax                                  
  1e01  b8042c           mov ax, 0x2c04                           
  1e04  8ec0             mov es, ax                               
  1e06  26a11001         mov ax, word ptr es:[0x110]              
  1e0a  6bc00c           imul ax, ax, 0xc                         
  1e0d  050311           add ax, 0x1103                           
  1e10  68042c           push 0x2c04                              
  1e13  50               push ax                                  
  1e14  b90c00           mov cx, 0xc                              
  1e17  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  1e1c  837eee00         cmp word ptr [bp - 0x12], 0              
  1e20  7505             jne 0x1e27                               
  1e22  33c0             xor ax, ax                               
  1e24  e91a09           jmp 0x2741                               
  1e27  b8042c           mov ax, 0x2c04                           
  1e2a  8ec0             mov es, ax                               
  1e2c  268b1e1001       mov bx, word ptr es:[0x110]              
  1e31  6bdb0c           imul bx, bx, 0xc                         
  1e34  b8042c           mov ax, 0x2c04                           
  1e37  8ec0             mov es, ax                               
  1e39  268b870711       mov ax, word ptr es:[bx + 0x1107]        
  1e3e  8946fc           mov word ptr [bp - 4], ax                
  1e41  8b5efc           mov bx, word ptr [bp - 4]                
  1e44  6bdb16           imul bx, bx, 0x16                        
  1e47  b81d1e           mov ax, 0x1e1d                           
  1e4a  8ec0             mov es, ax                               
  1e4c  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  1e51  98               cwde                                     
  1e52  ba042c           mov dx, 0x2c04                           
  1e55  8ec2             mov es, dx                               
  1e57  263b061001       cmp ax, word ptr es:[0x110]              
  1e5c  744a             je 0x1ea8                                
  1e5e  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  1e63  0bc0             or ax, ax                                
  1e65  7525             jne 0x1e8c                               
  1e67  666820000100     push 0x10020                             
  1e6d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1e72  83c404           add sp, 4                                
  1e75  52               push dx                                  
  1e76  50               push ax                                  
  1e77  666a20           push 0x20                                
  1e7a  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1e7f  83c404           add sp, 4                                
  1e82  52               push dx                                  
  1e83  50               push ax                                  
  1e84  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  1e89  83c408           add sp, 8                                
  1e8c  b8042c           mov ax, 0x2c04                           
  1e8f  8ec0             mov es, ax                               
  1e91  268b1e1001       mov bx, word ptr es:[0x110]              
  1e96  6bdb0c           imul bx, bx, 0xc                         
  1e99  b8042c           mov ax, 0x2c04                           
  1e9c  8ec0             mov es, ax                               
  1e9e  26c78703110000   mov word ptr es:[bx + 0x1103], 0         
  1ea5  e97aff           jmp 0x1e22                               
  1ea8  8b5e06           mov bx, word ptr [bp + 6]                
  1eab  43               inc bx                                   
  1eac  83fb05           cmp bx, 5                                
  1eaf  7603             jbe 0x1eb4                               
  1eb1  e93108           jmp 0x26e5                               
  1eb4  d1e3             shl bx, 1                                
  1eb6  2effa74527       jmp word ptr cs:[bx + 0x2745]            
ovl01_1ebb:  ; case
  1ebb  837ef004         cmp word ptr [bp - 0x10], 4              
  1ebf  7568             jne 0x1f29                               
  1ec1  8b5ef4           mov bx, word ptr [bp - 0xc]              
  1ec4  6bdb41           imul bx, bx, 0x41                        
  1ec7  b8042c           mov ax, 0x2c04                           
  1eca  8ec0             mov es, ax                               
  1ecc  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  1ed1  69dbe000         imul bx, bx, 0xe0                        
  1ed5  8b76f4           mov si, word ptr [bp - 0xc]              
  1ed8  6bf641           imul si, si, 0x41                        
  1edb  b8042c           mov ax, 0x2c04                           
  1ede  8ec0             mov es, ax                               
  1ee0  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  1ee5  d1e0             shl ax, 1                                
  1ee7  03d8             add bx, ax                               
  1ee9  b81d1e           mov ax, 0x1e1d                           
  1eec  8ec0             mov es, ax                               
  1eee  268a9f0000       mov bl, byte ptr es:[bx]                 
  1ef3  81e3ff00         and bx, 0xff                             
  1ef7  b8042c           mov ax, 0x2c04                           
  1efa  8ec0             mov es, ax                               
  1efc  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1f02  7425             je 0x1f29                                
  1f04  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  1f09  0bc0             or ax, ax                                
  1f0b  7403             je 0x1f10                                
  1f0d  e97cff           jmp 0x1e8c                               
  1f10  666821000100     push 0x10021                             
  1f16  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1f1b  83c404           add sp, 4                                
  1f1e  52               push dx                                  
  1f1f  50               push ax                                  
  1f20  666a21           push 0x21                                
  1f23  e954ff           jmp 0x1e7a                               
  1f26  e963ff           jmp 0x1e8c                               
  1f29  837ef005         cmp word ptr [bp - 0x10], 5              
  1f2d  757a             jne 0x1fa9                               
  1f2f  8b5ef4           mov bx, word ptr [bp - 0xc]              
  1f32  6bdb41           imul bx, bx, 0x41                        
  1f35  b8042c           mov ax, 0x2c04                           
  1f38  8ec0             mov es, ax                               
  1f3a  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  1f3f  69dbe000         imul bx, bx, 0xe0                        
  1f43  8b76f4           mov si, word ptr [bp - 0xc]              
  1f46  6bf641           imul si, si, 0x41                        
  1f49  b8042c           mov ax, 0x2c04                           
  1f4c  8ec0             mov es, ax                               
  1f4e  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  1f53  d1e0             shl ax, 1                                
  1f55  03d8             add bx, ax                               
  1f57  b81d1e           mov ax, 0x1e1d                           
  1f5a  8ec0             mov es, ax                               
  1f5c  268a9f0000       mov bl, byte ptr es:[bx]                 
  1f61  81e3ff00         and bx, 0xff                             
  1f65  b8042c           mov ax, 0x2c04                           
  1f68  8ec0             mov es, ax                               
  1f6a  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1f70  7437             je 0x1fa9                                
  1f72  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  1f77  0bc0             or ax, ax                                
  1f79  7403             je 0x1f7e                                
  1f7b  e90eff           jmp 0x1e8c                               
  1f7e  666821000100     push 0x10021                             
  1f84  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1f89  83c404           add sp, 4                                
  1f8c  52               push dx                                  
  1f8d  50               push ax                                  
  1f8e  666a21           push 0x21                                
  1f91  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1f96  83c404           add sp, 4                                
  1f99  52               push dx                                  
  1f9a  50               push ax                                  
  1f9b  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  1fa0  83c408           add sp, 8                                
  1fa3  e9e6fe           jmp 0x1e8c                               
  1fa6  e9e3fe           jmp 0x1e8c                               
  1fa9  837ef005         cmp word ptr [bp - 0x10], 5              
  1fad  7406             je 0x1fb5                                
  1faf  837ef004         cmp word ptr [bp - 0x10], 4              
  1fb3  7554             jne 0x2009                               
  1fb5  8b5ef4           mov bx, word ptr [bp - 0xc]              
  1fb8  6bdb41           imul bx, bx, 0x41                        
  1fbb  b8042c           mov ax, 0x2c04                           
  1fbe  8ec0             mov es, ax                               
  1fc0  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1fc5  98               cwde                                     
  1fc6  ba042c           mov dx, 0x2c04                           
  1fc9  8ec2             mov es, dx                               
  1fcb  263b061001       cmp ax, word ptr es:[0x110]              
  1fd0  7537             jne 0x2009                               
  1fd2  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  1fd7  0bc0             or ax, ax                                
  1fd9  7403             je 0x1fde                                
  1fdb  e9aefe           jmp 0x1e8c                               
  1fde  66682a000100     push 0x1002a                             
  1fe4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1fe9  83c404           add sp, 4                                
  1fec  52               push dx                                  
  1fed  50               push ax                                  
  1fee  666a2a           push 0x2a                                
  1ff1  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1ff6  83c404           add sp, 4                                
  1ff9  52               push dx                                  
  1ffa  50               push ax                                  
  1ffb  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  2000  83c408           add sp, 8                                
  2003  e986fe           jmp 0x1e8c                               
  2006  e983fe           jmp 0x1e8c                               
  2009  837ef000         cmp word ptr [bp - 0x10], 0              
  200d  754a             jne 0x2059                               
  200f  8b5ef4           mov bx, word ptr [bp - 0xc]              
  2012  6bdb16           imul bx, bx, 0x16                        
  2015  b81d1e           mov ax, 0x1e1d                           
  2018  8ec0             mov es, ax                               
  201a  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  2020  7437             je 0x2059                                
  2022  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  2027  0bc0             or ax, ax                                
  2029  7403             je 0x202e                                
  202b  e95efe           jmp 0x1e8c                               
  202e  666829000100     push 0x10029                             
  2034  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2039  83c404           add sp, 4                                
  203c  52               push dx                                  
  203d  50               push ax                                  
  203e  666a29           push 0x29                                
  2041  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2046  83c404           add sp, 4                                
  2049  52               push dx                                  
  204a  50               push ax                                  
  204b  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  2050  83c408           add sp, 8                                
  2053  e936fe           jmp 0x1e8c                               
  2056  e933fe           jmp 0x1e8c                               
  2059  837ef003         cmp word ptr [bp - 0x10], 3              
  205d  7549             jne 0x20a8                               
  205f  8b5ef4           mov bx, word ptr [bp - 0xc]              
  2062  d1e3             shl bx, 1                                
  2064  b8042c           mov ax, 0x2c04                           
  2067  8ec0             mov es, ax                               
  2069  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  206f  7537             jne 0x20a8                               
  2071  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  2076  0bc0             or ax, ax                                
  2078  7403             je 0x207d                                
  207a  e90ffe           jmp 0x1e8c                               
  207d  666827000100     push 0x10027                             
  2083  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2088  83c404           add sp, 4                                
  208b  52               push dx                                  
  208c  50               push ax                                  
  208d  666a27           push 0x27                                
  2090  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2095  83c404           add sp, 4                                
  2098  52               push dx                                  
  2099  50               push ax                                  
  209a  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  209f  83c408           add sp, 8                                
  20a2  e9e7fd           jmp 0x1e8c                               
  20a5  e9e4fd           jmp 0x1e8c                               
  20a8  837ef001         cmp word ptr [bp - 0x10], 1              
  20ac  7403             je 0x20b1                                
  20ae  e93406           jmp 0x26e5                               
  20b1  8b5ef4           mov bx, word ptr [bp - 0xc]              
  20b4  6bdb1d           imul bx, bx, 0x1d                        
  20b7  b8042c           mov ax, 0x2c04                           
  20ba  8ec0             mov es, ax                               
  20bc  2680bfff0c00     cmp byte ptr es:[bx + 0xcff], 0          
  20c2  7403             je 0x20c7                                
  20c4  e91e06           jmp 0x26e5                               
  20c7  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  20cc  0bc0             or ax, ax                                
  20ce  7403             je 0x20d3                                
  20d0  e9b9fd           jmp 0x1e8c                               
  20d3  666828000100     push 0x10028                             
  20d9  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  20de  83c404           add sp, 4                                
  20e1  52               push dx                                  
  20e2  50               push ax                                  
  20e3  666a28           push 0x28                                
  20e6  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  20eb  83c404           add sp, 4                                
  20ee  52               push dx                                  
  20ef  50               push ax                                  
  20f0  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  20f5  83c408           add sp, 8                                
  20f8  e991fd           jmp 0x1e8c                               
  20fb  e98efd           jmp 0x1e8c                               
ovl01_20fe:  ; case
  20fe  33f6             xor si, si                               
  2100  eb2b             jmp 0x212d                               
  2102  8b46f2           mov ax, word ptr [bp - 0xe]              
  2105  6bc016           imul ax, ax, 0x16                        
  2108  ba1d1e           mov dx, 0x1e1d                           
  210b  bb0000           mov bx, 0                                
  210e  81c38088         add bx, 0x8880                           
  2112  03c3             add ax, bx                               
  2114  8bde             mov bx, si                               
  2116  c1e302           shl bx, 2                                
  2119  3b97c842         cmp dx, word ptr [bx + 0x42c8]           
  211d  750d             jne 0x212c                               
  211f  3b87c642         cmp ax, word ptr [bx + 0x42c6]           
  2123  7507             jne 0x212c                               
  2125  c746fe0100       mov word ptr [bp - 2], 1                 
  212a  eb09             jmp 0x2135                               
  212c  46               inc si                                   
  212d  a0c442           mov al, byte ptr [0x42c4]                
  2130  98               cwde                                     
  2131  3bc6             cmp ax, si                               
  2133  7fcd             jg 0x2102                                
  2135  837efe00         cmp word ptr [bp - 2], 0                 
  2139  7503             jne 0x213e                               
  213b  e9a705           jmp 0x26e5                               
  213e  837ef003         cmp word ptr [bp - 0x10], 3              
  2142  7572             jne 0x21b6                               
  2144  a0fb41           mov al, byte ptr [0x41fb]                
  2147  98               cwde                                     
  2148  3b46f4           cmp ax, word ptr [bp - 0xc]              
  214b  7569             jne 0x21b6                               
  214d  33c9             xor cx, cx                               
  214f  33f6             xor si, si                               
  2151  eb0b             jmp 0x215e                               
  2153  8a842c42         mov al, byte ptr [si + 0x422c]           
  2157  98               cwde                                     
  2158  0bc0             or ax, ax                                
  215a  7501             jne 0x215d                               
  215c  41               inc cx                                   
  215d  46               inc si                                   
  215e  a0c542           mov al, byte ptr [0x42c5]                
  2161  98               cwde                                     
  2162  3bc6             cmp ax, si                               
  2164  7fed             jg 0x2153                                
  2166  b8042c           mov ax, 0x2c04                           
  2169  8ec0             mov es, ax                               
  216b  268b1e1001       mov bx, word ptr es:[0x110]              
  2170  6bdb0c           imul bx, bx, 0xc                         
  2173  b8042c           mov ax, 0x2c04                           
  2176  8ec0             mov es, ax                               
  2178  26018f0d11       add word ptr es:[bx + 0x110d], cx        
  217d  b8042c           mov ax, 0x2c04                           
  2180  8ec0             mov es, ax                               
  2182  268b1e1001       mov bx, word ptr es:[0x110]              
  2187  6bdb0c           imul bx, bx, 0xc                         
  218a  b8042c           mov ax, 0x2c04                           
  218d  8ec0             mov es, ax                               
  218f  268b870d11       mov ax, word ptr es:[bx + 0x110d]        
  2194  ba042c           mov dx, 0x2c04                           
  2197  8ec2             mov es, dx                               
  2199  268b1e1001       mov bx, word ptr es:[0x110]              
  219e  6bdb0c           imul bx, bx, 0xc                         
  21a1  ba042c           mov dx, 0x2c04                           
  21a4  8ec2             mov es, dx                               
  21a6  263b870b11       cmp ax, word ptr es:[bx + 0x110b]        
  21ab  7d03             jge 0x21b0                               
  21ad  e93505           jmp 0x26e5                               
  21b0  bf0100           mov di, 1                                
  21b3  e92f05           jmp 0x26e5                               
  21b6  837ef002         cmp word ptr [bp - 0x10], 2              
  21ba  7525             jne 0x21e1                               
  21bc  33f6             xor si, si                               
  21be  eb16             jmp 0x21d6                               
  21c0  8a842c42         mov al, byte ptr [si + 0x422c]           
  21c4  98               cwde                                     
  21c5  0bc0             or ax, ax                                
  21c7  750c             jne 0x21d5                               
  21c9  8a845442         mov al, byte ptr [si + 0x4254]           
  21cd  98               cwde                                     
  21ce  3b46f4           cmp ax, word ptr [bp - 0xc]              
  21d1  7502             jne 0x21d5                               
  21d3  ebdb             jmp 0x21b0                               
  21d5  46               inc si                                   
  21d6  a0c542           mov al, byte ptr [0x42c5]                
  21d9  98               cwde                                     
  21da  3bc6             cmp ax, si                               
  21dc  7fe2             jg 0x21c0                                
  21de  e90405           jmp 0x26e5                               
  21e1  837ef000         cmp word ptr [bp - 0x10], 0              
  21e5  7403             je 0x21ea                                
  21e7  e9fb04           jmp 0x26e5                               
  21ea  33f6             xor si, si                               
  21ec  eb2f             jmp 0x221d                               
  21ee  8a842c42         mov al, byte ptr [si + 0x422c]           
  21f2  98               cwde                                     
  21f3  0bc0             or ax, ax                                
  21f5  7525             jne 0x221c                               
  21f7  8b46f4           mov ax, word ptr [bp - 0xc]              
  21fa  6bc016           imul ax, ax, 0x16                        
  21fd  ba1d1e           mov dx, 0x1e1d                           
  2200  bb0000           mov bx, 0                                
  2203  81c38088         add bx, 0x8880                           
  2207  03c3             add ax, bx                               
  2209  8bde             mov bx, si                               
  220b  c1e302           shl bx, 2                                
  220e  3b97e842         cmp dx, word ptr [bx + 0x42e8]           
  2212  7508             jne 0x221c                               
  2214  3b87e642         cmp ax, word ptr [bx + 0x42e6]           
  2218  7502             jne 0x221c                               
  221a  eb94             jmp 0x21b0                               
  221c  46               inc si                                   
  221d  a0c542           mov al, byte ptr [0x42c5]                
  2220  98               cwde                                     
  2221  3bc6             cmp ax, si                               
  2223  7fc9             jg 0x21ee                                
  2225  e9bd04           jmp 0x26e5                               
ovl01_2228:  ; case
  2228  33f6             xor si, si                               
  222a  eb2b             jmp 0x2257                               
  222c  8b46f2           mov ax, word ptr [bp - 0xe]              
  222f  6bc016           imul ax, ax, 0x16                        
  2232  ba1d1e           mov dx, 0x1e1d                           
  2235  bb0000           mov bx, 0                                
  2238  81c38088         add bx, 0x8880                           
  223c  03c3             add ax, bx                               
  223e  8bde             mov bx, si                               
  2240  c1e302           shl bx, 2                                
  2243  3b97c842         cmp dx, word ptr [bx + 0x42c8]           
  2247  750d             jne 0x2256                               
  2249  3b87c642         cmp ax, word ptr [bx + 0x42c6]           
  224d  7507             jne 0x2256                               
  224f  c746fe0100       mov word ptr [bp - 2], 1                 
  2254  eb09             jmp 0x225f                               
  2256  46               inc si                                   
  2257  a0c442           mov al, byte ptr [0x42c4]                
  225a  98               cwde                                     
  225b  3bc6             cmp ax, si                               
  225d  7fcd             jg 0x222c                                
  225f  837ef004         cmp word ptr [bp - 0x10], 4              
  2263  7403             je 0x2268                                
  2265  e9aa00           jmp 0x2312                               
  2268  8b5ef4           mov bx, word ptr [bp - 0xc]              
  226b  6bdb41           imul bx, bx, 0x41                        
  226e  b8042c           mov ax, 0x2c04                           
  2271  8ec0             mov es, ax                               
  2273  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  2278  98               cwde                                     
  2279  ba042c           mov dx, 0x2c04                           
  227c  8ec2             mov es, dx                               
  227e  263b061001       cmp ax, word ptr es:[0x110]              
  2283  7403             je 0x2288                                
  2285  e98a00           jmp 0x2312                               
  2288  8b5ef4           mov bx, word ptr [bp - 0xc]              
  228b  6bdb41           imul bx, bx, 0x41                        
  228e  b8042c           mov ax, 0x2c04                           
  2291  8ec0             mov es, ax                               
  2293  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  2298  69dbe000         imul bx, bx, 0xe0                        
  229c  8b76f4           mov si, word ptr [bp - 0xc]              
  229f  6bf641           imul si, si, 0x41                        
  22a2  b8042c           mov ax, 0x2c04                           
  22a5  8ec0             mov es, ax                               
  22a7  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  22ac  d1e0             shl ax, 1                                
  22ae  03d8             add bx, ax                               
  22b0  b81d1e           mov ax, 0x1e1d                           
  22b3  8ec0             mov es, ax                               
  22b5  268a9f0000       mov bl, byte ptr es:[bx]                 
  22ba  81e3ff00         and bx, 0xff                             
  22be  b8042c           mov ax, 0x2c04                           
  22c1  8ec0             mov es, ax                               
  22c3  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  22c9  7547             jne 0x2312                               
  22cb  837efe00         cmp word ptr [bp - 2], 0                 
  22cf  753e             jne 0x230f                               
  22d1  b8042c           mov ax, 0x2c04                           
  22d4  8ec0             mov es, ax                               
  22d6  268b1e1001       mov bx, word ptr es:[0x110]              
  22db  6bdb0c           imul bx, bx, 0xc                         
  22de  b8042c           mov ax, 0x2c04                           
  22e1  8ec0             mov es, ax                               
  22e3  26c78703110000   mov word ptr es:[bx + 0x1103], 0         
  22ea  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  22ef  0bc0             or ax, ax                                
  22f1  7403             je 0x22f6                                
  22f3  e92cfb           jmp 0x1e22                               
  22f6  666822000100     push 0x10022                             
  22fc  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2301  83c404           add sp, 4                                
  2304  52               push dx                                  
  2305  50               push ax                                  
  2306  666a22           push 0x22                                
  2309  e9f902           jmp 0x2605                               
  230c  e913fb           jmp 0x1e22                               
  230f  bf0100           mov di, 1                                
  2312  837ef005         cmp word ptr [bp - 0x10], 5              
  2316  7403             je 0x231b                                
  2318  e9ca03           jmp 0x26e5                               
  231b  8b5ef4           mov bx, word ptr [bp - 0xc]              
  231e  6bdb41           imul bx, bx, 0x41                        
  2321  b8042c           mov ax, 0x2c04                           
  2324  8ec0             mov es, ax                               
  2326  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  232b  98               cwde                                     
  232c  ba042c           mov dx, 0x2c04                           
  232f  8ec2             mov es, dx                               
  2331  263b061001       cmp ax, word ptr es:[0x110]              
  2336  7403             je 0x233b                                
  2338  e9aa03           jmp 0x26e5                               
  233b  8b5ef4           mov bx, word ptr [bp - 0xc]              
  233e  6bdb41           imul bx, bx, 0x41                        
  2341  b8042c           mov ax, 0x2c04                           
  2344  8ec0             mov es, ax                               
  2346  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  234b  69dbe000         imul bx, bx, 0xe0                        
  234f  8b76f4           mov si, word ptr [bp - 0xc]              
  2352  6bf641           imul si, si, 0x41                        
  2355  b8042c           mov ax, 0x2c04                           
  2358  8ec0             mov es, ax                               
  235a  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  235f  d1e0             shl ax, 1                                
  2361  03d8             add bx, ax                               
  2363  b81d1e           mov ax, 0x1e1d                           
  2366  8ec0             mov es, ax                               
  2368  268a9f0000       mov bl, byte ptr es:[bx]                 
  236d  81e3ff00         and bx, 0xff                             
  2371  b8042c           mov ax, 0x2c04                           
  2374  8ec0             mov es, ax                               
  2376  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  237c  7403             je 0x2381                                
  237e  e96403           jmp 0x26e5                               
  2381  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  2386  0bc0             or ax, ax                                
  2388  7403             je 0x238d                                
  238a  e9fffa           jmp 0x1e8c                               
  238d  666823000100     push 0x10023                             
  2393  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2398  83c404           add sp, 4                                
  239b  52               push dx                                  
  239c  50               push ax                                  
  239d  666a23           push 0x23                                
  23a0  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  23a5  83c404           add sp, 4                                
  23a8  52               push dx                                  
  23a9  50               push ax                                  
  23aa  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  23af  83c408           add sp, 8                                
  23b2  e9d7fa           jmp 0x1e8c                               
  23b5  e9d4fa           jmp 0x1e8c                               
ovl01_23b8:  ; case
  23b8  33f6             xor si, si                               
  23ba  eb2b             jmp 0x23e7                               
  23bc  8b46f2           mov ax, word ptr [bp - 0xe]              
  23bf  6bc016           imul ax, ax, 0x16                        
  23c2  ba1d1e           mov dx, 0x1e1d                           
  23c5  bb0000           mov bx, 0                                
  23c8  81c38088         add bx, 0x8880                           
  23cc  03c3             add ax, bx                               
  23ce  8bde             mov bx, si                               
  23d0  c1e302           shl bx, 2                                
  23d3  3b97c842         cmp dx, word ptr [bx + 0x42c8]           
  23d7  750d             jne 0x23e6                               
  23d9  3b87c642         cmp ax, word ptr [bx + 0x42c6]           
  23dd  7507             jne 0x23e6                               
  23df  c746fe0100       mov word ptr [bp - 2], 1                 
  23e4  eb09             jmp 0x23ef                               
  23e6  46               inc si                                   
  23e7  a0c442           mov al, byte ptr [0x42c4]                
  23ea  98               cwde                                     
  23eb  3bc6             cmp ax, si                               
  23ed  7fcd             jg 0x23bc                                
  23ef  837ef005         cmp word ptr [bp - 0x10], 5              
  23f3  7409             je 0x23fe                                
  23f5  837ef004         cmp word ptr [bp - 0x10], 4              
  23f9  7403             je 0x23fe                                
  23fb  e99700           jmp 0x2495                               
  23fe  8b5ef4           mov bx, word ptr [bp - 0xc]              
  2401  6bdb41           imul bx, bx, 0x41                        
  2404  b8042c           mov ax, 0x2c04                           
  2407  8ec0             mov es, ax                               
  2409  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  240e  98               cwde                                     
  240f  ba042c           mov dx, 0x2c04                           
  2412  8ec2             mov es, dx                               
  2414  263b061001       cmp ax, word ptr es:[0x110]              
  2419  757a             jne 0x2495                               
  241b  8b5ef4           mov bx, word ptr [bp - 0xc]              
  241e  6bdb41           imul bx, bx, 0x41                        
  2421  b8042c           mov ax, 0x2c04                           
  2424  8ec0             mov es, ax                               
  2426  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  242b  69dbe000         imul bx, bx, 0xe0                        
  242f  8b76f4           mov si, word ptr [bp - 0xc]              
  2432  6bf641           imul si, si, 0x41                        
  2435  b8042c           mov ax, 0x2c04                           
  2438  8ec0             mov es, ax                               
  243a  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  243f  d1e0             shl ax, 1                                
  2441  03d8             add bx, ax                               
  2443  b81d1e           mov ax, 0x1e1d                           
  2446  8ec0             mov es, ax                               
  2448  268a9f0000       mov bl, byte ptr es:[bx]                 
  244d  81e3ff00         and bx, 0xff                             
  2451  b8042c           mov ax, 0x2c04                           
  2454  8ec0             mov es, ax                               
  2456  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  245c  7537             jne 0x2495                               
  245e  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  2463  0bc0             or ax, ax                                
  2465  7403             je 0x246a                                
  2467  e922fa           jmp 0x1e8c                               
  246a  666824000100     push 0x10024                             
  2470  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2475  83c404           add sp, 4                                
  2478  52               push dx                                  
  2479  50               push ax                                  
  247a  666a24           push 0x24                                
  247d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2482  83c404           add sp, 4                                
  2485  52               push dx                                  
  2486  50               push ax                                  
  2487  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  248c  83c408           add sp, 8                                
  248f  e9faf9           jmp 0x1e8c                               
  2492  e9f7f9           jmp 0x1e8c                               
  2495  837efe00         cmp word ptr [bp - 2], 0                 
  2499  7503             jne 0x249e                               
  249b  e94702           jmp 0x26e5                               
  249e  837ef006         cmp word ptr [bp - 0x10], 6              
  24a2  7403             je 0x24a7                                
  24a4  e93e02           jmp 0x26e5                               
  24a7  b8042c           mov ax, 0x2c04                           
  24aa  8ec0             mov es, ax                               
  24ac  268b1e1001       mov bx, word ptr es:[0x110]              
  24b1  6bdb0c           imul bx, bx, 0xc                         
  24b4  b8042c           mov ax, 0x2c04                           
  24b7  8b560a           mov dx, word ptr [bp + 0xa]              
  24ba  8ec0             mov es, ax                               
  24bc  2601970d11       add word ptr es:[bx + 0x110d], dx        
  24c1  b8042c           mov ax, 0x2c04                           
  24c4  8ec0             mov es, ax                               
  24c6  268b1e1001       mov bx, word ptr es:[0x110]              
  24cb  6bdb0c           imul bx, bx, 0xc                         
  24ce  b8042c           mov ax, 0x2c04                           
  24d1  8ec0             mov es, ax                               
  24d3  268b870d11       mov ax, word ptr es:[bx + 0x110d]        
  24d8  ba042c           mov dx, 0x2c04                           
  24db  8ec2             mov es, dx                               
  24dd  268b1e1001       mov bx, word ptr es:[0x110]              
  24e2  6bdb0c           imul bx, bx, 0xc                         
  24e5  ba042c           mov dx, 0x2c04                           
  24e8  8ec2             mov es, dx                               
  24ea  263b870b11       cmp ax, word ptr es:[bx + 0x110b]        
  24ef  7d03             jge 0x24f4                               
  24f1  e9f101           jmp 0x26e5                               
  24f4  e9b9fc           jmp 0x21b0                               
ovl01_24f7:  ; case
  24f7  33f6             xor si, si                               
  24f9  eb2b             jmp 0x2526                               
  24fb  8b46f2           mov ax, word ptr [bp - 0xe]              
  24fe  6bc016           imul ax, ax, 0x16                        
  2501  ba1d1e           mov dx, 0x1e1d                           
  2504  bb0000           mov bx, 0                                
  2507  81c38088         add bx, 0x8880                           
  250b  03c3             add ax, bx                               
  250d  8bde             mov bx, si                               
  250f  c1e302           shl bx, 2                                
  2512  3b97c842         cmp dx, word ptr [bx + 0x42c8]           
  2516  750d             jne 0x2525                               
  2518  3b87c642         cmp ax, word ptr [bx + 0x42c6]           
  251c  7507             jne 0x2525                               
  251e  c746fe0100       mov word ptr [bp - 2], 1                 
  2523  eb09             jmp 0x252e                               
  2525  46               inc si                                   
  2526  a0c442           mov al, byte ptr [0x42c4]                
  2529  98               cwde                                     
  252a  3bc6             cmp ax, si                               
  252c  7fcd             jg 0x24fb                                
  252e  837ef005         cmp word ptr [bp - 0x10], 5              
  2532  7403             je 0x2537                                
  2534  e9e900           jmp 0x2620                               
  2537  8b5ef4           mov bx, word ptr [bp - 0xc]              
  253a  6bdb41           imul bx, bx, 0x41                        
  253d  b8042c           mov ax, 0x2c04                           
  2540  8ec0             mov es, ax                               
  2542  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  2548  7403             je 0x254d                                
  254a  e9d300           jmp 0x2620                               
  254d  8b5ef4           mov bx, word ptr [bp - 0xc]              
  2550  6bdb41           imul bx, bx, 0x41                        
  2553  b8042c           mov ax, 0x2c04                           
  2556  8ec0             mov es, ax                               
  2558  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  255d  69dbe000         imul bx, bx, 0xe0                        
  2561  8b76f4           mov si, word ptr [bp - 0xc]              
  2564  6bf641           imul si, si, 0x41                        
  2567  b8042c           mov ax, 0x2c04                           
  256a  8ec0             mov es, ax                               
  256c  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  2571  d1e0             shl ax, 1                                
  2573  03d8             add bx, ax                               
  2575  b81d1e           mov ax, 0x1e1d                           
  2578  8ec0             mov es, ax                               
  257a  268a9f0000       mov bl, byte ptr es:[bx]                 
  257f  81e3ff00         and bx, 0xff                             
  2583  b8042c           mov ax, 0x2c04                           
  2586  8ec0             mov es, ax                               
  2588  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  258e  7503             jne 0x2593                               
  2590  e98d00           jmp 0x2620                               
  2593  8b5ef2           mov bx, word ptr [bp - 0xe]              
  2596  6bdb16           imul bx, bx, 0x16                        
  2599  b81d1e           mov ax, 0x1e1d                           
  259c  8ec0             mov es, ax                               
  259e  26ffb78288       push word ptr es:[bx - 0x777e]           
  25a3  8b5ef2           mov bx, word ptr [bp - 0xe]              
  25a6  6bdb16           imul bx, bx, 0x16                        
  25a9  b81d1e           mov ax, 0x1e1d                           
  25ac  ba0000           mov dx, 0                                
  25af  81c28088         add dx, 0x8880                           
  25b3  03da             add bx, dx                               
  25b5  8ec0             mov es, ax                               
  25b7  26ff37           push word ptr es:[bx]                    
  25ba  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  25bf  83c404           add sp, 4                                
  25c2  3b46f4           cmp ax, word ptr [bp - 0xc]              
  25c5  7559             jne 0x2620                               
  25c7  837efe00         cmp word ptr [bp - 2], 0                 
  25cb  7550             jne 0x261d                               
  25cd  b8042c           mov ax, 0x2c04                           
  25d0  8ec0             mov es, ax                               
  25d2  268b1e1001       mov bx, word ptr es:[0x110]              
  25d7  6bdb0c           imul bx, bx, 0xc                         
  25da  b8042c           mov ax, 0x2c04                           
  25dd  8ec0             mov es, ax                               
  25df  26c78703110000   mov word ptr es:[bx + 0x1103], 0         
  25e6  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  25eb  0bc0             or ax, ax                                
  25ed  7403             je 0x25f2                                
  25ef  e930f8           jmp 0x1e22                               
  25f2  666825000100     push 0x10025                             
  25f8  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  25fd  83c404           add sp, 4                                
  2600  52               push dx                                  
  2601  50               push ax                                  
  2602  666a25           push 0x25                                
  2605  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  260a  83c404           add sp, 4                                
  260d  52               push dx                                  
  260e  50               push ax                                  
  260f  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  2614  83c408           add sp, 8                                
  2617  e908f8           jmp 0x1e22                               
  261a  e905f8           jmp 0x1e22                               
  261d  bf0100           mov di, 1                                
  2620  837ef004         cmp word ptr [bp - 0x10], 4              
  2624  7403             je 0x2629                                
  2626  e9bc00           jmp 0x26e5                               
  2629  8b5ef4           mov bx, word ptr [bp - 0xc]              
  262c  6bdb41           imul bx, bx, 0x41                        
  262f  b8042c           mov ax, 0x2c04                           
  2632  8ec0             mov es, ax                               
  2634  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  2639  69dbe000         imul bx, bx, 0xe0                        
  263d  8b76f4           mov si, word ptr [bp - 0xc]              
  2640  6bf641           imul si, si, 0x41                        
  2643  b8042c           mov ax, 0x2c04                           
  2646  8ec0             mov es, ax                               
  2648  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  264d  d1e0             shl ax, 1                                
  264f  03d8             add bx, ax                               
  2651  b81d1e           mov ax, 0x1e1d                           
  2654  8ec0             mov es, ax                               
  2656  268a9f0000       mov bl, byte ptr es:[bx]                 
  265b  81e3ff00         and bx, 0xff                             
  265f  b8042c           mov ax, 0x2c04                           
  2662  8ec0             mov es, ax                               
  2664  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  266a  7479             je 0x26e5                                
  266c  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  2671  0bc0             or ax, ax                                
  2673  7403             je 0x2678                                
  2675  e914f8           jmp 0x1e8c                               
  2678  666826000100     push 0x10026                             
  267e  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2683  83c404           add sp, 4                                
  2686  52               push dx                                  
  2687  50               push ax                                  
  2688  666a26           push 0x26                                
  268b  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  2690  83c404           add sp, 4                                
  2693  52               push dx                                  
  2694  50               push ax                                  
  2695  9a8e00d730       lcall 0x30d7, 0x8e                       -> ovl61:1160
  269a  83c408           add sp, 8                                
  269d  e9ecf7           jmp 0x1e8c                               
  26a0  e9e9f7           jmp 0x1e8c                               
ovl01_26a3:  ; case
  26a3  837ef001         cmp word ptr [bp - 0x10], 1              
  26a7  753c             jne 0x26e5                               
  26a9  8b5ef4           mov bx, word ptr [bp - 0xc]              
  26ac  6bdb1d           imul bx, bx, 0x1d                        
  26af  b8042c           mov ax, 0x2c04                           
  26b2  8ec0             mov es, ax                               
  26b4  2680bfff0c03     cmp byte ptr es:[bx + 0xcff], 3          
  26ba  7529             jne 0x26e5                               
  26bc  8b5ef4           mov bx, word ptr [bp - 0xc]              
  26bf  6bdb1d           imul bx, bx, 0x1d                        
  26c2  b8042c           mov ax, 0x2c04                           
  26c5  8ec0             mov es, ax                               
  26c7  268b87000d       mov ax, word ptr es:[bx + 0xd00]         
  26cc  3b46f2           cmp ax, word ptr [bp - 0xe]              
  26cf  7514             jne 0x26e5                               
  26d1  8b5ef4           mov bx, word ptr [bp - 0xc]              
  26d4  6bdb1d           imul bx, bx, 0x1d                        
  26d7  b8042c           mov ax, 0x2c04                           
  26da  8ec0             mov es, ax                               
  26dc  26c687ff0c00     mov byte ptr es:[bx + 0xcff], 0          
  26e2  e9cbfa           jmp 0x21b0                               
  26e5  0bff             or di, di                                
  26e7  7456             je 0x273f                                
  26e9  b8042c           mov ax, 0x2c04                           
  26ec  8ec0             mov es, ax                               
  26ee  268b1e1001       mov bx, word ptr es:[0x110]              
  26f3  6bdb0c           imul bx, bx, 0xc                         
  26f6  b8042c           mov ax, 0x2c04                           
  26f9  8ec0             mov es, ax                               
  26fb  26c78703110000   mov word ptr es:[bx + 0x1103], 0         
  2702  668b460c         mov eax, dword ptr [bp + 0xc]            
  2706  66a3643f         mov dword ptr [0x3f64], eax              
  270a  16               push ss                                  
  270b  8d46fa           lea ax, [bp - 6]                         
  270e  50               push ax                                  
  270f  0e               push cs                                  
  2710  e8f6f1           call 0x1909                              
  2713  83c404           add sp, 4                                
  2716  8bf0             mov si, ax                               
  2718  ff76fa           push word ptr [bp - 6]                   
  271b  50               push ax                                  
  271c  0e               push cs                                  
  271d  e8e2f4           call 0x1c02                              
  2720  83c404           add sp, 4                                
  2723  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  2728  0bc0             or ax, ax                                
  272a  7513             jne 0x273f                               
  272c  6a03             push 3                                   
  272e  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  2733  59               pop cx                                   
  2734  ff76fa           push word ptr [bp - 6]                   
  2737  56               push si                                  
  2738  0e               push cs                                  
  2739  e8e4ed           call 0x1520                              
  273c  83c404           add sp, 4                                
  273f  8bc7             mov ax, di                               
  2741  5f               pop di                                   
  2742  5e               pop si                                   
  2743  c9               leave                                    
  2744  cb               retf                                     
  2745  bb1efe20b823f724 dw 1ebb,20fe,23b8,24f7,26a3,2228         jump table
