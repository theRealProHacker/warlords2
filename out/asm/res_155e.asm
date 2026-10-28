; res_155e file_off 0x175e0

res_155e_0005:  ; ENTRY
  0005  55               push bp                                  
  0006  8bec             mov bp, sp                               
  0008  81ecc200         sub sp, 0xc2                             
  000c  56               push si                                  
  000d  57               push di                                  
  000e  33c0             xor ax, ax                               
  0010  be6870           mov si, 0x7068                           
  0013  c60400           mov byte ptr [si], 0                     
  0016  83c60b           add si, 0xb                              
  0019  40               inc ax                                   
  001a  81fed670         cmp si, 0x70d6                           
  001e  75f3             jne 0x13                                 
  0020  6a02             push 2                                   
  0022  1e               push ds                                  
  0023  68ae37           push 0x37ae                               ; "sound.dat"
  0026  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  002b  83c406           add sp, 6                                
  002e  8bf0             mov si, ax                               
  0030  0bf6             or si, si                                
  0032  7d06             jge 0x3a                                 
  0034  b000             mov al, 0                                
  0036  5f               pop di                                   
  0037  5e               pop si                                   
  0038  c9               leave                                    
  0039  cb               retf                                     
  003a  6a50             push 0x50                                
  003c  16               push ss                                  
  003d  8d46a2           lea ax, [bp - 0x5e]                      
  0040  50               push ax                                  
  0041  56               push si                                  
  0042  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0047  83c408           add sp, 8                                
  004a  1e               push ds                                  
  004b  68a437           push 0x37a4                              
  004e  16               push ss                                  
  004f  8d8670ff         lea ax, [bp - 0x90]                      
  0053  50               push ax                                  
  0054  16               push ss                                  
  0055  8d863eff         lea ax, [bp - 0xc2]                      
  0059  50               push ax                                  
  005a  1e               push ds                                  
  005b  68b837           push 0x37b8                               ; "%s %s %d"
  005e  16               push ss                                  
  005f  8d46a2           lea ax, [bp - 0x5e]                      
  0062  50               push ax                                  
  0063  9aba490000       lcall 0, 0x49ba                          -> 0000:49ba
  0068  83c414           add sp, 0x14                             
  006b  56               push si                                  
  006c  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0071  83c402           add sp, 2                                
  0074  8cd0             mov ax, ss                               
  0076  8db63eff         lea si, [bp - 0xc2]                      
  007a  1e               push ds                                  
  007b  07               pop es                                   
  007c  bfc137           mov di, 0x37c1                            ; "NO_SOUND"
  007f  50               push ax                                  
  0080  33c0             xor ax, ax                               
  0082  b9ffff           mov cx, 0xffff                           
  0085  f2ae             repne scasb al, byte ptr es:[di]         
  0087  f7d1             not cx                                   
  0089  2bf9             sub di, cx                               
  008b  8cd8             mov ax, ds                               
  008d  1f               pop ds                                   
  008e  50               push ax                                  
  008f  33c0             xor ax, ax                               
  0091  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  0093  1f               pop ds                                   
  0094  7405             je 0x9b                                  
  0096  1bc0             sbb ax, ax                               
  0098  1dffff           sbb ax, 0xffff                           
  009b  0bc0             or ax, ax                                
  009d  750b             jne 0xaa                                 
  009f  c606a23700       mov byte ptr [0x37a2], 0                 
  00a4  c706a4370000     mov word ptr [0x37a4], 0                 
  00aa  8cd0             mov ax, ss                               
  00ac  8db670ff         lea si, [bp - 0x90]                      
  00b0  1e               push ds                                  
  00b1  07               pop es                                   
  00b2  bfca37           mov di, 0x37ca                            ; "NO_SOUND"
  00b5  50               push ax                                  
  00b6  33c0             xor ax, ax                               
  00b8  b9ffff           mov cx, 0xffff                           
  00bb  f2ae             repne scasb al, byte ptr es:[di]         
  00bd  f7d1             not cx                                   
  00bf  2bf9             sub di, cx                               
  00c1  8cd8             mov ax, ds                               
  00c3  1f               pop ds                                   
  00c4  50               push ax                                  
  00c5  33c0             xor ax, ax                               
  00c7  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  00c9  1f               pop ds                                   
  00ca  7405             je 0xd1                                  
  00cc  1bc0             sbb ax, ax                               
  00ce  1dffff           sbb ax, 0xffff                           
  00d1  0bc0             or ax, ax                                
  00d3  7505             jne 0xda                                 
  00d5  c606a33700       mov byte ptr [0x37a3], 0                 
  00da  a0a237           mov al, byte ptr [0x37a2]                
  00dd  98               cwde                                     
  00de  0bc0             or ax, ax                                
  00e0  7513             jne 0xf5                                 
  00e2  a0a337           mov al, byte ptr [0x37a3]                
  00e5  98               cwde                                     
  00e6  0bc0             or ax, ax                                
  00e8  750b             jne 0xf5                                 
  00ea  c606a63701       mov byte ptr [0x37a6], 1                 
  00ef  b001             mov al, 1                                
  00f1  5f               pop di                                   
  00f2  5e               pop si                                   
  00f3  c9               leave                                    
  00f4  cb               retf                                     
  00f5  803ea23700       cmp byte ptr [0x37a2], 0                 
  00fa  7450             je 0x14c                                 
  00fc  8cd0             mov ax, ss                               
  00fe  8db63eff         lea si, [bp - 0xc2]                      
  0102  1e               push ds                                  
  0103  07               pop es                                   
  0104  bfd337           mov di, 0x37d3                            ; "IBMBAK.COM"
  0107  50               push ax                                  
  0108  33c0             xor ax, ax                               
  010a  b9ffff           mov cx, 0xffff                           
  010d  f2ae             repne scasb al, byte ptr es:[di]         
  010f  f7d1             not cx                                   
  0111  2bf9             sub di, cx                               
  0113  8cd8             mov ax, ds                               
  0115  1f               pop ds                                   
  0116  50               push ax                                  
  0117  33c0             xor ax, ax                               
  0119  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  011b  1f               pop ds                                   
  011c  7405             je 0x123                                 
  011e  1bc0             sbb ax, ax                               
  0120  1dffff           sbb ax, 0xffff                           
  0123  0bc0             or ax, ax                                
  0125  7505             jne 0x12c                                
  0127  c606ab3701       mov byte ptr [0x37ab], 1                 
  012c  a0ab37           mov al, byte ptr [0x37ab]                
  012f  98               cwde                                     
  0130  0bc0             or ax, ax                                
  0132  7518             jne 0x14c                                
  0134  16               push ss                                  
  0135  8d863eff         lea ax, [bp - 0xc2]                      
  0139  50               push ax                                  
  013a  9af5030000       lcall 0, 0x3f5                           -> 0000:03f5
  013f  83c404           add sp, 4                                
  0142  0bc0             or ax, ax                                
  0144  7506             jne 0x14c                                
  0146  b000             mov al, 0                                
  0148  5f               pop di                                   
  0149  5e               pop si                                   
  014a  c9               leave                                    
  014b  cb               retf                                     
  014c  803ea33700       cmp byte ptr [0x37a3], 0                 
  0151  7503             jne 0x156                                
  0153  e94401           jmp 0x29a                                
  0156  6a00             push 0                                   
  0158  6a00             push 0                                   
  015a  16               push ss                                  
  015b  8d8670ff         lea ax, [bp - 0x90]                      
  015f  50               push ax                                  
  0160  9a60060000       lcall 0, 0x660                           -> 0000:0660
  0165  83c408           add sp, 8                                
  0168  8956fe           mov word ptr [bp - 2], dx                
  016b  8946fc           mov word ptr [bp - 4], ax                
  016e  0b46fe           or ax, word ptr [bp - 2]                 
  0171  7512             jne 0x185                                
  0173  1e               push ds                                  
  0174  68de37           push 0x37de                               ; "Unable to find ADV file"
  0177  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  017c  83c404           add sp, 4                                
  017f  b000             mov al, 0                                
  0181  5f               pop di                                   
  0182  5e               pop si                                   
  0183  c9               leave                                    
  0184  cb               retf                                     
  0185  8b46fe           mov ax, word ptr [bp - 2]                
  0188  8b56fc           mov dx, word ptr [bp - 4]                
  018b  8946f4           mov word ptr [bp - 0xc], ax              
  018e  8956f2           mov word ptr [bp - 0xe], dx              
  0191  6a00             push 0                                   
  0193  6a00             push 0                                   
  0195  1e               push ds                                  
  0196  68f737           push 0x37f7                               ; "MIDPAK.AD"
  0199  9a60060000       lcall 0, 0x660                           -> 0000:0660
  019e  83c408           add sp, 8                                
  01a1  8956fa           mov word ptr [bp - 6], dx                
  01a4  8946f8           mov word ptr [bp - 8], ax                
  01a7  0b46fa           or ax, word ptr [bp - 6]                 
  01aa  7512             jne 0x1be                                
  01ac  1e               push ds                                  
  01ad  680138           push 0x3801                               ; "Unable to find AD file"
  01b0  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  01b5  83c404           add sp, 4                                
  01b8  b000             mov al, 0                                
  01ba  5f               pop di                                   
  01bb  5e               pop si                                   
  01bc  c9               leave                                    
  01bd  cb               retf                                     
  01be  1e               push ds                                  
  01bf  681938           push 0x3819                               ; "MIDPAK.COM"
  01c2  9a3b0d0000       lcall 0, 0xd3b                           -> 0000:0d3b
  01c7  83c404           add sp, 4                                
  01ca  0bc0             or ax, ax                                
  01cc  7512             jne 0x1e0                                
  01ce  1e               push ds                                  
  01cf  682438           push 0x3824                               ; "Unable to load MIDPAK.COM"
  01d2  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  01d7  83c404           add sp, 4                                
  01da  b000             mov al, 0                                
  01dc  5f               pop di                                   
  01dd  5e               pop si                                   
  01de  c9               leave                                    
  01df  cb               retf                                     
  01e0  ff76fa           push word ptr [bp - 6]                   
  01e3  ff76f8           push word ptr [bp - 8]                   
  01e6  ff76f4           push word ptr [bp - 0xc]                 
  01e9  ff76f2           push word ptr [bp - 0xe]                 
  01ec  9a150e0000       lcall 0, 0xe15                           -> 0000:0e15
  01f1  83c408           add sp, 8                                
  01f4  8946f6           mov word ptr [bp - 0xa], ax              
  01f7  837ef600         cmp word ptr [bp - 0xa], 0               
  01fb  7412             je 0x20f                                 
  01fd  1e               push ds                                  
  01fe  683f38           push 0x383f                               ; "Error initilizing driver."
  0201  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  0206  83c404           add sp, 4                                
  0209  b000             mov al, 0                                
  020b  5f               pop di                                   
  020c  5e               pop si                                   
  020d  c9               leave                                    
  020e  cb               retf                                     
  020f  8cd0             mov ax, ss                               
  0211  8db670ff         lea si, [bp - 0x90]                      
  0215  1e               push ds                                  
  0216  07               pop es                                   
  0217  bf5a38           mov di, 0x385a                            ; "MT32MPU.ADV"
  021a  50               push ax                                  
  021b  33c0             xor ax, ax                               
  021d  b9ffff           mov cx, 0xffff                           
  0220  f2ae             repne scasb al, byte ptr es:[di]         
  0222  f7d1             not cx                                   
  0224  2bf9             sub di, cx                               
  0226  8cd8             mov ax, ds                               
  0228  1f               pop ds                                   
  0229  50               push ax                                  
  022a  33c0             xor ax, ax                               
  022c  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  022e  1f               pop ds                                   
  022f  7405             je 0x236                                 
  0231  1bc0             sbb ax, ax                               
  0233  1dffff           sbb ax, 0xffff                           
  0236  0bc0             or ax, ax                                
  0238  7505             jne 0x23f                                
  023a  c606ac3701       mov byte ptr [0x37ac], 1                 
  023f  8cd0             mov ax, ss                               
  0241  8db670ff         lea si, [bp - 0x90]                      
  0245  1e               push ds                                  
  0246  07               pop es                                   
  0247  bf6638           mov di, 0x3866                            ; "SC32MPU.ADV"
  024a  50               push ax                                  
  024b  33c0             xor ax, ax                               
  024d  b9ffff           mov cx, 0xffff                           
  0250  f2ae             repne scasb al, byte ptr es:[di]         
  0252  f7d1             not cx                                   
  0254  2bf9             sub di, cx                               
  0256  8cd8             mov ax, ds                               
  0258  1f               pop ds                                   
  0259  50               push ax                                  
  025a  33c0             xor ax, ax                               
  025c  f3a6             repe cmpsb byte ptr [si], byte ptr es:[di] 
  025e  1f               pop ds                                   
  025f  7405             je 0x266                                 
  0261  1bc0             sbb ax, ax                               
  0263  1dffff           sbb ax, 0xffff                           
  0266  0bc0             or ax, ax                                
  0268  7505             jne 0x26f                                
  026a  c606ad3701       mov byte ptr [0x37ad], 1                 
  026f  6a00             push 0                                   
  0271  6a03             push 3                                   
  0273  6a00             push 0                                   
  0275  6a00             push 0                                   
  0277  681027           push 0x2710                              
  027a  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  027f  83c40a           add sp, 0xa                              
  0282  89165670         mov word ptr [0x7056], dx                
  0286  a35470           mov word ptr [0x7054], ax                
  0289  52               push dx                                  
  028a  50               push ax                                  
  028b  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0290  83c404           add sp, 4                                
  0293  89165270         mov word ptr [0x7052], dx                
  0297  a35070           mov word ptr [0x7050], ax                
  029a  b001             mov al, 1                                
  029c  5f               pop di                                   
  029d  5e               pop si                                   
  029e  c9               leave                                    
  029f  cb               retf                                     

