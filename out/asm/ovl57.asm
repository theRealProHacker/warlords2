; ovl57 stub 30ab file_off 0x714e0 size 0x22d7

ovl57_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  57               push di                                  
  0005  8b7e08           mov di, word ptr [bp + 8]                
  0008  8b760c           mov si, word ptr [bp + 0xc]              
  000b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0010  0bff             or di, di                                
  0012  7426             je 0x3a                                  
  0014  9a66009709       lcall 0x997, 0x66                        -> 0997:0066
  0019  83fe02           cmp si, 2                                
  001c  750c             jne 0x2a                                 
  001e  b8042c           mov ax, 0x2c04                           
  0021  8ec0             mov es, ax                               
  0023  26a12001         mov ax, word ptr es:[0x120]              
  0027  a3c828           mov word ptr [0x28c8], ax                
  002a  6a00             push 0                                   
  002c  9aca00d730       lcall 0x30d7, 0xca                       -> ovl61:092a
  0031  59               pop cx                                   
  0032  6a00             push 0                                   
  0034  9a2f137213       lcall 0x1372, 0x132f                     -> 1372:132f
  0039  59               pop cx                                   
  003a  6a00             push 0                                   
  003c  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  0041  59               pop cx                                   
  0042  83fe01           cmp si, 1                                
  0045  7408             je 0x4f                                  
  0047  6a17             push 0x17                                
  0049  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  004e  59               pop cx                                   
  004f  833ec82800       cmp word ptr [0x28c8], 0                 
  0054  741b             je 0x71                                  
  0056  837e0600         cmp word ptr [bp + 6], 0                 
  005a  740d             je 0x69                                  
  005c  837e0a00         cmp word ptr [bp + 0xa], 0               
  0060  741d             je 0x7f                                  
  0062  90               nop                                      
  0063  0e               push cs                                  
  0064  e88110           call 0x10e8                              
  0067  eb16             jmp 0x7f                                 
  0069  837e0a00         cmp word ptr [bp + 0xa], 0               
  006d  7410             je 0x7f                                  
  006f  eb06             jmp 0x77                                 
  0071  837e0a00         cmp word ptr [bp + 0xa], 0               
  0075  7408             je 0x7f                                  
  0077  6a01             push 1                                   
  0079  90               nop                                      
  007a  0e               push cs                                  
  007b  e81601           call 0x194                               
  007e  59               pop cx                                   
  007f  b8042c           mov ax, 0x2c04                           
  0082  8b16c828         mov dx, word ptr [0x28c8]                
  0086  8ec0             mov es, ax                               
  0088  2689162001       mov word ptr es:[0x120], dx              
  008d  83fe01           cmp si, 1                                
  0090  7405             je 0x97                                  
  0092  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0097  6a01             push 1                                   
  0099  9a2000a230       lcall 0x30a2, 0x20                       -> ovl55:0000
  009e  59               pop cx                                   
  009f  b8042c           mov ax, 0x2c04                           
  00a2  8ec0             mov es, ax                               
  00a4  26833e2e0100     cmp word ptr es:[0x12e], 0               
  00aa  7445             je 0xf1                                  
  00ac  33d2             xor dx, dx                               
  00ae  eb11             jmp 0xc1                                 
  00b0  8bda             mov bx, dx                               
  00b2  d1e3             shl bx, 1                                
  00b4  8b877823         mov ax, word ptr [bx + 0x2378]           
  00b8  8bda             mov bx, dx                               
  00ba  d1e3             shl bx, 1                                
  00bc  8987b423         mov word ptr [bx + 0x23b4], ax           
  00c0  42               inc dx                                   
  00c1  83fa0a           cmp dx, 0xa                              
  00c4  7cea             jl 0xb0                                  
  00c6  c7066a160000     mov word ptr [0x166a], 0                 
  00cc  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  00d1  666819000800     push 0x80019                             
  00d7  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  00dc  83c404           add sp, 4                                
  00df  52               push dx                                  
  00e0  50               push ax                                  
  00e1  9ac000d730       lcall 0x30d7, 0xc0                       -> ovl61:168d
  00e6  83c404           add sp, 4                                
  00e9  90               nop                                      
  00ea  0e               push cs                                  
  00eb  e8100c           call 0xcfe                               
  00ee  e99f00           jmp 0x190                                
  00f1  83fe01           cmp si, 1                                
  00f4  7405             je 0xfb                                  
  00f6  90               nop                                      
  00f7  0e               push cs                                  
  00f8  e84021           call 0x223b                              
  00fb  0bff             or di, di                                
  00fd  743c             je 0x13b                                 
  00ff  666a00           push 0                                   
  0102  9a6b00d730       lcall 0x30d7, 0x6b                       -> ovl61:0a10
  0107  83c404           add sp, 4                                
  010a  666800000300     push 0x30000                             
  0110  666802000f00     push 0xf0002                             
  0116  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  011b  83c408           add sp, 8                                
  011e  6668ffff0000     push 0xffff                              
  0124  90               nop                                      
  0125  0e               push cs                                  
  0126  e80b05           call 0x634                               
  0129  83c404           add sp, 4                                
  012c  90               nop                                      
  012d  0e               push cs                                  
  012e  e87a0a           call 0xbab                               
  0131  90               nop                                      
  0132  0e               push cs                                  
  0133  e8910f           call 0x10c7                              
  0136  90               nop                                      
  0137  0e               push cs                                  
  0138  e84d0e           call 0xf88                               
  013b  c7066a160000     mov word ptr [0x166a], 0                 
  0141  0bff             or di, di                                
  0143  7439             je 0x17e                                 
  0145  666a07           push 7                                   
  0148  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  014d  83c404           add sp, 4                                
  0150  52               push dx                                  
  0151  50               push ax                                  
  0152  666800023000     push 0x300200                            
  0158  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  015d  83c408           add sp, 8                                
  0160  666807000100     push 0x10007                             
  0166  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  016b  83c404           add sp, 4                                
  016e  52               push dx                                  
  016f  50               push ax                                  
  0170  66680002ce00     push 0xce0200                            
  0176  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  017b  83c408           add sp, 8                                
  017e  6a03             push 3                                   
  0180  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0185  59               pop cx                                   
  0186  90               nop                                      
  0187  0e               push cs                                  
  0188  e88b02           call 0x416                               
  018b  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0190  5f               pop di                                   
  0191  5e               pop si                                   
  0192  5d               pop bp                                   
  0193  cb               retf                                     

ovl57_0194:  ; ENTRY
  0194  55               push bp                                  
  0195  8bec             mov bp, sp                               
  0197  83ec64           sub sp, 0x64                             
  019a  56               push si                                  
  019b  57               push di                                  
  019c  8b7606           mov si, word ptr [bp + 6]                
  019f  0bf6             or si, si                                
  01a1  7503             jne 0x1a6                                
  01a3  e98500           jmp 0x22b                                
  01a6  666887000600     push 0x60087                             
  01ac  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  01b1  83c404           add sp, 4                                
  01b4  52               push dx                                  
  01b5  50               push ax                                  
  01b6  666887000500     push 0x50087                             
  01bc  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  01c1  83c404           add sp, 4                                
  01c4  52               push dx                                  
  01c5  50               push ax                                  
  01c6  666887000400     push 0x40087                             
  01cc  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  01d1  83c404           add sp, 4                                
  01d4  52               push dx                                  
  01d5  50               push ax                                  
  01d6  666887000300     push 0x30087                             
  01dc  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  01e1  83c404           add sp, 4                                
  01e4  52               push dx                                  
  01e5  50               push ax                                  
  01e6  666887000200     push 0x20087                             
  01ec  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  01f1  83c404           add sp, 4                                
  01f4  52               push dx                                  
  01f5  50               push ax                                  
  01f6  666887000100     push 0x10087                             
  01fc  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0201  83c404           add sp, 4                                
  0204  52               push dx                                  
  0205  50               push ax                                  
  0206  666887000000     push 0x87                                
  020c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0211  83c404           add sp, 4                                
  0214  52               push dx                                  
  0215  50               push ax                                  
  0216  9abb00d730       lcall 0x30d7, 0xbb                       -> ovl61:1471
  021b  83c41c           add sp, 0x1c                             
  021e  9a4300622f       lcall 0x2f62, 0x43                       -> ovl02:01b5
  0223  6a00             push 0                                   
  0225  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  022a  59               pop cx                                   
  022b  1e               push ds                                  
  022c  68a05d           push 0x5da0                              
  022f  1e               push ds                                  
  0230  68a05d           push 0x5da0                              
  0233  1e               push ds                                  
  0234  686525           push 0x2565                               ; "%s\%s.scn"
  0237  16               push ss                                  
  0238  8d46d8           lea ax, [bp - 0x28]                      
  023b  50               push ax                                  
  023c  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0241  83c410           add sp, 0x10                             
  0244  6a02             push 2                                   
  0246  16               push ss                                  
  0247  8d46d8           lea ax, [bp - 0x28]                      
  024a  50               push ax                                  
  024b  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0250  83c406           add sp, 6                                
  0253  8bf8             mov di, ax                               
  0255  0bff             or di, di                                
  0257  7d2c             jge 0x285                                
  0259  16               push ss                                  
  025a  8d46d8           lea ax, [bp - 0x28]                      
  025d  50               push ax                                  
  025e  666a00           push 0                                   
  0261  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  0266  83c404           add sp, 4                                
  0269  52               push dx                                  
  026a  50               push ax                                  
  026b  16               push ss                                  
  026c  8d469c           lea ax, [bp - 0x64]                      
  026f  50               push ax                                  
  0270  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0275  83c40c           add sp, 0xc                              
  0278  16               push ss                                  
  0279  8d469c           lea ax, [bp - 0x64]                      
  027c  50               push ax                                  
  027d  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  0282  83c404           add sp, 4                                
  0285  68e12e           push 0x2ee1                              
  0288  68042c           push 0x2c04                              
  028b  680000           push 0                                   
  028e  57               push di                                  
  028f  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0294  83c408           add sp, 8                                
  0297  57               push di                                  
  0298  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  029d  59               pop cx                                   
  029e  0bf6             or si, si                                
  02a0  7408             je 0x2aa                                 
  02a2  6a14             push 0x14                                
  02a4  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  02a9  59               pop cx                                   
  02aa  90               nop                                      
  02ab  0e               push cs                                  
  02ac  e87400           call 0x323                               
  02af  0bf6             or si, si                                
  02b1  7408             je 0x2bb                                 
  02b3  6a3c             push 0x3c                                
  02b5  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  02ba  59               pop cx                                   
  02bb  9a2000f72f       lcall 0x2ff7, 0x20                       -> ovl29:0000
  02c0  0bf6             or si, si                                
  02c2  7410             je 0x2d4                                 
  02c4  6a64             push 0x64                                
  02c6  9a4800622f       lcall 0x2f62, 0x48                       -> ovl02:01ff
  02cb  59               pop cx                                   
  02cc  6a0a             push 0xa                                 
  02ce  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  02d3  59               pop cx                                   
  02d4  9a5700f230       lcall 0x30f2, 0x57                       -> ovl63:232b
  02d9  33f6             xor si, si                               
  02db  eb3a             jmp 0x317                                
  02dd  8bde             mov bx, si                               
  02df  d1e3             shl bx, 1                                
  02e1  b8042c           mov ax, 0x2c04                           
  02e4  8ec0             mov es, ax                               
  02e6  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  02ec  7528             jne 0x316                                
  02ee  1e               push ds                                  
  02ef  686f25           push 0x256f                               ; "Not used"
  02f2  8bc6             mov ax, si                               
  02f4  6bc014           imul ax, ax, 0x14                        
  02f7  050000           add ax, 0                                
  02fa  68042c           push 0x2c04                              
  02fd  50               push ax                                  
  02fe  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0303  83c408           add sp, 8                                
  0306  8bde             mov bx, si                               
  0308  d1e3             shl bx, 1                                
  030a  b8042c           mov ax, 0x2c04                           
  030d  8ec0             mov es, ax                               
  030f  26c787c0000300   mov word ptr es:[bx + 0xc0], 3           
  0316  46               inc si                                   
  0317  83fe08           cmp si, 8                                
  031a  7cc1             jl 0x2dd                                 
  031c  b80100           mov ax, 1                                
  031f  5f               pop di                                   
  0320  5e               pop si                                   
  0321  c9               leave                                    
  0322  cb               retf                                     

ovl57_0323:  ; ENTRY
  0323  55               push bp                                  
  0324  8bec             mov bp, sp                               
  0326  81ec9600         sub sp, 0x96                             
  032a  56               push si                                  
  032b  1e               push ds                                  
  032c  68a05d           push 0x5da0                              
  032f  1e               push ds                                  
  0330  68a05d           push 0x5da0                              
  0333  1e               push ds                                  
  0334  687825           push 0x2578                               ; "%s\%s.map"
  0337  16               push ss                                  
  0338  8d46ce           lea ax, [bp - 0x32]                      
  033b  50               push ax                                  
  033c  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0341  83c410           add sp, 0x10                             
  0344  6a02             push 2                                   
  0346  16               push ss                                  
  0347  8d46ce           lea ax, [bp - 0x32]                      
  034a  50               push ax                                  
  034b  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0350  83c406           add sp, 6                                
  0353  8bf0             mov si, ax                               
  0355  0bf6             or si, si                                
  0357  7d2d             jge 0x386                                
  0359  16               push ss                                  
  035a  8d46ce           lea ax, [bp - 0x32]                      
  035d  50               push ax                                  
  035e  666a01           push 1                                   
  0361  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  0366  83c404           add sp, 4                                
  0369  52               push dx                                  
  036a  50               push ax                                  
  036b  16               push ss                                  
  036c  8d866aff         lea ax, [bp - 0x96]                      
  0370  50               push ax                                  
  0371  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0376  83c40c           add sp, 0xc                              
  0379  16               push ss                                  
  037a  8d46ce           lea ax, [bp - 0x32]                      
  037d  50               push ax                                  
  037e  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  0383  83c404           add sp, 4                                
  0386  688088           push 0x8880                              
  0389  681d1e           push 0x1e1d                              
  038c  680000           push 0                                   
  038f  56               push si                                  
  0390  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0395  83c408           add sp, 8                                
  0398  56               push si                                  
  0399  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  039e  59               pop cx                                   
  039f  1e               push ds                                  
  03a0  68a05d           push 0x5da0                              
  03a3  1e               push ds                                  
  03a4  68a05d           push 0x5da0                              
  03a7  1e               push ds                                  
  03a8  688225           push 0x2582                               ; "%s\%s.rd"
  03ab  16               push ss                                  
  03ac  8d46ce           lea ax, [bp - 0x32]                      
  03af  50               push ax                                  
  03b0  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  03b5  83c410           add sp, 0x10                             
  03b8  6a02             push 2                                   
  03ba  16               push ss                                  
  03bb  8d46ce           lea ax, [bp - 0x32]                      
  03be  50               push ax                                  
  03bf  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  03c4  83c406           add sp, 6                                
  03c7  8bf0             mov si, ax                               
  03c9  0bf6             or si, si                                
  03cb  7d2d             jge 0x3fa                                
  03cd  16               push ss                                  
  03ce  8d46ce           lea ax, [bp - 0x32]                      
  03d1  50               push ax                                  
  03d2  666a01           push 1                                   
  03d5  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  03da  83c404           add sp, 4                                
  03dd  52               push dx                                  
  03de  50               push ax                                  
  03df  16               push ss                                  
  03e0  8d866aff         lea ax, [bp - 0x96]                      
  03e4  50               push ax                                  
  03e5  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  03ea  83c40c           add sp, 0xc                              
  03ed  16               push ss                                  
  03ee  8d46ce           lea ax, [bp - 0x32]                      
  03f1  50               push ax                                  
  03f2  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  03f7  83c404           add sp, 4                                
  03fa  684044           push 0x4440                              
  03fd  68d919           push 0x19d9                              
  0400  680000           push 0                                   
  0403  56               push si                                  
  0404  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0409  83c408           add sp, 8                                
  040c  56               push si                                  
  040d  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0412  59               pop cx                                   
  0413  5e               pop si                                   
  0414  c9               leave                                    
  0415  cb               retf                                     

