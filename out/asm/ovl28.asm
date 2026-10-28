; ovl28 stub 2fef file_off 0x54010 size 0x1b34

ovl28_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec58           sub sp, 0x58                             
  0006  56               push si                                  
  0007  57               push di                                  
  0008  c746fc0000       mov word ptr [bp - 4], 0                 
  000d  ba0400           mov dx, 4                                
  0010  eb18             jmp 0x2a                                 
  0012  8bc2             mov ax, dx                               
  0014  6bc05c           imul ax, ax, 0x5c                        
  0017  c41eee40         les bx, ptr [0x40ee]                     
  001b  03d8             add bx, ax                               
  001d  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0023  7405             je 0x2a                                  
  0025  c746fc0100       mov word ptr [bp - 4], 1                 
  002a  8bc2             mov ax, dx                               
  002c  4a               dec dx                                   
  002d  0bc0             or ax, ax                                
  002f  75e1             jne 0x12                                 
  0031  c41eee40         les bx, ptr [0x40ee]                     
  0035  26c74746ffff     mov word ptr es:[bx + 0x46], 0xffff      
  003b  b8042c           mov ax, 0x2c04                           
  003e  8ec0             mov es, ax                               
  0040  26833e1e0100     cmp word ptr es:[0x11e], 0               
  0046  746a             je 0xb2                                  
  0048  8ec0             mov es, ax                               
  004a  268b1e1001       mov bx, word ptr es:[0x110]              
  004f  6bdb0c           imul bx, bx, 0xc                         
  0052  b8042c           mov ax, 0x2c04                           
  0055  8ec0             mov es, ax                               
  0057  2683bf031100     cmp word ptr es:[bx + 0x1103], 0         
  005d  7453             je 0xb2                                  
  005f  b8042c           mov ax, 0x2c04                           
  0062  8ec0             mov es, ax                               
  0064  268b1e1001       mov bx, word ptr es:[0x110]              
  0069  6bdb0c           imul bx, bx, 0xc                         
  006c  b8042c           mov ax, 0x2c04                           
  006f  8ec0             mov es, ax                               
  0071  2683bf051104     cmp word ptr es:[bx + 0x1105], 4         
  0077  741a             je 0x93                                  
  0079  b8042c           mov ax, 0x2c04                           
  007c  8ec0             mov es, ax                               
  007e  268b1e1001       mov bx, word ptr es:[0x110]              
  0083  6bdb0c           imul bx, bx, 0xc                         
  0086  b8042c           mov ax, 0x2c04                           
  0089  8ec0             mov es, ax                               
  008b  2683bf051105     cmp word ptr es:[bx + 0x1105], 5         
  0091  751f             jne 0xb2                                 
  0093  b8042c           mov ax, 0x2c04                           
  0096  8ec0             mov es, ax                               
  0098  268b1e1001       mov bx, word ptr es:[0x110]              
  009d  6bdb0c           imul bx, bx, 0xc                         
  00a0  b8042c           mov ax, 0x2c04                           
  00a3  8ec0             mov es, ax                               
  00a5  268b870911       mov ax, word ptr es:[bx + 0x1109]        
  00aa  c41eee40         les bx, ptr [0x40ee]                     
  00ae  26894746         mov word ptr es:[bx + 0x46], ax          
  00b2  16               push ss                                  
  00b3  8d46b8           lea ax, [bp - 0x48]                      
  00b6  50               push ax                                  
  00b7  90               nop                                      
  00b8  0e               push cs                                  
  00b9  e8a105           call 0x65d                               
  00bc  83c404           add sp, 4                                
  00bf  bf0600           mov di, 6                                
  00c2  e94c03           jmp 0x411                                
  00c5  8bdf             mov bx, di                               
  00c7  d1e3             shl bx, 1                                
  00c9  8d46b8           lea ax, [bp - 0x48]                      
  00cc  03d8             add bx, ax                               
  00ce  368b37           mov si, word ptr ss:[bx]                 
  00d1  8bc6             mov ax, si                               
  00d3  3dffff           cmp ax, 0xffff                           
  00d6  7503             jne 0xdb                                 
  00d8  e93603           jmp 0x411                                
  00db  8bde             mov bx, si                               
  00dd  6bdb16           imul bx, bx, 0x16                        
  00e0  b81d1e           mov ax, 0x1e1d                           
  00e3  8ec0             mov es, ax                               
  00e5  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  00ea  98               cwde                                     
  00eb  ba042c           mov dx, 0x2c04                           
  00ee  8ec2             mov es, dx                               
  00f0  263b061001       cmp ax, word ptr es:[0x110]              
  00f5  7403             je 0xfa                                  
  00f7  e91703           jmp 0x411                                
  00fa  8bde             mov bx, si                               
  00fc  6bdb16           imul bx, bx, 0x16                        
  00ff  b81d1e           mov ax, 0x1e1d                           
  0102  8ec0             mov es, ax                               
  0104  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  010a  7403             je 0x10f                                 
  010c  e90203           jmp 0x411                                
  010f  8bdf             mov bx, di                               
  0111  d1e3             shl bx, 1                                
  0113  8d46c4           lea ax, [bp - 0x3c]                      
  0116  03d8             add bx, ax                               
  0118  36833f00         cmp word ptr ss:[bx], 0                  
  011c  7c13             jl 0x131                                 
  011e  6a01             push 1                                   
  0120  8bdf             mov bx, di                               
  0122  d1e3             shl bx, 1                                
  0124  03d8             add bx, ax                               
  0126  36ff37           push word ptr ss:[bx]                    
  0129  9a2500d62f       lcall 0x2fd6, 0x25                       -> ovl24:023f
  012e  83c404           add sp, 4                                
  0131  b8042c           mov ax, 0x2c04                           
  0134  8ec0             mov es, ax                               
  0136  26833e1e0100     cmp word ptr es:[0x11e], 0               
  013c  7445             je 0x183                                 
  013e  8ec0             mov es, ax                               
  0140  268b1e1001       mov bx, word ptr es:[0x110]              
  0145  6bdb0c           imul bx, bx, 0xc                         
  0148  b8042c           mov ax, 0x2c04                           
  014b  8ec0             mov es, ax                               
  014d  2683bf031100     cmp word ptr es:[bx + 0x1103], 0         
  0153  742e             je 0x183                                 
  0155  b8042c           mov ax, 0x2c04                           
  0158  8ec0             mov es, ax                               
  015a  268b1e1001       mov bx, word ptr es:[0x110]              
  015f  6bdb0c           imul bx, bx, 0xc                         
  0162  b8042c           mov ax, 0x2c04                           
  0165  8ec0             mov es, ax                               
  0167  2639b70711       cmp word ptr es:[bx + 0x1107], si        
  016c  7515             jne 0x183                                
  016e  16               push ss                                  
  016f  8d46b8           lea ax, [bp - 0x48]                      
  0172  50               push ax                                  
  0173  57               push di                                  
  0174  90               nop                                      
  0175  0e               push cs                                  
  0176  e87a0b           call 0xcf3                               
  0179  83c406           add sp, 6                                
  017c  0bc0             or ax, ax                                
  017e  7403             je 0x183                                 
  0180  e98e02           jmp 0x411                                
  0183  8bde             mov bx, si                               
  0185  6bdb16           imul bx, bx, 0x16                        
  0188  b81d1e           mov ax, 0x1e1d                           
  018b  8ec0             mov es, ax                               
  018d  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0192  250f00           and ax, 0xf                              
  0195  3d0300           cmp ax, 3                                
  0198  7403             je 0x19d                                 
  019a  e92f01           jmp 0x2cc                                
  019d  56               push si                                  
  019e  8bde             mov bx, si                               
  01a0  6bdb16           imul bx, bx, 0x16                        
  01a3  b81d1e           mov ax, 0x1e1d                           
  01a6  8ec0             mov es, ax                               
  01a8  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  01ad  d1e8             shr ax, 1                                
  01af  257f00           and ax, 0x7f                             
  01b2  50               push ax                                  
  01b3  90               nop                                      
  01b4  0e               push cs                                  
  01b5  e87f14           call 0x1637                              
  01b8  83c404           add sp, 4                                
  01bb  0bc0             or ax, ax                                
  01bd  742c             je 0x1eb                                 
  01bf  8bde             mov bx, si                               
  01c1  6bdb16           imul bx, bx, 0x16                        
  01c4  b81d1e           mov ax, 0x1e1d                           
  01c7  8ec0             mov es, ax                               
  01c9  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  01ce  d1e8             shr ax, 1                                
  01d0  257f00           and ax, 0x7f                             
  01d3  8946ec           mov word ptr [bp - 0x14], ax             
  01d6  6a01             push 1                                   
  01d8  16               push ss                                  
  01d9  8d46b8           lea ax, [bp - 0x48]                      
  01dc  50               push ax                                  
  01dd  6a03             push 3                                   
  01df  57               push di                                  
  01e0  90               nop                                      
  01e1  0e               push cs                                  
  01e2  e80506           call 0x7ea                               
  01e5  83c40a           add sp, 0xa                              
  01e8  e9e100           jmp 0x2cc                                
  01eb  b8042c           mov ax, 0x2c04                           
  01ee  8ec0             mov es, ax                               
  01f0  268b0e8101       mov cx, word ptr es:[0x181]              
  01f5  e9ca00           jmp 0x2c2                                
  01f8  8bd9             mov bx, cx                               
  01fa  6bdb16           imul bx, bx, 0x16                        
  01fd  b81d1e           mov ax, 0x1e1d                           
  0200  8ec0             mov es, ax                               
  0202  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0207  98               cwde                                     
  0208  ba042c           mov dx, 0x2c04                           
  020b  8ec2             mov es, dx                               
  020d  263b061001       cmp ax, word ptr es:[0x110]              
  0212  7403             je 0x217                                 
  0214  e9ab00           jmp 0x2c2                                
  0217  8bd9             mov bx, cx                               
  0219  6bdb16           imul bx, bx, 0x16                        
  021c  b81d1e           mov ax, 0x1e1d                           
  021f  8ec0             mov es, ax                               
  0221  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  0226  8bde             mov bx, si                               
  0228  6bdb16           imul bx, bx, 0x16                        
  022b  ba1d1e           mov dx, 0x1e1d                           
  022e  8ec2             mov es, dx                               
  0230  263b878088       cmp ax, word ptr es:[bx - 0x7780]        
  0235  7403             je 0x23a                                 
  0237  e98800           jmp 0x2c2                                
  023a  8bd9             mov bx, cx                               
  023c  6bdb16           imul bx, bx, 0x16                        
  023f  b81d1e           mov ax, 0x1e1d                           
  0242  8ec0             mov es, ax                               
  0244  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0249  8bde             mov bx, si                               
  024b  6bdb16           imul bx, bx, 0x16                        
  024e  ba1d1e           mov dx, 0x1e1d                           
  0251  8ec2             mov es, dx                               
  0253  263b878288       cmp ax, word ptr es:[bx - 0x777e]        
  0258  7568             jne 0x2c2                                
  025a  8bd9             mov bx, cx                               
  025c  6bdb16           imul bx, bx, 0x16                        
  025f  b81d1e           mov ax, 0x1e1d                           
  0262  8ec0             mov es, ax                               
  0264  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0269  250f00           and ax, 0xf                              
  026c  8bde             mov bx, si                               
  026e  6bdb16           imul bx, bx, 0x16                        
  0271  ba1d1e           mov dx, 0x1e1d                           
  0274  8ec2             mov es, dx                               
  0276  268a978e88       mov dl, byte ptr es:[bx - 0x7772]        
  027b  83e20f           and dx, 0xf                              
  027e  3bc2             cmp ax, dx                               
  0280  7540             jne 0x2c2                                
  0282  8bd9             mov bx, cx                               
  0284  6bdb16           imul bx, bx, 0x16                        
  0287  b81d1e           mov ax, 0x1e1d                           
  028a  8ec0             mov es, ax                               
  028c  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  0292  8bd9             mov bx, cx                               
  0294  6bdb16           imul bx, bx, 0x16                        
  0297  8ec0             mov es, ax                               
  0299  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  029f  8bd9             mov bx, cx                               
  02a1  6bdb16           imul bx, bx, 0x16                        
  02a4  b81d1e           mov ax, 0x1e1d                           
  02a7  baffff           mov dx, 0xffff                           
  02aa  8ec0             mov es, ax                               
  02ac  2689979488       mov word ptr es:[bx - 0x776c], dx        
  02b1  8bc2             mov ax, dx                               
  02b3  8bd9             mov bx, cx                               
  02b5  6bdb16           imul bx, bx, 0x16                        
  02b8  ba1d1e           mov dx, 0x1e1d                           
  02bb  8ec2             mov es, dx                               
  02bd  2689879288       mov word ptr es:[bx - 0x776e], ax        
  02c2  8bc1             mov ax, cx                               
  02c4  49               dec cx                                   
  02c5  0bc0             or ax, ax                                
  02c7  7403             je 0x2cc                                 
  02c9  e92cff           jmp 0x1f8                                
  02cc  b90100           mov cx, 1                                
  02cf  c746f80000       mov word ptr [bp - 8], 0                 
  02d4  c746fe0000       mov word ptr [bp - 2], 0                 
  02d9  e91601           jmp 0x3f2                                
  02dc  ff46f8           inc word ptr [bp - 8]                    
  02df  16               push ss                                  
  02e0  8d46b8           lea ax, [bp - 0x48]                      
  02e3  50               push ax                                  
  02e4  57               push di                                  
  02e5  90               nop                                      
  02e6  0e               push cs                                  
  02e7  e8f00c           call 0xfda                               
  02ea  83c406           add sp, 6                                
  02ed  16               push ss                                  
  02ee  8d46b8           lea ax, [bp - 0x48]                      
  02f1  50               push ax                                  
  02f2  57               push di                                  
  02f3  90               nop                                      
  02f4  0e               push cs                                  
  02f5  e8000f           call 0x11f8                              
  02f8  83c406           add sp, 6                                
  02fb  16               push ss                                  
  02fc  8d46b8           lea ax, [bp - 0x48]                      
  02ff  50               push ax                                  
  0300  57               push di                                  
  0301  90               nop                                      
  0302  0e               push cs                                  
  0303  e84210           call 0x1348                              
  0306  83c406           add sp, 6                                
  0309  16               push ss                                  
  030a  8d46b8           lea ax, [bp - 0x48]                      
  030d  50               push ax                                  
  030e  57               push di                                  
  030f  90               nop                                      
  0310  0e               push cs                                  
  0311  e8e80b           call 0xefc                               
  0314  83c406           add sp, 6                                
  0317  8946fa           mov word ptr [bp - 6], ax                
  031a  8bd8             mov bx, ax                               
  031c  4b               dec bx                                   
  031d  83fb03           cmp bx, 3                                
  0320  773d             ja 0x35f                                 
  0322  d1e3             shl bx, 1                                
  0324  2effa71f04       jmp word ptr cs:[bx + 0x41f]             
ovl28_0329:  ; case
  0329  e99400           jmp 0x3c0                                
ovl28_032c:  ; case
  032c  c746fe0100       mov word ptr [bp - 2], 1                 
  0331  6a00             push 0                                   
  0333  16               push ss                                  
  0334  8d46b8           lea ax, [bp - 0x48]                      
  0337  50               push ax                                  
  0338  ff76fa           push word ptr [bp - 6]                   
  033b  57               push di                                  
  033c  90               nop                                      
  033d  0e               push cs                                  
  033e  e8a904           call 0x7ea                               
  0341  83c40a           add sp, 0xa                              
  0344  8bc8             mov cx, ax                               
  0346  eb7a             jmp 0x3c2                                