res_155e_02a0:  ; ENTRY
  02a0  9aeb0d0000       lcall 0, 0xdeb                           -> 0000:0deb
  02a5  9aa5040000       lcall 0, 0x4a5                           -> 0000:04a5
  02aa  cb               retf                                     

res_155e_02ab:  ; ENTRY
  02ab  833e9e37ff       cmp word ptr [0x379e], -1                
  02b0  7438             je 0x2ea                                 
  02b2  90               nop                                      
  02b3  0e               push cs                                  
  02b4  e8f101           call 0x4a8                               
  02b7  98               cwde                                     
  02b8  0bc0             or ax, ax                                
  02ba  752e             jne 0x2ea                                
  02bc  f706a9370100     test word ptr [0x37a9], 1                
  02c2  7412             je 0x2d6                                 
  02c4  ff36a937         push word ptr [0x37a9]                   
  02c8  ff369e37         push word ptr [0x379e]                   
  02cc  90               nop                                      
  02cd  0e               push cs                                  
  02ce  e84101           call 0x412                               
  02d1  83c404           add sp, 4                                
  02d4  eb14             jmp 0x2ea                                
  02d6  f706a9370200     test word ptr [0x37a9], 2                
  02dc  7407             je 0x2e5                                 
  02de  90               nop                                      
  02df  0e               push cs                                  
  02e0  e88301           call 0x466                               
  02e3  eb05             jmp 0x2ea                                
  02e5  90               nop                                      
  02e6  0e               push cs                                  
  02e7  e87c01           call 0x466                               
  02ea  833ea037ff       cmp word ptr [0x37a0], -1                
  02ef  743d             je 0x32e                                 
  02f1  90               nop                                      
  02f2  0e               push cs                                  
  02f3  e86404           call 0x75a                               
  02f6  98               cwde                                     
  02f7  0bc0             or ax, ax                                
  02f9  7533             jne 0x32e                                
  02fb  f706a7370100     test word ptr [0x37a7], 1                
  0301  7411             je 0x314                                 
  0303  ff36a737         push word ptr [0x37a7]                   
  0307  ff36a037         push word ptr [0x37a0]                   
  030b  90               nop                                      
  030c  0e               push cs                                  
  030d  e84e03           call 0x65e                               
  0310  83c404           add sp, 4                                
  0313  cb               retf                                     
  0314  f706a7370200     test word ptr [0x37a7], 2                
  031a  740c             je 0x328                                 
  031c  90               nop                                      
  031d  0e               push cs                                  
  031e  e8d603           call 0x6f7                               
  0321  c706a037ffff     mov word ptr [0x37a0], 0xffff            
  0327  cb               retf                                     
  0328  c706a037ffff     mov word ptr [0x37a0], 0xffff            
  032e  cb               retf                                     