ovl57_0416:  ; ENTRY
  0416  55               push bp                                  
  0417  8bec             mov bp, sp                               
  0419  56               push si                                  
  041a  57               push di                                  
  041b  33ff             xor di, di                               
  041d  33f6             xor si, si                               
  041f  eb65             jmp 0x486                                
  0421  6a01             push 1                                   
  0423  8bc6             mov ax, si                               
  0425  057d00           add ax, 0x7d                             
  0428  50               push ax                                  
  0429  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  042e  83c404           add sp, 4                                
  0431  6a01             push 1                                   
  0433  8bc6             mov ax, si                               
  0435  058500           add ax, 0x85                             
  0438  50               push ax                                  
  0439  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  043e  83c404           add sp, 4                                
  0441  6a01             push 1                                   
  0443  8bc6             mov ax, si                               
  0445  059500           add ax, 0x95                             
  0448  50               push ax                                  
  0449  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  044e  83c404           add sp, 4                                
  0451  8bde             mov bx, si                               
  0453  d1e3             shl bx, 1                                
  0455  b8042c           mov ax, 0x2c04                           
  0458  8ec0             mov es, ax                               
  045a  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0460  7423             je 0x485                                 
  0462  8bde             mov bx, si                               
  0464  d1e3             shl bx, 1                                
  0466  b8042c           mov ax, 0x2c04                           
  0469  8ec0             mov es, ax                               
  046b  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  0471  7512             jne 0x485                                
  0473  8bde             mov bx, si                               
  0475  d1e3             shl bx, 1                                
  0477  b8042c           mov ax, 0x2c04                           
  047a  8ec0             mov es, ax                               
  047c  2683bfc00003     cmp word ptr es:[bx + 0xc0], 3           
  0482  7401             je 0x485                                 
  0484  47               inc di                                   
  0485  46               inc si                                   
  0486  83fe08           cmp si, 8                                
  0489  7c96             jl 0x421                                 
  048b  6a00             push 0                                   
  048d  90               nop                                      
  048e  0e               push cs                                  
  048f  e8af0d           call 0x1241                              
  0492  59               pop cx                                   
  0493  0bc0             or ax, ax                                
  0495  7504             jne 0x49b                                
  0497  6a01             push 1                                   
  0499  eb02             jmp 0x49d                                
  049b  6a00             push 0                                   
  049d  689100           push 0x91                                
  04a0  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04a5  83c404           add sp, 4                                
  04a8  6a01             push 1                                   
  04aa  90               nop                                      
  04ab  0e               push cs                                  
  04ac  e8920d           call 0x1241                              
  04af  59               pop cx                                   
  04b0  0bc0             or ax, ax                                
  04b2  7504             jne 0x4b8                                
  04b4  6a01             push 1                                   
  04b6  eb02             jmp 0x4ba                                
  04b8  6a00             push 0                                   
  04ba  689200           push 0x92                                
  04bd  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04c2  83c404           add sp, 4                                
  04c5  6a02             push 2                                   
  04c7  90               nop                                      
  04c8  0e               push cs                                  
  04c9  e8750d           call 0x1241                              
  04cc  59               pop cx                                   
  04cd  0bc0             or ax, ax                                
  04cf  7504             jne 0x4d5                                
  04d1  6a01             push 1                                   
  04d3  eb02             jmp 0x4d7                                
  04d5  6a00             push 0                                   
  04d7  689300           push 0x93                                
  04da  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04df  83c404           add sp, 4                                
  04e2  666894000100     push 0x10094                             
  04e8  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  04ed  83c404           add sp, 4                                
  04f0  b8042c           mov ax, 0x2c04                           
  04f3  8ec0             mov es, ax                               
  04f5  26833e160100     cmp word ptr es:[0x116], 0               
  04fb  7411             je 0x50e                                 
  04fd  688f00           push 0x8f                                
  0500  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0505  59               pop cx                                   
  0506  666890000100     push 0x10090                             
  050c  eb0f             jmp 0x51d                                
  050e  689000           push 0x90                                
  0511  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0516  59               pop cx                                   
  0517  66688f000100     push 0x1008f                             
  051d  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0522  83c404           add sp, 4                                
  0525  66688d000100     push 0x1008d                             
  052b  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0530  83c404           add sp, 4                                
  0533  66688e000100     push 0x1008e                             
  0539  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  053e  83c404           add sp, 4                                
  0541  66689d000100     push 0x1009d                             
  0547  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  054c  83c404           add sp, 4                                
  054f  0bff             or di, di                                
  0551  7404             je 0x557                                 
  0553  6a01             push 1                                   
  0555  eb02             jmp 0x559                                
  0557  6a02             push 2                                   
  0559  689e00           push 0x9e                                
  055c  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0561  83c404           add sp, 4                                
  0564  666a00           push 0                                   
  0567  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  056c  83c404           add sp, 4                                
  056f  6668f2010000     push 0x1f2                               
  0575  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  057a  83c404           add sp, 4                                
  057d  6668f4010000     push 0x1f4                               
  0583  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0588  83c404           add sp, 4                                
  058b  6668f5010000     push 0x1f5                               
  0591  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  0596  83c404           add sp, 4                                
  0599  9a4d007f30       lcall 0x307f, 0x4d                       -> ovl49:0e25
  059e  0bc0             or ax, ax                                
  05a0  7404             je 0x5a6                                 
  05a2  6a01             push 1                                   
  05a4  eb02             jmp 0x5a8                                
  05a6  6a00             push 0                                   
  05a8  68f601           push 0x1f6                               
  05ab  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  05b0  83c404           add sp, 4                                
  05b3  9a52007f30       lcall 0x307f, 0x52                       -> ovl49:0e42
  05b8  0bc0             or ax, ax                                
  05ba  7404             je 0x5c0                                 
  05bc  6a01             push 1                                   
  05be  eb02             jmp 0x5c2                                
  05c0  6a00             push 0                                   
  05c2  68f801           push 0x1f8                               
  05c5  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  05ca  83c404           add sp, 4                                
  05cd  b8042c           mov ax, 0x2c04                           
  05d0  8ec0             mov es, ax                               
  05d2  26833e200100     cmp word ptr es:[0x120], 0               
  05d8  7404             je 0x5de                                 
  05da  6a01             push 1                                   
  05dc  eb02             jmp 0x5e0                                
  05de  6a00             push 0                                   
  05e0  68f701           push 0x1f7                               
  05e3  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  05e8  83c404           add sp, 4                                
  05eb  6668f9010100     push 0x101f9                             
  05f1  9af80e7213       lcall 0x1372, 0xef8                      -> 1372:0ef8
  05f6  83c404           add sp, 4                                
  05f9  666a02           push 2                                   
  05fc  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  0601  83c404           add sp, 4                                
  0604  666a03           push 3                                   
  0607  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  060c  83c404           add sp, 4                                
  060f  666a04           push 4                                   
  0612  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  0617  83c404           add sp, 4                                
  061a  666a05           push 5                                   
  061d  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  0622  83c404           add sp, 4                                
  0625  666a07           push 7                                   
  0628  9aab0e7213       lcall 0x1372, 0xeab                      -> 1372:0eab
  062d  83c404           add sp, 4                                
  0630  5f               pop di                                   
  0631  5e               pop si                                   
  0632  5d               pop bp                                   
  0633  cb               retf                                     

ovl57_0634:  ; ENTRY
  0634  55               push bp                                  
  0635  8bec             mov bp, sp                               
  0637  83ec2a           sub sp, 0x2a                             
  063a  56               push si                                  
  063b  57               push di                                  
  063c  837e0600         cmp word ptr [bp + 6], 0                 
  0640  7d04             jge 0x646                                
  0642  33c0             xor ax, ax                               
  0644  eb03             jmp 0x649                                
  0646  8b4606           mov ax, word ptr [bp + 6]                
  0649  8946fe           mov word ptr [bp - 2], ax                
  064c  837e0600         cmp word ptr [bp + 6], 0                 
  0650  7d05             jge 0x657                                
  0652  b80800           mov ax, 8                                
  0655  eb04             jmp 0x65b                                
  0657  8b4606           mov ax, word ptr [bp + 6]                
  065a  40               inc ax                                   
  065b  8946fc           mov word ptr [bp - 4], ax                
  065e  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0663  8b76fe           mov si, word ptr [bp - 2]                
  0666  e9d403           jmp 0xa3d                                
  0669  837e0800         cmp word ptr [bp + 8], 0                 
  066d  7473             je 0x6e2                                 
  066f  8bde             mov bx, si                               
  0671  c1e303           shl bx, 3                                
  0674  8b87ce23         mov ax, word ptr [bx + 0x23ce]           
  0678  050900           add ax, 9                                
  067b  50               push ax                                  
  067c  8bde             mov bx, si                               
  067e  c1e303           shl bx, 3                                
  0681  8b87cc23         mov ax, word ptr [bx + 0x23cc]           
  0685  050200           add ax, 2                                
  0688  50               push ax                                  
  0689  8bde             mov bx, si                               
  068b  c1e303           shl bx, 3                                
  068e  8b87ca23         mov ax, word ptr [bx + 0x23ca]           
  0692  05f8ff           add ax, 0xfff8                           
  0695  50               push ax                                  
  0696  8bde             mov bx, si                               
  0698  c1e303           shl bx, 3                                
  069b  8b87c823         mov ax, word ptr [bx + 0x23c8]           
  069f  48               dec ax                                   
  06a0  50               push ax                                  
  06a1  16               push ss                                  
  06a2  8d46f2           lea ax, [bp - 0xe]                       
  06a5  50               push ax                                  
  06a6  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  06ab  83c40c           add sp, 0xc                              
  06ae  66ff76f2         push dword ptr [bp - 0xe]                
  06b2  16               push ss                                  
  06b3  8d46d6           lea ax, [bp - 0x2a]                      
  06b6  50               push ax                                  
  06b7  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  06bc  83c408           add sp, 8                                
  06bf  836ef210         sub word ptr [bp - 0xe], 0x10            
  06c3  836ef41e         sub word ptr [bp - 0xc], 0x1e            
  06c7  66ff76d6         push dword ptr [bp - 0x2a]               
  06cb  8d46f2           lea ax, [bp - 0xe]                       
  06ce  8cd2             mov dx, ss                               
  06d0  b90800           mov cx, 8                                
  06d3  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  06d8  6a19             push 0x19                                
  06da  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  06df  83c40e           add sp, 0xe                              
  06e2  837e0600         cmp word ptr [bp + 6], 0                 
  06e6  7c09             jl 0x6f1                                 
  06e8  837e0800         cmp word ptr [bp + 8], 0                 
  06ec  7503             jne 0x6f1                                
  06ee  e9d501           jmp 0x8c6                                
  06f1  8d46f2           lea ax, [bp - 0xe]                       
  06f4  16               push ss                                  
  06f5  50               push ax                                  
  06f6  8bc6             mov ax, si                               
  06f8  c1e003           shl ax, 3                                
  06fb  05c823           add ax, 0x23c8                           
  06fe  1e               push ds                                  
  06ff  50               push ax                                  
  0700  b90800           mov cx, 8                                
  0703  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0708  8d46ea           lea ax, [bp - 0x16]                      
  070b  16               push ss                                  
  070c  50               push ax                                  
  070d  8d46f2           lea ax, [bp - 0xe]                       
  0710  16               push ss                                  
  0711  50               push ax                                  
  0712  b90800           mov cx, 8                                
  0715  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  071a  ff4eea           dec word ptr [bp - 0x16]                 
  071d  ff4eec           dec word ptr [bp - 0x14]                 
  0720  8346ee02         add word ptr [bp - 0x12], 2              
  0724  8346f002         add word ptr [bp - 0x10], 2              
  0728  8d46e2           lea ax, [bp - 0x1e]                      
  072b  16               push ss                                  
  072c  50               push ax                                  
  072d  8d46f2           lea ax, [bp - 0xe]                       
  0730  16               push ss                                  
  0731  50               push ax                                  
  0732  b90800           mov cx, 8                                
  0735  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  073a  8d46da           lea ax, [bp - 0x26]                      
  073d  16               push ss                                  
  073e  50               push ax                                  
  073f  8d46f2           lea ax, [bp - 0xe]                       
  0742  16               push ss                                  
  0743  50               push ax                                  
  0744  b90800           mov cx, 8                                
  0747  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  074c  ff46da           inc word ptr [bp - 0x26]                 
  074f  ff46dc           inc word ptr [bp - 0x24]                 
  0752  836ede02         sub word ptr [bp - 0x22], 2              
  0756  836ee002         sub word ptr [bp - 0x20], 2              
  075a  8bde             mov bx, si                               
  075c  d1e3             shl bx, 1                                
  075e  b8042c           mov ax, 0x2c04                           
  0761  8ec0             mov es, ax                               
  0763  26ffb7a000       push word ptr es:[bx + 0xa0]             
  0768  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  076d  59               pop cx                                   
  076e  16               push ss                                  
  076f  8d46e2           lea ax, [bp - 0x1e]                      
  0772  50               push ax                                  
  0773  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0778  83c404           add sp, 4                                
  077b  66ff76ec         push dword ptr [bp - 0x14]               
  077f  ff76ea           push word ptr [bp - 0x16]                
  0782  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  0787  83c406           add sp, 6                                
  078a  ff76f0           push word ptr [bp - 0x10]                
  078d  66ff76ea         push dword ptr [bp - 0x16]               
  0791  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0796  83c406           add sp, 6                                
  0799  ff76de           push word ptr [bp - 0x22]                
  079c  8b46dc           mov ax, word ptr [bp - 0x24]             
  079f  0346e0           add ax, word ptr [bp - 0x20]             
  07a2  48               dec ax                                   
  07a3  50               push ax                                  
  07a4  ff76da           push word ptr [bp - 0x26]                
  07a7  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  07ac  83c406           add sp, 6                                
  07af  ff76e0           push word ptr [bp - 0x20]                
  07b2  ff76dc           push word ptr [bp - 0x24]                
  07b5  8b46da           mov ax, word ptr [bp - 0x26]             
  07b8  0346de           add ax, word ptr [bp - 0x22]             
  07bb  48               dec ax                                   
  07bc  50               push ax                                  
  07bd  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  07c2  83c406           add sp, 6                                
  07c5  8bde             mov bx, si                               
  07c7  d1e3             shl bx, 1                                
  07c9  b8042c           mov ax, 0x2c04                           
  07cc  8ec0             mov es, ax                               
  07ce  26ffb7b000       push word ptr es:[bx + 0xb0]             
  07d3  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  07d8  59               pop cx                                   
  07d9  66ff76dc         push dword ptr [bp - 0x24]               
  07dd  ff76da           push word ptr [bp - 0x26]                
  07e0  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  07e5  83c406           add sp, 6                                
  07e8  ff76e0           push word ptr [bp - 0x20]                
  07eb  66ff76da         push dword ptr [bp - 0x26]               
  07ef  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  07f4  83c406           add sp, 6                                
  07f7  ff76ee           push word ptr [bp - 0x12]                
  07fa  8b46ec           mov ax, word ptr [bp - 0x14]             
  07fd  0346f0           add ax, word ptr [bp - 0x10]             
  0800  48               dec ax                                   
  0801  50               push ax                                  
  0802  ff76ea           push word ptr [bp - 0x16]                
  0805  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  080a  83c406           add sp, 6                                
  080d  ff76f0           push word ptr [bp - 0x10]                
  0810  ff76ec           push word ptr [bp - 0x14]                
  0813  8b46ea           mov ax, word ptr [bp - 0x16]             
  0816  0346ee           add ax, word ptr [bp - 0x12]             
  0819  48               dec ax                                   
  081a  50               push ax                                  
  081b  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0820  83c406           add sp, 6                                
  0823  6a03             push 3                                   
  0825  8bde             mov bx, si                               
  0827  d1e3             shl bx, 1                                
  0829  b8042c           mov ax, 0x2c04                           
  082c  8ec0             mov es, ax                               
  082e  26ffb7b000       push word ptr es:[bx + 0xb0]             
  0833  8bde             mov bx, si                               
  0835  d1e3             shl bx, 1                                
  0837  b8042c           mov ax, 0x2c04                           
  083a  8ec0             mov es, ax                               
  083c  26ffb7a000       push word ptr es:[bx + 0xa0]             
  0841  6a02             push 2                                   
  0843  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0848  83c408           add sp, 8                                
  084b  8bc6             mov ax, si                               
  084d  6bc014           imul ax, ax, 0x14                        
  0850  050000           add ax, 0                                
  0853  68042c           push 0x2c04                              
  0856  50               push ax                                  
  0857  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  085c  83c404           add sp, 4                                
  085f  8946fa           mov word ptr [bp - 6], ax                
  0862  6a03             push 3                                   
  0864  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0869  59               pop cx                                   
  086a  6a14             push 0x14                                
  086c  8b46fa           mov ax, word ptr [bp - 6]                
  086f  050800           add ax, 8                                
  0872  50               push ax                                  
  0873  8bde             mov bx, si                               
  0875  c1e302           shl bx, 2                                
  0878  ffb77a24         push word ptr [bx + 0x247a]              
  087c  8bde             mov bx, si                               
  087e  c1e302           shl bx, 2                                
  0881  8b877824         mov ax, word ptr [bx + 0x2478]           
  0885  05fcff           add ax, 0xfffc                           
  0888  50               push ax                                  
  0889  16               push ss                                  
  088a  8d46f2           lea ax, [bp - 0xe]                       
  088d  50               push ax                                  
  088e  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0893  83c40c           add sp, 0xc                              
  0896  52               push dx                                  
  0897  50               push ax                                  
  0898  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  089d  83c404           add sp, 4                                
  08a0  8bc6             mov ax, si                               
  08a2  6bc014           imul ax, ax, 0x14                        
  08a5  050000           add ax, 0                                
  08a8  68042c           push 0x2c04                              
  08ab  50               push ax                                  
  08ac  8bde             mov bx, si                               
  08ae  c1e302           shl bx, 2                                
  08b1  ffb77a24         push word ptr [bx + 0x247a]              
  08b5  8bde             mov bx, si                               
  08b7  c1e302           shl bx, 2                                
  08ba  ffb77824         push word ptr [bx + 0x2478]              
  08be  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  08c3  83c408           add sp, 8                                
  08c6  8bde             mov bx, si                               
  08c8  d1e3             shl bx, 1                                
  08ca  b8042c           mov ax, 0x2c04                           
  08cd  8ec0             mov es, ax                               
  08cf  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  08d5  7505             jne 0x8dc                                
  08d7  b80400           mov ax, 4                                
  08da  eb0e             jmp 0x8ea                                
  08dc  8bde             mov bx, si                               
  08de  d1e3             shl bx, 1                                
  08e0  b8042c           mov ax, 0x2c04                           
  08e3  8ec0             mov es, ax                               
  08e5  268b87c000       mov ax, word ptr es:[bx + 0xc0]          
  08ea  8bf8             mov di, ax                               
  08ec  8bde             mov bx, si                               
  08ee  d1e3             shl bx, 1                                
  08f0  b8042c           mov ax, 0x2c04                           
  08f3  8ec0             mov es, ax                               
  08f5  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  08fb  7522             jne 0x91f                                
  08fd  8bde             mov bx, si                               
  08ff  d1e3             shl bx, 1                                
  0901  b8042c           mov ax, 0x2c04                           
  0904  8ec0             mov es, ax                               
  0906  2683bfe00000     cmp word ptr es:[bx + 0xe0], 0           
  090c  7411             je 0x91f                                 
  090e  8bde             mov bx, si                               
  0910  d1e3             shl bx, 1                                
  0912  b8042c           mov ax, 0x2c04                           
  0915  8ec0             mov es, ax                               
  0917  268bbfc000       mov di, word ptr es:[bx + 0xc0]          
  091c  83c707           add di, 7                                
  091f  83ff04           cmp di, 4                                
  0922  7523             jne 0x947                                
  0924  0bf6             or si, si                                
  0926  741a             je 0x942                                 
  0928  8bc6             mov ax, si                               
  092a  99               cdq                                      
  092b  2bc2             sub ax, dx                               
  092d  d1f8             sar ax, 1                                
  092f  50               push ax                                  
  0930  8bc6             mov ax, si                               
  0932  48               dec ax                                   
  0933  99               cdq                                      
  0934  2bc2             sub ax, dx                               
  0936  d1f8             sar ax, 1                                
  0938  5a               pop dx                                   
  0939  3bd0             cmp dx, ax                               
  093b  7505             jne 0x942                                
  093d  b80500           mov ax, 5                                
  0940  eb03             jmp 0x945                                
  0942  b80400           mov ax, 4                                
  0945  8bf8             mov di, ax                               
  0947  8bde             mov bx, si                               
  0949  d1e3             shl bx, 1                                
  094b  b8042c           mov ax, 0x2c04                           
  094e  8ec0             mov es, ax                               
  0950  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0956  7503             jne 0x95b                                
  0958  bf0600           mov di, 6                                
  095b  8bde             mov bx, si                               
  095d  c1e302           shl bx, 2                                
  0960  66ffb75824       push dword ptr [bx + 0x2458]             
  0965  8bc7             mov ax, di                               
  0967  c1e003           shl ax, 3                                
  096a  8cda             mov dx, ds                               
  096c  050824           add ax, 0x2408                           
  096f  b90800           mov cx, 8                                
  0972  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0977  6a1f             push 0x1f                                
  0979  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  097e  83c40e           add sp, 0xe                              
  0981  83ff07           cmp di, 7                                
  0984  7c03             jl 0x989                                 
  0986  83ef07           sub di, 7                                
  0989  83ff05           cmp di, 5                                
  098c  7503             jne 0x991                                
  098e  bf0400           mov di, 4                                
  0991  83ff06           cmp di, 6                                
  0994  7503             jne 0x999                                
  0996  bf0300           mov di, 3                                
  0999  8bde             mov bx, si                               
  099b  c1e302           shl bx, 2                                
  099e  66ffb79824       push dword ptr [bx + 0x2498]             
  09a3  8bc7             mov ax, di                               
  09a5  c1e003           shl ax, 3                                
  09a8  8cda             mov dx, ds                               
  09aa  05b824           add ax, 0x24b8                           
  09ad  b90800           mov cx, 8                                
  09b0  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  09b5  6a1f             push 0x1f                                
  09b7  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  09bc  83c40e           add sp, 0xe                              
  09bf  8bde             mov bx, si                               
  09c1  c1e302           shl bx, 2                                
  09c4  66ffb7fc24       push dword ptr [bx + 0x24fc]             
  09c9  8bde             mov bx, si                               
  09cb  d1e3             shl bx, 1                                
  09cd  b8042c           mov ax, 0x2c04                           
  09d0  8ec0             mov es, ax                               
  09d2  268b87e000       mov ax, word ptr es:[bx + 0xe0]          
  09d7  f7d8             neg ax                                   
  09d9  1bc0             sbb ax, ax                               
  09db  40               inc ax                                   
  09dc  c1e003           shl ax, 3                                
  09df  8cda             mov dx, ds                               
  09e1  05ec24           add ax, 0x24ec                           
  09e4  b90800           mov cx, 8                                
  09e7  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  09ec  6a1f             push 0x1f                                
  09ee  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  09f3  83c40e           add sp, 0xe                              
  09f6  6a03             push 3                                   
  09f8  8bde             mov bx, si                               
  09fa  d1e3             shl bx, 1                                
  09fc  b8042c           mov ax, 0x2c04                           
  09ff  8ec0             mov es, ax                               
  0a01  26ffb7b000       push word ptr es:[bx + 0xb0]             
  0a06  8bde             mov bx, si                               
  0a08  d1e3             shl bx, 1                                
  0a0a  b8042c           mov ax, 0x2c04                           
  0a0d  8ec0             mov es, ax                               
  0a0f  26ffb7a000       push word ptr es:[bx + 0xa0]             
  0a14  6a02             push 2                                   
  0a16  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0a1b  83c408           add sp, 8                                
  0a1e  1e               push ds                                  
  0a1f  688b25           push 0x258b                               ; "Character"
  0a22  8bde             mov bx, si                               
  0a24  c1e302           shl bx, 2                                
  0a27  ffb71e25         push word ptr [bx + 0x251e]              
  0a2b  8bde             mov bx, si                               
  0a2d  c1e302           shl bx, 2                                
  0a30  ffb71c25         push word ptr [bx + 0x251c]              
  0a34  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0a39  83c408           add sp, 8                                
  0a3c  46               inc si                                   
  0a3d  3b76fc           cmp si, word ptr [bp - 4]                
  0a40  7d03             jge 0xa45                                
  0a42  e924fc           jmp 0x669                                
  0a45  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0a4a  5f               pop di                                   
  0a4b  5e               pop si                                   
  0a4c  c9               leave                                    
  0a4d  cb               retf                                     