ovl28_0348:  ; case
  0348  c746fe0100       mov word ptr [bp - 2], 1                 
  034d  6a00             push 0                                   
  034f  16               push ss                                  
  0350  8d46b8           lea ax, [bp - 0x48]                      
  0353  50               push ax                                  
  0354  57               push di                                  
  0355  90               nop                                      
  0356  0e               push cs                                  
  0357  e81b08           call 0xb75                               
  035a  83c408           add sp, 8                                
  035d  ebe5             jmp 0x344                                
  035f  837efe00         cmp word ptr [bp - 2], 0                 
  0363  745b             je 0x3c0                                 
  0365  b8042c           mov ax, 0x2c04                           
  0368  8ec0             mov es, ax                               
  036a  26833e240100     cmp word ptr es:[0x124], 0               
  0370  744e             je 0x3c0                                 
  0372  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0377  3d0a00           cmp ax, 0xa                              
  037a  7d44             jge 0x3c0                                
  037c  6a08             push 8                                   
  037e  16               push ss                                  
  037f  8d46a8           lea ax, [bp - 0x58]                      
  0382  50               push ax                                  
  0383  8bde             mov bx, si                               
  0385  6bdb16           imul bx, bx, 0x16                        
  0388  b81d1e           mov ax, 0x1e1d                           
  038b  8ec0             mov es, ax                               
  038d  26ffb78288       push word ptr es:[bx - 0x777e]           
  0392  8bde             mov bx, si                               
  0394  6bdb16           imul bx, bx, 0x16                        
  0397  b81d1e           mov ax, 0x1e1d                           
  039a  ba0000           mov dx, 0                                
  039d  81c28088         add dx, 0x8880                           
  03a1  03da             add bx, dx                               
  03a3  8ec0             mov es, ax                               
  03a5  26ff37           push word ptr es:[bx]                    
  03a8  9a5200f72f       lcall 0x2ff7, 0x52                       -> ovl29:12c9
  03ad  83c40a           add sp, 0xa                              
  03b0  3d0100           cmp ax, 1                                
  03b3  750b             jne 0x3c0                                
  03b5  6aff             push -1                                  
  03b7  56               push si                                  
  03b8  9a3900bd2f       lcall 0x2fbd, 0x39                       -> ovl20:0e4b
  03bd  83c404           add sp, 4                                
  03c0  33c9             xor cx, cx                               
  03c2  8bde             mov bx, si                               
  03c4  6bdb16           imul bx, bx, 0x16                        
  03c7  b81d1e           mov ax, 0x1e1d                           
  03ca  8ec0             mov es, ax                               
  03cc  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  03d1  98               cwde                                     
  03d2  ba042c           mov dx, 0x2c04                           
  03d5  8ec2             mov es, dx                               
  03d7  263b061001       cmp ax, word ptr es:[0x110]              
  03dc  7512             jne 0x3f0                                
  03de  8bde             mov bx, si                               
  03e0  6bdb16           imul bx, bx, 0x16                        
  03e3  b81d1e           mov ax, 0x1e1d                           
  03e6  8ec0             mov es, ax                               
  03e8  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  03ee  7402             je 0x3f2                                 
  03f0  33c9             xor cx, cx                               
  03f2  0bc9             or cx, cx                                
  03f4  741b             je 0x411                                 
  03f6  837ef802         cmp word ptr [bp - 8], 2                 
  03fa  7d15             jge 0x411                                
  03fc  8bde             mov bx, si                               
  03fe  6bdb16           imul bx, bx, 0x16                        
  0401  b81d1e           mov ax, 0x1e1d                           
  0404  8ec0             mov es, ax                               
  0406  2680bf878804     cmp byte ptr es:[bx - 0x7779], 4         
  040c  7c03             jl 0x411                                 
  040e  e9cbfe           jmp 0x2dc                                
  0411  8bc7             mov ax, di                               
  0413  4f               dec di                                   
  0414  0bc0             or ax, ax                                
  0416  7403             je 0x41b                                 
  0418  e9aafc           jmp 0xc5                                 
  041b  5f               pop di                                   
  041c  5e               pop si                                   
  041d  c9               leave                                    
  041e  cb               retf                                     
  041f  29032c032c034803 dw 0329,032c,032c,0348                   jump table

ovl28_0427:  ; ENTRY
  0427  55               push bp                                  
  0428  8bec             mov bp, sp                               
  042a  83ec04           sub sp, 4                                
  042d  56               push si                                  
  042e  57               push di                                  
  042f  8b7606           mov si, word ptr [bp + 6]                
  0432  8b7e08           mov di, word ptr [bp + 8]                
  0435  8bdf             mov bx, di                               
  0437  69dbe000         imul bx, bx, 0xe0                        
  043b  8bc6             mov ax, si                               
  043d  d1e0             shl ax, 1                                
  043f  03d8             add bx, ax                               
  0441  b81d1e           mov ax, 0x1e1d                           
  0444  8ec0             mov es, ax                               
  0446  268a9f0000       mov bl, byte ptr es:[bx]                 
  044b  81e3ff00         and bx, 0xff                             
  044f  b8042c           mov ax, 0x2c04                           
  0452  8ec0             mov es, ax                               
  0454  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  045a  7505             jne 0x461                                
  045c  b80100           mov ax, 1                                
  045f  eb02             jmp 0x463                                
  0461  33c0             xor ax, ax                               
  0463  8946fc           mov word ptr [bp - 4], ax                
  0466  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  046c  7503             jne 0x471                                
  046e  e9f800           jmp 0x569                                
  0471  b91600           mov cx, 0x16                             
  0474  e9e800           jmp 0x55f                                
  0477  8bd9             mov bx, cx                               
  0479  6bdb1d           imul bx, bx, 0x1d                        
  047c  b8042c           mov ax, 0x2c04                           
  047f  8ec0             mov es, ax                               
  0481  2680bfff0c01     cmp byte ptr es:[bx + 0xcff], 1          
  0487  7403             je 0x48c                                 
  0489  e9d300           jmp 0x55f                                
  048c  837efc00         cmp word ptr [bp - 4], 0                 
  0490  7528             jne 0x4ba                                
  0492  8bd9             mov bx, cx                               
  0494  6bdb1d           imul bx, bx, 0x1d                        
  0497  b8042c           mov ax, 0x2c04                           
  049a  8ec0             mov es, ax                               
  049c  2639b7020d       cmp word ptr es:[bx + 0xd02], si         
  04a1  7403             je 0x4a6                                 
  04a3  e9b900           jmp 0x55f                                
  04a6  8bd9             mov bx, cx                               
  04a8  6bdb1d           imul bx, bx, 0x1d                        
  04ab  b8042c           mov ax, 0x2c04                           
  04ae  8ec0             mov es, ax                               
  04b0  2639bf040d       cmp word ptr es:[bx + 0xd04], di         
  04b5  7403             je 0x4ba                                 
  04b7  e9a500           jmp 0x55f                                
  04ba  837efc00         cmp word ptr [bp - 4], 0                 
  04be  7447             je 0x507                                 
  04c0  8bd9             mov bx, cx                               
  04c2  6bdb1d           imul bx, bx, 0x1d                        
  04c5  b8042c           mov ax, 0x2c04                           
  04c8  8ec0             mov es, ax                               
  04ca  2639b7020d       cmp word ptr es:[bx + 0xd02], si         
  04cf  7d03             jge 0x4d4                                
  04d1  e98b00           jmp 0x55f                                
  04d4  8bd9             mov bx, cx                               
  04d6  6bdb1d           imul bx, bx, 0x1d                        
  04d9  8bd6             mov dx, si                               
  04db  42               inc dx                                   
  04dc  8ec0             mov es, ax                               
  04de  263997020d       cmp word ptr es:[bx + 0xd02], dx         
  04e3  7f7a             jg 0x55f                                 
  04e5  8bd9             mov bx, cx                               
  04e7  6bdb1d           imul bx, bx, 0x1d                        
  04ea  b8042c           mov ax, 0x2c04                           
  04ed  8ec0             mov es, ax                               
  04ef  2639bf040d       cmp word ptr es:[bx + 0xd04], di         
  04f4  7c69             jl 0x55f                                 
  04f6  8bd9             mov bx, cx                               
  04f8  6bdb1d           imul bx, bx, 0x1d                        
  04fb  8bd7             mov dx, di                               
  04fd  42               inc dx                                   
  04fe  8ec0             mov es, ax                               
  0500  263997040d       cmp word ptr es:[bx + 0xd04], dx         
  0505  7f58             jg 0x55f                                 
  0507  8bd9             mov bx, cx                               
  0509  6bdb1d           imul bx, bx, 0x1d                        
  050c  b8042c           mov ax, 0x2c04                           
  050f  8ec0             mov es, ax                               
  0511  26c687ff0c03     mov byte ptr es:[bx + 0xcff], 3          
  0517  b8042c           mov ax, 0x2c04                           
  051a  8ec0             mov es, ax                               
  051c  26a18101         mov ax, word ptr es:[0x181]              
  0520  8946fe           mov word ptr [bp - 2], ax                
  0523  eb1e             jmp 0x543                                
  0525  8b46fe           mov ax, word ptr [bp - 2]                
  0528  6bc016           imul ax, ax, 0x16                        
  052b  ba1d1e           mov dx, 0x1e1d                           
  052e  bb0000           mov bx, 0                                
  0531  03d8             add bx, ax                               
  0533  81c38088         add bx, 0x8880                           
  0537  3b16605e         cmp dx, word ptr [0x5e60]                
  053b  7506             jne 0x543                                
  053d  3b1e5e5e         cmp bx, word ptr [0x5e5e]                
  0541  740a             je 0x54d                                 
  0543  8b46fe           mov ax, word ptr [bp - 2]                
  0546  ff4efe           dec word ptr [bp - 2]                    
  0549  0bc0             or ax, ax                                
  054b  75d8             jne 0x525                                
  054d  8bd9             mov bx, cx                               
  054f  6bdb1d           imul bx, bx, 0x1d                        
  0552  b8042c           mov ax, 0x2c04                           
  0555  8b56fe           mov dx, word ptr [bp - 2]                
  0558  8ec0             mov es, ax                               
  055a  268997000d       mov word ptr es:[bx + 0xd00], dx         
  055f  8bc1             mov ax, cx                               
  0561  49               dec cx                                   
  0562  0bc0             or ax, ax                                
  0564  7403             je 0x569                                 
  0566  e90eff           jmp 0x477                                
  0569  5f               pop di                                   
  056a  5e               pop si                                   
  056b  c9               leave                                    
  056c  cb               retf                                     

ovl28_056d:  ; ENTRY
  056d  55               push bp                                  
  056e  8bec             mov bp, sp                               
  0570  83ec02           sub sp, 2                                
  0573  56               push si                                  
  0574  57               push di                                  
  0575  8b7606           mov si, word ptr [bp + 6]                
  0578  8b7e08           mov di, word ptr [bp + 8]                
  057b  8bdf             mov bx, di                               
  057d  69dbe000         imul bx, bx, 0xe0                        
  0581  8bc6             mov ax, si                               
  0583  d1e0             shl ax, 1                                
  0585  03d8             add bx, ax                               
  0587  b81d1e           mov ax, 0x1e1d                           
  058a  8ec0             mov es, ax                               
  058c  268a9f0000       mov bl, byte ptr es:[bx]                 
  0591  81e3ff00         and bx, 0xff                             
  0595  b8042c           mov ax, 0x2c04                           
  0598  8ec0             mov es, ax                               
  059a  268a871007       mov al, byte ptr es:[bx + 0x710]         
  059f  98               cwde                                     
  05a0  8946fe           mov word ptr [bp - 2], ax                
  05a3  837efe0b         cmp word ptr [bp - 2], 0xb               
  05a7  7405             je 0x5ae                                 
  05a9  b8ffff           mov ax, 0xffff                           
  05ac  eb4e             jmp 0x5fc                                
  05ae  57               push di                                  
  05af  56               push si                                  
  05b0  9a3e00e830       lcall 0x30e8, 0x3e                       -> ovl62:04b5
  05b5  83c404           add sp, 4                                
  05b8  8bd0             mov dx, ax                               
  05ba  0bd2             or dx, dx                                
  05bc  7ceb             jl 0x5a9                                 
  05be  8bda             mov bx, dx                               
  05c0  6bdb1f           imul bx, bx, 0x1f                        
  05c3  b8042c           mov ax, 0x2c04                           
  05c6  8ec0             mov es, ax                               
  05c8  268a872908       mov al, byte ptr es:[bx + 0x829]         
  05cd  98               cwde                                     
  05ce  c45e0a           les bx, ptr [bp + 0xa]                   
  05d1  268907           mov word ptr es:[bx], ax                 
  05d4  26833f01         cmp word ptr es:[bx], 1                  
  05d8  7420             je 0x5fa                                 
  05da  8bdf             mov bx, di                               
  05dc  69dbe000         imul bx, bx, 0xe0                        
  05e0  8bc6             mov ax, si                               
  05e2  d1e0             shl ax, 1                                
  05e4  03d8             add bx, ax                               
  05e6  b81d1e           mov ax, 0x1e1d                           
  05e9  8ec0             mov es, ax                               
  05eb  268a870100       mov al, byte ptr es:[bx + 1]             
  05f0  c1e806           shr ax, 6                                
  05f3  250100           and ax, 1                                
  05f6  0bc0             or ax, ax                                
  05f8  75af             jne 0x5a9                                
  05fa  8bc2             mov ax, dx                               
  05fc  5f               pop di                                   
  05fd  5e               pop si                                   
  05fe  c9               leave                                    
  05ff  cb               retf                                     

ovl28_0600:  ; ENTRY
  0600  55               push bp                                  
  0601  8bec             mov bp, sp                               
  0603  33c9             xor cx, cx                               
  0605  33d2             xor dx, dx                               
  0607  eb22             jmp 0x62b                                
  0609  395606           cmp word ptr [bp + 6], dx                
  060c  7504             jne 0x612                                
  060e  8bc1             mov ax, cx                               
  0610  eb28             jmp 0x63a                                
  0612  8bda             mov bx, dx                               
  0614  6bdb1f           imul bx, bx, 0x1f                        
  0617  b8042c           mov ax, 0x2c04                           
  061a  8ec0             mov es, ax                               
  061c  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  0622  7506             jne 0x62a                                
  0624  83f904           cmp cx, 4                                
  0627  7d01             jge 0x62a                                
  0629  41               inc cx                                   
  062a  42               inc dx                                   
  062b  b8042c           mov ax, 0x2c04                           
  062e  8ec0             mov es, ax                               
  0630  2639160f08       cmp word ptr es:[0x80f], dx              
  0635  7fd2             jg 0x609                                 
  0637  b8ffff           mov ax, 0xffff                           
  063a  5d               pop bp                                   
  063b  cb               retf                                     

ovl28_063c:  ; ENTRY
  063c  55               push bp                                  
  063d  8bec             mov bp, sp                               
  063f  ff7606           push word ptr [bp + 6]                   
  0642  0e               push cs                                  
  0643  e8baff           call 0x600                               
  0646  59               pop cx                                   
  0647  8bd0             mov dx, ax                               
  0649  83faff           cmp dx, -1                               
  064c  7505             jne 0x653                                
  064e  b8ffff           mov ax, 0xffff                           
  0651  eb08             jmp 0x65b                                
  0653  8bda             mov bx, dx                               
  0655  d1e3             shl bx, 1                                
  0657  8b875809         mov ax, word ptr [bx + 0x958]            
  065b  5d               pop bp                                   
  065c  cb               retf                                     