res_155e_032f:  ; ENTRY
  032f  55               push bp                                  
  0330  8bec             mov bp, sp                               
  0332  83ec56           sub sp, 0x56                             
  0335  56               push si                                  
  0336  57               push di                                  
  0337  a0a337           mov al, byte ptr [0x37a3]                
  033a  98               cwde                                     
  033b  0bc0             or ax, ax                                
  033d  7506             jne 0x345                                
  033f  b000             mov al, 0                                
  0341  5f               pop di                                   
  0342  5e               pop si                                   
  0343  c9               leave                                    
  0344  cb               retf                                     
  0345  16               push ss                                  
  0346  07               pop es                                   
  0347  8d7efa           lea di, [bp - 6]                         
  034a  be7238           mov si, 0x3872                           
  034d  b90100           mov cx, 1                                
  0350  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0352  803eac3700       cmp byte ptr [0x37ac], 0                 
  0357  740b             je 0x364                                 
  0359  8d7efa           lea di, [bp - 6]                         
  035c  be7438           mov si, 0x3874                           
  035f  b90100           mov cx, 1                                
  0362  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0364  803ead3700       cmp byte ptr [0x37ad], 0                 
  0369  740d             je 0x378                                 
  036b  16               push ss                                  
  036c  07               pop es                                   
  036d  8d7efa           lea di, [bp - 6]                         
  0370  be7638           mov si, 0x3876                           
  0373  b90100           mov cx, 1                                
  0376  f3a5             rep movsw word ptr es:[di], word ptr [si] 
  0378  ff760c           push word ptr [bp + 0xc]                 
  037b  ff760a           push word ptr [bp + 0xa]                 
  037e  16               push ss                                  
  037f  8d46fa           lea ax, [bp - 6]                         
  0382  50               push ax                                  
  0383  ff7608           push word ptr [bp + 8]                   
  0386  ff7606           push word ptr [bp + 6]                   
  0389  1e               push ds                                  
  038a  687838           push 0x3878                               ; "%s%s%s"
  038d  16               push ss                                  
  038e  8d46aa           lea ax, [bp - 0x56]                      
  0391  50               push ax                                  
  0392  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0397  83c414           add sp, 0x14                             
  039a  6a02             push 2                                   
  039c  16               push ss                                  
  039d  8d46aa           lea ax, [bp - 0x56]                      
  03a0  50               push ax                                  
  03a1  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  03a6  83c406           add sp, 6                                
  03a9  8bf0             mov si, ax                               
  03ab  0bf6             or si, si                                
  03ad  7d06             jge 0x3b5                                
  03af  b000             mov al, 0                                
  03b1  5f               pop di                                   
  03b2  5e               pop si                                   
  03b3  c9               leave                                    
  03b4  cb               retf                                     
  03b5  56               push si                                  
  03b6  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  03bb  83c402           add sp, 2                                
  03be  8956fe           mov word ptr [bp - 2], dx                
  03c1  8946fc           mov word ptr [bp - 4], ax                
  03c4  837efe00         cmp word ptr [bp - 2], 0                 
  03c8  7c13             jl 0x3dd                                 
  03ca  7f07             jg 0x3d3                                 
  03cc  817efc1027       cmp word ptr [bp - 4], 0x2710            
  03d1  760a             jbe 0x3dd                                
  03d3  c746fe0000       mov word ptr [bp - 2], 0                 
  03d8  c746fc0f27       mov word ptr [bp - 4], 0x270f            
  03dd  8b46fe           mov ax, word ptr [bp - 2]                
  03e0  8b56fc           mov dx, word ptr [bp - 4]                
  03e3  a35a70           mov word ptr [0x705a], ax                
  03e6  89165870         mov word ptr [0x7058], dx                
  03ea  52               push dx                                  
  03eb  ff365270         push word ptr [0x7052]                   
  03ef  ff365070         push word ptr [0x7050]                   
  03f3  56               push si                                  
  03f4  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  03f9  83c408           add sp, 8                                
  03fc  56               push si                                  
  03fd  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0402  83c402           add sp, 2                                
  0405  b001             mov al, 1                                
  0407  5f               pop di                                   
  0408  5e               pop si                                   
  0409  c9               leave                                    
  040a  cb               retf                                     