ovl57_0a4e:  ; ENTRY
  0a4e  55               push bp                                  
  0a4f  8bec             mov bp, sp                               
  0a51  83ec0a           sub sp, 0xa                              
  0a54  56               push si                                  
  0a55  57               push di                                  
  0a56  8b7606           mov si, word ptr [bp + 6]                
  0a59  8bde             mov bx, si                               
  0a5b  d1e3             shl bx, 1                                
  0a5d  b8042c           mov ax, 0x2c04                           
  0a60  8ec0             mov es, ax                               
  0a62  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0a68  7507             jne 0xa71                                
  0a6a  0e               push cs                                  
  0a6b  e8a8f9           call 0x416                               
  0a6e  e93601           jmp 0xba7                                
  0a71  8bde             mov bx, si                               
  0a73  d1e3             shl bx, 1                                
  0a75  b8042c           mov ax, 0x2c04                           
  0a78  8ec0             mov es, ax                               
  0a7a  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0a80  7505             jne 0xa87                                
  0a82  b80400           mov ax, 4                                
  0a85  eb0e             jmp 0xa95                                
  0a87  8bde             mov bx, si                               
  0a89  d1e3             shl bx, 1                                
  0a8b  b8042c           mov ax, 0x2c04                           
  0a8e  8ec0             mov es, ax                               
  0a90  268b87c000       mov ax, word ptr es:[bx + 0xc0]          
  0a95  8946fe           mov word ptr [bp - 2], ax                
  0a98  8bde             mov bx, si                               
  0a9a  d1e3             shl bx, 1                                
  0a9c  b8042c           mov ax, 0x2c04                           
  0a9f  8ec0             mov es, ax                               
  0aa1  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0aa7  751f             jne 0xac8                                
  0aa9  8bde             mov bx, si                               
  0aab  d1e3             shl bx, 1                                
  0aad  8ec0             mov es, ax                               
  0aaf  26c787d0000100   mov word ptr es:[bx + 0xd0], 1           
  0ab6  8bde             mov bx, si                               
  0ab8  d1e3             shl bx, 1                                
  0aba  b8042c           mov ax, 0x2c04                           
  0abd  8ec0             mov es, ax                               
  0abf  26c787c0000000   mov word ptr es:[bx + 0xc0], 0           
  0ac6  eb5e             jmp 0xb26                                
  0ac8  8bde             mov bx, si                               
  0aca  d1e3             shl bx, 1                                
  0acc  b8042c           mov ax, 0x2c04                           
  0acf  8ec0             mov es, ax                               
  0ad1  2683bfc00002     cmp word ptr es:[bx + 0xc0], 2           
  0ad7  750f             jne 0xae8                                
  0ad9  8bde             mov bx, si                               
  0adb  d1e3             shl bx, 1                                
  0add  8ec0             mov es, ax                               
  0adf  26c787c0000300   mov word ptr es:[bx + 0xc0], 3           
  0ae6  eb3e             jmp 0xb26                                
  0ae8  8bde             mov bx, si                               
  0aea  d1e3             shl bx, 1                                
  0aec  b8042c           mov ax, 0x2c04                           
  0aef  8ec0             mov es, ax                               
  0af1  2683bfc00003     cmp word ptr es:[bx + 0xc0], 3           
  0af7  751f             jne 0xb18                                
  0af9  8bde             mov bx, si                               
  0afb  d1e3             shl bx, 1                                
  0afd  8ec0             mov es, ax                               
  0aff  26c787c0000000   mov word ptr es:[bx + 0xc0], 0           
  0b06  8bde             mov bx, si                               
  0b08  d1e3             shl bx, 1                                
  0b0a  b8042c           mov ax, 0x2c04                           
  0b0d  8ec0             mov es, ax                               
  0b0f  26c787d0000000   mov word ptr es:[bx + 0xd0], 0           
  0b16  eb0e             jmp 0xb26                                
  0b18  8bde             mov bx, si                               
  0b1a  d1e3             shl bx, 1                                
  0b1c  b8042c           mov ax, 0x2c04                           
  0b1f  8ec0             mov es, ax                               
  0b21  26ff87c000       inc word ptr es:[bx + 0xc0]              
  0b26  8bde             mov bx, si                               
  0b28  d1e3             shl bx, 1                                
  0b2a  b8042c           mov ax, 0x2c04                           
  0b2d  8ec0             mov es, ax                               
  0b2f  26c787e0000000   mov word ptr es:[bx + 0xe0], 0           
  0b36  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0b3b  bf0100           mov di, 1                                
  0b3e  eb4a             jmp 0xb8a                                
  0b40  8d46f6           lea ax, [bp - 0xa]                       
  0b43  16               push ss                                  
  0b44  50               push ax                                  
  0b45  8b46fe           mov ax, word ptr [bp - 2]                
  0b48  c1e003           shl ax, 3                                
  0b4b  05b824           add ax, 0x24b8                           
  0b4e  1e               push ds                                  
  0b4f  50               push ax                                  
  0b50  b90800           mov cx, 8                                
  0b53  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0b58  8bc7             mov ax, di                               
  0b5a  f76efc           imul word ptr [bp - 4]                   
  0b5d  0146f8           add word ptr [bp - 8], ax                
  0b60  8bde             mov bx, si                               
  0b62  c1e302           shl bx, 2                                
  0b65  66ffb79824       push dword ptr [bx + 0x2498]             
  0b6a  8d46f6           lea ax, [bp - 0xa]                       
  0b6d  8cd2             mov dx, ss                               
  0b6f  b90800           mov cx, 8                                
  0b72  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0b77  6a1f             push 0x1f                                
  0b79  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0b7e  83c40e           add sp, 0xe                              
  0b81  6a01             push 1                                   
  0b83  9a4800c130       lcall 0x30c1, 0x48                       -> ovl59:0000
  0b88  59               pop cx                                   
  0b89  47               inc di                                   
  0b8a  83ff04           cmp di, 4                                
  0b8d  7cb1             jl 0xb40                                 
  0b8f  6a00             push 0                                   
  0b91  56               push si                                  
  0b92  0e               push cs                                  
  0b93  e89efa           call 0x634                               
  0b96  83c404           add sp, 4                                
  0b99  90               nop                                      
  0b9a  0e               push cs                                  
  0b9b  e80d00           call 0xbab                               
  0b9e  0e               push cs                                  
  0b9f  e874f8           call 0x416                               
  0ba2  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0ba7  5f               pop di                                   
  0ba8  5e               pop si                                   
  0ba9  c9               leave                                    
  0baa  cb               retf                                     

ovl57_0bab:  ; ENTRY
  0bab  55               push bp                                  
  0bac  8bec             mov bp, sp                               
  0bae  83ec0e           sub sp, 0xe                              
  0bb1  56               push si                                  
  0bb2  57               push di                                  
  0bb3  33c9             xor cx, cx                               
  0bb5  a1b423           mov ax, word ptr [0x23b4]                
  0bb8  c1e002           shl ax, 2                                
  0bbb  03c8             add cx, ax                               
  0bbd  a1b623           mov ax, word ptr [0x23b6]                
  0bc0  c1e002           shl ax, 2                                
  0bc3  03c8             add cx, ax                               
  0bc5  a1b823           mov ax, word ptr [0x23b8]                
  0bc8  6bc003           imul ax, ax, 3                           
  0bcb  03c8             add cx, ax                               
  0bcd  a1ba23           mov ax, word ptr [0x23ba]                
  0bd0  c1e002           shl ax, 2                                
  0bd3  03c8             add cx, ax                               
  0bd5  2b0ebc23         sub cx, word ptr [0x23bc]                
  0bd9  030ebe23         add cx, word ptr [0x23be]                
  0bdd  83f914           cmp cx, 0x14                             
  0be0  7c03             jl 0xbe5                                 
  0be2  b91400           mov cx, 0x14                             
  0be5  33ff             xor di, di                               
  0be7  33f6             xor si, si                               
  0be9  33d2             xor dx, dx                               
  0beb  eb43             jmp 0xc30                                
  0bed  8bda             mov bx, dx                               
  0bef  d1e3             shl bx, 1                                
  0bf1  b8042c           mov ax, 0x2c04                           
  0bf4  8ec0             mov es, ax                               
  0bf6  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0bfc  7431             je 0xc2f                                 
  0bfe  8bda             mov bx, dx                               
  0c00  d1e3             shl bx, 1                                
  0c02  b8042c           mov ax, 0x2c04                           
  0c05  8ec0             mov es, ax                               
  0c07  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  0c0d  7520             jne 0xc2f                                
  0c0f  8bda             mov bx, dx                               
  0c11  d1e3             shl bx, 1                                
  0c13  b8042c           mov ax, 0x2c04                           
  0c16  8ec0             mov es, ax                               
  0c18  2683bfc00003     cmp word ptr es:[bx + 0xc0], 3           
  0c1e  740f             je 0xc2f                                 
  0c20  8bda             mov bx, dx                               
  0c22  d1e3             shl bx, 1                                
  0c24  8ec0             mov es, ax                               
  0c26  268b87c000       mov ax, word ptr es:[bx + 0xc0]          
  0c2b  40               inc ax                                   
  0c2c  03f8             add di, ax                               
  0c2e  46               inc si                                   
  0c2f  42               inc dx                                   
  0c30  83fa08           cmp dx, 8                                
  0c33  7cb8             jl 0xbed                                 
  0c35  0bf6             or si, si                                
  0c37  7505             jne 0xc3e                                
  0c39  b85000           mov ax, 0x50                             
  0c3c  eb0d             jmp 0xc4b                                
  0c3e  8bc7             mov ax, di                               
  0c40  6bc050           imul ax, ax, 0x50                        
  0c43  8bde             mov bx, si                               
  0c45  6bdb03           imul bx, bx, 3                           
  0c48  99               cdq                                      
  0c49  f7fb             idiv bx                                  
  0c4b  8bd0             mov dx, ax                               
  0c4d  83fa4e           cmp dx, 0x4e                             
  0c50  7c03             jl 0xc55                                 
  0c52  ba5000           mov dx, 0x50                             
  0c55  8bc2             mov ax, dx                               
  0c57  03c1             add ax, cx                               
  0c59  8946fe           mov word ptr [bp - 2], ax                
  0c5c  50               push ax                                  
  0c5d  666a06           push 6                                   
  0c60  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0c65  83c404           add sp, 4                                
  0c68  52               push dx                                  
  0c69  50               push ax                                  
  0c6a  1e               push ds                                  
  0c6b  683859           push 0x5938                              
  0c6e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0c73  83c40a           add sp, 0xa                              
  0c76  666800000300     push 0x30000                             
  0c7c  666802000f00     push 0xf0002                             
  0c82  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0c87  83c408           add sp, 8                                
  0c8a  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0c8f  66ff36e424       push dword ptr [0x24e4]                  
  0c94  16               push ss                                  
  0c95  8d46fa           lea ax, [bp - 6]                         
  0c98  50               push ax                                  
  0c99  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0c9e  83c408           add sp, 8                                
  0ca1  8d46f2           lea ax, [bp - 0xe]                       
  0ca4  16               push ss                                  
  0ca5  50               push ax                                  
  0ca6  1e               push ds                                  
  0ca7  68e424           push 0x24e4                              
  0caa  b90800           mov cx, 8                                
  0cad  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0cb2  836ef210         sub word ptr [bp - 0xe], 0x10            
  0cb6  816ef49301       sub word ptr [bp - 0xc], 0x193           
  0cbb  8346f43c         add word ptr [bp - 0xc], 0x3c            
  0cbf  66ff76fa         push dword ptr [bp - 6]                  
  0cc3  8d46f2           lea ax, [bp - 0xe]                       
  0cc6  8cd2             mov dx, ss                               
  0cc8  b90800           mov cx, 8                                
  0ccb  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0cd0  6a19             push 0x19                                
  0cd2  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0cd7  83c40e           add sp, 0xe                              
  0cda  1e               push ds                                  
  0cdb  683859           push 0x5938                              
  0cde  66ff36e024       push dword ptr [0x24e0]                  
  0ce3  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0ce8  83c408           add sp, 8                                
  0ceb  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0cf0  5f               pop di                                   
  0cf1  5e               pop si                                   
  0cf2  c9               leave                                    
  0cf3  cb               retf                                     

ovl57_0cf4:  ; ENTRY
  0cf4  55               push bp                                  
  0cf5  8bec             mov bp, sp                               
  0cf7  90               nop                                      
  0cf8  0e               push cs                                  
  0cf9  e8a605           call 0x12a2                              
  0cfc  5d               pop bp                                   
  0cfd  cb               retf                                     