ovl28_065d:  ; ENTRY
  065d  55               push bp                                  
  065e  8bec             mov bp, sp                               
  0660  83ec02           sub sp, 2                                
  0663  56               push si                                  
  0664  57               push di                                  
  0665  33f6             xor si, si                               
  0667  ba0600           mov dx, 6                                
  066a  eb0e             jmp 0x67a                                
  066c  8bc2             mov ax, dx                               
  066e  d1e0             shl ax, 1                                
  0670  c45e06           les bx, ptr [bp + 6]                     
  0673  03d8             add bx, ax                               
  0675  26c707ffff       mov word ptr es:[bx], 0xffff             
  067a  8bc2             mov ax, dx                               
  067c  4a               dec dx                                   
  067d  0bc0             or ax, ax                                
  067f  75eb             jne 0x66c                                
  0681  c41eee40         les bx, ptr [0x40ee]                     
  0685  26c7470e0000     mov word ptr es:[bx + 0xe], 0            
  068b  b8042c           mov ax, 0x2c04                           
  068e  8ec0             mov es, ax                               
  0690  268b3e8101       mov di, word ptr es:[0x181]              
  0695  e94401           jmp 0x7dc                                
  0698  8bdf             mov bx, di                               
  069a  6bdb16           imul bx, bx, 0x16                        
  069d  b81d1e           mov ax, 0x1e1d                           
  06a0  8ec0             mov es, ax                               
  06a2  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  06a7  98               cwde                                     
  06a8  ba042c           mov dx, 0x2c04                           
  06ab  8ec2             mov es, dx                               
  06ad  263b061001       cmp ax, word ptr es:[0x110]              
  06b2  7403             je 0x6b7                                 
  06b4  e92501           jmp 0x7dc                                
  06b7  8bdf             mov bx, di                               
  06b9  6bdb16           imul bx, bx, 0x16                        
  06bc  b81d1e           mov ax, 0x1e1d                           
  06bf  8ec0             mov es, ax                               
  06c1  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  06c7  7403             je 0x6cc                                 
  06c9  e91001           jmp 0x7dc                                
  06cc  83fe06           cmp si, 6                                
  06cf  7c03             jl 0x6d4                                 
  06d1  e90801           jmp 0x7dc                                
  06d4  8bc6             mov ax, si                               
  06d6  d1e0             shl ax, 1                                
  06d8  c45e06           les bx, ptr [bp + 6]                     
  06db  03d8             add bx, ax                               
  06dd  26893f           mov word ptr es:[bx], di                 
  06e0  8bdf             mov bx, di                               
  06e2  6bdb16           imul bx, bx, 0x16                        
  06e5  b81d1e           mov ax, 0x1e1d                           
  06e8  ba0000           mov dx, 0                                
  06eb  81c28088         add dx, 0x8880                           
  06ef  03da             add bx, dx                               
  06f1  8ec0             mov es, ax                               
  06f3  268b0f           mov cx, word ptr es:[bx]                 
  06f6  8bdf             mov bx, di                               
  06f8  6bdb16           imul bx, bx, 0x16                        
  06fb  b81d1e           mov ax, 0x1e1d                           
  06fe  8ec0             mov es, ax                               
  0700  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0705  8946fe           mov word ptr [bp - 2], ax                
  0708  8bc6             mov ax, si                               
  070a  d1e0             shl ax, 1                                
  070c  c45e06           les bx, ptr [bp + 6]                     
  070f  03d8             add bx, ax                               
  0711  b8ffff           mov ax, 0xffff                           
  0714  26894718         mov word ptr es:[bx + 0x18], ax          
  0718  2689470c         mov word ptr es:[bx + 0xc], ax           
  071c  26c747240000     mov word ptr es:[bx + 0x24], 0           
  0722  8b5efe           mov bx, word ptr [bp - 2]                
  0725  69dbe000         imul bx, bx, 0xe0                        
  0729  8bc1             mov ax, cx                               
  072b  d1e0             shl ax, 1                                
  072d  03d8             add bx, ax                               
  072f  b81d1e           mov ax, 0x1e1d                           
  0732  8ec0             mov es, ax                               
  0734  268a9f0000       mov bl, byte ptr es:[bx]                 
  0739  81e3ff00         and bx, 0xff                             
  073d  b8042c           mov ax, 0x2c04                           
  0740  8ec0             mov es, ax                               
  0742  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0748  751b             jne 0x765                                
  074a  ff76fe           push word ptr [bp - 2]                   
  074d  51               push cx                                  
  074e  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0753  83c404           add sp, 4                                
  0756  8bd6             mov dx, si                               
  0758  d1e2             shl dx, 1                                
  075a  c45e06           les bx, ptr [bp + 6]                     
  075d  03da             add bx, dx                               
  075f  2689470c         mov word ptr es:[bx + 0xc], ax           
  0763  eb41             jmp 0x7a6                                
  0765  8b5efe           mov bx, word ptr [bp - 2]                
  0768  69dbe000         imul bx, bx, 0xe0                        
  076c  8bc1             mov ax, cx                               
  076e  d1e0             shl ax, 1                                
  0770  03d8             add bx, ax                               
  0772  b81d1e           mov ax, 0x1e1d                           
  0775  8ec0             mov es, ax                               
  0777  268a9f0000       mov bl, byte ptr es:[bx]                 
  077c  81e3ff00         and bx, 0xff                             
  0780  b8042c           mov ax, 0x2c04                           
  0783  8ec0             mov es, ax                               
  0785  2680bf10070b     cmp byte ptr es:[bx + 0x710], 0xb        
  078b  7519             jne 0x7a6                                
  078d  ff76fe           push word ptr [bp - 2]                   
  0790  51               push cx                                  
  0791  9a3e00e830       lcall 0x30e8, 0x3e                       -> ovl62:04b5
  0796  83c404           add sp, 4                                
  0799  8bd6             mov dx, si                               
  079b  d1e2             shl dx, 1                                
  079d  c45e06           les bx, ptr [bp + 6]                     
  07a0  03da             add bx, dx                               
  07a2  26894718         mov word ptr es:[bx + 0x18], ax          
  07a6  8bc7             mov ax, di                               
  07a8  6bc016           imul ax, ax, 0x16                        
  07ab  ba0000           mov dx, 0                                
  07ae  81c28088         add dx, 0x8880                           
  07b2  03c2             add ax, dx                               
  07b4  681d1e           push 0x1e1d                              
  07b7  50               push ax                                  
  07b8  9a2f001d30       lcall 0x301d, 0x2f                       -> ovl35:08b4
  07bd  83c404           add sp, 4                                
  07c0  0bc0             or ax, ax                                
  07c2  740f             je 0x7d3                                 
  07c4  8bc6             mov ax, si                               
  07c6  d1e0             shl ax, 1                                
  07c8  c45e06           les bx, ptr [bp + 6]                     
  07cb  03d8             add bx, ax                               
  07cd  26c747240100     mov word ptr es:[bx + 0x24], 1           
  07d3  46               inc si                                   
  07d4  c41eee40         les bx, ptr [0x40ee]                     
  07d8  26ff470e         inc word ptr es:[bx + 0xe]               
  07dc  8bc7             mov ax, di                               
  07de  4f               dec di                                   
  07df  0bc0             or ax, ax                                
  07e1  7403             je 0x7e6                                 
  07e3  e9b2fe           jmp 0x698                                
  07e6  5f               pop di                                   
  07e7  5e               pop si                                   
  07e8  c9               leave                                    
  07e9  cb               retf                                     

ovl28_07ea:  ; ENTRY
  07ea  55               push bp                                  
  07eb  8bec             mov bp, sp                               
  07ed  83ec1e           sub sp, 0x1e                             
  07f0  56               push si                                  
  07f1  57               push di                                  
  07f2  c746fa0000       mov word ptr [bp - 6], 0                 
  07f7  8b4606           mov ax, word ptr [bp + 6]                
  07fa  d1e0             shl ax, 1                                
  07fc  c45e0a           les bx, ptr [bp + 0xa]                   
  07ff  03d8             add bx, ax                               
  0801  268b37           mov si, word ptr es:[bx]                 
  0804  837e0803         cmp word ptr [bp + 8], 3                 
  0808  7534             jne 0x83e                                
  080a  8b5e0a           mov bx, word ptr [bp + 0xa]              
  080d  268b5f34         mov bx, word ptr es:[bx + 0x34]          
  0811  6bdb1f           imul bx, bx, 0x1f                        
  0814  b8042c           mov ax, 0x2c04                           
  0817  8ec0             mov es, ax                               
  0819  268b8f1108       mov cx, word ptr es:[bx + 0x811]         
  081e  c45e0a           les bx, ptr [bp + 0xa]                   
  0821  268b5f34         mov bx, word ptr es:[bx + 0x34]          
  0825  6bdb1f           imul bx, bx, 0x1f                        
  0828  b8042c           mov ax, 0x2c04                           
  082b  8ec0             mov es, ax                               
  082d  268b871308       mov ax, word ptr es:[bx + 0x813]         
  0832  8946f6           mov word ptr [bp - 0xa], ax              
  0835  c45e0a           les bx, ptr [bp + 0xa]                   
  0838  268b7f34         mov di, word ptr es:[bx + 0x34]          
  083c  eb36             jmp 0x874                                
  083e  c45e0a           les bx, ptr [bp + 0xa]                   
  0841  268b5f3c         mov bx, word ptr es:[bx + 0x3c]          
  0845  6bdb1d           imul bx, bx, 0x1d                        
  0848  b8042c           mov ax, 0x2c04                           
  084b  8ec0             mov es, ax                               
  084d  268b8f020d       mov cx, word ptr es:[bx + 0xd02]         
  0852  c45e0a           les bx, ptr [bp + 0xa]                   
  0855  268b5f3c         mov bx, word ptr es:[bx + 0x3c]          
  0859  6bdb1d           imul bx, bx, 0x1d                        
  085c  b8042c           mov ax, 0x2c04                           
  085f  8ec0             mov es, ax                               
  0861  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  0866  8946f6           mov word ptr [bp - 0xa], ax              
  0869  c45e0a           les bx, ptr [bp + 0xa]                   
  086c  268b7f3c         mov di, word ptr es:[bx + 0x3c]          
  0870  81c7e803         add di, 0x3e8                            
  0874  8bde             mov bx, si                               
  0876  6bdb16           imul bx, bx, 0x16                        
  0879  b81d1e           mov ax, 0x1e1d                           
  087c  8ec0             mov es, ax                               
  087e  26ffb78288       push word ptr es:[bx - 0x777e]           
  0883  8bde             mov bx, si                               
  0885  6bdb16           imul bx, bx, 0x16                        
  0888  b81d1e           mov ax, 0x1e1d                           
  088b  ba0000           mov dx, 0                                
  088e  81c28088         add dx, 0x8880                           
  0892  03da             add bx, dx                               
  0894  8ec0             mov es, ax                               
  0896  26ff37           push word ptr es:[bx]                    
  0899  ff76f6           push word ptr [bp - 0xa]                 
  089c  51               push cx                                  
  089d  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  08a2  83c408           add sp, 8                                
  08a5  8946f4           mov word ptr [bp - 0xc], ax              
  08a8  6a0c             push 0xc                                 
  08aa  8bde             mov bx, si                               
  08ac  6bdb16           imul bx, bx, 0x16                        
  08af  b81d1e           mov ax, 0x1e1d                           
  08b2  8ec0             mov es, ax                               
  08b4  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  08b9  250f00           and ax, 0xf                              
  08bc  50               push ax                                  
  08bd  8bde             mov bx, si                               
  08bf  6bdb16           imul bx, bx, 0x16                        
  08c2  b81d1e           mov ax, 0x1e1d                           
  08c5  8ec0             mov es, ax                               
  08c7  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  08cc  c1e804           shr ax, 4                                
  08cf  250700           and ax, 7                                
  08d2  50               push ax                                  
  08d3  16               push ss                                  
  08d4  8d46e2           lea ax, [bp - 0x1e]                      
  08d7  50               push ax                                  
  08d8  8bde             mov bx, si                               
  08da  6bdb16           imul bx, bx, 0x16                        
  08dd  b81d1e           mov ax, 0x1e1d                           
  08e0  8ec0             mov es, ax                               
  08e2  26ffb78288       push word ptr es:[bx - 0x777e]           
  08e7  8bde             mov bx, si                               
  08e9  6bdb16           imul bx, bx, 0x16                        
  08ec  b81d1e           mov ax, 0x1e1d                           
  08ef  ba0000           mov dx, 0                                
  08f2  81c28088         add dx, 0x8880                           
  08f6  03da             add bx, dx                               
  08f8  8ec0             mov es, ax                               
  08fa  26ff37           push word ptr es:[bx]                    
  08fd  9a5700f72f       lcall 0x2ff7, 0x57                       -> ovl29:13b2
  0902  83c40e           add sp, 0xe                              
  0905  8946fe           mov word ptr [bp - 2], ax                
  0908  0bc0             or ax, ax                                
  090a  7503             jne 0x90f                                
  090c  e95f02           jmp 0xb6e                                
  090f  8b4606           mov ax, word ptr [bp + 6]                
  0912  d1e0             shl ax, 1                                
  0914  c45e0a           les bx, ptr [bp + 0xa]                   
  0917  03d8             add bx, ax                               
  0919  268b470c         mov ax, word ptr es:[bx + 0xc]           
  091d  8946f8           mov word ptr [bp - 8], ax                
  0920  837ef8ff         cmp word ptr [bp - 8], -1                
  0924  7434             je 0x95a                                 
  0926  6aff             push -1                                  
  0928  8bde             mov bx, si                               
  092a  6bdb16           imul bx, bx, 0x16                        
  092d  b81d1e           mov ax, 0x1e1d                           
  0930  8ec0             mov es, ax                               
  0932  26ffb78288       push word ptr es:[bx - 0x777e]           
  0937  8bde             mov bx, si                               
  0939  6bdb16           imul bx, bx, 0x16                        
  093c  b81d1e           mov ax, 0x1e1d                           
  093f  ba0000           mov dx, 0                                
  0942  81c28088         add dx, 0x8880                           
  0946  03da             add bx, dx                               
  0948  8ec0             mov es, ax                               
  094a  26ff37           push word ptr es:[bx]                    
  094d  9a3400bd2f       lcall 0x2fbd, 0x34                       -> ovl20:0a3e
  0952  83c406           add sp, 6                                
  0955  8946fc           mov word ptr [bp - 4], ax                
  0958  eb05             jmp 0x95f                                
  095a  c746fc6400       mov word ptr [bp - 4], 0x64              
  095f  837ef8ff         cmp word ptr [bp - 8], -1                
  0963  7503             jne 0x968                                
  0965  e9a400           jmp 0xa0c                                
  0968  b9ffff           mov cx, 0xffff                           
  096b  ba0800           mov dx, 8                                
  096e  eb34             jmp 0x9a4                                
  0970  8bda             mov bx, dx                               
  0972  d1e3             shl bx, 1                                
  0974  8d46e2           lea ax, [bp - 0x1e]                      
  0977  03d8             add bx, ax                               
  0979  368b07           mov ax, word ptr ss:[bx]                 
  097c  8946f2           mov word ptr [bp - 0xe], ax              
  097f  3dffff           cmp ax, 0xffff                           
  0982  7420             je 0x9a4                                 
  0984  8b5ef2           mov bx, word ptr [bp - 0xe]              
  0987  6bdb16           imul bx, bx, 0x16                        
  098a  b81d1e           mov ax, 0x1e1d                           
  098d  8ec0             mov es, ax                               
  098f  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0994  98               cwde                                     
  0995  6bc006           imul ax, ax, 6                           
  0998  8bd8             mov bx, ax                               
  099a  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  099f  7403             je 0x9a4                                 
  09a1  8b4ef2           mov cx, word ptr [bp - 0xe]              
  09a4  8bc2             mov ax, dx                               
  09a6  4a               dec dx                                   
  09a7  0bc0             or ax, ax                                
  09a9  75c5             jne 0x970                                
  09ab  83f9ff           cmp cx, -1                               
  09ae  7427             je 0x9d7                                 
  09b0  ba0800           mov dx, 8                                
  09b3  eb0e             jmp 0x9c3                                
  09b5  8bda             mov bx, dx                               
  09b7  d1e3             shl bx, 1                                
  09b9  8d46e2           lea ax, [bp - 0x1e]                      
  09bc  03d8             add bx, ax                               
  09be  36c707ffff       mov word ptr ss:[bx], 0xffff             
  09c3  8bc2             mov ax, dx                               
  09c5  4a               dec dx                                   
  09c6  0bc0             or ax, ax                                
  09c8  75eb             jne 0x9b5                                
  09ca  8976e2           mov word ptr [bp - 0x1e], si             
  09cd  894ee4           mov word ptr [bp - 0x1c], cx             
  09d0  c746fe0200       mov word ptr [bp - 2], 2                 
  09d5  eb28             jmp 0x9ff                                
  09d7  837efc0f         cmp word ptr [bp - 4], 0xf               
  09db  7c2f             jl 0xa0c                                 
  09dd  ba0800           mov dx, 8                                
  09e0  eb0e             jmp 0x9f0                                
  09e2  8bda             mov bx, dx                               
  09e4  d1e3             shl bx, 1                                
  09e6  8d46e2           lea ax, [bp - 0x1e]                      
  09e9  03d8             add bx, ax                               
  09eb  36c707ffff       mov word ptr ss:[bx], 0xffff             
  09f0  8bc2             mov ax, dx                               
  09f2  4a               dec dx                                   
  09f3  0bc0             or ax, ax                                
  09f5  75eb             jne 0x9e2                                
  09f7  8976e2           mov word ptr [bp - 0x1e], si             
  09fa  c746fe0100       mov word ptr [bp - 2], 1                 
  09ff  16               push ss                                  
  0a00  8d46e2           lea ax, [bp - 0x1e]                      
  0a03  50               push ax                                  
  0a04  9a5c00f72f       lcall 0x2ff7, 0x5c                       -> ovl29:14d3
  0a09  83c404           add sp, 4                                
  0a0c  837ef8ff         cmp word ptr [bp - 8], -1                
  0a10  7422             je 0xa34                                 
  0a12  c41eee40         les bx, ptr [0x40ee]                     
  0a16  035ef8           add bx, word ptr [bp - 8]                
  0a19  268a878201       mov al, byte ptr es:[bx + 0x182]         
  0a1e  b400             mov ah, 0                                
  0a20  3b46fe           cmp ax, word ptr [bp - 2]                
  0a23  750f             jne 0xa34                                
  0a25  837efe03         cmp word ptr [bp - 2], 3                 
  0a29  7d09             jge 0xa34                                
  0a2b  837efc0f         cmp word ptr [bp - 4], 0xf               
  0a2f  7d03             jge 0xa34                                
  0a31  e93a01           jmp 0xb6e                                
  0a34  837ef8ff         cmp word ptr [bp - 8], -1                
  0a38  7430             je 0xa6a                                 
  0a3a  837efe03         cmp word ptr [bp - 2], 3                 
  0a3e  752a             jne 0xa6a                                
  0a40  ba0800           mov dx, 8                                
  0a43  eb0e             jmp 0xa53                                
  0a45  8bda             mov bx, dx                               
  0a47  d1e3             shl bx, 1                                
  0a49  8d46e2           lea ax, [bp - 0x1e]                      
  0a4c  03d8             add bx, ax                               
  0a4e  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0a53  8bc2             mov ax, dx                               
  0a55  4a               dec dx                                   
  0a56  0bc0             or ax, ax                                
  0a58  75eb             jne 0xa45                                
  0a5a  8976e2           mov word ptr [bp - 0x1e], si             
  0a5d  16               push ss                                  
  0a5e  8d46e2           lea ax, [bp - 0x1e]                      
  0a61  50               push ax                                  
  0a62  9a5c00f72f       lcall 0x2ff7, 0x5c                       -> ovl29:14d3
  0a67  83c404           add sp, 4                                
  0a6a  9a29058c0c       lcall 0xc8c, 0x529                       -> 0c8c:0529
  0a6f  ff36fa5d         push word ptr [0x5dfa]                   
  0a73  ff36fc5d         push word ptr [0x5dfc]                   
  0a77  8b46f4           mov ax, word ptr [bp - 0xc]              
  0a7a  050a00           add ax, 0xa                              
  0a7d  50               push ax                                  
  0a7e  1e               push ds                                  
  0a7f  686009           push 0x960                                ; "Scan dist %d, status %d bonus %d"
  0a82  1e               push ds                                  
  0a83  68885c           push 0x5c88                              
  0a86  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0a8b  83c40e           add sp, 0xe                              
  0a8e  8bde             mov bx, si                               
  0a90  6bdb16           imul bx, bx, 0x16                        
  0a93  b81d1e           mov ax, 0x1e1d                           
  0a96  8ec0             mov es, ax                               
  0a98  26ffb78288       push word ptr es:[bx - 0x777e]           
  0a9d  8bde             mov bx, si                               
  0a9f  6bdb16           imul bx, bx, 0x16                        
  0aa2  b81d1e           mov ax, 0x1e1d                           
  0aa5  8ec0             mov es, ax                               
  0aa7  26ffb78088       push word ptr es:[bx - 0x7780]           
  0aac  1e               push ds                                  
  0aad  68885c           push 0x5c88                              
  0ab0  9a7500f72f       lcall 0x2ff7, 0x75                       -> ovl29:170c
  0ab5  83c408           add sp, 8                                
  0ab8  83ffff           cmp di, -1                               
  0abb  7503             jne 0xac0                                
  0abd  e9ae00           jmp 0xb6e                                
  0ac0  57               push di                                  
  0ac1  1e               push ds                                  
  0ac2  688109           push 0x981                                ; "Moving to site %d"
  0ac5  1e               push ds                                  
  0ac6  68885c           push 0x5c88                              
  0ac9  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0ace  83c40a           add sp, 0xa                              
  0ad1  81ffe803         cmp di, 0x3e8                            
  0ad5  7c65             jl 0xb3c                                 
  0ad7  666a00           push 0                                   
  0ada  6a04             push 4                                   
  0adc  16               push ss                                  
  0add  8d46e2           lea ax, [bp - 0x1e]                      
  0ae0  50               push ax                                  
  0ae1  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  0ae6  83c40a           add sp, 0xa                              
  0ae9  8bdf             mov bx, di                               
  0aeb  6bdb1d           imul bx, bx, 0x1d                        
  0aee  b8042c           mov ax, 0x2c04                           
  0af1  baa19b           mov dx, 0x9ba1                           
  0af4  83c219           add dx, 0x19                             
  0af7  03da             add bx, dx                               
  0af9  8ec0             mov es, ax                               
  0afb  268b07           mov ax, word ptr es:[bx]                 
  0afe  c41e625e         les bx, ptr [0x5e62]                     
  0b02  26894712         mov word ptr es:[bx + 0x12], ax          
  0b06  8bdf             mov bx, di                               
  0b08  6bdb1d           imul bx, bx, 0x1d                        
  0b0b  b8042c           mov ax, 0x2c04                           
  0b0e  baa19b           mov dx, 0x9ba1                           
  0b11  83c21b           add dx, 0x1b                             
  0b14  03da             add bx, dx                               
  0b16  8ec0             mov es, ax                               
  0b18  268b07           mov ax, word ptr es:[bx]                 
  0b1b  c41e625e         les bx, ptr [0x5e62]                     
  0b1f  26894714         mov word ptr es:[bx + 0x14], ax          
  0b23  6a00             push 0                                   
  0b25  26ff7714         push word ptr es:[bx + 0x14]             
  0b29  26ff7712         push word ptr es:[bx + 0x12]             
  0b2d  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  0b32  83c406           add sp, 6                                
  0b35  3d0400           cmp ax, 4                                
  0b38  7534             jne 0xb6e                                
  0b3a  eb2d             jmp 0xb69                                
  0b3c  6a00             push 0                                   
  0b3e  57               push di                                  
  0b3f  6a03             push 3                                   
  0b41  16               push ss                                  
  0b42  8d46e2           lea ax, [bp - 0x1e]                      
  0b45  50               push ax                                  
  0b46  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  0b4b  83c40a           add sp, 0xa                              
  0b4e  6a00             push 0                                   
  0b50  c41e625e         les bx, ptr [0x5e62]                     
  0b54  26ff7714         push word ptr es:[bx + 0x14]             
  0b58  26ff7712         push word ptr es:[bx + 0x12]             
  0b5c  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  0b61  83c406           add sp, 6                                
  0b64  3d0400           cmp ax, 4                                
  0b67  7505             jne 0xb6e                                
  0b69  c746fa0100       mov word ptr [bp - 6], 1                 
  0b6e  8b46fa           mov ax, word ptr [bp - 6]                
  0b71  5f               pop di                                   
  0b72  5e               pop si                                   
  0b73  c9               leave                                    
  0b74  cb               retf                                     