res_155e_040b:  ; ENTRY
  040b  a0a337           mov al, byte ptr [0x37a3]                
  040e  98               cwde                                     
  040f  0bc0             or ax, ax                                
  0411  cb               retf                                     

res_155e_0412:  ; ENTRY
  0412  55               push bp                                  
  0413  8bec             mov bp, sp                               
  0415  56               push si                                  
  0416  8b7606           mov si, word ptr [bp + 6]                
  0419  a0a337           mov al, byte ptr [0x37a3]                
  041c  98               cwde                                     
  041d  0bc0             or ax, ax                                
  041f  7442             je 0x463                                 
  0421  90               nop                                      
  0422  0e               push cs                                  
  0423  e88200           call 0x4a8                               
  0426  0ac0             or al, al                                
  0428  7405             je 0x42f                                 
  042a  90               nop                                      
  042b  0e               push cs                                  
  042c  e83700           call 0x466                               
  042f  89369e37         mov word ptr [0x379e], si                
  0433  ff365a70         push word ptr [0x705a]                   
  0437  ff365870         push word ptr [0x7058]                   
  043b  ff365270         push word ptr [0x7052]                   
  043f  ff365070         push word ptr [0x7050]                   
  0443  9a6f0c0000       lcall 0, 0xc6f                           -> 0000:0c6f
  0448  83c408           add sp, 8                                
  044b  8bd0             mov dx, ax                               
  044d  0bd2             or dx, dx                                
  044f  7412             je 0x463                                 
  0451  83fa01           cmp dx, 1                                
  0454  56               push si                                  
  0455  9a4e0c0000       lcall 0, 0xc4e                           -> 0000:0c4e
  045a  83c402           add sp, 2                                
  045d  8b4608           mov ax, word ptr [bp + 8]                
  0460  a3a937           mov word ptr [0x37a9], ax                
  0463  5e               pop si                                   
  0464  5d               pop bp                                   
  0465  cb               retf                                     