ovl57_0cfe:  ; ENTRY
  0cfe  55               push bp                                  
  0cff  8bec             mov bp, sp                               
  0d01  56               push si                                  
  0d02  33f6             xor si, si                               
  0d04  33d2             xor dx, dx                               
  0d06  eb24             jmp 0xd2c                                
  0d08  8bde             mov bx, si                               
  0d0a  d1e3             shl bx, 1                                
  0d0c  b8042c           mov ax, 0x2c04                           
  0d0f  8ec0             mov es, ax                               
  0d11  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0d17  7412             je 0xd2b                                 
  0d19  8bde             mov bx, si                               
  0d1b  d1e3             shl bx, 1                                
  0d1d  b8042c           mov ax, 0x2c04                           
  0d20  8ec0             mov es, ax                               
  0d22  2683bfc00003     cmp word ptr es:[bx + 0xc0], 3           
  0d28  7401             je 0xd2b                                 
  0d2a  42               inc dx                                   
  0d2b  46               inc si                                   
  0d2c  83fe08           cmp si, 8                                
  0d2f  7cd7             jl 0xd08                                 
  0d31  83fa01           cmp dx, 1                                
  0d34  7d0c             jge 0xd42                                
  0d36  9a2500ba30       lcall 0x30ba, 0x25                       -> ovl58:0b5f
  0d3b  0e               push cs                                  
  0d3c  e8d7f6           call 0x416                               
  0d3f  e99601           jmp 0xed8                                
  0d42  90               nop                                      
  0d43  0e               push cs                                  
  0d44  e84215           call 0x2289                              
  0d47  33f6             xor si, si                               
  0d49  e9d000           jmp 0xe1c                                
  0d4c  8bde             mov bx, si                               
  0d4e  d1e3             shl bx, 1                                
  0d50  b8042c           mov ax, 0x2c04                           
  0d53  8ec0             mov es, ax                               
  0d55  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0d5b  7520             jne 0xd7d                                
  0d5d  8bde             mov bx, si                               
  0d5f  d1e3             shl bx, 1                                
  0d61  b8042c           mov ax, 0x2c04                           
  0d64  8ec0             mov es, ax                               
  0d66  26c787d0000100   mov word ptr es:[bx + 0xd0], 1           
  0d6d  8bde             mov bx, si                               
  0d6f  d1e3             shl bx, 1                                
  0d71  b8042c           mov ax, 0x2c04                           
  0d74  8ec0             mov es, ax                               
  0d76  26c787c0000000   mov word ptr es:[bx + 0xc0], 0           
  0d7d  8bde             mov bx, si                               
  0d7f  d1e3             shl bx, 1                                
  0d81  b8042c           mov ax, 0x2c04                           
  0d84  8ec0             mov es, ax                               
  0d86  2683bfc00003     cmp word ptr es:[bx + 0xc0], 3           
  0d8c  756c             jne 0xdfa                                
  0d8e  8bde             mov bx, si                               
  0d90  d1e3             shl bx, 1                                
  0d92  b8042c           mov ax, 0x2c04                           
  0d95  8ec0             mov es, ax                               
  0d97  26c78737010000   mov word ptr es:[bx + 0x137], 0          
  0d9e  8bde             mov bx, si                               
  0da0  d1e3             shl bx, 1                                
  0da2  b8042c           mov ax, 0x2c04                           
  0da5  8ec0             mov es, ax                               
  0da7  26c787d0000100   mov word ptr es:[bx + 0xd0], 1           
  0dae  8bde             mov bx, si                               
  0db0  d1e3             shl bx, 1                                
  0db2  b8042c           mov ax, 0x2c04                           
  0db5  8ec0             mov es, ax                               
  0db7  26c787c0000000   mov word ptr es:[bx + 0xc0], 0           
  0dbe  8bde             mov bx, si                               
  0dc0  6bdb14           imul bx, bx, 0x14                        
  0dc3  b8042c           mov ax, 0x2c04                           
  0dc6  8ec0             mov es, ax                               
  0dc8  26ffb78b01       push word ptr es:[bx + 0x18b]            
  0dcd  8bde             mov bx, si                               
  0dcf  6bdb14           imul bx, bx, 0x14                        
  0dd2  b8042c           mov ax, 0x2c04                           
  0dd5  8ec0             mov es, ax                               
  0dd7  26ffb78901       push word ptr es:[bx + 0x189]            
  0ddc  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0de1  83c404           add sp, 4                                
  0de4  8bd0             mov dx, ax                               
  0de6  0bd2             or dx, dx                                
  0de8  7c10             jl 0xdfa                                 
  0dea  8bda             mov bx, dx                               
  0dec  6bdb41           imul bx, bx, 0x41                        
  0def  b8042c           mov ax, 0x2c04                           
  0df2  8ec0             mov es, ax                               
  0df4  26c68792150f     mov byte ptr es:[bx + 0x1592], 0xf       
  0dfa  8bde             mov bx, si                               
  0dfc  d1e3             shl bx, 1                                
  0dfe  b8042c           mov ax, 0x2c04                           
  0e01  8ec0             mov es, ax                               
  0e03  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0e09  7510             jne 0xe1b                                
  0e0b  8bde             mov bx, si                               
  0e0d  d1e3             shl bx, 1                                
  0e0f  b8042c           mov ax, 0x2c04                           
  0e12  8ec0             mov es, ax                               
  0e14  26c787c0000200   mov word ptr es:[bx + 0xc0], 2           
  0e1b  46               inc si                                   
  0e1c  83fe08           cmp si, 8                                
  0e1f  7d03             jge 0xe24                                
  0e21  e928ff           jmp 0xd4c                                
  0e24  6a0b             push 0xb                                 
  0e26  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  0e2b  59               pop cx                                   
  0e2c  6a01             push 1                                   
  0e2e  9a6100ba30       lcall 0x30ba, 0x61                       -> ovl58:026f
  0e33  59               pop cx                                   
  0e34  b8042c           mov ax, 0x2c04                           
  0e37  8b16b423         mov dx, word ptr [0x23b4]                
  0e3b  8ec0             mov es, ax                               
  0e3d  2689161a01       mov word ptr es:[0x11a], dx              
  0e42  8b16b623         mov dx, word ptr [0x23b6]                
  0e46  8ec0             mov es, ax                               
  0e48  2689161c01       mov word ptr es:[0x11c], dx              
  0e4d  8b16b823         mov dx, word ptr [0x23b8]                
  0e51  8ec0             mov es, ax                               
  0e53  2689161e01       mov word ptr es:[0x11e], dx              
  0e58  8b16ba23         mov dx, word ptr [0x23ba]                
  0e5c  8ec0             mov es, ax                               
  0e5e  2689162401       mov word ptr es:[0x124], dx              
  0e63  8b16bc23         mov dx, word ptr [0x23bc]                
  0e67  8ec0             mov es, ax                               
  0e69  2689162a01       mov word ptr es:[0x12a], dx              
  0e6e  8b16be23         mov dx, word ptr [0x23be]                
  0e72  8ec0             mov es, ax                               
  0e74  2689163201       mov word ptr es:[0x132], dx              
  0e79  8b16c023         mov dx, word ptr [0x23c0]                
  0e7d  8ec0             mov es, ax                               
  0e7f  2689162601       mov word ptr es:[0x126], dx              
  0e84  8b16c223         mov dx, word ptr [0x23c2]                
  0e88  8ec0             mov es, ax                               
  0e8a  2689162801       mov word ptr es:[0x128], dx              
  0e8f  8b16c423         mov dx, word ptr [0x23c4]                
  0e93  8ec0             mov es, ax                               
  0e95  2689162c01       mov word ptr es:[0x12c], dx              
  0e9a  8b16c623         mov dx, word ptr [0x23c6]                
  0e9e  8ec0             mov es, ax                               
  0ea0  2689162201       mov word ptr es:[0x122], dx              
  0ea5  8ec0             mov es, ax                               
  0ea7  26c70630010000   mov word ptr es:[0x130], 0               
  0eae  9a4d00db2f       lcall 0x2fdb, 0x4d                       -> ovl25:0519
  0eb3  9a7000d730       lcall 0x30d7, 0x70                       -> ovl61:0aeb
  0eb8  b8042c           mov ax, 0x2c04                           
  0ebb  8ec0             mov es, ax                               
  0ebd  26833e240100     cmp word ptr es:[0x124], 0               
  0ec3  7405             je 0xeca                                 
  0ec5  9a7500d730       lcall 0x30d7, 0x75                       -> ovl61:0a6e
  0eca  666800000100     push 0x10000                             
  0ed0  9a2000d730       lcall 0x30d7, 0x20                       -> ovl61:0000
  0ed5  83c404           add sp, 4                                
  0ed8  5e               pop si                                   
  0ed9  5d               pop bp                                   
  0eda  cb               retf                                     

ovl57_0edb:  ; ENTRY
  0edb  55               push bp                                  
  0edc  8bec             mov bp, sp                               
  0ede  6a01             push 1                                   
  0ee0  9a2000cc30       lcall 0x30cc, 0x20                       -> ovl60:0000
  0ee5  59               pop cx                                   
  0ee6  5d               pop bp                                   
  0ee7  cb               retf                                     

ovl57_0ee8:  ; ENTRY
  0ee8  55               push bp                                  
  0ee9  8bec             mov bp, sp                               
  0eeb  837e0600         cmp word ptr [bp + 6], 0                 
  0eef  746a             je 0xf5b                                 
  0ef1  33d2             xor dx, dx                               
  0ef3  eb53             jmp 0xf48                                
  0ef5  8bda             mov bx, dx                               
  0ef7  d1e3             shl bx, 1                                
  0ef9  b8042c           mov ax, 0x2c04                           
  0efc  8ec0             mov es, ax                               
  0efe  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0f04  7441             je 0xf47                                 
  0f06  8bda             mov bx, dx                               
  0f08  d1e3             shl bx, 1                                
  0f0a  b8042c           mov ax, 0x2c04                           
  0f0d  8ec0             mov es, ax                               
  0f0f  26c787d0000100   mov word ptr es:[bx + 0xd0], 1           
  0f16  8bda             mov bx, dx                               
  0f18  d1e3             shl bx, 1                                
  0f1a  b8042c           mov ax, 0x2c04                           
  0f1d  8ec0             mov es, ax                               
  0f1f  2683bfc00002     cmp word ptr es:[bx + 0xc0], 2           
  0f25  7410             je 0xf37                                 
  0f27  8bda             mov bx, dx                               
  0f29  d1e3             shl bx, 1                                
  0f2b  b8042c           mov ax, 0x2c04                           
  0f2e  8ec0             mov es, ax                               
  0f30  26c787e0000000   mov word ptr es:[bx + 0xe0], 0           
  0f37  8bda             mov bx, dx                               
  0f39  d1e3             shl bx, 1                                
  0f3b  b8042c           mov ax, 0x2c04                           
  0f3e  8ec0             mov es, ax                               
  0f40  26c787c0000200   mov word ptr es:[bx + 0xc0], 2           
  0f47  42               inc dx                                   
  0f48  83fa08           cmp dx, 8                                
  0f4b  7ca8             jl 0xef5                                 
  0f4d  b8042c           mov ax, 0x2c04                           
  0f50  8ec0             mov es, ax                               
  0f52  26c70616010100   mov word ptr es:[0x116], 1               
  0f59  eb0c             jmp 0xf67                                
  0f5b  b8042c           mov ax, 0x2c04                           
  0f5e  8ec0             mov es, ax                               
  0f60  26c70616010000   mov word ptr es:[0x116], 0               
  0f67  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0f6c  6668ffff0000     push 0xffff                              
  0f72  0e               push cs                                  
  0f73  e8bef6           call 0x634                               
  0f76  83c404           add sp, 4                                
  0f79  0e               push cs                                  
  0f7a  e82efc           call 0xbab                               
  0f7d  0e               push cs                                  
  0f7e  e895f4           call 0x416                               
  0f81  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0f86  5d               pop bp                                   
  0f87  cb               retf                                     

ovl57_0f88:  ; ENTRY
  0f88  55               push bp                                  
  0f89  8bec             mov bp, sp                               
  0f8b  81ec0601         sub sp, 0x106                            
  0f8f  56               push si                                  
  0f90  57               push di                                  
  0f91  666800000200     push 0x20000                             
  0f97  6a02             push 2                                   
  0f99  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0f9e  83c404           add sp, 4                                
  0fa1  52               push dx                                  
  0fa2  50               push ax                                  
  0fa3  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0fa8  83c406           add sp, 6                                
  0fab  8bf8             mov di, ax                               
  0fad  0bff             or di, di                                
  0faf  7d03             jge 0xfb4                                
  0fb1  e90f01           jmp 0x10c3                               
  0fb4  6a04             push 4                                   
  0fb6  16               push ss                                  
  0fb7  8d86fafe         lea ax, [bp - 0x106]                     
  0fbb  50               push ax                                  
  0fbc  57               push di                                  
  0fbd  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0fc2  83c408           add sp, 8                                
  0fc5  c686fcfe00       mov byte ptr [bp - 0x104], 0             
  0fca  16               push ss                                  
  0fcb  8d46fe           lea ax, [bp - 2]                         
  0fce  50               push ax                                  
  0fcf  1e               push ds                                  
  0fd0  689525           push 0x2595                              
  0fd3  16               push ss                                  
  0fd4  8d86fafe         lea ax, [bp - 0x106]                     
  0fd8  50               push ax                                  
  0fd9  9aba490000       lcall 0, 0x49ba                          -> 0000:49ba
  0fde  83c40c           add sp, 0xc                              
  0fe1  6a00             push 0                                   
  0fe3  ff76fe           push word ptr [bp - 2]                   
  0fe6  6a01             push 1                                   
  0fe8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0fed  83c406           add sp, 6                                
  0ff0  8946fc           mov word ptr [bp - 4], ax                
  0ff3  33f6             xor si, si                               
  0ff5  eb4f             jmp 0x1046                               
  0ff7  6a03             push 3                                   
  0ff9  16               push ss                                  
  0ffa  8d86fafe         lea ax, [bp - 0x106]                     
  0ffe  50               push ax                                  
  0fff  57               push di                                  
  1000  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  1005  83c408           add sp, 8                                
  1008  c686fdfe00       mov byte ptr [bp - 0x103], 0             
  100d  16               push ss                                  
  100e  8d46fe           lea ax, [bp - 2]                         
  1011  50               push ax                                  
  1012  1e               push ds                                  
  1013  689925           push 0x2599                              
  1016  16               push ss                                  
  1017  8d86fafe         lea ax, [bp - 0x106]                     
  101b  50               push ax                                  
  101c  9aba490000       lcall 0, 0x49ba                          -> 0000:49ba
  1021  83c40c           add sp, 0xc                              
  1024  8b46fe           mov ax, word ptr [bp - 2]                
  1027  40               inc ax                                   
  1028  50               push ax                                  
  1029  16               push ss                                  
  102a  8d86fafe         lea ax, [bp - 0x106]                     
  102e  50               push ax                                  
  102f  57               push di                                  
  1030  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  1035  83c408           add sp, 8                                
  1038  8d86f9fe         lea ax, [bp - 0x107]                     
  103c  8b5efe           mov bx, word ptr [bp - 2]                
  103f  03d8             add bx, ax                               
  1041  36c60700         mov byte ptr ss:[bx], 0                  
  1045  46               inc si                                   
  1046  3b76fc           cmp si, word ptr [bp - 4]                
  1049  7cac             jl 0xff7                                 
  104b  57               push di                                  
  104c  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  1051  59               pop cx                                   
  1052  666800000300     push 0x30000                             
  1058  666802000f00     push 0xf0002                             
  105e  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1063  83c408           add sp, 8                                
  1066  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  106b  16               push ss                                  
  106c  8d86fafe         lea ax, [bp - 0x106]                     
  1070  50               push ax                                  
  1071  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  1076  83c404           add sp, 4                                
  1079  8946fa           mov word ptr [bp - 6], ax                
  107c  33f6             xor si, si                               
  107e  33c9             xor cx, cx                               
  1080  33ff             xor di, di                               
  1082  eb35             jmp 0x10b9                               
  1084  80bafafe7c       cmp byte ptr [bp + si - 0x106], 0x7c     
  1089  752d             jne 0x10b8                               
  108b  c682fafe00       mov byte ptr [bp + si - 0x106], 0        
  1090  8d86fafe         lea ax, [bp - 0x106]                     
  1094  8bd1             mov dx, cx                               
  1096  03d0             add dx, ax                               
  1098  16               push ss                                  
  1099  52               push dx                                  
  109a  8bdf             mov bx, di                               
  109c  c1e302           shl bx, 2                                
  109f  ffb73e25         push word ptr [bx + 0x253e]              
  10a3  8bdf             mov bx, di                               
  10a5  c1e302           shl bx, 2                                
  10a8  ffb73c25         push word ptr [bx + 0x253c]              
  10ac  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  10b1  83c408           add sp, 8                                
  10b4  47               inc di                                   
  10b5  8bce             mov cx, si                               
  10b7  41               inc cx                                   
  10b8  46               inc si                                   
  10b9  3b76fa           cmp si, word ptr [bp - 6]                
  10bc  7cc6             jl 0x1084                                
  10be  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  10c3  5f               pop di                                   
  10c4  5e               pop si                                   
  10c5  c9               leave                                    
  10c6  cb               retf                                     

ovl57_10c7:  ; ENTRY
  10c7  55               push bp                                  
  10c8  8bec             mov bp, sp                               
  10ca  66ff365825       push dword ptr [0x2558]                  
  10cf  b85025           mov ax, 0x2550                           
  10d2  8cda             mov dx, ds                               
  10d4  b90800           mov cx, 8                                
  10d7  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  10dc  6a34             push 0x34                                
  10de  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  10e3  83c40e           add sp, 0xe                              
  10e6  5d               pop bp                                   
  10e7  cb               retf                                     