ovl28_0b75:  ; ENTRY
  0b75  55               push bp                                  
  0b76  8bec             mov bp, sp                               
  0b78  83ec1e           sub sp, 0x1e                             
  0b7b  56               push si                                  
  0b7c  57               push di                                  
  0b7d  8b5606           mov dx, word ptr [bp + 6]                
  0b80  33ff             xor di, di                               
  0b82  8bc2             mov ax, dx                               
  0b84  d1e0             shl ax, 1                                
  0b86  c45e08           les bx, ptr [bp + 8]                     
  0b89  03d8             add bx, ax                               
  0b8b  268b37           mov si, word ptr es:[bx]                 
  0b8e  8b5e08           mov bx, word ptr [bp + 8]                
  0b91  268b4738         mov ax, word ptr es:[bx + 0x38]          
  0b95  8946f4           mov word ptr [bp - 0xc], ax              
  0b98  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0b9b  6bdb41           imul bx, bx, 0x41                        
  0b9e  b8042c           mov ax, 0x2c04                           
  0ba1  8ec0             mov es, ax                               
  0ba3  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0ba8  8946fa           mov word ptr [bp - 6], ax                
  0bab  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0bae  6bdb41           imul bx, bx, 0x41                        
  0bb1  b8042c           mov ax, 0x2c04                           
  0bb4  8ec0             mov es, ax                               
  0bb6  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0bbb  8946f8           mov word ptr [bp - 8], ax                
  0bbe  8bc2             mov ax, dx                               
  0bc0  d1e0             shl ax, 1                                
  0bc2  c45e08           les bx, ptr [bp + 8]                     
  0bc5  03d8             add bx, ax                               
  0bc7  268b470c         mov ax, word ptr es:[bx + 0xc]           
  0bcb  8946fc           mov word ptr [bp - 4], ax                
  0bce  8bde             mov bx, si                               
  0bd0  6bdb16           imul bx, bx, 0x16                        
  0bd3  b81d1e           mov ax, 0x1e1d                           
  0bd6  8ec0             mov es, ax                               
  0bd8  26ffb78288       push word ptr es:[bx - 0x777e]           
  0bdd  8bde             mov bx, si                               
  0bdf  6bdb16           imul bx, bx, 0x16                        
  0be2  b81d1e           mov ax, 0x1e1d                           
  0be5  ba0000           mov dx, 0                                
  0be8  81c28088         add dx, 0x8880                           
  0bec  03da             add bx, dx                               
  0bee  8ec0             mov es, ax                               
  0bf0  26ff37           push word ptr es:[bx]                    
  0bf3  ff76f8           push word ptr [bp - 8]                   
  0bf6  ff76fa           push word ptr [bp - 6]                   
  0bf9  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0bfe  83c408           add sp, 8                                
  0c01  8946f6           mov word ptr [bp - 0xa], ax              
  0c04  6a0c             push 0xc                                 
  0c06  8bde             mov bx, si                               
  0c08  6bdb16           imul bx, bx, 0x16                        
  0c0b  b81d1e           mov ax, 0x1e1d                           
  0c0e  8ec0             mov es, ax                               
  0c10  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0c15  250f00           and ax, 0xf                              
  0c18  50               push ax                                  
  0c19  8bde             mov bx, si                               
  0c1b  6bdb16           imul bx, bx, 0x16                        
  0c1e  b81d1e           mov ax, 0x1e1d                           
  0c21  8ec0             mov es, ax                               
  0c23  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0c28  c1e804           shr ax, 4                                
  0c2b  250700           and ax, 7                                
  0c2e  50               push ax                                  
  0c2f  16               push ss                                  
  0c30  8d46e2           lea ax, [bp - 0x1e]                      
  0c33  50               push ax                                  
  0c34  8bde             mov bx, si                               
  0c36  6bdb16           imul bx, bx, 0x16                        
  0c39  b81d1e           mov ax, 0x1e1d                           
  0c3c  8ec0             mov es, ax                               
  0c3e  26ffb78288       push word ptr es:[bx - 0x777e]           
  0c43  8bde             mov bx, si                               
  0c45  6bdb16           imul bx, bx, 0x16                        
  0c48  b81d1e           mov ax, 0x1e1d                           
  0c4b  8ec0             mov es, ax                               
  0c4d  26ffb78088       push word ptr es:[bx - 0x7780]           
  0c52  9a5700f72f       lcall 0x2ff7, 0x57                       -> ovl29:13b2
  0c57  83c40e           add sp, 0xe                              
  0c5a  0bc0             or ax, ax                                
  0c5c  7503             jne 0xc61                                
  0c5e  e98c00           jmp 0xced                                
  0c61  837efcff         cmp word ptr [bp - 4], -1                
  0c65  745c             je 0xcc3                                 
  0c67  c41eee40         les bx, ptr [0x40ee]                     
  0c6b  035efc           add bx, word ptr [bp - 4]                
  0c6e  268a878201       mov al, byte ptr es:[bx + 0x182]         
  0c73  b400             mov ah, 0                                
  0c75  3b46fe           cmp ax, word ptr [bp - 2]                
  0c78  7549             jne 0xcc3                                
  0c7a  6aff             push -1                                  
  0c7c  8bde             mov bx, si                               
  0c7e  6bdb16           imul bx, bx, 0x16                        
  0c81  b81d1e           mov ax, 0x1e1d                           
  0c84  8ec0             mov es, ax                               
  0c86  26ffb78288       push word ptr es:[bx - 0x777e]           
  0c8b  8bde             mov bx, si                               
  0c8d  6bdb16           imul bx, bx, 0x16                        
  0c90  b81d1e           mov ax, 0x1e1d                           
  0c93  ba0000           mov dx, 0                                
  0c96  81c28088         add dx, 0x8880                           
  0c9a  03da             add bx, dx                               
  0c9c  8ec0             mov es, ax                               
  0c9e  26ff37           push word ptr es:[bx]                    
  0ca1  9a3400bd2f       lcall 0x2fbd, 0x34                       -> ovl20:0a3e
  0ca6  83c406           add sp, 6                                
  0ca9  8946f2           mov word ptr [bp - 0xe], ax              
  0cac  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0cb1  3d0500           cmp ax, 5                                
  0cb4  7e05             jle 0xcbb                                
  0cb6  b80f00           mov ax, 0xf                              
  0cb9  eb03             jmp 0xcbe                                
  0cbb  b80a00           mov ax, 0xa                              
  0cbe  3b46f2           cmp ax, word ptr [bp - 0xe]              
  0cc1  7f2a             jg 0xced                                 
  0cc3  6a00             push 0                                   
  0cc5  ff76f4           push word ptr [bp - 0xc]                 
  0cc8  6a01             push 1                                   
  0cca  16               push ss                                  
  0ccb  8d46e2           lea ax, [bp - 0x1e]                      
  0cce  50               push ax                                  
  0ccf  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  0cd4  83c40a           add sp, 0xa                              
  0cd7  6a00             push 0                                   
  0cd9  c41e625e         les bx, ptr [0x5e62]                     
  0cdd  26ff7714         push word ptr es:[bx + 0x14]             
  0ce1  26ff7712         push word ptr es:[bx + 0x12]             
  0ce5  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  0cea  83c406           add sp, 6                                
  0ced  8bc7             mov ax, di                               
  0cef  5f               pop di                                   
  0cf0  5e               pop si                                   
  0cf1  c9               leave                                    
  0cf2  cb               retf                                     