res_155e_0466:  ; ENTRY
  0466  a0a337           mov al, byte ptr [0x37a3]                
  0469  98               cwde                                     
  046a  0bc0             or ax, ax                                
  046c  741d             je 0x48b                                 
  046e  9a8b0c0000       lcall 0, 0xc8b                           -> 0000:0c8b
  0473  f706a9370200     test word ptr [0x37a9], 2                
  0479  7404             je 0x47f                                 
  047b  0e               push cs                                  
  047c  e88cff           call 0x40b                               
  047f  c7069e37ffff     mov word ptr [0x379e], 0xffff            
  0485  c706a9370000     mov word ptr [0x37a9], 0                 
  048b  cb               retf                                     
  048c  a0a337           mov al, byte ptr [0x37a3]                
  048f  98               cwde                                     
  0490  0bc0             or ax, ax                                
  0492  7405             je 0x499                                 
  0494  9a8b0c0000       lcall 0, 0xc8b                           -> 0000:0c8b
  0499  cb               retf                                     
  049a  a0a337           mov al, byte ptr [0x37a3]                
  049d  98               cwde                                     
  049e  0bc0             or ax, ax                                
  04a0  7405             je 0x4a7                                 
  04a2  9af70c0000       lcall 0, 0xcf7                           -> 0000:0cf7
  04a7  cb               retf                                     

res_155e_04a8:  ; ENTRY
  04a8  a0a337           mov al, byte ptr [0x37a3]                
  04ab  98               cwde                                     
  04ac  0bc0             or ax, ax                                
  04ae  7503             jne 0x4b3                                
  04b0  b000             mov al, 0                                
  04b2  cb               retf                                     
  04b3  9afd0c0000       lcall 0, 0xcfd                           -> 0000:0cfd
  04b8  3d0100           cmp ax, 1                                
  04bb  7503             jne 0x4c0                                
  04bd  b001             mov al, 1                                
  04bf  cb               retf                                     
  04c0  b000             mov al, 0                                
  04c2  cb               retf                                     
  04c3  56               push si                                  
  04c4  a0a337           mov al, byte ptr [0x37a3]                
  04c7  98               cwde                                     
  04c8  0bc0             or ax, ax                                
  04ca  741b             je 0x4e7                                 
  04cc  be6400           mov si, 0x64                             
  04cf  eb0b             jmp 0x4dc                                
  04d1  6a00             push 0                                   
  04d3  56               push si                                  
  04d4  9a090d0000       lcall 0, 0xd09                           -> 0000:0d09
  04d9  83c404           add sp, 4                                
  04dc  8bc6             mov ax, si                               
  04de  4e               dec si                                   
  04df  0bc0             or ax, ax                                
  04e1  75ee             jne 0x4d1                                
  04e3  0e               push cs                                  
  04e4  e87fff           call 0x466                               
  04e7  5e               pop si                                   
  04e8  cb               retf                                     