ovl57_10e8:  ; ENTRY
  10e8  55               push bp                                  
  10e9  8bec             mov bp, sp                               
  10eb  83ec12           sub sp, 0x12                             
  10ee  56               push si                                  
  10ef  33f6             xor si, si                               
  10f1  eb1a             jmp 0x110d                               
  10f3  666a5a           push 0x5a                                
  10f6  6a01             push 1                                   
  10f8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  10fd  83c406           add sp, 6                                
  1100  052000           add ax, 0x20                             
  1103  8946f6           mov word ptr [bp - 0xa], ax              
  1106  8a46f6           mov al, byte ptr [bp - 0xa]              
  1109  8842ee           mov byte ptr [bp + si - 0x12], al        
  110c  46               inc si                                   
  110d  83fe06           cmp si, 6                                
  1110  7ce1             jl 0x10f3                                
  1112  c646f400         mov byte ptr [bp - 0xc], 0               
  1116  666888000600     push 0x60088                             
  111c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1121  83c404           add sp, 4                                
  1124  52               push dx                                  
  1125  50               push ax                                  
  1126  666888000500     push 0x50088                             
  112c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1131  83c404           add sp, 4                                
  1134  52               push dx                                  
  1135  50               push ax                                  
  1136  666888000400     push 0x40088                             
  113c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1141  83c404           add sp, 4                                
  1144  52               push dx                                  
  1145  50               push ax                                  
  1146  666888000300     push 0x30088                             
  114c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1151  83c404           add sp, 4                                
  1154  52               push dx                                  
  1155  50               push ax                                  
  1156  666888000200     push 0x20088                             
  115c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1161  83c404           add sp, 4                                
  1164  52               push dx                                  
  1165  50               push ax                                  
  1166  666888000100     push 0x10088                             
  116c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1171  83c404           add sp, 4                                
  1174  52               push dx                                  
  1175  50               push ax                                  
  1176  666888000000     push 0x88                                
  117c  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1181  83c404           add sp, 4                                
  1184  52               push dx                                  
  1185  50               push ax                                  
  1186  9abb00d730       lcall 0x30d7, 0xbb                       -> ovl61:1471
  118b  83c41c           add sp, 0x1c                             
  118e  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1193  33f6             xor si, si                               
  1195  eb32             jmp 0x11c9                               
  1197  8bde             mov bx, si                               
  1199  d1e3             shl bx, 1                                
  119b  83bfd02807       cmp word ptr [bx + 0x28d0], 7            
  11a0  7512             jne 0x11b4                               
  11a2  66680700ffff     push 0xffff0007                          
  11a8  6a01             push 1                                   
  11aa  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  11af  83c406           add sp, 6                                
  11b2  eb08             jmp 0x11bc                               
  11b4  8bde             mov bx, si                               
  11b6  d1e3             shl bx, 1                                
  11b8  8b87d028         mov ax, word ptr [bx + 0x28d0]           
  11bc  8bde             mov bx, si                               
  11be  d1e3             shl bx, 1                                
  11c0  8d56f8           lea dx, [bp - 8]                         
  11c3  03da             add bx, dx                               
  11c5  368907           mov word ptr ss:[bx], ax                 
  11c8  46               inc si                                   
  11c9  83fe04           cmp si, 4                                
  11cc  7cc9             jl 0x1197                                
  11ce  66ff76fc         push dword ptr [bp - 4]                  
  11d2  66ff76f8         push dword ptr [bp - 8]                  
  11d6  9a2000622f       lcall 0x2f62, 0x20                       -> ovl02:0000
  11db  83c408           add sp, 8                                
  11de  1e               push ds                                  
  11df  685c25           push 0x255c                               ; "random"
  11e2  1e               push ds                                  
  11e3  68a05d           push 0x5da0                              
  11e6  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  11eb  83c408           add sp, 8                                
  11ee  1e               push ds                                  
  11ef  685c25           push 0x255c                               ; "random"
  11f2  1e               push ds                                  
  11f3  68785d           push 0x5d78                              
  11f6  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  11fb  83c408           add sp, 8                                
  11fe  16               push ss                                  
  11ff  8d46ee           lea ax, [bp - 0x12]                      
  1202  50               push ax                                  
  1203  1e               push ds                                  
  1204  68a85d           push 0x5da8                              
  1207  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  120c  83c408           add sp, 8                                
  120f  b8042c           mov ax, 0x2c04                           
  1212  8b16ca28         mov dx, word ptr [0x28ca]                
  1216  8ec0             mov es, ax                               
  1218  2689166101       mov word ptr es:[0x161], dx              
  121d  1e               push ds                                  
  121e  689d25           push 0x259d                               ; "random\"
  1221  1e               push ds                                  
  1222  687216           push 0x1672                               ; "Illuria\"
  1225  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  122a  83c408           add sp, 8                                
  122d  6a00             push 0                                   
  122f  0e               push cs                                  
  1230  e861ef           call 0x194                               
  1233  59               pop cx                                   
  1234  9a61007f30       lcall 0x307f, 0x61                       -> ovl49:11f3
  1239  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  123e  5e               pop si                                   
  123f  c9               leave                                    
  1240  cb               retf                                     

ovl57_1241:  ; ENTRY
  1241  55               push bp                                  
  1242  8bec             mov bp, sp                               
  1244  b90100           mov cx, 1                                
  1247  33d2             xor dx, dx                               
  1249  eb1f             jmp 0x126a                               
  124b  8b5e06           mov bx, word ptr [bp + 6]                
  124e  6bdb14           imul bx, bx, 0x14                        
  1251  8bc2             mov ax, dx                               
  1253  d1e0             shl ax, 1                                
  1255  03d8             add bx, ax                               
  1257  8b877823         mov ax, word ptr [bx + 0x2378]           
  125b  8bda             mov bx, dx                               
  125d  d1e3             shl bx, 1                                
  125f  3b87b423         cmp ax, word ptr [bx + 0x23b4]           
  1263  7404             je 0x1269                                
  1265  33c9             xor cx, cx                               
  1267  eb06             jmp 0x126f                               
  1269  42               inc dx                                   
  126a  83fa06           cmp dx, 6                                
  126d  7cdc             jl 0x124b                                
  126f  8bc1             mov ax, cx                               
  1271  5d               pop bp                                   
  1272  cb               retf                                     

ovl57_1273:  ; ENTRY
  1273  55               push bp                                  
  1274  8bec             mov bp, sp                               
  1276  33d2             xor dx, dx                               
  1278  eb19             jmp 0x1293                               
  127a  8b5e06           mov bx, word ptr [bp + 6]                
  127d  6bdb14           imul bx, bx, 0x14                        
  1280  8bc2             mov ax, dx                               
  1282  d1e0             shl ax, 1                                
  1284  03d8             add bx, ax                               
  1286  8b877823         mov ax, word ptr [bx + 0x2378]           
  128a  8bda             mov bx, dx                               
  128c  d1e3             shl bx, 1                                
  128e  8987b423         mov word ptr [bx + 0x23b4], ax           
  1292  42               inc dx                                   
  1293  83fa06           cmp dx, 6                                
  1296  7ce2             jl 0x127a                                
  1298  0e               push cs                                  
  1299  e80ff9           call 0xbab                               
  129c  0e               push cs                                  
  129d  e876f1           call 0x416                               
  12a0  5d               pop bp                                   
  12a1  cb               retf                                     

ovl57_12a2:  ; ENTRY
  12a2  55               push bp                                  
  12a3  8bec             mov bp, sp                               
  12a5  6a04             push 4                                   
  12a7  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  12ac  59               pop cx                                   
  12ad  6aff             push -1                                  
  12af  90               nop                                      
  12b0  0e               push cs                                  
  12b1  e81600           call 0x12ca                              
  12b4  59               pop cx                                   
  12b5  c7066a160100     mov word ptr [0x166a], 1                 
  12bb  6a04             push 4                                   
  12bd  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  12c2  59               pop cx                                   
  12c3  90               nop                                      
  12c4  0e               push cs                                  
  12c5  e80503           call 0x15cd                              
  12c8  5d               pop bp                                   
  12c9  cb               retf                                     

ovl57_12ca:  ; ENTRY
  12ca  55               push bp                                  
  12cb  8bec             mov bp, sp                               
  12cd  83ec18           sub sp, 0x18                             
  12d0  56               push si                                  
  12d1  57               push di                                  
  12d2  8b7e06           mov di, word ptr [bp + 6]                
  12d5  83ff06           cmp di, 6                                
  12d8  7d05             jge 0x12df                               
  12da  b80100           mov ax, 1                                
  12dd  eb02             jmp 0x12e1                               
  12df  33c0             xor ax, ax                               
  12e1  8946f4           mov word ptr [bp - 0xc], ax              
  12e4  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  12e9  8bc7             mov ax, di                               
  12eb  8946fe           mov word ptr [bp - 2], ax                
  12ee  8bf0             mov si, ax                               
  12f0  83ffff           cmp di, -1                               
  12f3  7403             je 0x12f8                                
  12f5  e97d01           jmp 0x1475                               
  12f8  33f6             xor si, si                               
  12fa  c746fe0900       mov word ptr [bp - 2], 9                 
  12ff  833e6a1600       cmp word ptr [0x166a], 0                 
  1304  7403             je 0x1309                                
  1306  e96c01           jmp 0x1475                               
  1309  666800000300     push 0x30000                             
  130f  666801000f00     push 0xf0001                             
  1315  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  131a  83c408           add sp, 8                                
  131d  666a08           push 8                                   
  1320  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1325  83c404           add sp, 4                                
  1328  52               push dx                                  
  1329  50               push ax                                  
  132a  666840013700     push 0x370140                            
  1330  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1335  83c408           add sp, 8                                
  1338  666800000300     push 0x30000                             
  133e  666802000f00     push 0xf0002                             
  1344  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1349  83c408           add sp, 8                                
  134c  6a0f             push 0xf                                 
  134e  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1353  59               pop cx                                   
  1354  66686f004001     push 0x140006f                           
  135a  68a000           push 0xa0                                
  135d  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  1362  83c406           add sp, 6                                
  1365  6668fa004001     push 0x14000fa                           
  136b  68a000           push 0xa0                                
  136e  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  1373  83c406           add sp, 6                                
  1376  6a00             push 0                                   
  1378  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  137d  59               pop cx                                   
  137e  666870004001     push 0x1400070                           
  1384  68a100           push 0xa1                                
  1387  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  138c  83c406           add sp, 6                                
  138f  6668fb004001     push 0x14000fb                           
  1395  68a100           push 0xa1                                
  1398  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  139d  83c406           add sp, 6                                
  13a0  666a09           push 9                                   
  13a3  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  13a8  83c404           add sp, 4                                
  13ab  52               push dx                                  
  13ac  50               push ax                                  
  13ad  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  13b2  83c404           add sp, 4                                
  13b5  8946f2           mov word ptr [bp - 0xe], ax              
  13b8  666a0a           push 0xa                                 
  13bb  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  13c0  83c404           add sp, 4                                
  13c3  52               push dx                                  
  13c4  50               push ax                                  
  13c5  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  13ca  83c404           add sp, 4                                
  13cd  8946f0           mov word ptr [bp - 0x10], ax             
  13d0  6a03             push 3                                   
  13d2  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  13d7  59               pop cx                                   
  13d8  6a02             push 2                                   
  13da  8b46f2           mov ax, word ptr [bp - 0xe]              
  13dd  050800           add ax, 8                                
  13e0  50               push ax                                  
  13e1  6a6f             push 0x6f                                
  13e3  8b46f2           mov ax, word ptr [bp - 0xe]              
  13e6  99               cdq                                      
  13e7  2bc2             sub ax, dx                               
  13e9  d1f8             sar ax, 1                                
  13eb  ba4001           mov dx, 0x140                            
  13ee  2bd0             sub dx, ax                               
  13f0  83c2fc           add dx, -4                               
  13f3  52               push dx                                  
  13f4  16               push ss                                  
  13f5  8d46e8           lea ax, [bp - 0x18]                      
  13f8  50               push ax                                  
  13f9  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  13fe  83c40c           add sp, 0xc                              
  1401  52               push dx                                  
  1402  50               push ax                                  
  1403  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  1408  83c404           add sp, 4                                
  140b  6a02             push 2                                   
  140d  8b46f0           mov ax, word ptr [bp - 0x10]             
  1410  050800           add ax, 8                                
  1413  50               push ax                                  
  1414  68fa00           push 0xfa                                
  1417  8b46f0           mov ax, word ptr [bp - 0x10]             
  141a  99               cdq                                      
  141b  2bc2             sub ax, dx                               
  141d  d1f8             sar ax, 1                                
  141f  ba4001           mov dx, 0x140                            
  1422  2bd0             sub dx, ax                               
  1424  83c2fc           add dx, -4                               
  1427  52               push dx                                  
  1428  16               push ss                                  
  1429  8d46e8           lea ax, [bp - 0x18]                      
  142c  50               push ax                                  
  142d  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  1432  83c40c           add sp, 0xc                              
  1435  52               push dx                                  
  1436  50               push ax                                  
  1437  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  143c  83c404           add sp, 4                                
  143f  666a09           push 9                                   
  1442  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1447  83c404           add sp, 4                                
  144a  52               push dx                                  
  144b  50               push ax                                  
  144c  666840016800     push 0x680140                            
  1452  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1457  83c408           add sp, 8                                
  145a  666a0a           push 0xa                                 
  145d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1462  83c404           add sp, 4                                
  1465  52               push dx                                  
  1466  50               push ax                                  
  1467  66684001f300     push 0xf30140                            
  146d  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1472  83c408           add sp, 8                                
  1475  e93501           jmp 0x15ad                               
  1478  83fe06           cmp si, 6                                
  147b  7d2f             jge 0x14ac                               
  147d  8bc6             mov ax, si                               
  147f  99               cdq                                      
  1480  2bc2             sub ax, dx                               
  1482  d1f8             sar ax, 1                                
  1484  6bc01e           imul ax, ax, 0x1e                        
  1487  058300           add ax, 0x83                             
  148a  8946fa           mov word ptr [bp - 6], ax                
  148d  8946f6           mov word ptr [bp - 0xa], ax              
  1490  8bc6             mov ax, si                               
  1492  99               cdq                                      
  1493  2bc2             sub ax, dx                               
  1495  d1f8             sar ax, 1                                
  1497  50               push ax                                  
  1498  8bc6             mov ax, si                               
  149a  40               inc ax                                   
  149b  99               cdq                                      
  149c  2bc2             sub ax, dx                               
  149e  d1f8             sar ax, 1                                
  14a0  5a               pop dx                                   
  14a1  3bd0             cmp dx, ax                               
  14a3  7537             jne 0x14dc                               
  14a5  b88000           mov ax, 0x80                             
  14a8  eb35             jmp 0x14df                               
  14aa  eb30             jmp 0x14dc                               
  14ac  8bc6             mov ax, si                               
  14ae  05faff           add ax, 0xfffa                           
  14b1  99               cdq                                      
  14b2  2bc2             sub ax, dx                               
  14b4  d1f8             sar ax, 1                                
  14b6  6bc01e           imul ax, ax, 0x1e                        
  14b9  050e01           add ax, 0x10e                            
  14bc  8946fa           mov word ptr [bp - 6], ax                
  14bf  8946f6           mov word ptr [bp - 0xa], ax              
  14c2  8bc6             mov ax, si                               
  14c4  05faff           add ax, 0xfffa                           
  14c7  99               cdq                                      
  14c8  2bc2             sub ax, dx                               
  14ca  d1f8             sar ax, 1                                
  14cc  50               push ax                                  
  14cd  8bc6             mov ax, si                               
  14cf  05fbff           add ax, 0xfffb                           
  14d2  99               cdq                                      
  14d3  2bc2             sub ax, dx                               
  14d5  d1f8             sar ax, 1                                
  14d7  5a               pop dx                                   
  14d8  3bd0             cmp dx, ax                               
  14da  74c9             je 0x14a5                                
  14dc  b84001           mov ax, 0x140                            
  14df  8946fc           mov word ptr [bp - 4], ax                
  14e2  8b46fc           mov ax, word ptr [bp - 4]                
  14e5  058000           add ax, 0x80                             
  14e8  8946f8           mov word ptr [bp - 8], ax                
  14eb  83ffff           cmp di, -1                               
  14ee  752f             jne 0x151f                               
  14f0  666800000300     push 0x30000                             
  14f6  666802000f00     push 0xf0002                             
  14fc  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1501  83c408           add sp, 8                                
  1504  56               push si                                  
  1505  6a04             push 4                                   
  1507  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  150c  83c404           add sp, 4                                
  150f  52               push dx                                  
  1510  50               push ax                                  
  1511  ff76fa           push word ptr [bp - 6]                   
  1514  ff76fc           push word ptr [bp - 4]                   
  1517  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  151c  83c408           add sp, 8                                
  151f  666838001400     push 0x140038                            
  1525  8b46f6           mov ax, word ptr [bp - 0xa]              
  1528  05ceff           add ax, 0xffce                           
  152b  50               push ax                                  
  152c  8b46f8           mov ax, word ptr [bp - 8]                
  152f  0588ff           add ax, 0xff88                           
  1532  50               push ax                                  
  1533  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  1538  83c408           add sp, 8                                
  153b  666800000300     push 0x30000                             
  1541  666802000700     push 0x70002                             
  1547  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  154c  83c408           add sp, 8                                
  154f  0bf6             or si, si                                
  1551  7514             jne 0x1567                               
  1553  8bde             mov bx, si                               
  1555  d1e3             shl bx, 1                                
  1557  ffb7b423         push word ptr [bx + 0x23b4]              
  155b  6a05             push 5                                   
  155d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  1562  83c404           add sp, 4                                
  1565  eb35             jmp 0x159c                               
  1567  83fe05           cmp si, 5                                
  156a  7519             jne 0x1585                               
  156c  8bde             mov bx, si                               
  156e  d1e3             shl bx, 1                                
  1570  83bfb42300       cmp word ptr [bx + 0x23b4], 0            
  1575  7407             je 0x157e                                
  1577  8cda             mov dx, ds                               
  1579  b8a525           mov ax, 0x25a5                           
  157c  eb1e             jmp 0x159c                               
  157e  8cda             mov dx, ds                               
  1580  b8a925           mov ax, 0x25a9                           
  1583  eb17             jmp 0x159c                               
  1585  8bde             mov bx, si                               
  1587  d1e3             shl bx, 1                                
  1589  83bfb42300       cmp word ptr [bx + 0x23b4], 0            
  158e  7407             je 0x1597                                
  1590  8cda             mov dx, ds                               
  1592  b8ac25           mov ax, 0x25ac                           
  1595  ebe5             jmp 0x157c                               
  1597  8cda             mov dx, ds                               
  1599  b8af25           mov ax, 0x25af                           
  159c  52               push dx                                  
  159d  50               push ax                                  
  159e  ff76f6           push word ptr [bp - 0xa]                 
  15a1  ff76f8           push word ptr [bp - 8]                   
  15a4  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  15a9  83c408           add sp, 8                                
  15ac  46               inc si                                   
  15ad  3b76fe           cmp si, word ptr [bp - 2]                
  15b0  7f03             jg 0x15b5                                
  15b2  e9c3fe           jmp 0x1478                               
  15b5  83ffff           cmp di, -1                               
  15b8  7406             je 0x15c0                                
  15ba  837ef400         cmp word ptr [bp - 0xc], 0               
  15be  7404             je 0x15c4                                
  15c0  0e               push cs                                  
  15c1  e8e7f5           call 0xbab                               
  15c4  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  15c9  5f               pop di                                   
  15ca  5e               pop si                                   
  15cb  c9               leave                                    
  15cc  cb               retf                                     