ovl28_0cf3:  ; ENTRY
  0cf3  55               push bp                                  
  0cf4  8bec             mov bp, sp                               
  0cf6  83ec1a           sub sp, 0x1a                             
  0cf9  56               push si                                  
  0cfa  57               push di                                  
  0cfb  8b4606           mov ax, word ptr [bp + 6]                
  0cfe  d1e0             shl ax, 1                                
  0d00  c45e08           les bx, ptr [bp + 8]                     
  0d03  03d8             add bx, ax                               
  0d05  268b3f           mov di, word ptr es:[bx]                 
  0d08  b8042c           mov ax, 0x2c04                           
  0d0b  8ec0             mov es, ax                               
  0d0d  268b1e1001       mov bx, word ptr es:[0x110]              
  0d12  6bdb0c           imul bx, bx, 0xc                         
  0d15  b8042c           mov ax, 0x2c04                           
  0d18  8ec0             mov es, ax                               
  0d1a  2683bf051104     cmp word ptr es:[bx + 0x1105], 4         
  0d20  741f             je 0xd41                                 
  0d22  b8042c           mov ax, 0x2c04                           
  0d25  8ec0             mov es, ax                               
  0d27  268b1e1001       mov bx, word ptr es:[0x110]              
  0d2c  6bdb0c           imul bx, bx, 0xc                         
  0d2f  b8042c           mov ax, 0x2c04                           
  0d32  8ec0             mov es, ax                               
  0d34  2683bf051105     cmp word ptr es:[bx + 0x1105], 5         
  0d3a  7405             je 0xd41                                 
  0d3c  33c0             xor ax, ax                               
  0d3e  e9b701           jmp 0xef8                                
  0d41  b8042c           mov ax, 0x2c04                           
  0d44  8ec0             mov es, ax                               
  0d46  268b1e1001       mov bx, word ptr es:[0x110]              
  0d4b  6bdb0c           imul bx, bx, 0xc                         
  0d4e  b8042c           mov ax, 0x2c04                           
  0d51  8ec0             mov es, ax                               
  0d53  268bb70911       mov si, word ptr es:[bx + 0x1109]        
  0d58  8bde             mov bx, si                               
  0d5a  6bdb41           imul bx, bx, 0x41                        
  0d5d  b8042c           mov ax, 0x2c04                           
  0d60  8ec0             mov es, ax                               
  0d62  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0d67  8946fc           mov word ptr [bp - 4], ax                
  0d6a  8bde             mov bx, si                               
  0d6c  6bdb41           imul bx, bx, 0x41                        
  0d6f  b8042c           mov ax, 0x2c04                           
  0d72  8ec0             mov es, ax                               
  0d74  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0d79  8946fa           mov word ptr [bp - 6], ax                
  0d7c  c41eee40         les bx, ptr [0x40ee]                     
  0d80  03de             add bx, si                               
  0d82  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  0d88  75b2             jne 0xd3c                                
  0d8a  8bde             mov bx, si                               
  0d8c  6bdb41           imul bx, bx, 0x41                        
  0d8f  b8042c           mov ax, 0x2c04                           
  0d92  8ec0             mov es, ax                               
  0d94  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  0d9a  740a             je 0xda6                                 
  0d9c  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  0da1  3d0800           cmp ax, 8                                
  0da4  7d05             jge 0xdab                                
  0da6  b80100           mov ax, 1                                
  0da9  eb03             jmp 0xdae                                
  0dab  b80200           mov ax, 2                                
  0dae  8946f6           mov word ptr [bp - 0xa], ax              
  0db1  6a08             push 8                                   
  0db3  16               push ss                                  
  0db4  8d46e6           lea ax, [bp - 0x1a]                      
  0db7  50               push ax                                  
  0db8  8bdf             mov bx, di                               
  0dba  6bdb16           imul bx, bx, 0x16                        
  0dbd  b81d1e           mov ax, 0x1e1d                           
  0dc0  8ec0             mov es, ax                               
  0dc2  26ffb78288       push word ptr es:[bx - 0x777e]           
  0dc7  8bdf             mov bx, di                               
  0dc9  6bdb16           imul bx, bx, 0x16                        
  0dcc  b81d1e           mov ax, 0x1e1d                           
  0dcf  ba0000           mov dx, 0                                
  0dd2  81c28088         add dx, 0x8880                           
  0dd6  03da             add bx, dx                               
  0dd8  8ec0             mov es, ax                               
  0dda  26ff37           push word ptr es:[bx]                    
  0ddd  9a5200f72f       lcall 0x2ff7, 0x52                       -> ovl29:12c9
  0de2  83c40a           add sp, 0xa                              
  0de5  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0de8  7d03             jge 0xded                                
  0dea  e94fff           jmp 0xd3c                                
  0ded  8bdf             mov bx, di                               
  0def  6bdb16           imul bx, bx, 0x16                        
  0df2  b81d1e           mov ax, 0x1e1d                           
  0df5  8ec0             mov es, ax                               
  0df7  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0dfc  250f00           and ax, 0xf                              
  0dff  3d0100           cmp ax, 1                                
  0e02  7518             jne 0xe1c                                
  0e04  8bdf             mov bx, di                               
  0e06  6bdb16           imul bx, bx, 0x16                        
  0e09  b81d1e           mov ax, 0x1e1d                           
  0e0c  8ec0             mov es, ax                               
  0e0e  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  0e13  d1e8             shr ax, 1                                
  0e15  257f00           and ax, 0x7f                             
  0e18  3bc6             cmp ax, si                               
  0e1a  7468             je 0xe84                                 
  0e1c  8bdf             mov bx, di                               
  0e1e  6bdb16           imul bx, bx, 0x16                        
  0e21  b81d1e           mov ax, 0x1e1d                           
  0e24  8ec0             mov es, ax                               
  0e26  26ffb78288       push word ptr es:[bx - 0x777e]           
  0e2b  8bdf             mov bx, di                               
  0e2d  6bdb16           imul bx, bx, 0x16                        
  0e30  b81d1e           mov ax, 0x1e1d                           
  0e33  ba0000           mov dx, 0                                
  0e36  81c28088         add dx, 0x8880                           
  0e3a  03da             add bx, dx                               
  0e3c  8ec0             mov es, ax                               
  0e3e  26ff37           push word ptr es:[bx]                    
  0e41  ff76fa           push word ptr [bp - 6]                   
  0e44  ff76fc           push word ptr [bp - 4]                   
  0e47  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0e4c  83c408           add sp, 8                                
  0e4f  8946f8           mov word ptr [bp - 8], ax                
  0e52  8bde             mov bx, si                               
  0e54  6bdb41           imul bx, bx, 0x41                        
  0e57  b8042c           mov ax, 0x2c04                           
  0e5a  8ec0             mov es, ax                               
  0e5c  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0e61  8bde             mov bx, si                               
  0e63  6bdb41           imul bx, bx, 0x41                        
  0e66  b8042c           mov ax, 0x2c04                           
  0e69  8ec0             mov es, ax                               
  0e6b  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0e70  9a6100f72f       lcall 0x2ff7, 0x61                       -> ovl29:15c5
  0e75  83c404           add sp, 4                                
  0e78  8946fe           mov word ptr [bp - 2], ax                
  0e7b  837efe4b         cmp word ptr [bp - 2], 0x4b              
  0e7f  7d03             jge 0xe84                                
  0e81  e9b8fe           jmp 0xd3c                                
  0e84  ff36fa5d         push word ptr [0x5dfa]                   
  0e88  ff36fc5d         push word ptr [0x5dfc]                   
  0e8c  ff76f8           push word ptr [bp - 8]                   
  0e8f  8bc6             mov ax, si                               
  0e91  40               inc ax                                   
  0e92  50               push ax                                  
  0e93  1e               push ds                                  
  0e94  689309           push 0x993                                ; "Quest city %d GOING !! dist %d, status %d bonus %d"
  0e97  1e               push ds                                  
  0e98  68885c           push 0x5c88                              
  0e9b  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0ea0  83c410           add sp, 0x10                             
  0ea3  8bdf             mov bx, di                               
  0ea5  6bdb16           imul bx, bx, 0x16                        
  0ea8  b81d1e           mov ax, 0x1e1d                           
  0eab  8ec0             mov es, ax                               
  0ead  26ffb78288       push word ptr es:[bx - 0x777e]           
  0eb2  8bdf             mov bx, di                               
  0eb4  6bdb16           imul bx, bx, 0x16                        
  0eb7  b81d1e           mov ax, 0x1e1d                           
  0eba  8ec0             mov es, ax                               
  0ebc  26ffb78088       push word ptr es:[bx - 0x7780]           
  0ec1  1e               push ds                                  
  0ec2  68885c           push 0x5c88                              
  0ec5  9a7500f72f       lcall 0x2ff7, 0x75                       -> ovl29:170c
  0eca  83c408           add sp, 8                                
  0ecd  6a00             push 0                                   
  0ecf  56               push si                                  
  0ed0  6a01             push 1                                   
  0ed2  16               push ss                                  
  0ed3  8d46e6           lea ax, [bp - 0x1a]                      
  0ed6  50               push ax                                  
  0ed7  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  0edc  83c40a           add sp, 0xa                              
  0edf  6a00             push 0                                   
  0ee1  c41e625e         les bx, ptr [0x5e62]                     
  0ee5  26ff7714         push word ptr es:[bx + 0x14]             
  0ee9  26ff7712         push word ptr es:[bx + 0x12]             
  0eed  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  0ef2  83c406           add sp, 6                                
  0ef5  b80100           mov ax, 1                                
  0ef8  5f               pop di                                   
  0ef9  5e               pop si                                   
  0efa  c9               leave                                    
  0efb  cb               retf                                     

ovl28_0efc:  ; ENTRY
  0efc  55               push bp                                  
  0efd  8bec             mov bp, sp                               
  0eff  56               push si                                  
  0f00  57               push di                                  
  0f01  33ff             xor di, di                               
  0f03  33f6             xor si, si                               
  0f05  666a14           push 0x14                                
  0f08  6a01             push 1                                   
  0f0a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0f0f  83c406           add sp, 6                                
  0f12  c45e08           les bx, ptr [bp + 8]                     
  0f15  ba6400           mov dx, 0x64                             
  0f18  262b5732         sub dx, word ptr es:[bx + 0x32]          
  0f1c  03d0             add dx, ax                               
  0f1e  8bca             mov cx, dx                               
  0f20  26837f30ff       cmp word ptr es:[bx + 0x30], -1          
  0f25  7405             je 0xf2c                                 
  0f27  bf0100           mov di, 1                                
  0f2a  8bf1             mov si, cx                               
  0f2c  666a14           push 0x14                                
  0f2f  6a01             push 1                                   
  0f31  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0f36  83c406           add sp, 6                                
  0f39  c45e08           les bx, ptr [bp + 8]                     
  0f3c  ba6400           mov dx, 0x64                             
  0f3f  262b5736         sub dx, word ptr es:[bx + 0x36]          
  0f43  03d0             add dx, ax                               
  0f45  8bca             mov cx, dx                               
  0f47  26837f34ff       cmp word ptr es:[bx + 0x34], -1          
  0f4c  7409             je 0xf57                                 
  0f4e  3bf1             cmp si, cx                               
  0f50  7d05             jge 0xf57                                
  0f52  bf0300           mov di, 3                                
  0f55  8bf1             mov si, cx                               
  0f57  8b4606           mov ax, word ptr [bp + 6]                
  0f5a  d1e0             shl ax, 1                                
  0f5c  c45e08           les bx, ptr [bp + 8]                     
  0f5f  03d8             add bx, ax                               
  0f61  26837f0cff       cmp word ptr es:[bx + 0xc], -1           
  0f66  7418             je 0xf80                                 
  0f68  06               push es                                  
  0f69  c406ee40         les ax, ptr [0x40ee]                     
  0f6d  8cc2             mov dx, es                               
  0f6f  07               pop es                                   
  0f70  2603470c         add ax, word ptr es:[bx + 0xc]           
  0f74  8bd8             mov bx, ax                               
  0f76  8ec2             mov es, dx                               
  0f78  2680bf820104     cmp byte ptr es:[bx + 0x182], 4          
  0f7e  7654             jbe 0xfd4                                
  0f80  666a14           push 0x14                                
  0f83  6a01             push 1                                   
  0f85  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0f8a  83c406           add sp, 6                                
  0f8d  c45e08           les bx, ptr [bp + 8]                     
  0f90  ba6400           mov dx, 0x64                             
  0f93  262b573a         sub dx, word ptr es:[bx + 0x3a]          
  0f97  03d0             add dx, ax                               
  0f99  8bca             mov cx, dx                               
  0f9b  26837f38ff       cmp word ptr es:[bx + 0x38], -1          
  0fa0  7409             je 0xfab                                 
  0fa2  3bf1             cmp si, cx                               
  0fa4  7d05             jge 0xfab                                
  0fa6  bf0400           mov di, 4                                
  0fa9  8bf1             mov si, cx                               
  0fab  666a14           push 0x14                                
  0fae  6a01             push 1                                   
  0fb0  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0fb5  83c406           add sp, 6                                
  0fb8  c45e08           les bx, ptr [bp + 8]                     
  0fbb  ba6400           mov dx, 0x64                             
  0fbe  262b573e         sub dx, word ptr es:[bx + 0x3e]          
  0fc2  03d0             add dx, ax                               
  0fc4  8bca             mov cx, dx                               
  0fc6  26837f3cff       cmp word ptr es:[bx + 0x3c], -1          
  0fcb  7407             je 0xfd4                                 
  0fcd  3bf1             cmp si, cx                               
  0fcf  7d03             jge 0xfd4                                
  0fd1  bf0200           mov di, 2                                
  0fd4  8bc7             mov ax, di                               
  0fd6  5f               pop di                                   
  0fd7  5e               pop si                                   
  0fd8  5d               pop bp                                   
  0fd9  cb               retf                                     

ovl28_0fda:  ; ENTRY
  0fda  55               push bp                                  
  0fdb  8bec             mov bp, sp                               
  0fdd  83ec12           sub sp, 0x12                             
  0fe0  56               push si                                  
  0fe1  57               push di                                  
  0fe2  8b4606           mov ax, word ptr [bp + 6]                
  0fe5  d1e0             shl ax, 1                                
  0fe7  c45e08           les bx, ptr [bp + 8]                     
  0fea  03d8             add bx, ax                               
  0fec  268b07           mov ax, word ptr es:[bx]                 
  0fef  8946fe           mov word ptr [bp - 2], ax                
  0ff2  c746f8ffff       mov word ptr [bp - 8], 0xffff            
  0ff7  c746f66400       mov word ptr [bp - 0xa], 0x64            
  0ffc  c746f4ffff       mov word ptr [bp - 0xc], 0xffff          
  1001  c746f26400       mov word ptr [bp - 0xe], 0x64            
  1006  8b5efe           mov bx, word ptr [bp - 2]                
  1009  6bdb16           imul bx, bx, 0x16                        
  100c  b81d1e           mov ax, 0x1e1d                           
  100f  8ec0             mov es, ax                               
  1011  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  1016  250f00           and ax, 0xf                              
  1019  3d0100           cmp ax, 1                                
  101c  7505             jne 0x1023                               
  101e  b80500           mov ax, 5                                
  1021  eb03             jmp 0x1026                               
  1023  b81900           mov ax, 0x19                             
  1026  8946fa           mov word ptr [bp - 6], ax                
  1029  33f6             xor si, si                               
  102b  e99801           jmp 0x11c6                               
  102e  8bde             mov bx, si                               
  1030  6bdb1f           imul bx, bx, 0x1f                        
  1033  b8042c           mov ax, 0x2c04                           
  1036  8ec0             mov es, ax                               
  1038  268b871108       mov ax, word ptr es:[bx + 0x811]         
  103d  8946f0           mov word ptr [bp - 0x10], ax             
  1040  8bde             mov bx, si                               
  1042  6bdb1f           imul bx, bx, 0x1f                        
  1045  b8042c           mov ax, 0x2c04                           
  1048  8ec0             mov es, ax                               
  104a  268b871308       mov ax, word ptr es:[bx + 0x813]         
  104f  8946ee           mov word ptr [bp - 0x12], ax             
  1052  c746fc0100       mov word ptr [bp - 4], 1                 
  1057  ff76fe           push word ptr [bp - 2]                   
  105a  56               push si                                  
  105b  90               nop                                      
  105c  0e               push cs                                  
  105d  e8d705           call 0x1637                              
  1060  83c404           add sp, 4                                
  1063  0bc0             or ax, ax                                
  1065  7503             jne 0x106a                               
  1067  e95b01           jmp 0x11c5                               
  106a  8b5efe           mov bx, word ptr [bp - 2]                
  106d  6bdb16           imul bx, bx, 0x16                        
  1070  b81d1e           mov ax, 0x1e1d                           
  1073  8ec0             mov es, ax                               
  1075  26ffb78288       push word ptr es:[bx - 0x777e]           
  107a  8b5efe           mov bx, word ptr [bp - 2]                
  107d  6bdb16           imul bx, bx, 0x16                        
  1080  b81d1e           mov ax, 0x1e1d                           
  1083  ba0000           mov dx, 0                                
  1086  81c28088         add dx, 0x8880                           
  108a  03da             add bx, dx                               
  108c  8ec0             mov es, ax                               
  108e  26ff37           push word ptr es:[bx]                    
  1091  ff76ee           push word ptr [bp - 0x12]                
  1094  ff76f0           push word ptr [bp - 0x10]                
  1097  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  109c  83c408           add sp, 8                                
  109f  8bf8             mov di, ax                               
  10a1  8bde             mov bx, si                               
  10a3  6bdb1f           imul bx, bx, 0x1f                        
  10a6  b8042c           mov ax, 0x2c04                           
  10a9  8ec0             mov es, ax                               
  10ab  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  10b1  7552             jne 0x1105                               
  10b3  b8042c           mov ax, 0x2c04                           
  10b6  8ec0             mov es, ax                               
  10b8  26833e1e0100     cmp word ptr es:[0x11e], 0               
  10be  742a             je 0x10ea                                
  10c0  8ec0             mov es, ax                               
  10c2  268b1e1001       mov bx, word ptr es:[0x110]              
  10c7  6bdb0c           imul bx, bx, 0xc                         
  10ca  b8042c           mov ax, 0x2c04                           
  10cd  8ec0             mov es, ax                               
  10cf  2683bf031100     cmp word ptr es:[bx + 0x1103], 0         
  10d5  7513             jne 0x10ea                               
  10d7  3b7efa           cmp di, word ptr [bp - 6]                
  10da  7d0e             jge 0x10ea                               
  10dc  3b7ef2           cmp di, word ptr [bp - 0xe]              
  10df  7d09             jge 0x10ea                               
  10e1  8976f4           mov word ptr [bp - 0xc], si              
  10e4  897ef2           mov word ptr [bp - 0xe], di              
  10e7  e98300           jmp 0x116d                               
  10ea  56               push si                                  
  10eb  0e               push cs                                  
  10ec  e84df5           call 0x63c                               
  10ef  59               pop cx                                   
  10f0  8b5efe           mov bx, word ptr [bp - 2]                
  10f3  6bdb16           imul bx, bx, 0x16                        
  10f6  ba1d1e           mov dx, 0x1e1d                           
  10f9  8ec2             mov es, dx                               
  10fb  2685878c88       test word ptr es:[bx - 0x7774], ax       
  1100  746b             je 0x116d                                
  1102  e9c000           jmp 0x11c5                               
  1105  ba0600           mov dx, 6                                
  1108  eb5c             jmp 0x1166                               
  110a  3b5606           cmp dx, word ptr [bp + 6]                
  110d  7457             je 0x1166                                
  110f  8bc2             mov ax, dx                               
  1111  d1e0             shl ax, 1                                
  1113  c45e08           les bx, ptr [bp + 8]                     
  1116  03d8             add bx, ax                               
  1118  26833fff         cmp word ptr es:[bx], -1                 
  111c  7448             je 0x1166                                
  111e  8bc2             mov ax, dx                               
  1120  d1e0             shl ax, 1                                
  1122  c45e08           les bx, ptr [bp + 8]                     
  1125  03d8             add bx, ax                               
  1127  268b1f           mov bx, word ptr es:[bx]                 
  112a  6bdb16           imul bx, bx, 0x16                        
  112d  b81d1e           mov ax, 0x1e1d                           
  1130  8ec0             mov es, ax                               
  1132  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  1137  250f00           and ax, 0xf                              
  113a  3d0300           cmp ax, 3                                
  113d  7527             jne 0x1166                               
  113f  8bc2             mov ax, dx                               
  1141  d1e0             shl ax, 1                                
  1143  c45e08           les bx, ptr [bp + 8]                     
  1146  03d8             add bx, ax                               
  1148  268b1f           mov bx, word ptr es:[bx]                 
  114b  6bdb16           imul bx, bx, 0x16                        
  114e  b81d1e           mov ax, 0x1e1d                           
  1151  8ec0             mov es, ax                               
  1153  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  1158  d1e8             shr ax, 1                                
  115a  257f00           and ax, 0x7f                             
  115d  3bc6             cmp ax, si                               
  115f  7505             jne 0x1166                               
  1161  c746fc0000       mov word ptr [bp - 4], 0                 
  1166  8bc2             mov ax, dx                               
  1168  4a               dec dx                                   
  1169  0bc0             or ax, ax                                
  116b  759d             jne 0x110a                               
  116d  837efc00         cmp word ptr [bp - 4], 0                 
  1171  7452             je 0x11c5                                
  1173  3b7efa           cmp di, word ptr [bp - 6]                
  1176  7f4d             jg 0x11c5                                
  1178  3b7ef6           cmp di, word ptr [bp - 0xa]              
  117b  7d06             jge 0x1183                               
  117d  8976f8           mov word ptr [bp - 8], si                
  1180  897ef6           mov word ptr [bp - 0xa], di              
  1183  ff76f8           push word ptr [bp - 8]                   
  1186  ff76fa           push word ptr [bp - 6]                   
  1189  57               push di                                  
  118a  56               push si                                  
  118b  1e               push ds                                  
  118c  68c609           push 0x9c6                                ; "Legal site %d, dist %d [%d] {current %d}"
  118f  1e               push ds                                  
  1190  68885c           push 0x5c88                              
  1193  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1198  83c410           add sp, 0x10                             
  119b  8bde             mov bx, si                               
  119d  6bdb1f           imul bx, bx, 0x1f                        
  11a0  b8042c           mov ax, 0x2c04                           
  11a3  8ec0             mov es, ax                               
  11a5  26ffb71308       push word ptr es:[bx + 0x813]            
  11aa  8bde             mov bx, si                               
  11ac  6bdb1f           imul bx, bx, 0x1f                        
  11af  b8042c           mov ax, 0x2c04                           
  11b2  8ec0             mov es, ax                               
  11b4  26ffb71108       push word ptr es:[bx + 0x811]            
  11b9  1e               push ds                                  
  11ba  68885c           push 0x5c88                              
  11bd  9a7500f72f       lcall 0x2ff7, 0x75                       -> ovl29:170c
  11c2  83c408           add sp, 8                                
  11c5  46               inc si                                   
  11c6  b8042c           mov ax, 0x2c04                           
  11c9  8ec0             mov es, ax                               
  11cb  2639360f08       cmp word ptr es:[0x80f], si              
  11d0  7e03             jle 0x11d5                               
  11d2  e959fe           jmp 0x102e                               
  11d5  c45e08           les bx, ptr [bp + 8]                     
  11d8  8b46f4           mov ax, word ptr [bp - 0xc]              
  11db  26894730         mov word ptr es:[bx + 0x30], ax          
  11df  8b46f2           mov ax, word ptr [bp - 0xe]              
  11e2  26894732         mov word ptr es:[bx + 0x32], ax          
  11e6  8b46f8           mov ax, word ptr [bp - 8]                
  11e9  26894734         mov word ptr es:[bx + 0x34], ax          
  11ed  8b46f6           mov ax, word ptr [bp - 0xa]              
  11f0  26894736         mov word ptr es:[bx + 0x36], ax          
  11f4  5f               pop di                                   
  11f5  5e               pop si                                   
  11f6  c9               leave                                    
  11f7  cb               retf                                     