res_155e_04e9:  ; ENTRY
  04e9  55               push bp                                  
  04ea  8bec             mov bp, sp                               
  04ec  83ec06           sub sp, 6                                
  04ef  56               push si                                  
  04f0  57               push di                                  
  04f1  bfffff           mov di, 0xffff                           
  04f4  a0a237           mov al, byte ptr [0x37a2]                
  04f7  98               cwde                                     
  04f8  0bc0             or ax, ax                                
  04fa  7507             jne 0x503                                
  04fc  b8ffff           mov ax, 0xffff                           
  04ff  5f               pop di                                   
  0500  5e               pop si                                   
  0501  c9               leave                                    
  0502  cb               retf                                     
  0503  803eab3700       cmp byte ptr [0x37ab], 0                 
  0508  7406             je 0x510                                 
  050a  33c0             xor ax, ax                               
  050c  5f               pop di                                   
  050d  5e               pop si                                   
  050e  c9               leave                                    
  050f  cb               retf                                     
  0510  33d2             xor dx, dx                               
  0512  be6870           mov si, 0x7068                           
  0515  8a04             mov al, byte ptr [si]                    
  0517  98               cwde                                     
  0518  0bc0             or ax, ax                                
  051a  7504             jne 0x520                                
  051c  8bfa             mov di, dx                               
  051e  eb0a             jmp 0x52a                                
  0520  83c60b           add si, 0xb                              
  0523  42               inc dx                                   
  0524  81fed670         cmp si, 0x70d6                           
  0528  75eb             jne 0x515                                
  052a  0bff             or di, di                                
  052c  7d03             jge 0x531                                
  052e  e9e700           jmp 0x618                                
  0531  6a02             push 2                                   
  0533  ff7608           push word ptr [bp + 8]                   
  0536  ff7606           push word ptr [bp + 6]                   
  0539  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  053e  83c406           add sp, 6                                
  0541  8946fe           mov word ptr [bp - 2], ax                
  0544  837efe00         cmp word ptr [bp - 2], 0                 
  0548  7d07             jge 0x551                                
  054a  b8ffff           mov ax, 0xffff                           
  054d  5f               pop di                                   
  054e  5e               pop si                                   
  054f  c9               leave                                    
  0550  cb               retf                                     
  0551  ff76fe           push word ptr [bp - 2]                   
  0554  9aa9000b07       lcall 0x70b, 0xa9                        -> 070b:00a9
  0559  83c402           add sp, 2                                
  055c  8956fc           mov word ptr [bp - 4], dx                
  055f  8946fa           mov word ptr [bp - 6], ax                
  0562  6a00             push 0                                   
  0564  6a0d             push 0xd                                 
  0566  6a00             push 0                                   
  0568  52               push dx                                  
  0569  50               push ax                                  
  056a  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  056f  83c40a           add sp, 0xa                              
  0572  50               push ax                                  
  0573  8bc7             mov ax, di                               
  0575  bb0b00           mov bx, 0xb                              
  0578  52               push dx                                  
  0579  f7eb             imul bx                                  
  057b  8bf0             mov si, ax                               
  057d  8bd8             mov bx, ax                               
  057f  58               pop ax                                   
  0580  89877170         mov word ptr [bx + 0x7071], ax           
  0584  58               pop ax                                   
  0585  89876f70         mov word ptr [bx + 0x706f], ax           
  0589  ffb47170         push word ptr [si + 0x7071]              
  058d  ffb46f70         push word ptr [si + 0x706f]              
  0591  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0596  83c404           add sp, 4                                
  0599  50               push ax                                  
  059a  8bc7             mov ax, di                               
  059c  bb0b00           mov bx, 0xb                              
  059f  52               push dx                                  
  05a0  f7eb             imul bx                                  
  05a2  8bf0             mov si, ax                               
  05a4  8bd8             mov bx, ax                               
  05a6  58               pop ax                                   
  05a7  89876d70         mov word ptr [bx + 0x706d], ax           
  05ab  58               pop ax                                   
  05ac  89876b70         mov word ptr [bx + 0x706b], ax           
  05b0  c684687001       mov byte ptr [si + 0x7068], 1            
  05b5  8b46fa           mov ax, word ptr [bp - 6]                
  05b8  89846970         mov word ptr [si + 0x7069], ax           
  05bc  50               push ax                                  
  05bd  ffb46d70         push word ptr [si + 0x706d]              
  05c1  ffb46b70         push word ptr [si + 0x706b]              
  05c5  ff76fe           push word ptr [bp - 2]                   
  05c8  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  05cd  83c408           add sp, 8                                
  05d0  c7066670f82a     mov word ptr [0x7066], 0x2af8            
  05d6  8c1e6470         mov word ptr [0x7064], ds                
  05da  c70662704e70     mov word ptr [0x7062], 0x704e            
  05e0  8bc7             mov ax, di                               
  05e2  ba0b00           mov dx, 0xb                              
  05e5  f7ea             imul dx                                  
  05e7  8bf0             mov si, ax                               
  05e9  8bd8             mov bx, ax                               
  05eb  8b876970         mov ax, word ptr [bx + 0x7069]           
  05ef  a36070           mov word ptr [0x7060], ax                
  05f2  8b846d70         mov ax, word ptr [si + 0x706d]           
  05f6  8b946b70         mov dx, word ptr [si + 0x706b]           
  05fa  a35e70           mov word ptr [0x705e], ax                
  05fd  89165c70         mov word ptr [0x705c], dx                
  0601  1e               push ds                                  
  0602  685c70           push 0x705c                              
  0605  9abb020000       lcall 0, 0x2bb                           -> 0000:02bb
  060a  83c404           add sp, 4                                
  060d  ff76fe           push word ptr [bp - 2]                   
  0610  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0615  83c402           add sp, 2                                
  0618  8bc7             mov ax, di                               
  061a  5f               pop di                                   
  061b  5e               pop si                                   
  061c  c9               leave                                    
  061d  cb               retf                                     