ovl57_15cd:  ; ENTRY
  15cd  55               push bp                                  
  15ce  8bec             mov bp, sp                               
  15d0  56               push si                                  
  15d1  33f6             xor si, si                               
  15d3  eb11             jmp 0x15e6                               
  15d5  6a01             push 1                                   
  15d7  8bc6             mov ax, si                               
  15d9  059f00           add ax, 0x9f                             
  15dc  50               push ax                                  
  15dd  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  15e2  83c404           add sp, 4                                
  15e5  46               inc si                                   
  15e6  83fe0a           cmp si, 0xa                              
  15e9  7cea             jl 0x15d5                                
  15eb  6a00             push 0                                   
  15ed  0e               push cs                                  
  15ee  e850fc           call 0x1241                              
  15f1  59               pop cx                                   
  15f2  0bc0             or ax, ax                                
  15f4  7504             jne 0x15fa                               
  15f6  6a01             push 1                                   
  15f8  eb02             jmp 0x15fc                               
  15fa  6a00             push 0                                   
  15fc  68a900           push 0xa9                                
  15ff  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1604  83c404           add sp, 4                                
  1607  6a01             push 1                                   
  1609  0e               push cs                                  
  160a  e834fc           call 0x1241                              
  160d  59               pop cx                                   
  160e  0bc0             or ax, ax                                
  1610  7504             jne 0x1616                               
  1612  6a01             push 1                                   
  1614  eb02             jmp 0x1618                               
  1616  6a00             push 0                                   
  1618  68aa00           push 0xaa                                
  161b  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1620  83c404           add sp, 4                                
  1623  6a02             push 2                                   
  1625  0e               push cs                                  
  1626  e818fc           call 0x1241                              
  1629  59               pop cx                                   
  162a  0bc0             or ax, ax                                
  162c  7504             jne 0x1632                               
  162e  6a01             push 1                                   
  1630  eb02             jmp 0x1634                               
  1632  6a00             push 0                                   
  1634  68ab00           push 0xab                                
  1637  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  163c  83c404           add sp, 4                                
  163f  6668ac000100     push 0x100ac                             
  1645  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  164a  83c404           add sp, 4                                
  164d  5e               pop si                                   
  164e  5d               pop bp                                   
  164f  cb               retf                                     

ovl57_1650:  ; ENTRY
  1650  55               push bp                                  
  1651  8bec             mov bp, sp                               
  1653  8b4e06           mov cx, word ptr [bp + 6]                
  1656  0bc9             or cx, cx                                
  1658  7519             jne 0x1673                               
  165a  8bd9             mov bx, cx                               
  165c  d1e3             shl bx, 1                                
  165e  8b87b423         mov ax, word ptr [bx + 0x23b4]           
  1662  40               inc ax                                   
  1663  bb0300           mov bx, 3                                
  1666  99               cdq                                      
  1667  f7fb             idiv bx                                  
  1669  8bd9             mov bx, cx                               
  166b  d1e3             shl bx, 1                                
  166d  8997b423         mov word ptr [bx + 0x23b4], dx           
  1671  eb15             jmp 0x1688                               
  1673  8bd9             mov bx, cx                               
  1675  d1e3             shl bx, 1                                
  1677  8b87b423         mov ax, word ptr [bx + 0x23b4]           
  167b  f7d8             neg ax                                   
  167d  1bc0             sbb ax, ax                               
  167f  40               inc ax                                   
  1680  8bd9             mov bx, cx                               
  1682  d1e3             shl bx, 1                                
  1684  8987b423         mov word ptr [bx + 0x23b4], ax           
  1688  51               push cx                                  
  1689  0e               push cs                                  
  168a  e83dfc           call 0x12ca                              
  168d  59               pop cx                                   
  168e  0e               push cs                                  
  168f  e83bff           call 0x15cd                              
  1692  5d               pop bp                                   
  1693  cb               retf                                     

ovl57_1694:  ; ENTRY
  1694  55               push bp                                  
  1695  8bec             mov bp, sp                               
  1697  33d2             xor dx, dx                               
  1699  eb19             jmp 0x16b4                               
  169b  8b5e06           mov bx, word ptr [bp + 6]                
  169e  6bdb14           imul bx, bx, 0x14                        
  16a1  8bc2             mov ax, dx                               
  16a3  d1e0             shl ax, 1                                
  16a5  03d8             add bx, ax                               
  16a7  8b877823         mov ax, word ptr [bx + 0x2378]           
  16ab  8bda             mov bx, dx                               
  16ad  d1e3             shl bx, 1                                
  16af  8987b423         mov word ptr [bx + 0x23b4], ax           
  16b3  42               inc dx                                   
  16b4  83fa06           cmp dx, 6                                
  16b7  7ce2             jl 0x169b                                
  16b9  6aff             push -1                                  
  16bb  0e               push cs                                  
  16bc  e80bfc           call 0x12ca                              
  16bf  59               pop cx                                   
  16c0  0e               push cs                                  
  16c1  e809ff           call 0x15cd                              
  16c4  5d               pop bp                                   
  16c5  cb               retf                                     

ovl57_16c6:  ; ENTRY
  16c6  55               push bp                                  
  16c7  8bec             mov bp, sp                               
  16c9  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  16ce  c7066a160000     mov word ptr [0x166a], 0                 
  16d4  666800000100     push 0x10000                             
  16da  666a00           push 0                                   
  16dd  0e               push cs                                  
  16de  e81fe9           call 0                                   
  16e1  83c408           add sp, 8                                
  16e4  0e               push cs                                  
  16e5  e8c3f4           call 0xbab                               
  16e8  5d               pop bp                                   
  16e9  cb               retf                                     

ovl57_16ea:  ; ENTRY
  16ea  55               push bp                                  
  16eb  8bec             mov bp, sp                               
  16ed  56               push si                                  
  16ee  8b7606           mov si, word ptr [bp + 6]                
  16f1  8bde             mov bx, si                               
  16f3  d1e3             shl bx, 1                                
  16f5  b8042c           mov ax, 0x2c04                           
  16f8  8ec0             mov es, ax                               
  16fa  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  1700  7507             jne 0x1709                               
  1702  0e               push cs                                  
  1703  e810ed           call 0x416                               
  1706  e9ff00           jmp 0x1808                               
  1709  8bde             mov bx, si                               
  170b  d1e3             shl bx, 1                                
  170d  b8042c           mov ax, 0x2c04                           
  1710  8ec0             mov es, ax                               
  1712  268b87e000       mov ax, word ptr es:[bx + 0xe0]          
  1717  a35659           mov word ptr [0x5956], ax                
  171a  89366325         mov word ptr [0x2563], si                
  171e  8bc6             mov ax, si                               
  1720  6bc014           imul ax, ax, 0x14                        
  1723  050000           add ax, 0                                
  1726  68042c           push 0x2c04                              
  1729  50               push ax                                  
  172a  1e               push ds                                  
  172b  686459           push 0x5964                              
  172e  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1733  83c408           add sp, 8                                
  1736  33d2             xor dx, dx                               
  1738  eb0b             jmp 0x1745                               
  173a  8bda             mov bx, dx                               
  173c  d1e3             shl bx, 1                                
  173e  c7875a59ffff     mov word ptr [bx + 0x595a], 0xffff       
  1744  42               inc dx                                   
  1745  83fa05           cmp dx, 5                                
  1748  7cf0             jl 0x173a                                
  174a  8bde             mov bx, si                               
  174c  d1e3             shl bx, 1                                
  174e  b8042c           mov ax, 0x2c04                           
  1751  8ec0             mov es, ax                               
  1753  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  1759  7403             je 0x175e                                
  175b  e98700           jmp 0x17e5                               
  175e  666a00           push 0                                   
  1761  6aff             push -1                                  
  1763  8bde             mov bx, si                               
  1765  d1e3             shl bx, 1                                
  1767  b8042c           mov ax, 0x2c04                           
  176a  8ec0             mov es, ax                               
  176c  26ffb7c000       push word ptr es:[bx + 0xc0]             
  1771  6a07             push 7                                   
  1773  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  1778  83c40a           add sp, 0xa                              
  177b  33d2             xor dx, dx                               
  177d  eb16             jmp 0x1795                               
  177f  3b162e48         cmp dx, word ptr [0x482e]                
  1783  7d04             jge 0x1789                               
  1785  8bc2             mov ax, dx                               
  1787  eb03             jmp 0x178c                               
  1789  b8ffff           mov ax, 0xffff                           
  178c  8bda             mov bx, dx                               
  178e  d1e3             shl bx, 1                                
  1790  89875a59         mov word ptr [bx + 0x595a], ax           
  1794  42               inc dx                                   
  1795  83fa05           cmp dx, 5                                
  1798  7ce5             jl 0x177f                                
  179a  8b1e6325         mov bx, word ptr [0x2563]                
  179e  d1e3             shl bx, 1                                
  17a0  b8042c           mov ax, 0x2c04                           
  17a3  8ec0             mov es, ax                               
  17a5  268b87e000       mov ax, word ptr es:[bx + 0xe0]          
  17aa  a35859           mov word ptr [0x5958], ax                
  17ad  8b1e6325         mov bx, word ptr [0x2563]                
  17b1  d1e3             shl bx, 1                                
  17b3  b8042c           mov ax, 0x2c04                           
  17b6  8ec0             mov es, ax                               
  17b8  2683bfe00005     cmp word ptr es:[bx + 0xe0], 5           
  17be  7c25             jl 0x17e5                                
  17c0  33d2             xor dx, dx                               
  17c2  eb1c             jmp 0x17e0                               
  17c4  8b1e6325         mov bx, word ptr [0x2563]                
  17c8  d1e3             shl bx, 1                                
  17ca  b8042c           mov ax, 0x2c04                           
  17cd  8ec0             mov es, ax                               
  17cf  268b87e000       mov ax, word ptr es:[bx + 0xe0]          
  17d4  05fcff           add ax, 0xfffc                           
  17d7  8bda             mov bx, dx                               
  17d9  d1e3             shl bx, 1                                
  17db  01875a59         add word ptr [bx + 0x595a], ax           
  17df  42               inc dx                                   
  17e0  83fa05           cmp dx, 5                                
  17e3  7cdf             jl 0x17c4                                
  17e5  6a04             push 4                                   
  17e7  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  17ec  59               pop cx                                   
  17ed  6a00             push 0                                   
  17ef  90               nop                                      
  17f0  0e               push cs                                  
  17f1  e81700           call 0x180b                              
  17f4  59               pop cx                                   
  17f5  c7066a160100     mov word ptr [0x166a], 1                 
  17fb  6a1b             push 0x1b                                
  17fd  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  1802  59               pop cx                                   
  1803  90               nop                                      
  1804  0e               push cs                                  
  1805  e8dc02           call 0x1ae4                              
  1808  5e               pop si                                   
  1809  5d               pop bp                                   
  180a  cb               retf                                     

ovl57_180b:  ; ENTRY
  180b  55               push bp                                  
  180c  8bec             mov bp, sp                               
  180e  83ec08           sub sp, 8                                
  1811  56               push si                                  
  1812  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  1817  837e0600         cmp word ptr [bp + 6], 0                 
  181b  7403             je 0x1820                                
  181d  e9bc02           jmp 0x1adc                               
  1820  666800000300     push 0x30000                             
  1826  666801000f00     push 0xf0001                             
  182c  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1831  83c408           add sp, 8                                
  1834  1e               push ds                                  
  1835  68b325           push 0x25b3                               ; "Setup Side"
  1838  666840013700     push 0x370140                            
  183e  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1843  83c408           add sp, 8                                
  1846  666870014300     push 0x430170                            
  184c  66688a006b00     push 0x6b008a                            
  1852  16               push ss                                  
  1853  8d46f8           lea ax, [bp - 8]                         
  1856  50               push ax                                  
  1857  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  185c  83c40c           add sp, 0xc                              
  185f  8b1e6325         mov bx, word ptr [0x2563]                
  1863  d1e3             shl bx, 1                                
  1865  b8042c           mov ax, 0x2c04                           
  1868  8ec0             mov es, ax                               
  186a  26ffb7b000       push word ptr es:[bx + 0xb0]             
  186f  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1874  59               pop cx                                   
  1875  16               push ss                                  
  1876  8d46f8           lea ax, [bp - 8]                         
  1879  50               push ax                                  
  187a  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  187f  83c404           add sp, 4                                
  1882  ff4ef8           dec word ptr [bp - 8]                    
  1885  ff4efa           dec word ptr [bp - 6]                    
  1888  8b1e6325         mov bx, word ptr [0x2563]                
  188c  d1e3             shl bx, 1                                
  188e  b8042c           mov ax, 0x2c04                           
  1891  8ec0             mov es, ax                               
  1893  26ffb7a000       push word ptr es:[bx + 0xa0]             
  1898  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  189d  59               pop cx                                   
  189e  16               push ss                                  
  189f  8d46f8           lea ax, [bp - 8]                         
  18a2  50               push ax                                  
  18a3  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  18a8  83c404           add sp, 4                                
  18ab  ff4ef8           dec word ptr [bp - 8]                    
  18ae  ff4efa           dec word ptr [bp - 6]                    
  18b1  16               push ss                                  
  18b2  8d46f8           lea ax, [bp - 8]                         
  18b5  50               push ax                                  
  18b6  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  18bb  83c404           add sp, 4                                
  18be  66687001a500     push 0xa50170                            
  18c4  66688a00c200     push 0xc2008a                            
  18ca  16               push ss                                  
  18cb  8d46f8           lea ax, [bp - 8]                         
  18ce  50               push ax                                  
  18cf  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  18d4  83c40c           add sp, 0xc                              
  18d7  8b1e6325         mov bx, word ptr [0x2563]                
  18db  d1e3             shl bx, 1                                
  18dd  b8042c           mov ax, 0x2c04                           
  18e0  8ec0             mov es, ax                               
  18e2  26ffb7b000       push word ptr es:[bx + 0xb0]             
  18e7  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  18ec  59               pop cx                                   
  18ed  16               push ss                                  
  18ee  8d46f8           lea ax, [bp - 8]                         
  18f1  50               push ax                                  
  18f2  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  18f7  83c404           add sp, 4                                
  18fa  ff4ef8           dec word ptr [bp - 8]                    
  18fd  ff4efa           dec word ptr [bp - 6]                    
  1900  8b1e6325         mov bx, word ptr [0x2563]                
  1904  d1e3             shl bx, 1                                
  1906  b8042c           mov ax, 0x2c04                           
  1909  8ec0             mov es, ax                               
  190b  26ffb7a000       push word ptr es:[bx + 0xa0]             
  1910  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1915  59               pop cx                                   
  1916  16               push ss                                  
  1917  8d46f8           lea ax, [bp - 8]                         
  191a  50               push ax                                  
  191b  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  1920  83c404           add sp, 4                                
  1923  ff4ef8           dec word ptr [bp - 8]                    
  1926  ff4efa           dec word ptr [bp - 6]                    
  1929  16               push ss                                  
  192a  8d46f8           lea ax, [bp - 8]                         
  192d  50               push ax                                  
  192e  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  1933  83c404           add sp, 4                                
  1936  6a03             push 3                                   
  1938  8b1e6325         mov bx, word ptr [0x2563]                
  193c  d1e3             shl bx, 1                                
  193e  b8042c           mov ax, 0x2c04                           
  1941  8ec0             mov es, ax                               
  1943  26ffb7b000       push word ptr es:[bx + 0xb0]             
  1948  8b1e6325         mov bx, word ptr [0x2563]                
  194c  d1e3             shl bx, 1                                
  194e  b8042c           mov ax, 0x2c04                           
  1951  8ec0             mov es, ax                               
  1953  26ffb7a000       push word ptr es:[bx + 0xa0]             
  1958  6a02             push 2                                   
  195a  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  195f  83c408           add sp, 8                                
  1962  1e               push ds                                  
  1963  68be25           push 0x25be                               ; "Side Name"
  1966  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  196b  83c404           add sp, 4                                
  196e  8bf0             mov si, ax                               
  1970  6a03             push 3                                   
  1972  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1977  59               pop cx                                   
  1978  6a11             push 0x11                                
  197a  56               push si                                  
  197b  6668a0006000     push 0x6000a0                            
  1981  16               push ss                                  
  1982  8d46f8           lea ax, [bp - 8]                         
  1985  50               push ax                                  
  1986  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  198b  83c40c           add sp, 0xc                              
  198e  52               push dx                                  
  198f  50               push ax                                  
  1990  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  1995  83c404           add sp, 4                                
  1998  1e               push ds                                  
  1999  68c825           push 0x25c8                               ; "Side Name"
  199c  6668a0006000     push 0x6000a0                            
  19a2  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  19a7  83c408           add sp, 8                                
  19aa  1e               push ds                                  
  19ab  68d225           push 0x25d2                               ; "Leader"
  19ae  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  19b3  83c404           add sp, 4                                
  19b6  8bf0             mov si, ax                               
  19b8  6a03             push 3                                   
  19ba  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  19bf  59               pop cx                                   
  19c0  6a11             push 0x11                                
  19c2  56               push si                                  
  19c3  6668a000b500     push 0xb500a0                            
  19c9  16               push ss                                  
  19ca  8d46f8           lea ax, [bp - 8]                         
  19cd  50               push ax                                  
  19ce  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  19d3  83c40c           add sp, 0xc                              
  19d6  52               push dx                                  
  19d7  50               push ax                                  
  19d8  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  19dd  83c404           add sp, 4                                
  19e0  1e               push ds                                  
  19e1  68d925           push 0x25d9                               ; "Leader"
  19e4  6668a000b500     push 0xb500a0                            
  19ea  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  19ef  83c408           add sp, 8                                
  19f2  666890007a00     push 0x7a0090                            
  19f8  1e               push ds                                  
  19f9  682a34           push 0x342a                              
  19fc  6a00             push 0                                   
  19fe  ff366325         push word ptr [0x2563]                   
  1a02  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  1a07  83c40c           add sp, 0xc                              
  1a0a  6668c8017a00     push 0x7a01c8                            
  1a10  1e               push ds                                  
  1a11  682a34           push 0x342a                              
  1a14  6a00             push 0                                   
  1a16  ff366325         push word ptr [0x2563]                   
  1a1a  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  1a1f  83c40c           add sp, 0xc                              
  1a22  66689000ca00     push 0xca0090                            
  1a28  1e               push ds                                  
  1a29  682a34           push 0x342a                              
  1a2c  6a00             push 0                                   
  1a2e  ff366325         push word ptr [0x2563]                   
  1a32  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  1a37  83c40c           add sp, 0xc                              
  1a3a  666800000300     push 0x30000                             
  1a40  666802000f00     push 0xf0002                             
  1a46  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1a4b  83c408           add sp, 8                                
  1a4e  1e               push ds                                  
  1a4f  68e025           push 0x25e0                               ; "Retype the name of this side"
  1a52  666840017400     push 0x740140                            
  1a58  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  1a5d  83c408           add sp, 8                                
  1a60  a16325           mov ax, word ptr [0x2563]                
  1a63  6bc014           imul ax, ax, 0x14                        
  1a66  050000           add ax, 0                                
  1a69  68042c           push 0x2c04                              
  1a6c  50               push ax                                  
  1a6d  6668bc001600     push 0x1600bc                            
  1a73  6668e5008a00     push 0x8a00e5                            
  1a79  9a5c00c130       lcall 0x30c1, 0x5c                       -> ovl59:0058
  1a7e  83c40c           add sp, 0xc                              
  1a81  6a00             push 0                                   
  1a83  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1a88  59               pop cx                                   
  1a89  6668da004800     push 0x4800da                            
  1a8f  68c400           push 0xc4                                
  1a92  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  1a97  83c406           add sp, 6                                
  1a9a  6668da006000     push 0x6000da                            
  1aa0  688001           push 0x180                               
  1aa3  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  1aa8  83c406           add sp, 6                                
  1aab  1e               push ds                                  
  1aac  68fd25           push 0x25fd                               ; "Name"
  1aaf  6668c400cb00     push 0xcb00c4                            
  1ab5  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1aba  83c408           add sp, 8                                
  1abd  1e               push ds                                  
  1abe  680226           push 0x2602                               ; "Description"
  1ac1  66688001cb00     push 0xcb0180                            
  1ac7  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1acc  83c408           add sp, 8                                
  1acf  6a01             push 1                                   
  1ad1  90               nop                                      
  1ad2  0e               push cs                                  
  1ad3  e81001           call 0x1be6                              
  1ad6  59               pop cx                                   
  1ad7  90               nop                                      
  1ad8  0e               push cs                                  
  1ad9  e83302           call 0x1d0f                              
  1adc  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  1ae1  5e               pop si                                   
  1ae2  c9               leave                                    
  1ae3  cb               retf                                     