ovl28_11f8:  ; ENTRY
  11f8  55               push bp                                  
  11f9  8bec             mov bp, sp                               
  11fb  83ec0c           sub sp, 0xc                              
  11fe  56               push si                                  
  11ff  57               push di                                  
  1200  8b4606           mov ax, word ptr [bp + 6]                
  1203  d1e0             shl ax, 1                                
  1205  c45e08           les bx, ptr [bp + 8]                     
  1208  03d8             add bx, ax                               
  120a  268b3f           mov di, word ptr es:[bx]                 
  120d  c746faffff       mov word ptr [bp - 6], 0xffff            
  1212  c746f86400       mov word ptr [bp - 8], 0x64              
  1217  8bdf             mov bx, di                               
  1219  6bdb16           imul bx, bx, 0x16                        
  121c  b81d1e           mov ax, 0x1e1d                           
  121f  8ec0             mov es, ax                               
  1221  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  1226  250f00           and ax, 0xf                              
  1229  3d0100           cmp ax, 1                                
  122c  7505             jne 0x1233                               
  122e  b80500           mov ax, 5                                
  1231  eb03             jmp 0x1236                               
  1233  b80f00           mov ax, 0xf                              
  1236  8946fc           mov word ptr [bp - 4], ax                
  1239  be1600           mov si, 0x16                             
  123c  e9ea00           jmp 0x1329                               
  123f  8bde             mov bx, si                               
  1241  6bdb1d           imul bx, bx, 0x1d                        
  1244  b8042c           mov ax, 0x2c04                           
  1247  8ec0             mov es, ax                               
  1249  268b87020d       mov ax, word ptr es:[bx + 0xd02]         
  124e  8946f6           mov word ptr [bp - 0xa], ax              
  1251  8bde             mov bx, si                               
  1253  6bdb1d           imul bx, bx, 0x1d                        
  1256  b8042c           mov ax, 0x2c04                           
  1259  8ec0             mov es, ax                               
  125b  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  1260  8946f4           mov word ptr [bp - 0xc], ax              
  1263  c746fe0100       mov word ptr [bp - 2], 1                 
  1268  56               push si                                  
  1269  90               nop                                      
  126a  0e               push cs                                  
  126b  e8c804           call 0x1736                              
  126e  59               pop cx                                   
  126f  0bc0             or ax, ax                                
  1271  7503             jne 0x1276                               
  1273  e9b300           jmp 0x1329                               
  1276  ba0600           mov dx, 6                                
  1279  eb5c             jmp 0x12d7                               
  127b  3b5606           cmp dx, word ptr [bp + 6]                
  127e  7457             je 0x12d7                                
  1280  8bc2             mov ax, dx                               
  1282  d1e0             shl ax, 1                                
  1284  c45e08           les bx, ptr [bp + 8]                     
  1287  03d8             add bx, ax                               
  1289  26833fff         cmp word ptr es:[bx], -1                 
  128d  7448             je 0x12d7                                
  128f  8bc2             mov ax, dx                               
  1291  d1e0             shl ax, 1                                
  1293  c45e08           les bx, ptr [bp + 8]                     
  1296  03d8             add bx, ax                               
  1298  268b1f           mov bx, word ptr es:[bx]                 
  129b  6bdb16           imul bx, bx, 0x16                        
  129e  b81d1e           mov ax, 0x1e1d                           
  12a1  8ec0             mov es, ax                               
  12a3  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  12a8  250f00           and ax, 0xf                              
  12ab  3d0200           cmp ax, 2                                
  12ae  7527             jne 0x12d7                               
  12b0  8bc2             mov ax, dx                               
  12b2  d1e0             shl ax, 1                                
  12b4  c45e08           les bx, ptr [bp + 8]                     
  12b7  03d8             add bx, ax                               
  12b9  268b1f           mov bx, word ptr es:[bx]                 
  12bc  6bdb16           imul bx, bx, 0x16                        
  12bf  b81d1e           mov ax, 0x1e1d                           
  12c2  8ec0             mov es, ax                               
  12c4  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  12c9  d1e8             shr ax, 1                                
  12cb  257f00           and ax, 0x7f                             
  12ce  3bc6             cmp ax, si                               
  12d0  7505             jne 0x12d7                               
  12d2  c746fe0000       mov word ptr [bp - 2], 0                 
  12d7  8bc2             mov ax, dx                               
  12d9  4a               dec dx                                   
  12da  0bc0             or ax, ax                                
  12dc  759d             jne 0x127b                               
  12de  837efe00         cmp word ptr [bp - 2], 0                 
  12e2  7445             je 0x1329                                
  12e4  8bdf             mov bx, di                               
  12e6  6bdb16           imul bx, bx, 0x16                        
  12e9  b81d1e           mov ax, 0x1e1d                           
  12ec  8ec0             mov es, ax                               
  12ee  26ffb78288       push word ptr es:[bx - 0x777e]           
  12f3  8bdf             mov bx, di                               
  12f5  6bdb16           imul bx, bx, 0x16                        
  12f8  b81d1e           mov ax, 0x1e1d                           
  12fb  ba0000           mov dx, 0                                
  12fe  81c28088         add dx, 0x8880                           
  1302  03da             add bx, dx                               
  1304  8ec0             mov es, ax                               
  1306  26ff37           push word ptr es:[bx]                    
  1309  ff76f4           push word ptr [bp - 0xc]                 
  130c  ff76f6           push word ptr [bp - 0xa]                 
  130f  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1314  83c408           add sp, 8                                
  1317  8bd0             mov dx, ax                               
  1319  3b56fc           cmp dx, word ptr [bp - 4]                
  131c  7f0b             jg 0x1329                                
  131e  3b56f8           cmp dx, word ptr [bp - 8]                
  1321  7d06             jge 0x1329                               
  1323  8976fa           mov word ptr [bp - 6], si                
  1326  8956f8           mov word ptr [bp - 8], dx                
  1329  8bc6             mov ax, si                               
  132b  4e               dec si                                   
  132c  0bc0             or ax, ax                                
  132e  7403             je 0x1333                                
  1330  e90cff           jmp 0x123f                               
  1333  c45e08           les bx, ptr [bp + 8]                     
  1336  8b46fa           mov ax, word ptr [bp - 6]                
  1339  2689473c         mov word ptr es:[bx + 0x3c], ax          
  133d  8b46f8           mov ax, word ptr [bp - 8]                
  1340  2689473e         mov word ptr es:[bx + 0x3e], ax          
  1344  5f               pop di                                   
  1345  5e               pop si                                   
  1346  c9               leave                                    
  1347  cb               retf                                     