res_155e_061e:  ; ENTRY
  061e  55               push bp                                  
  061f  8bec             mov bp, sp                               
  0621  56               push si                                  
  0622  a0a237           mov al, byte ptr [0x37a2]                
  0625  98               cwde                                     
  0626  0bc0             or ax, ax                                
  0628  7431             je 0x65b                                 
  062a  803eab3700       cmp byte ptr [0x37ab], 0                 
  062f  752a             jne 0x65b                                
  0631  8b4606           mov ax, word ptr [bp + 6]                
  0634  ba0b00           mov dx, 0xb                              
  0637  f7ea             imul dx                                  
  0639  8bf0             mov si, ax                               
  063b  8bd8             mov bx, ax                               
  063d  8a876870         mov al, byte ptr [bx + 0x7068]           
  0641  98               cwde                                     
  0642  0bc0             or ax, ax                                
  0644  7415             je 0x65b                                 
  0646  c684687000       mov byte ptr [si + 0x7068], 0            
  064b  ffb47170         push word ptr [si + 0x7071]              
  064f  ffb46f70         push word ptr [si + 0x706f]              
  0653  9a8e04280d       lcall 0xd28, 0x48e                       -> 0d28:048e
  0658  83c404           add sp, 4                                
  065b  5e               pop si                                   
  065c  5d               pop bp                                   
  065d  cb               retf                                     

res_155e_065e:  ; ENTRY
  065e  55               push bp                                  
  065f  8bec             mov bp, sp                               
  0661  83ec02           sub sp, 2                                
  0664  56               push si                                  
  0665  8b7606           mov si, word ptr [bp + 6]                
  0668  a0a237           mov al, byte ptr [0x37a2]                
  066b  98               cwde                                     
  066c  0bc0             or ax, ax                                
  066e  7503             jne 0x673                                
  0670  e98100           jmp 0x6f4                                
  0673  803eab3700       cmp byte ptr [0x37ab], 0                 
  0678  7411             je 0x68b                                 
  067a  6a07             push 7                                   
  067c  1e               push ds                                  
  067d  687f38           push 0x387f                              
  0680  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  0685  83c406           add sp, 6                                
  0688  5e               pop si                                   
  0689  c9               leave                                    
  068a  cb               retf                                     
  068b  8bc6             mov ax, si                               
  068d  ba0b00           mov dx, 0xb                              
  0690  f7ea             imul dx                                  
  0692  8bd8             mov bx, ax                               
  0694  8a876870         mov al, byte ptr [bx + 0x7068]           
  0698  98               cwde                                     
  0699  0bc0             or ax, ax                                
  069b  7457             je 0x6f4                                 
  069d  833ea037ff       cmp word ptr [0x37a0], -1                
  06a2  7405             je 0x6a9                                 
  06a4  90               nop                                      
  06a5  0e               push cs                                  
  06a6  e88d00           call 0x736                               
  06a9  c7066670f82a     mov word ptr [0x7066], 0x2af8            
  06af  8c1e6470         mov word ptr [0x7064], ds                
  06b3  c70662704e70     mov word ptr [0x7062], 0x704e            
  06b9  8bc6             mov ax, si                               
  06bb  ba0b00           mov dx, 0xb                              
  06be  f7ea             imul dx                                  
  06c0  8946fe           mov word ptr [bp - 2], ax                
  06c3  8bd8             mov bx, ax                               
  06c5  8b876970         mov ax, word ptr [bx + 0x7069]           
  06c9  a36070           mov word ptr [0x7060], ax                
  06cc  8b5efe           mov bx, word ptr [bp - 2]                
  06cf  8b876d70         mov ax, word ptr [bx + 0x706d]           
  06d3  8b976b70         mov dx, word ptr [bx + 0x706b]           
  06d7  a35e70           mov word ptr [0x705e], ax                
  06da  89165c70         mov word ptr [0x705c], dx                
  06de  8936a037         mov word ptr [0x37a0], si                
  06e2  8b4608           mov ax, word ptr [bp + 8]                
  06e5  a3a737           mov word ptr [0x37a7], ax                
  06e8  1e               push ds                                  
  06e9  685c70           push 0x705c                              
  06ec  9ace020000       lcall 0, 0x2ce                           -> 0000:02ce
  06f1  83c404           add sp, 4                                
  06f4  5e               pop si                                   
  06f5  c9               leave                                    
  06f6  cb               retf                                     