ovl57_1ae4:  ; ENTRY
  1ae4  55               push bp                                  
  1ae5  8bec             mov bp, sp                               
  1ae7  56               push si                                  
  1ae8  33f6             xor si, si                               
  1aea  eb23             jmp 0x1b0f                               
  1aec  8bde             mov bx, si                               
  1aee  d1e3             shl bx, 1                                
  1af0  83bf5a5900       cmp word ptr [bx + 0x595a], 0            
  1af5  7d05             jge 0x1afc                               
  1af7  b80200           mov ax, 2                                
  1afa  eb03             jmp 0x1aff                               
  1afc  b80100           mov ax, 1                                
  1aff  50               push ax                                  
  1b00  8bc6             mov ax, si                               
  1b02  05d001           add ax, 0x1d0                            
  1b05  50               push ax                                  
  1b06  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1b0b  83c404           add sp, 4                                
  1b0e  46               inc si                                   
  1b0f  83fe05           cmp si, 5                                
  1b12  7cd8             jl 0x1aec                                
  1b14  6668c9010100     push 0x101c9                             
  1b1a  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1b1f  83c404           add sp, 4                                
  1b22  6668ca010100     push 0x101ca                             
  1b28  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1b2d  83c404           add sp, 4                                
  1b30  6668cb010100     push 0x101cb                             
  1b36  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1b3b  83c404           add sp, 4                                
  1b3e  8b1e6325         mov bx, word ptr [0x2563]                
  1b42  d1e3             shl bx, 1                                
  1b44  b8042c           mov ax, 0x2c04                           
  1b47  8ec0             mov es, ax                               
  1b49  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1b4f  7539             jne 0x1b8a                               
  1b51  6668cc010200     push 0x201cc                             
  1b57  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1b5c  83c404           add sp, 4                                
  1b5f  6668ce010200     push 0x201ce                             
  1b65  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1b6a  83c404           add sp, 4                                
  1b6d  6668cd010200     push 0x201cd                             
  1b73  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1b78  83c404           add sp, 4                                
  1b7b  6a02             push 2                                   
  1b7d  68cf01           push 0x1cf                               
  1b80  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1b85  83c404           add sp, 4                                
  1b88  eb59             jmp 0x1be3                               
  1b8a  833e5a5900       cmp word ptr [0x595a], 0                 
  1b8f  7e12             jle 0x1ba3                               
  1b91  6668cc010100     push 0x101cc                             
  1b97  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1b9c  83c404           add sp, 4                                
  1b9f  6a01             push 1                                   
  1ba1  eb10             jmp 0x1bb3                               
  1ba3  6668cc010200     push 0x201cc                             
  1ba9  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1bae  83c404           add sp, 4                                
  1bb1  6a02             push 2                                   
  1bb3  68ce01           push 0x1ce                               
  1bb6  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1bbb  83c404           add sp, 4                                
  1bbe  a12e48           mov ax, word ptr [0x482e]                
  1bc1  48               dec ax                                   
  1bc2  3b066259         cmp ax, word ptr [0x5962]                
  1bc6  7ea5             jle 0x1b6d                               
  1bc8  833e625900       cmp word ptr [0x5962], 0                 
  1bcd  7e9e             jle 0x1b6d                               
  1bcf  6668cd010100     push 0x101cd                             
  1bd5  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  1bda  83c404           add sp, 4                                
  1bdd  6a01             push 1                                   
  1bdf  eb9c             jmp 0x1b7d                               
  1be1  eb8a             jmp 0x1b6d                               
  1be3  5e               pop si                                   
  1be4  5d               pop bp                                   
  1be5  cb               retf                                     

ovl57_1be6:  ; ENTRY
  1be6  55               push bp                                  
  1be7  8bec             mov bp, sp                               
  1be9  83ec08           sub sp, 8                                
  1bec  56               push si                                  
  1bed  837e0600         cmp word ptr [bp + 6], 0                 
  1bf1  744c             je 0x1c3f                                
  1bf3  666804000200     push 0x20004                             
  1bf9  6668bc006600     push 0x6600bc                            
  1bff  6668bc00f800     push 0xf800bc                            
  1c05  16               push ss                                  
  1c06  8d46f8           lea ax, [bp - 8]                         
  1c09  50               push ax                                  
  1c0a  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  1c0f  83c40c           add sp, 0xc                              
  1c12  52               push dx                                  
  1c13  50               push ax                                  
  1c14  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  1c19  83c408           add sp, 8                                
  1c1c  ff46f8           inc word ptr [bp - 8]                    
  1c1f  ff46fa           inc word ptr [bp - 6]                    
  1c22  836efc02         sub word ptr [bp - 4], 2                 
  1c26  836efe02         sub word ptr [bp - 2], 2                 
  1c2a  6a03             push 3                                   
  1c2c  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  1c31  59               pop cx                                   
  1c32  16               push ss                                  
  1c33  8d46f8           lea ax, [bp - 8]                         
  1c36  50               push ax                                  
  1c37  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  1c3c  83c404           add sp, 4                                
  1c3f  8b1e6325         mov bx, word ptr [0x2563]                
  1c43  d1e3             shl bx, 1                                
  1c45  b8042c           mov ax, 0x2c04                           
  1c48  8ec0             mov es, ax                               
  1c4a  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  1c50  7503             jne 0x1c55                               
  1c52  e9b700           jmp 0x1d0c                               
  1c55  33f6             xor si, si                               
  1c57  e9aa00           jmp 0x1d04                               
  1c5a  8bde             mov bx, si                               
  1c5c  d1e3             shl bx, 1                                
  1c5e  83bf5a5900       cmp word ptr [bx + 0x595a], 0            
  1c63  7d03             jge 0x1c68                               
  1c65  e9a400           jmp 0x1d0c                               
  1c68  8bde             mov bx, si                               
  1c6a  d1e3             shl bx, 1                                
  1c6c  8b875a59         mov ax, word ptr [bx + 0x595a]           
  1c70  3b065859         cmp ax, word ptr [0x5958]                
  1c74  750a             jne 0x1c80                               
  1c76  666800000300     push 0x30000                             
  1c7c  6a0f             push 0xf                                 
  1c7e  eb55             jmp 0x1cd5                               
  1c80  8b1e6325         mov bx, word ptr [0x2563]                
  1c84  d1e3             shl bx, 1                                
  1c86  b8042c           mov ax, 0x2c04                           
  1c89  8ec0             mov es, ax                               
  1c8b  2683bfc00000     cmp word ptr es:[bx + 0xc0], 0           
  1c91  750a             jne 0x1c9d                               
  1c93  666800000300     push 0x30000                             
  1c99  6a05             push 5                                   
  1c9b  eb38             jmp 0x1cd5                               
  1c9d  8b1e6325         mov bx, word ptr [0x2563]                
  1ca1  d1e3             shl bx, 1                                
  1ca3  b8042c           mov ax, 0x2c04                           
  1ca6  8ec0             mov es, ax                               
  1ca8  2683bfc00001     cmp word ptr es:[bx + 0xc0], 1           
  1cae  750a             jne 0x1cba                               
  1cb0  666800000300     push 0x30000                             
  1cb6  6a07             push 7                                   
  1cb8  eb1b             jmp 0x1cd5                               
  1cba  8b1e6325         mov bx, word ptr [0x2563]                
  1cbe  d1e3             shl bx, 1                                
  1cc0  b8042c           mov ax, 0x2c04                           
  1cc3  8ec0             mov es, ax                               
  1cc5  2683bfc00002     cmp word ptr es:[bx + 0xc0], 2           
  1ccb  7512             jne 0x1cdf                               
  1ccd  666800000300     push 0x30000                             
  1cd3  6a09             push 9                                   
  1cd5  6a02             push 2                                   
  1cd7  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1cdc  83c408           add sp, 8                                
  1cdf  8bde             mov bx, si                               
  1ce1  d1e3             shl bx, 1                                
  1ce3  8b875a59         mov ax, word ptr [bx + 0x595a]           
  1ce7  c1e005           shl ax, 5                                
  1cea  053c48           add ax, 0x483c                           
  1ced  1e               push ds                                  
  1cee  50               push ax                                  
  1cef  8bc6             mov ax, si                               
  1cf1  6bc013           imul ax, ax, 0x13                        
  1cf4  05fc00           add ax, 0xfc                             
  1cf7  50               push ax                                  
  1cf8  68c400           push 0xc4                                
  1cfb  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1d00  83c408           add sp, 8                                
  1d03  46               inc si                                   
  1d04  83fe05           cmp si, 5                                
  1d07  7d03             jge 0x1d0c                               
  1d09  e94eff           jmp 0x1c5a                               
  1d0c  5e               pop si                                   
  1d0d  c9               leave                                    
  1d0e  cb               retf                                     

ovl57_1d0f:  ; ENTRY
  1d0f  55               push bp                                  
  1d10  8bec             mov bp, sp                               
  1d12  8b1e6325         mov bx, word ptr [0x2563]                
  1d16  d1e3             shl bx, 1                                
  1d18  b8042c           mov ax, 0x2c04                           
  1d1b  8ec0             mov es, ax                               
  1d1d  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  1d23  743b             je 0x1d60                                
  1d25  666800000300     push 0x30000                             
  1d2b  666802000f00     push 0xf0002                             
  1d31  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1d36  83c408           add sp, 8                                
  1d39  1e               push ds                                  
  1d3a  680e26           push 0x260e                              
  1d3d  6668c400e000     push 0xe000c4                            
  1d43  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1d48  83c408           add sp, 8                                
  1d4b  1e               push ds                                  
  1d4c  681226           push 0x2612                              
  1d4f  68e000           push 0xe0                                
  1d52  688001           push 0x180                               
  1d55  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1d5a  83c408           add sp, 8                                
  1d5d  e92801           jmp 0x1e88                               
  1d60  8b1e6325         mov bx, word ptr [0x2563]                
  1d64  d1e3             shl bx, 1                                
  1d66  b8042c           mov ax, 0x2c04                           
  1d69  8ec0             mov es, ax                               
  1d6b  2683bfc00000     cmp word ptr es:[bx + 0xc0], 0           
  1d71  750a             jne 0x1d7d                               
  1d73  666800000300     push 0x30000                             
  1d79  6a05             push 5                                   
  1d7b  eb38             jmp 0x1db5                               
  1d7d  8b1e6325         mov bx, word ptr [0x2563]                
  1d81  d1e3             shl bx, 1                                
  1d83  b8042c           mov ax, 0x2c04                           
  1d86  8ec0             mov es, ax                               
  1d88  2683bfc00001     cmp word ptr es:[bx + 0xc0], 1           
  1d8e  750a             jne 0x1d9a                               
  1d90  666800000300     push 0x30000                             
  1d96  6a07             push 7                                   
  1d98  eb1b             jmp 0x1db5                               
  1d9a  8b1e6325         mov bx, word ptr [0x2563]                
  1d9e  d1e3             shl bx, 1                                
  1da0  b8042c           mov ax, 0x2c04                           
  1da3  8ec0             mov es, ax                               
  1da5  2683bfc00002     cmp word ptr es:[bx + 0xc0], 2           
  1dab  7512             jne 0x1dbf                               
  1dad  666800000300     push 0x30000                             
  1db3  6a09             push 9                                   
  1db5  6a02             push 2                                   
  1db7  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  1dbc  83c408           add sp, 8                                
  1dbf  6668bc001400     push 0x1400bc                            
  1dc5  66684800ae00     push 0xae0048                            
  1dcb  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  1dd0  83c408           add sp, 8                                
  1dd3  a15859           mov ax, word ptr [0x5958]                
  1dd6  c1e005           shl ax, 5                                
  1dd9  053c48           add ax, 0x483c                           
  1ddc  1e               push ds                                  
  1ddd  50               push ax                                  
  1dde  6668c000e000     push 0xe000c0                            
  1de4  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1de9  83c408           add sp, 8                                
  1dec  666870007800     push 0x780070                            
  1df2  66680801ae00     push 0xae0108                            
  1df8  9a2a00ac2f       lcall 0x2fac, 0x2a                       -> ovl17:070b
  1dfd  83c408           add sp, 8                                
  1e00  6a01             push 1                                   
  1e02  90               nop                                      
  1e03  0e               push cs                                  
  1e04  e8d502           call 0x20dc                              
  1e07  59               pop cx                                   
  1e08  52               push dx                                  
  1e09  50               push ax                                  
  1e0a  66688001e000     push 0xe00180                            
  1e10  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1e15  83c408           add sp, 8                                
  1e18  6a02             push 2                                   
  1e1a  90               nop                                      
  1e1b  0e               push cs                                  
  1e1c  e8bd02           call 0x20dc                              
  1e1f  59               pop cx                                   
  1e20  52               push dx                                  
  1e21  50               push ax                                  
  1e22  66688001f400     push 0xf40180                            
  1e28  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1e2d  83c408           add sp, 8                                
  1e30  6a03             push 3                                   
  1e32  90               nop                                      
  1e33  0e               push cs                                  
  1e34  e8a502           call 0x20dc                              
  1e37  59               pop cx                                   
  1e38  52               push dx                                  
  1e39  50               push ax                                  
  1e3a  666880010801     push 0x1080180                           
  1e40  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1e45  83c408           add sp, 8                                
  1e48  6a04             push 4                                   
  1e4a  90               nop                                      
  1e4b  0e               push cs                                  
  1e4c  e88d02           call 0x20dc                              
  1e4f  59               pop cx                                   
  1e50  52               push dx                                  
  1e51  50               push ax                                  
  1e52  666880011c01     push 0x11c0180                           
  1e58  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1e5d  83c408           add sp, 8                                
  1e60  6a05             push 5                                   
  1e62  90               nop                                      
  1e63  0e               push cs                                  
  1e64  e87502           call 0x20dc                              
  1e67  59               pop cx                                   
  1e68  52               push dx                                  
  1e69  50               push ax                                  
  1e6a  666880013001     push 0x1300180                           
  1e70  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  1e75  83c408           add sp, 8                                
  1e78  6a06             push 6                                   
  1e7a  90               nop                                      
  1e7b  0e               push cs                                  
  1e7c  e85d02           call 0x20dc                              
  1e7f  59               pop cx                                   
  1e80  52               push dx                                  
  1e81  50               push ax                                  
  1e82  684401           push 0x144                               
  1e85  e9cafe           jmp 0x1d52                               
  1e88  5d               pop bp                                   
  1e89  cb               retf                                     

ovl57_1e8a:  ; ENTRY
  1e8a  55               push bp                                  
  1e8b  8bec             mov bp, sp                               
  1e8d  56               push si                                  
  1e8e  8b5606           mov dx, word ptr [bp + 6]                
  1e91  8bda             mov bx, dx                               
  1e93  d1e3             shl bx, 1                                
  1e95  83bf5a5900       cmp word ptr [bx + 0x595a], 0            
  1e9a  7c2e             jl 0x1eca                                
  1e9c  8bda             mov bx, dx                               
  1e9e  d1e3             shl bx, 1                                
  1ea0  8b875a59         mov ax, word ptr [bx + 0x595a]           
  1ea4  a35859           mov word ptr [0x5958], ax                
  1ea7  8b1e6325         mov bx, word ptr [0x2563]                
  1eab  d1e3             shl bx, 1                                
  1ead  b8042c           mov ax, 0x2c04                           
  1eb0  8bf2             mov si, dx                               
  1eb2  d1e6             shl si, 1                                
  1eb4  8b945a59         mov dx, word ptr [si + 0x595a]           
  1eb8  8ec0             mov es, ax                               
  1eba  268997e000       mov word ptr es:[bx + 0xe0], dx          
  1ebf  6a00             push 0                                   
  1ec1  0e               push cs                                  
  1ec2  e821fd           call 0x1be6                              
  1ec5  59               pop cx                                   
  1ec6  0e               push cs                                  
  1ec7  e845fe           call 0x1d0f                              
  1eca  0e               push cs                                  
  1ecb  e816fc           call 0x1ae4                              
  1ece  5e               pop si                                   
  1ecf  5d               pop bp                                   
  1ed0  cb               retf                                     

ovl57_1ed1:  ; ENTRY
  1ed1  55               push bp                                  
  1ed2  8bec             mov bp, sp                               
  1ed4  33d2             xor dx, dx                               
  1ed6  eb39             jmp 0x1f11                               
  1ed8  8bda             mov bx, dx                               
  1eda  d1e3             shl bx, 1                                
  1edc  8b4606           mov ax, word ptr [bp + 6]                
  1edf  01875a59         add word ptr [bx + 0x595a], ax           
  1ee3  8bda             mov bx, dx                               
  1ee5  d1e3             shl bx, 1                                
  1ee7  83bf5a5900       cmp word ptr [bx + 0x595a], 0            
  1eec  7d0a             jge 0x1ef8                               
  1eee  8bda             mov bx, dx                               
  1ef0  d1e3             shl bx, 1                                
  1ef2  c7875a59ffff     mov word ptr [bx + 0x595a], 0xffff       
  1ef8  8bda             mov bx, dx                               
  1efa  d1e3             shl bx, 1                                
  1efc  8b875a59         mov ax, word ptr [bx + 0x595a]           
  1f00  3b062e48         cmp ax, word ptr [0x482e]                
  1f04  7c0a             jl 0x1f10                                
  1f06  8bda             mov bx, dx                               
  1f08  d1e3             shl bx, 1                                
  1f0a  c7875a59ffff     mov word ptr [bx + 0x595a], 0xffff       
  1f10  42               inc dx                                   
  1f11  83fa05           cmp dx, 5                                
  1f14  7cc2             jl 0x1ed8                                
  1f16  6a01             push 1                                   
  1f18  0e               push cs                                  
  1f19  e8cafc           call 0x1be6                              
  1f1c  59               pop cx                                   
  1f1d  0e               push cs                                  
  1f1e  e8c3fb           call 0x1ae4                              
  1f21  5d               pop bp                                   
  1f22  cb               retf                                     