ovl28_1348:  ; ENTRY
  1348  55               push bp                                  
  1349  8bec             mov bp, sp                               
  134b  83ec20           sub sp, 0x20                             
  134e  56               push si                                  
  134f  57               push di                                  
  1350  8b4606           mov ax, word ptr [bp + 6]                
  1353  d1e0             shl ax, 1                                
  1355  c45e08           les bx, ptr [bp + 8]                     
  1358  03d8             add bx, ax                               
  135a  268b07           mov ax, word ptr es:[bx]                 
  135d  8946fa           mov word ptr [bp - 6], ax                
  1360  c746f4ffff       mov word ptr [bp - 0xc], 0xffff          
  1365  c746f21400       mov word ptr [bp - 0xe], 0x14            
  136a  c746f00000       mov word ptr [bp - 0x10], 0              
  136f  8b5e08           mov bx, word ptr [bp + 8]                
  1372  b8ffff           mov ax, 0xffff                           
  1375  2689473a         mov word ptr es:[bx + 0x3a], ax          
  1379  26894738         mov word ptr es:[bx + 0x38], ax          
  137d  8b5efa           mov bx, word ptr [bp - 6]                
  1380  6bdb16           imul bx, bx, 0x16                        
  1383  b81d1e           mov ax, 0x1e1d                           
  1386  8ec0             mov es, ax                               
  1388  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  138d  250f00           and ax, 0xf                              
  1390  3d0100           cmp ax, 1                                
  1393  751a             jne 0x13af                               
  1395  8b5efa           mov bx, word ptr [bp - 6]                
  1398  6bdb16           imul bx, bx, 0x16                        
  139b  b81d1e           mov ax, 0x1e1d                           
  139e  8ec0             mov es, ax                               
  13a0  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  13a5  d1e8             shr ax, 1                                
  13a7  257f00           and ax, 0x7f                             
  13aa  8946f8           mov word ptr [bp - 8], ax                
  13ad  eb05             jmp 0x13b4                               
  13af  c746f8ffff       mov word ptr [bp - 8], 0xffff            
  13b4  6a0c             push 0xc                                 
  13b6  8b5efa           mov bx, word ptr [bp - 6]                
  13b9  6bdb16           imul bx, bx, 0x16                        
  13bc  b81d1e           mov ax, 0x1e1d                           
  13bf  8ec0             mov es, ax                               
  13c1  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  13c6  250f00           and ax, 0xf                              
  13c9  50               push ax                                  
  13ca  8b5efa           mov bx, word ptr [bp - 6]                
  13cd  6bdb16           imul bx, bx, 0x16                        
  13d0  b81d1e           mov ax, 0x1e1d                           
  13d3  8ec0             mov es, ax                               
  13d5  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  13da  c1e804           shr ax, 4                                
  13dd  250700           and ax, 7                                
  13e0  50               push ax                                  
  13e1  16               push ss                                  
  13e2  8d46e0           lea ax, [bp - 0x20]                      
  13e5  50               push ax                                  
  13e6  8b5efa           mov bx, word ptr [bp - 6]                
  13e9  6bdb16           imul bx, bx, 0x16                        
  13ec  b81d1e           mov ax, 0x1e1d                           
  13ef  8ec0             mov es, ax                               
  13f1  26ffb78288       push word ptr es:[bx - 0x777e]           
  13f6  8b5efa           mov bx, word ptr [bp - 6]                
  13f9  6bdb16           imul bx, bx, 0x16                        
  13fc  b81d1e           mov ax, 0x1e1d                           
  13ff  ba0000           mov dx, 0                                
  1402  81c28088         add dx, 0x8880                           
  1406  03da             add bx, dx                               
  1408  8ec0             mov es, ax                               
  140a  26ff37           push word ptr es:[bx]                    
  140d  9a5700f72f       lcall 0x2ff7, 0x57                       -> ovl29:13b2
  1412  83c40e           add sp, 0xe                              
  1415  8946fc           mov word ptr [bp - 4], ax                
  1418  0bc0             or ax, ax                                
  141a  7503             jne 0x141f                               
  141c  e91402           jmp 0x1633                               
  141f  837efc03         cmp word ptr [bp - 4], 3                 
  1423  7d05             jge 0x142a                               
  1425  b85f00           mov ax, 0x5f                             
  1428  eb03             jmp 0x142d                               
  142a  b84b00           mov ax, 0x4b                             
  142d  8946fe           mov word ptr [bp - 2], ax                
  1430  b8042c           mov ax, 0x2c04                           
  1433  8ec0             mov es, ax                               
  1435  268b3e7b15       mov di, word ptr es:[0x157b]             
  143a  e9db01           jmp 0x1618                               
  143d  8bdf             mov bx, di                               
  143f  6bdb41           imul bx, bx, 0x41                        
  1442  b8042c           mov ax, 0x2c04                           
  1445  8ec0             mov es, ax                               
  1447  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  144c  69dbe000         imul bx, bx, 0xe0                        
  1450  8bf7             mov si, di                               
  1452  6bf641           imul si, si, 0x41                        
  1455  b8042c           mov ax, 0x2c04                           
  1458  8ec0             mov es, ax                               
  145a  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  145f  d1e0             shl ax, 1                                
  1461  03d8             add bx, ax                               
  1463  b81d1e           mov ax, 0x1e1d                           
  1466  8ec0             mov es, ax                               
  1468  268a9f0000       mov bl, byte ptr es:[bx]                 
  146d  81e3ff00         and bx, 0xff                             
  1471  b8042c           mov ax, 0x2c04                           
  1474  8ec0             mov es, ax                               
  1476  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  147c  7403             je 0x1481                                
  147e  e99701           jmp 0x1618                               
  1481  c41eee40         les bx, ptr [0x40ee]                     
  1485  03df             add bx, di                               
  1487  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  148d  7403             je 0x1492                                
  148f  e98601           jmp 0x1618                               
  1492  8bdf             mov bx, di                               
  1494  6bdb41           imul bx, bx, 0x41                        
  1497  b8042c           mov ax, 0x2c04                           
  149a  8ec0             mov es, ax                               
  149c  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  14a2  7503             jne 0x14a7                               
  14a4  e97101           jmp 0x1618                               
  14a7  8bdf             mov bx, di                               
  14a9  6bdb41           imul bx, bx, 0x41                        
  14ac  b8042c           mov ax, 0x2c04                           
  14af  8ec0             mov es, ax                               
  14b1  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  14b6  98               cwde                                     
  14b7  ba042c           mov dx, 0x2c04                           
  14ba  8ec2             mov es, dx                               
  14bc  268b1e1001       mov bx, word ptr es:[0x110]              
  14c1  c1e303           shl bx, 3                                
  14c4  03d8             add bx, ax                               
  14c6  b8042c           mov ax, 0x2c04                           
  14c9  8ec0             mov es, ax                               
  14cb  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  14d0  250300           and ax, 3                                
  14d3  3d0200           cmp ax, 2                                
  14d6  7403             je 0x14db                                
  14d8  e93d01           jmp 0x1618                               
  14db  8b5efa           mov bx, word ptr [bp - 6]                
  14de  6bdb16           imul bx, bx, 0x16                        
  14e1  b81d1e           mov ax, 0x1e1d                           
  14e4  8ec0             mov es, ax                               
  14e6  26ffb78288       push word ptr es:[bx - 0x777e]           
  14eb  8b5efa           mov bx, word ptr [bp - 6]                
  14ee  6bdb16           imul bx, bx, 0x16                        
  14f1  b81d1e           mov ax, 0x1e1d                           
  14f4  ba0000           mov dx, 0                                
  14f7  81c28088         add dx, 0x8880                           
  14fb  03da             add bx, dx                               
  14fd  8ec0             mov es, ax                               
  14ff  26ff37           push word ptr es:[bx]                    
  1502  8bdf             mov bx, di                               
  1504  6bdb41           imul bx, bx, 0x41                        
  1507  b8042c           mov ax, 0x2c04                           
  150a  8ec0             mov es, ax                               
  150c  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1511  8bdf             mov bx, di                               
  1513  6bdb41           imul bx, bx, 0x41                        
  1516  b8042c           mov ax, 0x2c04                           
  1519  8ec0             mov es, ax                               
  151b  26ffb77d15       push word ptr es:[bx + 0x157d]           
  1520  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1525  83c408           add sp, 8                                
  1528  8946f6           mov word ptr [bp - 0xa], ax              
  152b  3b46f2           cmp ax, word ptr [bp - 0xe]              
  152e  7e08             jle 0x1538                               
  1530  397ef8           cmp word ptr [bp - 8], di                
  1533  7403             je 0x1538                                
  1535  e9e000           jmp 0x1618                               
  1538  8bdf             mov bx, di                               
  153a  6bdb41           imul bx, bx, 0x41                        
  153d  b8042c           mov ax, 0x2c04                           
  1540  8ec0             mov es, ax                               
  1542  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1547  8bdf             mov bx, di                               
  1549  6bdb41           imul bx, bx, 0x41                        
  154c  b8042c           mov ax, 0x2c04                           
  154f  8ec0             mov es, ax                               
  1551  26ffb77d15       push word ptr es:[bx + 0x157d]           
  1556  9a6100f72f       lcall 0x2ff7, 0x61                       -> ovl29:15c5
  155b  83c404           add sp, 4                                
  155e  8bf0             mov si, ax                               
  1560  397ef8           cmp word ptr [bp - 8], di                
  1563  7503             jne 0x1568                               
  1565  83c614           add si, 0x14                             
  1568  8b5efa           mov bx, word ptr [bp - 6]                
  156b  6bdb16           imul bx, bx, 0x16                        
  156e  b81d1e           mov ax, 0x1e1d                           
  1571  8ec0             mov es, ax                               
  1573  26ffb78288       push word ptr es:[bx - 0x777e]           
  1578  8b5efa           mov bx, word ptr [bp - 6]                
  157b  6bdb16           imul bx, bx, 0x16                        
  157e  b81d1e           mov ax, 0x1e1d                           
  1581  ba0000           mov dx, 0                                
  1584  81c28088         add dx, 0x8880                           
  1588  03da             add bx, dx                               
  158a  8ec0             mov es, ax                               
  158c  26ff37           push word ptr es:[bx]                    
  158f  8bdf             mov bx, di                               
  1591  6bdb41           imul bx, bx, 0x41                        
  1594  b8042c           mov ax, 0x2c04                           
  1597  8ec0             mov es, ax                               
  1599  26ffb77f15       push word ptr es:[bx + 0x157f]           
  159e  8bdf             mov bx, di                               
  15a0  6bdb41           imul bx, bx, 0x41                        
  15a3  b8042c           mov ax, 0x2c04                           
  15a6  8ec0             mov es, ax                               
  15a8  26ffb77d15       push word ptr es:[bx + 0x157d]           
  15ad  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  15b2  83c408           add sp, 8                                
  15b5  50               push ax                                  
  15b6  56               push si                                  
  15b7  8bc7             mov ax, di                               
  15b9  40               inc ax                                   
  15ba  50               push ax                                  
  15bb  1e               push ds                                  
  15bc  68ef09           push 0x9ef                                ; "Enemy city %d, combat %d dist %d"
  15bf  1e               push ds                                  
  15c0  68885c           push 0x5c88                              
  15c3  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  15c8  83c40e           add sp, 0xe                              
  15cb  8bdf             mov bx, di                               
  15cd  6bdb41           imul bx, bx, 0x41                        
  15d0  b8042c           mov ax, 0x2c04                           
  15d3  8ec0             mov es, ax                               
  15d5  26ffb77f15       push word ptr es:[bx + 0x157f]           
  15da  8bdf             mov bx, di                               
  15dc  6bdb41           imul bx, bx, 0x41                        
  15df  b8042c           mov ax, 0x2c04                           
  15e2  8ec0             mov es, ax                               
  15e4  26ffb77d15       push word ptr es:[bx + 0x157d]           
  15e9  1e               push ds                                  
  15ea  68885c           push 0x5c88                              
  15ed  9a7500f72f       lcall 0x2ff7, 0x75                       -> ovl29:170c
  15f2  83c408           add sp, 8                                
  15f5  3b76fe           cmp si, word ptr [bp - 2]                
  15f8  7c1e             jl 0x1618                                
  15fa  3b76f0           cmp si, word ptr [bp - 0x10]             
  15fd  7f0d             jg 0x160c                                
  15ff  3b76f0           cmp si, word ptr [bp - 0x10]             
  1602  7514             jne 0x1618                               
  1604  8b46f6           mov ax, word ptr [bp - 0xa]              
  1607  3b46f2           cmp ax, word ptr [bp - 0xe]              
  160a  7d0c             jge 0x1618                               
  160c  8b46f6           mov ax, word ptr [bp - 0xa]              
  160f  8946f2           mov word ptr [bp - 0xe], ax              
  1612  897ef4           mov word ptr [bp - 0xc], di              
  1615  8976f0           mov word ptr [bp - 0x10], si             
  1618  8bc7             mov ax, di                               
  161a  4f               dec di                                   
  161b  0bc0             or ax, ax                                
  161d  7403             je 0x1622                                
  161f  e91bfe           jmp 0x143d                               
  1622  c45e08           les bx, ptr [bp + 8]                     
  1625  8b46f4           mov ax, word ptr [bp - 0xc]              
  1628  26894738         mov word ptr es:[bx + 0x38], ax          
  162c  8b46f2           mov ax, word ptr [bp - 0xe]              
  162f  2689473a         mov word ptr es:[bx + 0x3a], ax          
  1633  5f               pop di                                   
  1634  5e               pop si                                   
  1635  c9               leave                                    
  1636  cb               retf                                     

ovl28_1637:  ; ENTRY
  1637  55               push bp                                  
  1638  8bec             mov bp, sp                               
  163a  83ec04           sub sp, 4                                
  163d  56               push si                                  
  163e  57               push di                                  
  163f  8b7606           mov si, word ptr [bp + 6]                
  1642  8b5608           mov dx, word ptr [bp + 8]                
  1645  8bde             mov bx, si                               
  1647  6bdb1f           imul bx, bx, 0x1f                        
  164a  b8042c           mov ax, 0x2c04                           
  164d  8ec0             mov es, ax                               
  164f  268bbf1108       mov di, word ptr es:[bx + 0x811]         
  1654  8bde             mov bx, si                               
  1656  6bdb1f           imul bx, bx, 0x1f                        
  1659  b8042c           mov ax, 0x2c04                           
  165c  8ec0             mov es, ax                               
  165e  268b871308       mov ax, word ptr es:[bx + 0x813]         
  1663  8946fe           mov word ptr [bp - 2], ax                
  1666  8bda             mov bx, dx                               
  1668  6bdb16           imul bx, bx, 0x16                        
  166b  b81d1e           mov ax, 0x1e1d                           
  166e  8ec0             mov es, ax                               
  1670  26ffb78288       push word ptr es:[bx - 0x777e]           
  1675  8bda             mov bx, dx                               
  1677  6bdb16           imul bx, bx, 0x16                        
  167a  b81d1e           mov ax, 0x1e1d                           
  167d  ba0000           mov dx, 0                                
  1680  81c28088         add dx, 0x8880                           
  1684  03da             add bx, dx                               
  1686  8ec0             mov es, ax                               
  1688  26ff37           push word ptr es:[bx]                    
  168b  ff76fe           push word ptr [bp - 2]                   
  168e  57               push di                                  
  168f  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1694  83c408           add sp, 8                                
  1697  8946fc           mov word ptr [bp - 4], ax                
  169a  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  169f  d1e0             shl ax, 1                                
  16a1  050300           add ax, 3                                
  16a4  8bd0             mov dx, ax                               
  16a6  8bde             mov bx, si                               
  16a8  6bdb1f           imul bx, bx, 0x1f                        
  16ab  b8042c           mov ax, 0x2c04                           
  16ae  8ec0             mov es, ax                               
  16b0  2683bf2c0800     cmp word ptr es:[bx + 0x82c], 0          
  16b6  7403             je 0x16bb                                
  16b8  83c20c           add dx, 0xc                              
  16bb  3956fc           cmp word ptr [bp - 4], dx                
  16be  7c04             jl 0x16c4                                
  16c0  33c0             xor ax, ax                               
  16c2  eb6e             jmp 0x1732                               
  16c4  ff76fe           push word ptr [bp - 2]                   
  16c7  57               push di                                  
  16c8  9a7000f72f       lcall 0x2ff7, 0x70                       -> ovl29:16ae
  16cd  83c404           add sp, 4                                
  16d0  0bc0             or ax, ax                                
  16d2  74ec             je 0x16c0                                
  16d4  8b5efe           mov bx, word ptr [bp - 2]                
  16d7  69dbe000         imul bx, bx, 0xe0                        
  16db  8bc7             mov ax, di                               
  16dd  d1e0             shl ax, 1                                
  16df  03d8             add bx, ax                               
  16e1  b81d1e           mov ax, 0x1e1d                           
  16e4  8ec0             mov es, ax                               
  16e6  268a9f0000       mov bl, byte ptr es:[bx]                 
  16eb  81e3ff00         and bx, 0xff                             
  16ef  b8042c           mov ax, 0x2c04                           
  16f2  8ec0             mov es, ax                               
  16f4  2680bf10070b     cmp byte ptr es:[bx + 0x710], 0xb        
  16fa  75c4             jne 0x16c0                               
  16fc  8bde             mov bx, si                               
  16fe  6bdb1f           imul bx, bx, 0x1f                        
  1701  b8042c           mov ax, 0x2c04                           
  1704  8ec0             mov es, ax                               
  1706  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  170c  7421             je 0x172f                                
  170e  8b5efe           mov bx, word ptr [bp - 2]                
  1711  69dbe000         imul bx, bx, 0xe0                        
  1715  8bc7             mov ax, di                               
  1717  d1e0             shl ax, 1                                
  1719  03d8             add bx, ax                               
  171b  b81d1e           mov ax, 0x1e1d                           
  171e  8ec0             mov es, ax                               
  1720  268a870100       mov al, byte ptr es:[bx + 1]             
  1725  c1e806           shr ax, 6                                
  1728  250100           and ax, 1                                
  172b  0bc0             or ax, ax                                
  172d  7591             jne 0x16c0                               
  172f  b80100           mov ax, 1                                
  1732  5f               pop di                                   
  1733  5e               pop si                                   
  1734  c9               leave                                    
  1735  cb               retf                                     

ovl28_1736:  ; ENTRY
  1736  55               push bp                                  
  1737  8bec             mov bp, sp                               
  1739  83ec02           sub sp, 2                                
  173c  56               push si                                  
  173d  57               push di                                  
  173e  8b5606           mov dx, word ptr [bp + 6]                
  1741  8bda             mov bx, dx                               
  1743  6bdb1d           imul bx, bx, 0x1d                        
  1746  b8042c           mov ax, 0x2c04                           
  1749  8ec0             mov es, ax                               
  174b  268bb7020d       mov si, word ptr es:[bx + 0xd02]         
  1750  8bda             mov bx, dx                               
  1752  6bdb1d           imul bx, bx, 0x1d                        
  1755  b8042c           mov ax, 0x2c04                           
  1758  8ec0             mov es, ax                               
  175a  268bbf040d       mov di, word ptr es:[bx + 0xd04]         
  175f  8bda             mov bx, dx                               
  1761  6bdb1d           imul bx, bx, 0x1d                        
  1764  b8042c           mov ax, 0x2c04                           
  1767  8ec0             mov es, ax                               
  1769  2680bfff0c01     cmp byte ptr es:[bx + 0xcff], 1          
  176f  7404             je 0x1775                                
  1771  33c0             xor ax, ax                               
  1773  eb62             jmp 0x17d7                               
  1775  57               push di                                  
  1776  56               push si                                  
  1777  9a7000f72f       lcall 0x2ff7, 0x70                       -> ovl29:16ae
  177c  83c404           add sp, 4                                
  177f  0bc0             or ax, ax                                
  1781  74ee             je 0x1771                                
  1783  8bdf             mov bx, di                               
  1785  69dbe000         imul bx, bx, 0xe0                        
  1789  8bc6             mov ax, si                               
  178b  d1e0             shl ax, 1                                
  178d  03d8             add bx, ax                               
  178f  b81d1e           mov ax, 0x1e1d                           
  1792  8ec0             mov es, ax                               
  1794  268a9f0000       mov bl, byte ptr es:[bx]                 
  1799  81e3ff00         and bx, 0xff                             
  179d  b8042c           mov ax, 0x2c04                           
  17a0  8ec0             mov es, ax                               
  17a2  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  17a8  752a             jne 0x17d4                               
  17aa  57               push di                                  
  17ab  56               push si                                  
  17ac  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  17b1  83c404           add sp, 4                                
  17b4  8946fe           mov word ptr [bp - 2], ax                
  17b7  8b5efe           mov bx, word ptr [bp - 2]                
  17ba  6bdb41           imul bx, bx, 0x41                        
  17bd  b8042c           mov ax, 0x2c04                           
  17c0  8ec0             mov es, ax                               
  17c2  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  17c7  98               cwde                                     
  17c8  ba042c           mov dx, 0x2c04                           
  17cb  8ec2             mov es, dx                               
  17cd  263b061001       cmp ax, word ptr es:[0x110]              
  17d2  759d             jne 0x1771                               
  17d4  b80100           mov ax, 1                                
  17d7  5f               pop di                                   
  17d8  5e               pop si                                   
  17d9  c9               leave                                    
  17da  cb               retf                                     