res_155e_06f7:  ; ENTRY
  06f7  a0a237           mov al, byte ptr [0x37a2]                
  06fa  98               cwde                                     
  06fb  0bc0             or ax, ax                                
  06fd  7436             je 0x735                                 
  06ff  803eab3700       cmp byte ptr [0x37ab], 0                 
  0704  752f             jne 0x735                                
  0706  833ea037ff       cmp word ptr [0x37a0], -1                
  070b  7428             je 0x735                                 
  070d  9ab5020000       lcall 0, 0x2b5                           -> 0000:02b5
  0712  0bc0             or ax, ax                                
  0714  75f7             jne 0x70d                                
  0716  f706a7370200     test word ptr [0x37a7], 2                
  071c  740b             je 0x729                                 
  071e  ff36a037         push word ptr [0x37a0]                   
  0722  0e               push cs                                  
  0723  e8f8fe           call 0x61e                               
  0726  83c402           add sp, 2                                
  0729  c706a037ffff     mov word ptr [0x37a0], 0xffff            
  072f  c706a7370000     mov word ptr [0x37a7], 0                 
  0735  cb               retf                                     

res_155e_0736:  ; ENTRY
  0736  a0a237           mov al, byte ptr [0x37a2]                
  0739  98               cwde                                     
  073a  0bc0             or ax, ax                                
  073c  741b             je 0x759                                 
  073e  803eab3700       cmp byte ptr [0x37ab], 0                 
  0743  7514             jne 0x759                                
  0745  833ea037ff       cmp word ptr [0x37a0], -1                
  074a  740d             je 0x759                                 
  074c  9ab5020000       lcall 0, 0x2b5                           -> 0000:02b5
  0751  0bc0             or ax, ax                                
  0753  75f7             jne 0x74c                                
  0755  0e               push cs                                  
  0756  e89eff           call 0x6f7                               
  0759  cb               retf                                     

res_155e_075a:  ; ENTRY
  075a  a0a237           mov al, byte ptr [0x37a2]                
  075d  98               cwde                                     
  075e  0bc0             or ax, ax                                
  0760  7503             jne 0x765                                
  0762  b000             mov al, 0                                
  0764  cb               retf                                     
  0765  803eab3700       cmp byte ptr [0x37ab], 0                 
  076a  7403             je 0x76f                                 
  076c  b000             mov al, 0                                
  076e  cb               retf                                     
  076f  9ab5020000       lcall 0, 0x2b5                           -> 0000:02b5
  0774  cb               retf                                     

res_155e_0775:  ; ENTRY
  0775  803ea63700       cmp byte ptr [0x37a6], 0                 
  077a  7505             jne 0x781                                
  077c  c606a33701       mov byte ptr [0x37a3], 1                 
  0781  cb               retf                                     

res_155e_0782:  ; ENTRY
  0782  803ea63700       cmp byte ptr [0x37a6], 0                 
  0787  7511             jne 0x79a                                
  0789  0e               push cs                                  
  078a  e81bfd           call 0x4a8                               
  078d  0ac0             or al, al                                
  078f  7404             je 0x795                                 
  0791  0e               push cs                                  
  0792  e8d1fc           call 0x466                               
  0795  c606a33700       mov byte ptr [0x37a3], 0                 
  079a  cb               retf                                     
  079b  803ea63700       cmp byte ptr [0x37a6], 0                 
  07a0  7505             jne 0x7a7                                
  07a2  c606a23701       mov byte ptr [0x37a2], 1                 
  07a7  cb               retf                                     
  07a8  803ea63700       cmp byte ptr [0x37a6], 0                 
  07ad  7511             jne 0x7c0                                
  07af  0e               push cs                                  
  07b0  e8a7ff           call 0x75a                               
  07b3  0ac0             or al, al                                
  07b5  7404             je 0x7bb                                 
  07b7  0e               push cs                                  
  07b8  e83cff           call 0x6f7                               
  07bb  c606a23700       mov byte ptr [0x37a2], 0                 
  07c0  cb               retf                                     

res_155e_07c1:  ; ENTRY
  07c1  55               push bp                                  
  07c2  8bec             mov bp, sp                               
  07c4  83ec04           sub sp, 4                                
  07c7  ff7606           push word ptr [bp + 6]                   
  07ca  9ad501280d       lcall 0xd28, 0x1d5                       -> 0d28:01d5
  07cf  83c402           add sp, 2                                
  07d2  8956fe           mov word ptr [bp - 2], dx                
  07d5  8946fc           mov word ptr [bp - 4], ax                
  07d8  0b46fe           or ax, word ptr [bp - 2]                 
  07db  7505             jne 0x7e2                                
  07dd  b8ffff           mov ax, 0xffff                           
  07e0  c9               leave                                    
  07e1  cb               retf                                     
  07e2  8b46fc           mov ax, word ptr [bp - 4]                
  07e5  c1f804           sar ax, 4                                
  07e8  c9               leave                                    
  07e9  cb               retf                                     

res_155e_07ea:  ; ENTRY
  07ea  55               push bp                                  
  07eb  8bec             mov bp, sp                               
  07ed  83ec04           sub sp, 4                                
  07f0  8b4606           mov ax, word ptr [bp + 6]                
  07f3  c1e004           shl ax, 4                                
  07f6  99               cdq                                      
  07f7  8956fe           mov word ptr [bp - 2], dx                
  07fa  8946fc           mov word ptr [bp - 4], ax                
  07fd  52               push dx                                  
  07fe  50               push ax                                  
  07ff  9a0d05280d       lcall 0xd28, 0x50d                       -> 0d28:050d
  0804  83c404           add sp, 4                                
  0807  c9               leave                                    
  0808  cb               retf                                     
  0809  f4               hlt                                      