ovl57_1f23:  ; ENTRY
  1f23  55               push bp                                  
  1f24  8bec             mov bp, sp                               
  1f26  837e06ff         cmp word ptr [bp + 6], -1                
  1f2a  7515             jne 0x1f41                               
  1f2c  833e5a5905       cmp word ptr [0x595a], 5                 
  1f31  7e05             jle 0x1f38                               
  1f33  b80500           mov ax, 5                                
  1f36  eb03             jmp 0x1f3b                               
  1f38  a15a59           mov ax, word ptr [0x595a]                
  1f3b  f7d8             neg ax                                   
  1f3d  8bd0             mov dx, ax                               
  1f3f  eb1c             jmp 0x1f5d                               
  1f41  a12e48           mov ax, word ptr [0x482e]                
  1f44  2b066259         sub ax, word ptr [0x5962]                
  1f48  48               dec ax                                   
  1f49  3d0500           cmp ax, 5                                
  1f4c  7e05             jle 0x1f53                               
  1f4e  b80500           mov ax, 5                                
  1f51  eb08             jmp 0x1f5b                               
  1f53  a12e48           mov ax, word ptr [0x482e]                
  1f56  2b066259         sub ax, word ptr [0x5962]                
  1f5a  48               dec ax                                   
  1f5b  8bd0             mov dx, ax                               
  1f5d  01165a59         add word ptr [0x595a], dx                
  1f61  ba0100           mov dx, 1                                
  1f64  eb12             jmp 0x1f78                               
  1f66  8bda             mov bx, dx                               
  1f68  d1e3             shl bx, 1                                
  1f6a  8b875859         mov ax, word ptr [bx + 0x5958]           
  1f6e  40               inc ax                                   
  1f6f  8bda             mov bx, dx                               
  1f71  d1e3             shl bx, 1                                
  1f73  89875a59         mov word ptr [bx + 0x595a], ax           
  1f77  42               inc dx                                   
  1f78  83fa05           cmp dx, 5                                
  1f7b  7ce9             jl 0x1f66                                
  1f7d  6a01             push 1                                   
  1f7f  0e               push cs                                  
  1f80  e863fc           call 0x1be6                              
  1f83  59               pop cx                                   
  1f84  0e               push cs                                  
  1f85  e85cfb           call 0x1ae4                              
  1f88  5d               pop bp                                   
  1f89  cb               retf                                     

ovl57_1f8a:  ; ENTRY
  1f8a  55               push bp                                  
  1f8b  8bec             mov bp, sp                               
  1f8d  83ec08           sub sp, 8                                
  1f90  6668bc001600     push 0x1600bc                            
  1f96  6668e5008a00     push 0x8a00e5                            
  1f9c  16               push ss                                  
  1f9d  8d46f8           lea ax, [bp - 8]                         
  1fa0  50               push ax                                  
  1fa1  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  1fa6  83c40c           add sp, 0xc                              
  1fa9  66680f008000     push 0x80000f                            
  1faf  a16325           mov ax, word ptr [0x2563]                
  1fb2  6bc014           imul ax, ax, 0x14                        
  1fb5  050000           add ax, 0                                
  1fb8  68042c           push 0x2c04                              
  1fbb  50               push ax                                  
  1fbc  8d46f8           lea ax, [bp - 8]                         
  1fbf  8cd2             mov dx, ss                               
  1fc1  b90800           mov cx, 8                                
  1fc4  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  1fc9  9a4800a530       lcall 0x30a5, 0x48                       -> ovl56:03a6
  1fce  83c410           add sp, 0x10                             
  1fd1  0e               push cs                                  
  1fd2  e80ffb           call 0x1ae4                              
  1fd5  c9               leave                                    
  1fd6  cb               retf                                     

ovl57_1fd7:  ; ENTRY
  1fd7  55               push bp                                  
  1fd8  8bec             mov bp, sp                               
  1fda  1e               push ds                                  
  1fdb  686459           push 0x5964                              
  1fde  a16325           mov ax, word ptr [0x2563]                
  1fe1  6bc014           imul ax, ax, 0x14                        
  1fe4  050000           add ax, 0                                
  1fe7  68042c           push 0x2c04                              
  1fea  50               push ax                                  
  1feb  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  1ff0  83c408           add sp, 8                                
  1ff3  8b1e6325         mov bx, word ptr [0x2563]                
  1ff7  d1e3             shl bx, 1                                
  1ff9  b8042c           mov ax, 0x2c04                           
  1ffc  8b165659         mov dx, word ptr [0x5956]                
  2000  8ec0             mov es, ax                               
  2002  268997e000       mov word ptr es:[bx + 0xe0], dx          
  2007  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  200c  c7066a160000     mov word ptr [0x166a], 0                 
  2012  666800000100     push 0x10000                             
  2018  666a00           push 0                                   
  201b  0e               push cs                                  
  201c  e8e1df           call 0                                   
  201f  83c408           add sp, 8                                
  2022  5d               pop bp                                   
  2023  cb               retf                                     

ovl57_2024:  ; ENTRY
  2024  55               push bp                                  
  2025  8bec             mov bp, sp                               
  2027  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  202c  c7066a160000     mov word ptr [0x166a], 0                 
  2032  666800000100     push 0x10000                             
  2038  666a00           push 0                                   
  203b  0e               push cs                                  
  203c  e8c1df           call 0                                   
  203f  83c408           add sp, 8                                
  2042  6a01             push 1                                   
  2044  ff366325         push word ptr [0x2563]                   
  2048  0e               push cs                                  
  2049  e8e8e5           call 0x634                               
  204c  83c404           add sp, 4                                
  204f  5d               pop bp                                   
  2050  cb               retf                                     

ovl57_2051:  ; ENTRY
  2051  55               push bp                                  
  2052  8bec             mov bp, sp                               
  2054  56               push si                                  
  2055  33f6             xor si, si                               
  2057  eb77             jmp 0x20d0                               
  2059  8bde             mov bx, si                               
  205b  d1e3             shl bx, 1                                
  205d  b8042c           mov ax, 0x2c04                           
  2060  8ec0             mov es, ax                               
  2062  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  2068  7465             je 0x20cf                                
  206a  8bde             mov bx, si                               
  206c  d1e3             shl bx, 1                                
  206e  b8042c           mov ax, 0x2c04                           
  2071  8ec0             mov es, ax                               
  2073  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  2079  7554             jne 0x20cf                               
  207b  8bde             mov bx, si                               
  207d  d1e3             shl bx, 1                                
  207f  b8042c           mov ax, 0x2c04                           
  2082  8ec0             mov es, ax                               
  2084  2683bfc00003     cmp word ptr es:[bx + 0xc0], 3           
  208a  7443             je 0x20cf                                
  208c  666a00           push 0                                   
  208f  6aff             push -1                                  
  2091  8bde             mov bx, si                               
  2093  d1e3             shl bx, 1                                
  2095  8ec0             mov es, ax                               
  2097  26ffb7c000       push word ptr es:[bx + 0xc0]             
  209c  6a07             push 7                                   
  209e  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  20a3  83c40a           add sp, 0xa                              
  20a6  6a00             push 0                                   
  20a8  a12e48           mov ax, word ptr [0x482e]                
  20ab  48               dec ax                                   
  20ac  50               push ax                                  
  20ad  6a01             push 1                                   
  20af  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  20b4  83c406           add sp, 6                                
  20b7  8bde             mov bx, si                               
  20b9  d1e3             shl bx, 1                                
  20bb  ba042c           mov dx, 0x2c04                           
  20be  8ec2             mov es, dx                               
  20c0  268987e000       mov word ptr es:[bx + 0xe0], ax          
  20c5  6a00             push 0                                   
  20c7  56               push si                                  
  20c8  0e               push cs                                  
  20c9  e868e5           call 0x634                               
  20cc  83c404           add sp, 4                                
  20cf  46               inc si                                   
  20d0  83fe08           cmp si, 8                                
  20d3  7c84             jl 0x2059                                
  20d5  0e               push cs                                  
  20d6  e83de3           call 0x416                               
  20d9  5e               pop si                                   
  20da  5d               pop bp                                   
  20db  cb               retf                                     

ovl57_20dc:  ; ENTRY
  20dc  55               push bp                                  
  20dd  8bec             mov bp, sp                               
  20df  83ec40           sub sp, 0x40                             
  20e2  56               push si                                  
  20e3  57               push di                                  
  20e4  33f6             xor si, si                               
  20e6  c606885c00       mov byte ptr [0x5c88], 0                 
  20eb  16               push ss                                  
  20ec  8d46d2           lea ax, [bp - 0x2e]                      
  20ef  50               push ax                                  
  20f0  6a00             push 0                                   
  20f2  ff366325         push word ptr [0x2563]                   
  20f6  90               nop                                      
  20f7  0e               push cs                                  
  20f8  e8c600           call 0x21c1                              
  20fb  83c408           add sp, 8                                
  20fe  6a02             push 2                                   
  2100  16               push ss                                  
  2101  8d46d2           lea ax, [bp - 0x2e]                      
  2104  50               push ax                                  
  2105  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  210a  83c406           add sp, 6                                
  210d  8bf8             mov di, ax                               
  210f  0bff             or di, di                                
  2111  7d03             jge 0x2116                               
  2113  e9a200           jmp 0x21b8                               
  2116  50               push ax                                  
  2117  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  211c  59               pop cx                                   
  211d  8946fa           mov word ptr [bp - 6], ax                
  2120  50               push ax                                  
  2121  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  2126  59               pop cx                                   
  2127  8956fe           mov word ptr [bp - 2], dx                
  212a  8946fc           mov word ptr [bp - 4], ax                
  212d  ff76fa           push word ptr [bp - 6]                   
  2130  52               push dx                                  
  2131  50               push ax                                  
  2132  57               push di                                  
  2133  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2138  83c408           add sp, 8                                
  213b  57               push di                                  
  213c  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  2141  59               pop cx                                   
  2142  8bde             mov bx, si                               
  2144  d1e3             shl bx, 1                                
  2146  8d46c0           lea ax, [bp - 0x40]                      
  2149  03d8             add bx, ax                               
  214b  36c7070000       mov word ptr ss:[bx], 0                  
  2150  46               inc si                                   
  2151  33d2             xor dx, dx                               
  2153  eb25             jmp 0x217a                               
  2155  c45efc           les bx, ptr [bp - 4]                     
  2158  03da             add bx, dx                               
  215a  26803f0d         cmp byte ptr es:[bx], 0xd                
  215e  7519             jne 0x2179                               
  2160  8b5efc           mov bx, word ptr [bp - 4]                
  2163  03da             add bx, dx                               
  2165  26c60700         mov byte ptr es:[bx], 0                  
  2169  83c202           add dx, 2                                
  216c  8bde             mov bx, si                               
  216e  d1e3             shl bx, 1                                
  2170  8d46c0           lea ax, [bp - 0x40]                      
  2173  03d8             add bx, ax                               
  2175  368917           mov word ptr ss:[bx], dx                 
  2178  46               inc si                                   
  2179  42               inc dx                                   
  217a  3b56fa           cmp dx, word ptr [bp - 6]                
  217d  7d05             jge 0x2184                               
  217f  83fe09           cmp si, 9                                
  2182  7cd1             jl 0x2155                                
  2184  8bc6             mov ax, si                               
  2186  48               dec ax                                   
  2187  3b4606           cmp ax, word ptr [bp + 6]                
  218a  7e20             jle 0x21ac                               
  218c  8b5e06           mov bx, word ptr [bp + 6]                
  218f  d1e3             shl bx, 1                                
  2191  8d46c0           lea ax, [bp - 0x40]                      
  2194  03d8             add bx, ax                               
  2196  8b46fc           mov ax, word ptr [bp - 4]                
  2199  360307           add ax, word ptr ss:[bx]                 
  219c  ff76fe           push word ptr [bp - 2]                   
  219f  50               push ax                                  
  21a0  1e               push ds                                  
  21a1  68885c           push 0x5c88                              
  21a4  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  21a9  83c408           add sp, 8                                
  21ac  66ff76fc         push dword ptr [bp - 4]                  
  21b0  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  21b5  83c404           add sp, 4                                
  21b8  8cda             mov dx, ds                               
  21ba  b8885c           mov ax, 0x5c88                           
  21bd  5f               pop di                                   
  21be  5e               pop si                                   
  21bf  c9               leave                                    
  21c0  cb               retf                                     

ovl57_21c1:  ; ENTRY
  21c1  55               push bp                                  
  21c2  8bec             mov bp, sp                               
  21c4  83ec04           sub sp, 4                                
  21c7  56               push si                                  
  21c8  8b7606           mov si, word ptr [bp + 6]                
  21cb  1e               push ds                                  
  21cc  681626           push 0x2616                              
  21cf  16               push ss                                  
  21d0  8d46fc           lea ax, [bp - 4]                         
  21d3  50               push ax                                  
  21d4  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  21d9  83c408           add sp, 8                                
  21dc  837e0800         cmp word ptr [bp + 8], 0                 
  21e0  7407             je 0x21e9                                
  21e2  8cda             mov dx, ds                               
  21e4  b82a26           mov ax, 0x262a                           
  21e7  eb05             jmp 0x21ee                               
  21e9  8cda             mov dx, ds                               
  21eb  b82e26           mov ax, 0x262e                           
  21ee  52               push dx                                  
  21ef  50               push ax                                  
  21f0  8bde             mov bx, si                               
  21f2  d1e3             shl bx, 1                                
  21f4  b8042c           mov ax, 0x2c04                           
  21f7  8ec0             mov es, ax                               
  21f9  26ffb7e000       push word ptr es:[bx + 0xe0]             
  21fe  8bde             mov bx, si                               
  2200  d1e3             shl bx, 1                                
  2202  b8042c           mov ax, 0x2c04                           
  2205  8ec0             mov es, ax                               
  2207  268b9fc000       mov bx, word ptr es:[bx + 0xc0]          
  220c  8d46fc           lea ax, [bp - 4]                         
  220f  03d8             add bx, ax                               
  2211  368a07           mov al, byte ptr ss:[bx]                 
  2214  98               cwde                                     
  2215  50               push ax                                  
  2216  1e               push ds                                  
  2217  681a26           push 0x261a                               ; "CARDS\%c%03d.%s"
  221a  66ff760a         push dword ptr [bp + 0xa]                
  221e  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  2223  83c410           add sp, 0x10                             
  2226  5e               pop si                                   
  2227  c9               leave                                    
  2228  cb               retf                                     

ovl57_2229:  ; ENTRY
  2229  55               push bp                                  
  222a  8bec             mov bp, sp                               
  222c  90               nop                                      
  222d  0e               push cs                                  
  222e  e80a00           call 0x223b                              
  2231  0e               push cs                                  
  2232  e876e9           call 0xbab                               
  2235  0e               push cs                                  
  2236  e8dde1           call 0x416                               
  2239  5d               pop bp                                   
  223a  cb               retf                                     

ovl57_223b:  ; ENTRY
  223b  55               push bp                                  
  223c  8bec             mov bp, sp                               
  223e  56               push si                                  
  223f  57               push di                                  
  2240  666800000200     push 0x20000                             
  2246  6a43             push 0x43                                
  2248  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  224d  83c404           add sp, 4                                
  2250  52               push dx                                  
  2251  50               push ax                                  
  2252  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  2257  83c406           add sp, 6                                
  225a  8bf8             mov di, ax                               
  225c  0bff             or di, di                                
  225e  7c25             jl 0x2285                                
  2260  33f6             xor si, si                               
  2262  eb15             jmp 0x2279                               
  2264  6a02             push 2                                   
  2266  1e               push ds                                  
  2267  8bc6             mov ax, si                               
  2269  d1e0             shl ax, 1                                
  226b  05b423           add ax, 0x23b4                           
  226e  50               push ax                                  
  226f  57               push di                                  
  2270  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  2275  83c408           add sp, 8                                
  2278  46               inc si                                   
  2279  83fe0a           cmp si, 0xa                              
  227c  7ce6             jl 0x2264                                
  227e  57               push di                                  
  227f  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  2284  59               pop cx                                   
  2285  5f               pop di                                   
  2286  5e               pop si                                   
  2287  5d               pop bp                                   
  2288  cb               retf                                     

ovl57_2289:  ; ENTRY
  2289  55               push bp                                  
  228a  8bec             mov bp, sp                               
  228c  56               push si                                  
  228d  57               push di                                  
  228e  666800000900     push 0x90000                             
  2294  6a43             push 0x43                                
  2296  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  229b  83c404           add sp, 4                                
  229e  52               push dx                                  
  229f  50               push ax                                  
  22a0  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  22a5  83c406           add sp, 6                                
  22a8  8bf8             mov di, ax                               
  22aa  0bff             or di, di                                
  22ac  7c25             jl 0x22d3                                
  22ae  33f6             xor si, si                               
  22b0  eb15             jmp 0x22c7                               
  22b2  6a02             push 2                                   
  22b4  1e               push ds                                  
  22b5  8bc6             mov ax, si                               
  22b7  d1e0             shl ax, 1                                
  22b9  05b423           add ax, 0x23b4                           
  22bc  50               push ax                                  
  22bd  57               push di                                  
  22be  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  22c3  83c408           add sp, 8                                
  22c6  46               inc si                                   
  22c7  83fe0a           cmp si, 0xa                              
  22ca  7ce6             jl 0x22b2                                
  22cc  57               push di                                  
  22cd  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  22d2  59               pop cx                                   
  22d3  5f               pop di                                   
  22d4  5e               pop si                                   
  22d5  5d               pop bp                                   
  22d6  cb               retf                                     