ovl28_17db:  ; ENTRY
  17db  55               push bp                                  
  17dc  8bec             mov bp, sp                               
  17de  81ecde00         sub sp, 0xde                             
  17e2  56               push si                                  
  17e3  57               push di                                  
  17e4  33ff             xor di, di                               
  17e6  eb2f             jmp 0x1817                               
  17e8  b000             mov al, 0                                
  17ea  8843d4           mov byte ptr [bp + di - 0x2c], al        
  17ed  8843dc           mov byte ptr [bp + di - 0x24], al        
  17f0  8843e4           mov byte ptr [bp + di - 0x1c], al        
  17f3  8843ec           mov byte ptr [bp + di - 0x14], al        
  17f6  8843f4           mov byte ptr [bp + di - 0xc], al         
  17f9  be1600           mov si, 0x16                             
  17fc  eb11             jmp 0x180f                               
  17fe  8bdf             mov bx, di                               
  1800  6bdb16           imul bx, bx, 0x16                        
  1803  03de             add bx, si                               
  1805  8d8622ff         lea ax, [bp - 0xde]                      
  1809  03d8             add bx, ax                               
  180b  36c607ff         mov byte ptr ss:[bx], 0xff               
  180f  8bc6             mov ax, si                               
  1811  4e               dec si                                   
  1812  0bc0             or ax, ax                                
  1814  75e8             jne 0x17fe                               
  1816  47               inc di                                   
  1817  83ff08           cmp di, 8                                
  181a  7ccc             jl 0x17e8                                
  181c  33ff             xor di, di                               
  181e  e99200           jmp 0x18b3                               
  1821  8bc7             mov ax, di                               
  1823  d1e0             shl ax, 1                                
  1825  c45e06           les bx, ptr [bp + 6]                     
  1828  03d8             add bx, ax                               
  182a  268b07           mov ax, word ptr es:[bx]                 
  182d  8946fe           mov word ptr [bp - 2], ax                
  1830  3dffff           cmp ax, 0xffff                           
  1833  747d             je 0x18b2                                
  1835  8b46fe           mov ax, word ptr [bp - 2]                
  1838  6bc016           imul ax, ax, 0x16                        
  183b  ba0000           mov dx, 0                                
  183e  03d0             add dx, ax                               
  1840  81c28088         add dx, 0x8880                           
  1844  681d1e           push 0x1e1d                              
  1847  52               push dx                                  
  1848  666a00           push 0                                   
  184b  6a02             push 2                                   
  184d  9a48009030       lcall 0x3090, 0x48                       -> ovl51:03d9
  1852  83c40a           add sp, 0xa                              
  1855  33f6             xor si, si                               
  1857  eb53             jmp 0x18ac                               
  1859  8bde             mov bx, si                               
  185b  d1e3             shl bx, 1                                
  185d  8a87fc4b         mov al, byte ptr [bx + 0x4bfc]           
  1861  8bdf             mov bx, di                               
  1863  6bdb16           imul bx, bx, 0x16                        
  1866  03de             add bx, si                               
  1868  8d9622ff         lea dx, [bp - 0xde]                      
  186c  03da             add bx, dx                               
  186e  368807           mov byte ptr ss:[bx], al                 
  1871  8bde             mov bx, si                               
  1873  d1e3             shl bx, 1                                
  1875  8b9ffc4b         mov bx, word ptr [bx + 0x4bfc]           
  1879  6bdb1d           imul bx, bx, 0x1d                        
  187c  b8042c           mov ax, 0x2c04                           
  187f  8ec0             mov es, ax                               
  1881  268a87fd0c       mov al, byte ptr es:[bx + 0xcfd]         
  1886  98               cwde                                     
  1887  48               dec ax                                   
  1888  8bd8             mov bx, ax                               
  188a  83fb07           cmp bx, 7                                
  188d  7719             ja 0x18a8                                
  188f  d1e3             shl bx, 1                                
  1891  2effa72d1a       jmp word ptr cs:[bx + 0x1a2d]            
ovl28_1896:  ; case
  1896  fe43ec           inc byte ptr [bp + di - 0x14]            
  1899  eb0d             jmp 0x18a8                               
ovl28_189b:  ; case
  189b  fe43dc           inc byte ptr [bp + di - 0x24]            
  189e  eb08             jmp 0x18a8                               
ovl28_18a0:  ; case
  18a0  fe43e4           inc byte ptr [bp + di - 0x1c]            
  18a3  eb03             jmp 0x18a8                               
ovl28_18a5:  ; case
  18a5  fe43d4           inc byte ptr [bp + di - 0x2c]            
ovl28_18a8:  ; case
  18a8  fe43f4           inc byte ptr [bp + di - 0xc]             
  18ab  46               inc si                                   
  18ac  3b362e48         cmp si, word ptr [0x482e]                
  18b0  7ca7             jl 0x1859                                
  18b2  47               inc di                                   
  18b3  83ff08           cmp di, 8                                
  18b6  7d03             jge 0x18bb                               
  18b8  e966ff           jmp 0x1821                               
  18bb  6a06             push 6                                   
  18bd  16               push ss                                  
  18be  8d8622ff         lea ax, [bp - 0xde]                      
  18c2  50               push ax                                  
  18c3  16               push ss                                  
  18c4  8d46e4           lea ax, [bp - 0x1c]                      
  18c7  50               push ax                                  
  18c8  66ff7606         push dword ptr [bp + 6]                  
  18cc  90               nop                                      
  18cd  0e               push cs                                  
  18ce  e86c01           call 0x1a3d                              
  18d1  83c40e           add sp, 0xe                              
  18d4  6a05             push 5                                   
  18d6  16               push ss                                  
  18d7  8d8622ff         lea ax, [bp - 0xde]                      
  18db  50               push ax                                  
  18dc  16               push ss                                  
  18dd  8d46dc           lea ax, [bp - 0x24]                      
  18e0  50               push ax                                  
  18e1  66ff7606         push dword ptr [bp + 6]                  
  18e5  90               nop                                      
  18e6  0e               push cs                                  
  18e7  e85301           call 0x1a3d                              
  18ea  83c40e           add sp, 0xe                              
  18ed  6a07             push 7                                   
  18ef  16               push ss                                  
  18f0  8d8622ff         lea ax, [bp - 0xde]                      
  18f4  50               push ax                                  
  18f5  16               push ss                                  
  18f6  8d46d4           lea ax, [bp - 0x2c]                      
  18f9  50               push ax                                  
  18fa  66ff7606         push dword ptr [bp + 6]                  
  18fe  90               nop                                      
  18ff  0e               push cs                                  
  1900  e83a01           call 0x1a3d                              
  1903  83c40e           add sp, 0xe                              
  1906  c746fc0000       mov word ptr [bp - 4], 0                 
  190b  e91201           jmp 0x1a20                               
  190e  c746fc0100       mov word ptr [bp - 4], 1                 
  1913  33ff             xor di, di                               
  1915  e90001           jmp 0x1a18                               
  1918  8bc7             mov ax, di                               
  191a  d1e0             shl ax, 1                                
  191c  c45e06           les bx, ptr [bp + 6]                     
  191f  03d8             add bx, ax                               
  1921  26833fff         cmp word ptr es:[bx], -1                 
  1925  7503             jne 0x192a                               
  1927  e9ed00           jmp 0x1a17                               
  192a  8a43ec           mov al, byte ptr [bp + di - 0x14]        
  192d  98               cwde                                     
  192e  0bc0             or ax, ax                                
  1930  7503             jne 0x1935                               
  1932  e9e200           jmp 0x1a17                               
  1935  8a43ec           mov al, byte ptr [bp + di - 0x14]        
  1938  98               cwde                                     
  1939  8bd0             mov dx, ax                               
  193b  c746d2ffff       mov word ptr [bp - 0x2e], 0xffff         
  1940  33f6             xor si, si                               
  1942  eb25             jmp 0x1969                               
  1944  3bfe             cmp di, si                               
  1946  7420             je 0x1968                                
  1948  8bc6             mov ax, si                               
  194a  d1e0             shl ax, 1                                
  194c  c45e06           les bx, ptr [bp + 6]                     
  194f  03d8             add bx, ax                               
  1951  26833fff         cmp word ptr es:[bx], -1                 
  1955  7411             je 0x1968                                
  1957  8a42ec           mov al, byte ptr [bp + si - 0x14]        
  195a  98               cwde                                     
  195b  3bc2             cmp ax, dx                               
  195d  7d09             jge 0x1968                               
  195f  8a42ec           mov al, byte ptr [bp + si - 0x14]        
  1962  98               cwde                                     
  1963  8bd0             mov dx, ax                               
  1965  8976d2           mov word ptr [bp - 0x2e], si             
  1968  46               inc si                                   
  1969  83fe08           cmp si, 8                                
  196c  7cd6             jl 0x1944                                
  196e  837ed2ff         cmp word ptr [bp - 0x2e], -1             
  1972  7503             jne 0x1977                               
  1974  e9a000           jmp 0x1a17                               
  1977  33d2             xor dx, dx                               
  1979  e99300           jmp 0x1a0f                               
  197c  8bdf             mov bx, di                               
  197e  6bdb16           imul bx, bx, 0x16                        
  1981  03da             add bx, dx                               
  1983  8d8622ff         lea ax, [bp - 0xde]                      
  1987  03d8             add bx, ax                               
  1989  368a07           mov al, byte ptr ss:[bx]                 
  198c  98               cwde                                     
  198d  8bc8             mov cx, ax                               
  198f  3dff00           cmp ax, 0xff                             
  1992  747a             je 0x1a0e                                
  1994  8bd9             mov bx, cx                               
  1996  6bdb1d           imul bx, bx, 0x1d                        
  1999  b8042c           mov ax, 0x2c04                           
  199c  8ec0             mov es, ax                               
  199e  2680bffd0c01     cmp byte ptr es:[bx + 0xcfd], 1          
  19a4  741e             je 0x19c4                                
  19a6  8bd9             mov bx, cx                               
  19a8  6bdb1d           imul bx, bx, 0x1d                        
  19ab  8ec0             mov es, ax                               
  19ad  2680bffd0c02     cmp byte ptr es:[bx + 0xcfd], 2          
  19b3  740f             je 0x19c4                                
  19b5  8bd9             mov bx, cx                               
  19b7  6bdb1d           imul bx, bx, 0x1d                        
  19ba  8ec0             mov es, ax                               
  19bc  2680bffd0c08     cmp byte ptr es:[bx + 0xcfd], 8          
  19c2  754a             jne 0x1a0e                               
  19c4  8bdf             mov bx, di                               
  19c6  6bdb16           imul bx, bx, 0x16                        
  19c9  03da             add bx, dx                               
  19cb  8d8622ff         lea ax, [bp - 0xde]                      
  19cf  03d8             add bx, ax                               
  19d1  36c607ff         mov byte ptr ss:[bx], 0xff               
  19d5  c746fc0000       mov word ptr [bp - 4], 0                 
  19da  c41eee40         les bx, ptr [0x40ee]                     
  19de  26ff474c         inc word ptr es:[bx + 0x4c]              
  19e2  8bd9             mov bx, cx                               
  19e4  6bdb1d           imul bx, bx, 0x1d                        
  19e7  b8042c           mov ax, 0x2c04                           
  19ea  8b56d2           mov dx, word ptr [bp - 0x2e]             
  19ed  d1e2             shl dx, 1                                
  19ef  c47606           les si, ptr [bp + 6]                     
  19f2  03f2             add si, dx                               
  19f4  268b14           mov dx, word ptr es:[si]                 
  19f7  8ec0             mov es, ax                               
  19f9  268997000d       mov word ptr es:[bx + 0xd00], dx         
  19fe  fe4bec           dec byte ptr [bp + di - 0x14]            
  1a01  8d46ec           lea ax, [bp - 0x14]                      
  1a04  8b5ed2           mov bx, word ptr [bp - 0x2e]             
  1a07  03d8             add bx, ax                               
  1a09  36fe07           inc byte ptr ss:[bx]                     
  1a0c  eb09             jmp 0x1a17                               
  1a0e  42               inc dx                                   
  1a0f  83fa16           cmp dx, 0x16                             
  1a12  7d03             jge 0x1a17                               
  1a14  e965ff           jmp 0x197c                               
  1a17  47               inc di                                   
  1a18  83ff08           cmp di, 8                                
  1a1b  7d03             jge 0x1a20                               
  1a1d  e9f8fe           jmp 0x1918                               
  1a20  837efc00         cmp word ptr [bp - 4], 0                 
  1a24  7503             jne 0x1a29                               
  1a26  e9e5fe           jmp 0x190e                               
  1a29  5f               pop di                                   
  1a2a  5e               pop si                                   
  1a2b  c9               leave                                    
  1a2c  cb               retf                                     
  1a2d  96189618a818a818 dw 1896,1896,18a8,18a8,189b,18a0,18a5,1896 jump table

ovl28_1a3d:  ; ENTRY
  1a3d  55               push bp                                  
  1a3e  8bec             mov bp, sp                               
  1a40  83ec04           sub sp, 4                                
  1a43  56               push si                                  
  1a44  57               push di                                  
  1a45  33ff             xor di, di                               
  1a47  e9df00           jmp 0x1b29                               
  1a4a  bf0100           mov di, 1                                
  1a4d  33c9             xor cx, cx                               
  1a4f  e9cf00           jmp 0x1b21                               
  1a52  8bc1             mov ax, cx                               
  1a54  d1e0             shl ax, 1                                
  1a56  c45e06           les bx, ptr [bp + 6]                     
  1a59  03d8             add bx, ax                               
  1a5b  26833fff         cmp word ptr es:[bx], -1                 
  1a5f  7503             jne 0x1a64                               
  1a61  e9bc00           jmp 0x1b20                               
  1a64  c45e0a           les bx, ptr [bp + 0xa]                   
  1a67  03d9             add bx, cx                               
  1a69  26803f02         cmp byte ptr es:[bx], 2                  
  1a6d  7d03             jge 0x1a72                               
  1a6f  e9ae00           jmp 0x1b20                               
  1a72  33f6             xor si, si                               
  1a74  e9a100           jmp 0x1b18                               
  1a77  3bce             cmp cx, si                               
  1a79  7503             jne 0x1a7e                               
  1a7b  e99900           jmp 0x1b17                               
  1a7e  8bc6             mov ax, si                               
  1a80  d1e0             shl ax, 1                                
  1a82  c45e06           les bx, ptr [bp + 6]                     
  1a85  03d8             add bx, ax                               
  1a87  268b07           mov ax, word ptr es:[bx]                 
  1a8a  8946fe           mov word ptr [bp - 2], ax                
  1a8d  3dffff           cmp ax, 0xffff                           
  1a90  7503             jne 0x1a95                               
  1a92  e98200           jmp 0x1b17                               
  1a95  c45e0a           les bx, ptr [bp + 0xa]                   
  1a98  03de             add bx, si                               
  1a9a  26803f00         cmp byte ptr es:[bx], 0                  
  1a9e  7577             jne 0x1b17                               
  1aa0  33d2             xor dx, dx                               
  1aa2  eb6e             jmp 0x1b12                               
  1aa4  8bc1             mov ax, cx                               
  1aa6  6bc016           imul ax, ax, 0x16                        
  1aa9  c45e0e           les bx, ptr [bp + 0xe]                   
  1aac  03d8             add bx, ax                               
  1aae  03da             add bx, dx                               
  1ab0  268a07           mov al, byte ptr es:[bx]                 
  1ab3  98               cwde                                     
  1ab4  8946fc           mov word ptr [bp - 4], ax                
  1ab7  3dff00           cmp ax, 0xff                             
  1aba  7455             je 0x1b11                                
  1abc  8b5efc           mov bx, word ptr [bp - 4]                
  1abf  6bdb1d           imul bx, bx, 0x1d                        
  1ac2  b8042c           mov ax, 0x2c04                           
  1ac5  8ec0             mov es, ax                               
  1ac7  268a87fd0c       mov al, byte ptr es:[bx + 0xcfd]         
  1acc  98               cwde                                     
  1acd  3b4612           cmp ax, word ptr [bp + 0x12]             
  1ad0  753f             jne 0x1b11                               
  1ad2  33ff             xor di, di                               
  1ad4  8bc1             mov ax, cx                               
  1ad6  6bc016           imul ax, ax, 0x16                        
  1ad9  c45e0e           les bx, ptr [bp + 0xe]                   
  1adc  03d8             add bx, ax                               
  1ade  03da             add bx, dx                               
  1ae0  26c607ff         mov byte ptr es:[bx], 0xff               
  1ae4  c41eee40         les bx, ptr [0x40ee]                     
  1ae8  26ff474c         inc word ptr es:[bx + 0x4c]              
  1aec  8b5efc           mov bx, word ptr [bp - 4]                
  1aef  6bdb1d           imul bx, bx, 0x1d                        
  1af2  b8042c           mov ax, 0x2c04                           
  1af5  8b56fe           mov dx, word ptr [bp - 2]                
  1af8  8ec0             mov es, ax                               
  1afa  268997000d       mov word ptr es:[bx + 0xd00], dx         
  1aff  c45e0a           les bx, ptr [bp + 0xa]                   
  1b02  03d9             add bx, cx                               
  1b04  26fe0f           dec byte ptr es:[bx]                     
  1b07  8b5e0a           mov bx, word ptr [bp + 0xa]              
  1b0a  03de             add bx, si                               
  1b0c  26fe07           inc byte ptr es:[bx]                     
  1b0f  eb06             jmp 0x1b17                               
  1b11  42               inc dx                                   
  1b12  83fa16           cmp dx, 0x16                             
  1b15  7c8d             jl 0x1aa4                                
  1b17  46               inc si                                   
  1b18  83fe08           cmp si, 8                                
  1b1b  7d03             jge 0x1b20                               
  1b1d  e957ff           jmp 0x1a77                               
  1b20  41               inc cx                                   
  1b21  83f908           cmp cx, 8                                
  1b24  7d03             jge 0x1b29                               
  1b26  e929ff           jmp 0x1a52                               
  1b29  0bff             or di, di                                
  1b2b  7503             jne 0x1b30                               
  1b2d  e91aff           jmp 0x1a4a                               
  1b30  5f               pop di                                   
  1b31  5e               pop si                                   
  1b32  c9               leave                                    
  1b33  cb               retf                                     
