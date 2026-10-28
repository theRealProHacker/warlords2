; ovl22 stub 2fcb file_off 0x4df10 size 0x1803

ovl22_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec04           sub sp, 4                                
  0006  56               push si                                  
  0007  b8042c           mov ax, 0x2c04                           
  000a  8ec0             mov es, ax                               
  000c  268b0e8101       mov cx, word ptr es:[0x181]              
  0011  eb61             jmp 0x74                                 
  0013  8bd9             mov bx, cx                               
  0015  6bdb16           imul bx, bx, 0x16                        
  0018  b81d1e           mov ax, 0x1e1d                           
  001b  8ec0             mov es, ax                               
  001d  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0022  ba042c           mov dx, 0x2c04                           
  0025  8ec2             mov es, dx                               
  0027  263a061001       cmp al, byte ptr es:[0x110]              
  002c  7546             jne 0x74                                 
  002e  8bd9             mov bx, cx                               
  0030  6bdb16           imul bx, bx, 0x16                        
  0033  b81d1e           mov ax, 0x1e1d                           
  0036  8ec0             mov es, ax                               
  0038  2683bf8088ff     cmp word ptr es:[bx - 0x7780], -1        
  003e  7434             je 0x74                                  
  0040  8bd9             mov bx, cx                               
  0042  6bdb16           imul bx, bx, 0x16                        
  0045  b81d1e           mov ax, 0x1e1d                           
  0048  8ec0             mov es, ax                               
  004a  2681a78c88fffd   and word ptr es:[bx - 0x7774], 0xfdff    
  0051  8bd9             mov bx, cx                               
  0053  6bdb16           imul bx, bx, 0x16                        
  0056  b81d1e           mov ax, 0x1e1d                           
  0059  8ec0             mov es, ax                               
  005b  2680bf878802     cmp byte ptr es:[bx - 0x7779], 2         
  0061  7d11             jge 0x74                                 
  0063  8bd9             mov bx, cx                               
  0065  6bdb16           imul bx, bx, 0x16                        
  0068  b81d1e           mov ax, 0x1e1d                           
  006b  8ec0             mov es, ax                               
  006d  26818f8c880002   or word ptr es:[bx - 0x7774], 0x200      
  0074  8bc1             mov ax, cx                               
  0076  49               dec cx                                   
  0077  0bc0             or ax, ax                                
  0079  7598             jne 0x13                                 
  007b  e9ee01           jmp 0x26c                                
  007e  c45efc           les bx, ptr [bp - 4]                     
  0081  26814f0c0002     or word ptr es:[bx + 0xc], 0x200         
  0087  26837f1200       cmp word ptr es:[bx + 0x12], 0           
  008c  7d03             jge 0x91                                 
  008e  e9db01           jmp 0x26c                                
  0091  26807f0702       cmp byte ptr es:[bx + 7], 2              
  0096  7d03             jge 0x9b                                 
  0098  e9d101           jmp 0x26c                                
  009b  66ff76fc         push dword ptr [bp - 4]                  
  009f  9a3e001931       lcall 0x3119, 0x3e                       -> ovl67:06eb
  00a4  83c404           add sp, 4                                
  00a7  c45efc           les bx, ptr [bp - 4]                     
  00aa  268a470e         mov al, byte ptr es:[bx + 0xe]           
  00ae  250f00           and ax, 0xf                              
  00b1  0bc0             or ax, ax                                
  00b3  7503             jne 0xb8                                 
  00b5  e9ac00           jmp 0x164                                
  00b8  268a470e         mov al, byte ptr es:[bx + 0xe]           
  00bc  250f00           and ax, 0xf                              
  00bf  3d0100           cmp ax, 1                                
  00c2  7518             jne 0xdc                                 
  00c4  268a470f         mov al, byte ptr es:[bx + 0xf]           
  00c8  d1e8             shr ax, 1                                
  00ca  257f00           and ax, 0x7f                             
  00cd  ba042c           mov dx, 0x2c04                           
  00d0  8ec2             mov es, dx                               
  00d2  263b067b15       cmp ax, word ptr es:[0x157b]             
  00d7  7203             jb 0xdc                                  
  00d9  e98800           jmp 0x164                                
  00dc  c45efc           les bx, ptr [bp - 4]                     
  00df  268a470e         mov al, byte ptr es:[bx + 0xe]           
  00e3  250f00           and ax, 0xf                              
  00e6  3d0100           cmp ax, 1                                
  00e9  7513             jne 0xfe                                 
  00eb  268a470f         mov al, byte ptr es:[bx + 0xf]           
  00ef  d1e8             shr ax, 1                                
  00f1  257f00           and ax, 0x7f                             
  00f4  c41eee40         les bx, ptr [0x40ee]                     
  00f8  263b4746         cmp ax, word ptr es:[bx + 0x46]          
  00fc  7466             je 0x164                                 
  00fe  c45efc           les bx, ptr [bp - 4]                     
  0101  268a470e         mov al, byte ptr es:[bx + 0xe]           
  0105  250f00           and ax, 0xf                              
  0108  3d0100           cmp ax, 1                                
  010b  7403             je 0x110                                 
  010d  e9b900           jmp 0x1c9                                
  0110  268a5f0f         mov bl, byte ptr es:[bx + 0xf]           
  0114  d1eb             shr bx, 1                                
  0116  83e37f           and bx, 0x7f                             
  0119  6bdb41           imul bx, bx, 0x41                        
  011c  b8042c           mov ax, 0x2c04                           
  011f  8ec0             mov es, ax                               
  0121  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0126  69dbe000         imul bx, bx, 0xe0                        
  012a  c476fc           les si, ptr [bp - 4]                     
  012d  53               push bx                                  
  012e  268a5c0f         mov bl, byte ptr es:[si + 0xf]           
  0132  d1eb             shr bx, 1                                
  0134  83e37f           and bx, 0x7f                             
  0137  6bdb41           imul bx, bx, 0x41                        
  013a  b8042c           mov ax, 0x2c04                           
  013d  8ec0             mov es, ax                               
  013f  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0144  d1e0             shl ax, 1                                
  0146  5b               pop bx                                   
  0147  03d8             add bx, ax                               
  0149  b81d1e           mov ax, 0x1e1d                           
  014c  8ec0             mov es, ax                               
  014e  268a9f0000       mov bl, byte ptr es:[bx]                 
  0153  81e3ff00         and bx, 0xff                             
  0157  b8042c           mov ax, 0x2c04                           
  015a  8ec0             mov es, ax                               
  015c  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0162  7465             je 0x1c9                                 
  0164  ba0800           mov dx, 8                                
  0167  eb56             jmp 0x1bf                                
  0169  8bda             mov bx, dx                               
  016b  c1e302           shl bx, 2                                
  016e  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  0172  0b87405e         or ax, word ptr [bx + 0x5e40]            
  0176  7447             je 0x1bf                                 
  0178  8bda             mov bx, dx                               
  017a  c1e302           shl bx, 2                                
  017d  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  0181  2680670ef0       and byte ptr es:[bx + 0xe], 0xf0         
  0186  8bda             mov bx, dx                               
  0188  c1e302           shl bx, 2                                
  018b  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  018f  2680670f01       and byte ptr es:[bx + 0xf], 1            
  0194  8bda             mov bx, dx                               
  0196  c1e302           shl bx, 2                                
  0199  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  019d  b8ffff           mov ax, 0xffff                           
  01a0  26894714         mov word ptr es:[bx + 0x14], ax          
  01a4  8bda             mov bx, dx                               
  01a6  c1e302           shl bx, 2                                
  01a9  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  01ad  26894712         mov word ptr es:[bx + 0x12], ax          
  01b1  8bda             mov bx, dx                               
  01b3  c1e302           shl bx, 2                                
  01b6  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  01ba  26834f0c40       or word ptr es:[bx + 0xc], 0x40          
  01bf  8bc2             mov ax, dx                               
  01c1  4a               dec dx                                   
  01c2  0bc0             or ax, ax                                
  01c4  75a3             jne 0x169                                
  01c6  e9a300           jmp 0x26c                                
  01c9  c45efc           les bx, ptr [bp - 4]                     
  01cc  26f7470c8000     test word ptr es:[bx + 0xc], 0x80        
  01d2  740c             je 0x1e0                                 
  01d4  90               nop                                      
  01d5  0e               push cs                                  
  01d6  e82604           call 0x5ff                               
  01d9  0bc0             or ax, ax                                
  01db  7503             jne 0x1e0                                
  01dd  e98c00           jmp 0x26c                                
  01e0  c45efc           les bx, ptr [bp - 4]                     
  01e3  268a470e         mov al, byte ptr es:[bx + 0xe]           
  01e7  250f00           and ax, 0xf                              
  01ea  3d0100           cmp ax, 1                                
  01ed  7567             jne 0x256                                
  01ef  268a5f0f         mov bl, byte ptr es:[bx + 0xf]           
  01f3  d1eb             shr bx, 1                                
  01f5  83e37f           and bx, 0x7f                             
  01f8  6bdb41           imul bx, bx, 0x41                        
  01fb  b8042c           mov ax, 0x2c04                           
  01fe  8ec0             mov es, ax                               
  0200  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0205  98               cwde                                     
  0206  ba042c           mov dx, 0x2c04                           
  0209  8ec2             mov es, dx                               
  020b  263b061001       cmp ax, word ptr es:[0x110]              
  0210  7544             jne 0x256                                
  0212  c45efc           les bx, ptr [bp - 4]                     
  0215  268a5f0f         mov bl, byte ptr es:[bx + 0xf]           
  0219  d1eb             shr bx, 1                                
  021b  83e37f           and bx, 0x7f                             
  021e  6bdb41           imul bx, bx, 0x41                        
  0221  b8042c           mov ax, 0x2c04                           
  0224  8ec0             mov es, ax                               
  0226  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  022b  40               inc ax                                   
  022c  c41e625e         les bx, ptr [0x5e62]                     
  0230  26894712         mov word ptr es:[bx + 0x12], ax          
  0234  c45efc           les bx, ptr [bp - 4]                     
  0237  268a5f0f         mov bl, byte ptr es:[bx + 0xf]           
  023b  d1eb             shr bx, 1                                
  023d  83e37f           and bx, 0x7f                             
  0240  6bdb41           imul bx, bx, 0x41                        
  0243  b8042c           mov ax, 0x2c04                           
  0246  8ec0             mov es, ax                               
  0248  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  024d  40               inc ax                                   
  024e  c41e625e         les bx, ptr [0x5e62]                     
  0252  26894714         mov word ptr es:[bx + 0x14], ax          
  0256  6a00             push 0                                   
  0258  c41e625e         les bx, ptr [0x5e62]                     
  025c  26ff7714         push word ptr es:[bx + 0x14]             
  0260  26ff7712         push word ptr es:[bx + 0x12]             
  0264  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  0269  83c406           add sp, 6                                
  026c  9a52001931       lcall 0x3119, 0x52                       -> ovl67:05c4
  0271  8956fe           mov word ptr [bp - 2], dx                
  0274  8946fc           mov word ptr [bp - 4], ax                
  0277  0bc2             or ax, dx                                
  0279  7403             je 0x27e                                 
  027b  e900fe           jmp 0x7e                                 
  027e  b80100           mov ax, 1                                
  0281  5e               pop si                                   
  0282  c9               leave                                    
  0283  cb               retf                                     

ovl22_0284:  ; ENTRY
  0284  55               push bp                                  
  0285  8bec             mov bp, sp                               
  0287  83ec02           sub sp, 2                                
  028a  56               push si                                  
  028b  57               push di                                  
  028c  c746fe0000       mov word ptr [bp - 2], 0                 
  0291  b8042c           mov ax, 0x2c04                           
  0294  8ec0             mov es, ax                               
  0296  268b0e7b15       mov cx, word ptr es:[0x157b]             
  029b  eb2e             jmp 0x2cb                                
  029d  8bd9             mov bx, cx                               
  029f  6bdb41           imul bx, bx, 0x41                        
  02a2  b8042c           mov ax, 0x2c04                           
  02a5  8ec0             mov es, ax                               
  02a7  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  02ac  98               cwde                                     
  02ad  ba042c           mov dx, 0x2c04                           
  02b0  8ec2             mov es, dx                               
  02b2  263b061001       cmp ax, word ptr es:[0x110]              
  02b7  7512             jne 0x2cb                                
  02b9  c41eee40         les bx, ptr [0x40ee]                     
  02bd  03d9             add bx, cx                               
  02bf  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  02c4  7505             jne 0x2cb                                
  02c6  c746fe0100       mov word ptr [bp - 2], 1                 
  02cb  8bc1             mov ax, cx                               
  02cd  49               dec cx                                   
  02ce  0bc0             or ax, ax                                
  02d0  75cb             jne 0x29d                                
  02d2  c41eee40         les bx, ptr [0x40ee]                     
  02d6  26c747220000     mov word ptr es:[bx + 0x22], 0           
  02dc  26c747240000     mov word ptr es:[bx + 0x24], 0           
  02e2  33ff             xor di, di                               
  02e4  e96501           jmp 0x44c                                
  02e7  b8042c           mov ax, 0x2c04                           
  02ea  8ec0             mov es, ax                               
  02ec  268b368101       mov si, word ptr es:[0x181]              
  02f1  e94d01           jmp 0x441                                
  02f4  8bde             mov bx, si                               
  02f6  6bdb16           imul bx, bx, 0x16                        
  02f9  b81d1e           mov ax, 0x1e1d                           
  02fc  8ec0             mov es, ax                               
  02fe  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0303  ba042c           mov dx, 0x2c04                           
  0306  8ec2             mov es, dx                               
  0308  263a061001       cmp al, byte ptr es:[0x110]              
  030d  7403             je 0x312                                 
  030f  e92f01           jmp 0x441                                
  0312  8bde             mov bx, si                               
  0314  6bdb16           imul bx, bx, 0x16                        
  0317  b81d1e           mov ax, 0x1e1d                           
  031a  8ec0             mov es, ax                               
  031c  2683bf8088ff     cmp word ptr es:[bx - 0x7780], -1        
  0322  7503             jne 0x327                                
  0324  e91a01           jmp 0x441                                
  0327  8bde             mov bx, si                               
  0329  6bdb16           imul bx, bx, 0x16                        
  032c  b81d1e           mov ax, 0x1e1d                           
  032f  8ec0             mov es, ax                               
  0331  26f7878c882000   test word ptr es:[bx - 0x7774], 0x20     
  0338  7503             jne 0x33d                                
  033a  e90401           jmp 0x441                                
  033d  8bde             mov bx, si                               
  033f  6bdb16           imul bx, bx, 0x16                        
  0342  b81d1e           mov ax, 0x1e1d                           
  0345  8ec0             mov es, ax                               
  0347  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  034d  7507             jne 0x356                                
  034f  0bff             or di, di                                
  0351  7403             je 0x356                                 
  0353  e9eb00           jmp 0x441                                
  0356  8bde             mov bx, si                               
  0358  6bdb16           imul bx, bx, 0x16                        
  035b  b81d1e           mov ax, 0x1e1d                           
  035e  8ec0             mov es, ax                               
  0360  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0366  7407             je 0x36f                                 
  0368  0bff             or di, di                                
  036a  7503             jne 0x36f                                
  036c  e9d200           jmp 0x441                                
  036f  8bde             mov bx, si                               
  0371  6bdb16           imul bx, bx, 0x16                        
  0374  b81d1e           mov ax, 0x1e1d                           
  0377  8ec0             mov es, ax                               
  0379  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  037f  7506             jne 0x387                                
  0381  837efe00         cmp word ptr [bp - 2], 0                 
  0385  7539             jne 0x3c0                                
  0387  8bde             mov bx, si                               
  0389  6bdb16           imul bx, bx, 0x16                        
  038c  b81d1e           mov ax, 0x1e1d                           
  038f  8ec0             mov es, ax                               
  0391  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0396  98               cwde                                     
  0397  6bc006           imul ax, ax, 6                           
  039a  8bd8             mov bx, ax                               
  039c  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  03a1  7449             je 0x3ec                                 
  03a3  c41eee40         les bx, ptr [0x40ee]                     
  03a7  26837f2407       cmp word ptr es:[bx + 0x24], 7           
  03ac  7e3e             jle 0x3ec                                
  03ae  8bde             mov bx, si                               
  03b0  6bdb16           imul bx, bx, 0x16                        
  03b3  b81d1e           mov ax, 0x1e1d                           
  03b6  8ec0             mov es, ax                               
  03b8  2680bf888804     cmp byte ptr es:[bx - 0x7778], 4         
  03be  7d2c             jge 0x3ec                                
  03c0  8bde             mov bx, si                               
  03c2  6bdb16           imul bx, bx, 0x16                        
  03c5  b81d1e           mov ax, 0x1e1d                           
  03c8  8ec0             mov es, ax                               
  03ca  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  03d0  8bde             mov bx, si                               
  03d2  6bdb16           imul bx, bx, 0x16                        
  03d5  8ec0             mov es, ax                               
  03d7  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  03dd  8bde             mov bx, si                               
  03df  6bdb16           imul bx, bx, 0x16                        
  03e2  8ec0             mov es, ax                               
  03e4  2683a78c88df     and word ptr es:[bx - 0x7774], 0xffdf    
  03ea  eb55             jmp 0x441                                
  03ec  6aff             push -1                                  
  03ee  56               push si                                  
  03ef  9a3900bd2f       lcall 0x2fbd, 0x39                       -> ovl20:0e4b
  03f4  83c404           add sp, 4                                
  03f7  8bde             mov bx, si                               
  03f9  6bdb16           imul bx, bx, 0x16                        
  03fc  b81d1e           mov ax, 0x1e1d                           
  03ff  8ec0             mov es, ax                               
  0401  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0406  98               cwde                                     
  0407  ba042c           mov dx, 0x2c04                           
  040a  8ec2             mov es, dx                               
  040c  263b061001       cmp ax, word ptr es:[0x110]              
  0411  752e             jne 0x441                                
  0413  8bde             mov bx, si                               
  0415  6bdb16           imul bx, bx, 0x16                        
  0418  b81d1e           mov ax, 0x1e1d                           
  041b  8ec0             mov es, ax                               
  041d  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0422  98               cwde                                     
  0423  6bc006           imul ax, ax, 6                           
  0426  8bd8             mov bx, ax                               
  0428  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  042d  740a             je 0x439                                 
  042f  c41eee40         les bx, ptr [0x40ee]                     
  0433  26ff4724         inc word ptr es:[bx + 0x24]              
  0437  eb08             jmp 0x441                                
  0439  c41eee40         les bx, ptr [0x40ee]                     
  043d  26ff4722         inc word ptr es:[bx + 0x22]              
  0441  8bc6             mov ax, si                               
  0443  4e               dec si                                   
  0444  0bc0             or ax, ax                                
  0446  7403             je 0x44b                                 
  0448  e9a9fe           jmp 0x2f4                                
  044b  47               inc di                                   
  044c  83ff02           cmp di, 2                                
  044f  7d03             jge 0x454                                
  0451  e993fe           jmp 0x2e7                                
  0454  5f               pop di                                   
  0455  5e               pop si                                   
  0456  c9               leave                                    
  0457  cb               retf                                     

ovl22_0458:  ; ENTRY
  0458  55               push bp                                  
  0459  8bec             mov bp, sp                               
  045b  83ec14           sub sp, 0x14                             
  045e  56               push si                                  
  045f  57               push di                                  
  0460  b8042c           mov ax, 0x2c04                           
  0463  8ec0             mov es, ax                               
  0465  268b368101       mov si, word ptr es:[0x181]              
  046a  e98401           jmp 0x5f1                                
  046d  8bde             mov bx, si                               
  046f  6bdb16           imul bx, bx, 0x16                        
  0472  b81d1e           mov ax, 0x1e1d                           
  0475  8ec0             mov es, ax                               
  0477  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  047c  ba042c           mov dx, 0x2c04                           
  047f  8ec2             mov es, dx                               
  0481  263a061001       cmp al, byte ptr es:[0x110]              
  0486  7403             je 0x48b                                 
  0488  e96601           jmp 0x5f1                                
  048b  8bde             mov bx, si                               
  048d  6bdb16           imul bx, bx, 0x16                        
  0490  b81d1e           mov ax, 0x1e1d                           
  0493  8ec0             mov es, ax                               
  0495  2683bf8088ff     cmp word ptr es:[bx - 0x7780], -1        
  049b  7503             jne 0x4a0                                
  049d  e95101           jmp 0x5f1                                
  04a0  8bde             mov bx, si                               
  04a2  6bdb16           imul bx, bx, 0x16                        
  04a5  b81d1e           mov ax, 0x1e1d                           
  04a8  8ec0             mov es, ax                               
  04aa  26f7878c880001   test word ptr es:[bx - 0x7774], 0x100    
  04b1  7503             jne 0x4b6                                
  04b3  e93b01           jmp 0x5f1                                
  04b6  8bde             mov bx, si                               
  04b8  6bdb16           imul bx, bx, 0x16                        
  04bb  b81d1e           mov ax, 0x1e1d                           
  04be  8ec0             mov es, ax                               
  04c0  2681a78c88fffe   and word ptr es:[bx - 0x7774], 0xfeff    
  04c7  8bde             mov bx, si                               
  04c9  6bdb16           imul bx, bx, 0x16                        
  04cc  b81d1e           mov ax, 0x1e1d                           
  04cf  8ec0             mov es, ax                               
  04d1  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  04d7  7403             je 0x4dc                                 
  04d9  e91501           jmp 0x5f1                                
  04dc  bf0100           mov di, 1                                
  04df  e90801           jmp 0x5ea                                
  04e2  6a00             push 0                                   
  04e4  8bde             mov bx, si                               
  04e6  6bdb16           imul bx, bx, 0x16                        
  04e9  b81d1e           mov ax, 0x1e1d                           
  04ec  8ec0             mov es, ax                               
  04ee  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  04f3  250f00           and ax, 0xf                              
  04f6  50               push ax                                  
  04f7  8bde             mov bx, si                               
  04f9  6bdb16           imul bx, bx, 0x16                        
  04fc  b81d1e           mov ax, 0x1e1d                           
  04ff  8ec0             mov es, ax                               
  0501  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0506  c1e804           shr ax, 4                                
  0509  250700           and ax, 7                                
  050c  50               push ax                                  
  050d  16               push ss                                  
  050e  8d46ec           lea ax, [bp - 0x14]                      
  0511  50               push ax                                  
  0512  8bde             mov bx, si                               
  0514  6bdb16           imul bx, bx, 0x16                        
  0517  b81d1e           mov ax, 0x1e1d                           
  051a  8ec0             mov es, ax                               
  051c  26ffb78288       push word ptr es:[bx - 0x777e]           
  0521  8bde             mov bx, si                               
  0523  6bdb16           imul bx, bx, 0x16                        
  0526  b81d1e           mov ax, 0x1e1d                           
  0529  8ec0             mov es, ax                               
  052b  26ffb78088       push word ptr es:[bx - 0x7780]           
  0530  9a5700f72f       lcall 0x2ff7, 0x57                       -> ovl29:13b2
  0535  83c40e           add sp, 0xe                              
  0538  0bc0             or ax, ax                                
  053a  7503             jne 0x53f                                
  053c  e9b200           jmp 0x5f1                                
  053f  8bde             mov bx, si                               
  0541  6bdb16           imul bx, bx, 0x16                        
  0544  b81d1e           mov ax, 0x1e1d                           
  0547  8ec0             mov es, ax                               
  0549  2680bf878803     cmp byte ptr es:[bx - 0x7779], 3         
  054f  7d03             jge 0x554                                
  0551  e99d00           jmp 0x5f1                                
  0554  8bde             mov bx, si                               
  0556  6bdb16           imul bx, bx, 0x16                        
  0559  b81d1e           mov ax, 0x1e1d                           
  055c  ba0000           mov dx, 0                                
  055f  81c28088         add dx, 0x8880                           
  0563  03da             add bx, dx                               
  0565  8ec0             mov es, ax                               
  0567  268b07           mov ax, word ptr es:[bx]                 
  056a  8946fe           mov word ptr [bp - 2], ax                
  056d  8bde             mov bx, si                               
  056f  6bdb16           imul bx, bx, 0x16                        
  0572  b81d1e           mov ax, 0x1e1d                           
  0575  8ec0             mov es, ax                               
  0577  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  057c  8946fc           mov word ptr [bp - 4], ax                
  057f  16               push ss                                  
  0580  8d46ec           lea ax, [bp - 0x14]                      
  0583  50               push ax                                  
  0584  90               nop                                      
  0585  0e               push cs                                  
  0586  e81d0c           call 0x11a6                              
  0589  83c404           add sp, 4                                
  058c  0bc0             or ax, ax                                
  058e  740c             je 0x59c                                 
  0590  3d0100           cmp ax, 1                                
  0593  7407             je 0x59c                                 
  0595  3d0200           cmp ax, 2                                
  0598  7408             je 0x5a2                                 
  059a  eb06             jmp 0x5a2                                
  059c  33ff             xor di, di                               
  059e  eb02             jmp 0x5a2                                
  05a0  ebfa             jmp 0x59c                                
  05a2  8bde             mov bx, si                               
  05a4  6bdb16           imul bx, bx, 0x16                        
  05a7  b81d1e           mov ax, 0x1e1d                           
  05aa  8ec0             mov es, ax                               
  05ac  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  05b1  3b46fe           cmp ax, word ptr [bp - 2]                
  05b4  7534             jne 0x5ea                                
  05b6  8bde             mov bx, si                               
  05b8  6bdb16           imul bx, bx, 0x16                        
  05bb  b81d1e           mov ax, 0x1e1d                           
  05be  8ec0             mov es, ax                               
  05c0  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  05c5  3b46fc           cmp ax, word ptr [bp - 4]                
  05c8  7520             jne 0x5ea                                
  05ca  8bde             mov bx, si                               
  05cc  6bdb16           imul bx, bx, 0x16                        
  05cf  b81d1e           mov ax, 0x1e1d                           
  05d2  8ec0             mov es, ax                               
  05d4  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  05d9  8bde             mov bx, si                               
  05db  6bdb16           imul bx, bx, 0x16                        
  05de  ba1d1e           mov dx, 0x1e1d                           
  05e1  8ec2             mov es, dx                               
  05e3  263a878688       cmp al, byte ptr es:[bx - 0x777a]        
  05e8  7c07             jl 0x5f1                                 
  05ea  0bff             or di, di                                
  05ec  7403             je 0x5f1                                 
  05ee  e9f1fe           jmp 0x4e2                                
  05f1  8bc6             mov ax, si                               
  05f3  4e               dec si                                   
  05f4  0bc0             or ax, ax                                
  05f6  7403             je 0x5fb                                 
  05f8  e972fe           jmp 0x46d                                
  05fb  5f               pop di                                   
  05fc  5e               pop si                                   
  05fd  c9               leave                                    
  05fe  cb               retf                                     

ovl22_05ff:  ; ENTRY
  05ff  55               push bp                                  
  0600  8bec             mov bp, sp                               
  0602  83ec18           sub sp, 0x18                             
  0605  56               push si                                  
  0606  57               push di                                  
  0607  c41e625e         les bx, ptr [0x5e62]                     
  060b  268a470f         mov al, byte ptr es:[bx + 0xf]           
  060f  d1e8             shr ax, 1                                
  0611  257f00           and ax, 0x7f                             
  0614  8bf0             mov si, ax                               
  0616  268b07           mov ax, word ptr es:[bx]                 
  0619  8946fa           mov word ptr [bp - 6], ax                
  061c  268b4702         mov ax, word ptr es:[bx + 2]             
  0620  8946f8           mov word ptr [bp - 8], ax                
  0623  c746f66400       mov word ptr [bp - 0xa], 0x64            
  0628  56               push si                                  
  0629  9a2500b12f       lcall 0x2fb1, 0x25                       -> ovl18:0851
  062e  59               pop cx                                   
  062f  8946f4           mov word ptr [bp - 0xc], ax              
  0632  ff76f8           push word ptr [bp - 8]                   
  0635  ff76fa           push word ptr [bp - 6]                   
  0638  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  063d  83c404           add sp, 4                                
  0640  8bc8             mov cx, ax                               
  0642  8bde             mov bx, si                               
  0644  6bdb41           imul bx, bx, 0x41                        
  0647  b8042c           mov ax, 0x2c04                           
  064a  8ec0             mov es, ax                               
  064c  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0651  98               cwde                                     
  0652  ba042c           mov dx, 0x2c04                           
  0655  8ec2             mov es, dx                               
  0657  263b061001       cmp ax, word ptr es:[0x110]              
  065c  7403             je 0x661                                 
  065e  e9c601           jmp 0x827                                
  0661  0bc9             or cx, cx                                
  0663  7c17             jl 0x67c                                 
  0665  16               push ss                                  
  0666  8d46e8           lea ax, [bp - 0x18]                      
  0669  50               push ax                                  
  066a  16               push ss                                  
  066b  8d46ee           lea ax, [bp - 0x12]                      
  066e  50               push ax                                  
  066f  51               push cx                                  
  0670  9a2000bd2f       lcall 0x2fbd, 0x20                       -> ovl20:01f6
  0675  83c40a           add sp, 0xa                              
  0678  0bc0             or ax, ax                                
  067a  7513             jne 0x68f                                
  067c  16               push ss                                  
  067d  8d46e8           lea ax, [bp - 0x18]                      
  0680  50               push ax                                  
  0681  16               push ss                                  
  0682  8d46ee           lea ax, [bp - 0x12]                      
  0685  50               push ax                                  
  0686  56               push si                                  
  0687  9a2000bd2f       lcall 0x2fbd, 0x20                       -> ovl20:01f6
  068c  83c40a           add sp, 0xa                              
  068f  c746feffff       mov word ptr [bp - 2], 0xffff            
  0694  c746fce803       mov word ptr [bp - 4], 0x3e8             
  0699  be0600           mov si, 6                                
  069c  e99200           jmp 0x731                                
  069f  8a42ee           mov al, byte ptr [bp + si - 0x12]        
  06a2  b400             mov ah, 0                                
  06a4  8bf8             mov di, ax                               
  06a6  3dff00           cmp ax, 0xff                             
  06a9  7503             jne 0x6ae                                
  06ab  e98300           jmp 0x731                                
  06ae  c41eee40         les bx, ptr [0x40ee]                     
  06b2  03df             add bx, di                               
  06b4  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  06ba  7575             jne 0x731                                
  06bc  b8042c           mov ax, 0x2c04                           
  06bf  8ec0             mov es, ax                               
  06c1  26833e1a0100     cmp word ptr es:[0x11a], 0               
  06c7  7429             je 0x6f2                                 
  06c9  8bdf             mov bx, di                               
  06cb  6bdb41           imul bx, bx, 0x41                        
  06ce  b8042c           mov ax, 0x2c04                           
  06d1  8ec0             mov es, ax                               
  06d3  26ffb77f15       push word ptr es:[bx + 0x157f]           
  06d8  8bdf             mov bx, di                               
  06da  6bdb41           imul bx, bx, 0x41                        
  06dd  b8042c           mov ax, 0x2c04                           
  06e0  8ec0             mov es, ax                               
  06e2  26ffb77d15       push word ptr es:[bx + 0x157d]           
  06e7  9a6100f72f       lcall 0x2ff7, 0x61                       -> ovl29:15c5
  06ec  83c404           add sp, 4                                
  06ef  8946f6           mov word ptr [bp - 0xa], ax              
  06f2  837ef64b         cmp word ptr [bp - 0xa], 0x4b            
  06f6  7c39             jl 0x731                                 
  06f8  8bdf             mov bx, di                               
  06fa  6bdb41           imul bx, bx, 0x41                        
  06fd  b8042c           mov ax, 0x2c04                           
  0700  8ec0             mov es, ax                               
  0702  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0707  8bdf             mov bx, di                               
  0709  6bdb41           imul bx, bx, 0x41                        
  070c  b8042c           mov ax, 0x2c04                           
  070f  8ec0             mov es, ax                               
  0711  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0716  ff76f8           push word ptr [bp - 8]                   
  0719  ff76fa           push word ptr [bp - 6]                   
  071c  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0721  83c408           add sp, 8                                
  0724  8bd0             mov dx, ax                               
  0726  3b56fc           cmp dx, word ptr [bp - 4]                
  0729  7d06             jge 0x731                                
  072b  8956fc           mov word ptr [bp - 4], dx                
  072e  897efe           mov word ptr [bp - 2], di                
  0731  8bc6             mov ax, si                               
  0733  4e               dec si                                   
  0734  0bc0             or ax, ax                                
  0736  7403             je 0x73b                                 
  0738  e964ff           jmp 0x69f                                
  073b  837efeff         cmp word ptr [bp - 2], -1                
  073f  7460             je 0x7a1                                 
  0741  33f6             xor si, si                               
  0743  eb54             jmp 0x799                                
  0745  8bde             mov bx, si                               
  0747  c1e302           shl bx, 2                                
  074a  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  074e  0b87405e         or ax, word ptr [bx + 0x5e40]            
  0752  7444             je 0x798                                 
  0754  8bde             mov bx, si                               
  0756  c1e302           shl bx, 2                                
  0759  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  075d  2680670ef0       and byte ptr es:[bx + 0xe], 0xf0         
  0762  26804f0e01       or byte ptr es:[bx + 0xe], 1             
  0767  8b46fe           mov ax, word ptr [bp - 2]                
  076a  257f00           and ax, 0x7f                             
  076d  8bde             mov bx, si                               
  076f  c1e302           shl bx, 2                                
  0772  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  0776  2680670f01       and byte ptr es:[bx + 0xf], 1            
  077b  d0e0             shl al, 1                                
  077d  2608470f         or byte ptr es:[bx + 0xf], al            
  0781  ff76fe           push word ptr [bp - 2]                   
  0784  6a01             push 1                                   
  0786  8bde             mov bx, si                               
  0788  c1e302           shl bx, 2                                
  078b  66ffb73e5e       push dword ptr [bx + 0x5e3e]             
  0790  9a2f00f72f       lcall 0x2ff7, 0x2f                       -> ovl29:0c7e
  0795  83c408           add sp, 8                                
  0798  46               inc si                                   
  0799  83fe08           cmp si, 8                                
  079c  7ca7             jl 0x745                                 
  079e  e9e000           jmp 0x881                                
  07a1  b8042c           mov ax, 0x2c04                           
  07a4  8ec0             mov es, ax                               
  07a6  26833e240100     cmp word ptr es:[0x124], 0               
  07ac  7503             jne 0x7b1                                
  07ae  e9d000           jmp 0x881                                
  07b1  9a8400d730       lcall 0x30d7, 0x84                       -> ovl61:225b
  07b6  3d0a00           cmp ax, 0xa                              
  07b9  7c03             jl 0x7be                                 
  07bb  e9c300           jmp 0x881                                
  07be  33f6             xor si, si                               
  07c0  eb5c             jmp 0x81e                                
  07c2  8bde             mov bx, si                               
  07c4  c1e302           shl bx, 2                                
  07c7  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  07cb  0b87405e         or ax, word ptr [bx + 0x5e40]            
  07cf  744c             je 0x81d                                 
  07d1  bfffff           mov di, 0xffff                           
  07d4  b8042c           mov ax, 0x2c04                           
  07d7  8ec0             mov es, ax                               
  07d9  268b0e8101       mov cx, word ptr es:[0x181]              
  07de  eb26             jmp 0x806                                
  07e0  8bc1             mov ax, cx                               
  07e2  6bc016           imul ax, ax, 0x16                        
  07e5  ba1d1e           mov dx, 0x1e1d                           
  07e8  bb0000           mov bx, 0                                
  07eb  81c38088         add bx, 0x8880                           
  07ef  03c3             add ax, bx                               
  07f1  8bde             mov bx, si                               
  07f3  c1e302           shl bx, 2                                
  07f6  3b97405e         cmp dx, word ptr [bx + 0x5e40]           
  07fa  750a             jne 0x806                                
  07fc  3b873e5e         cmp ax, word ptr [bx + 0x5e3e]           
  0800  7504             jne 0x806                                
  0802  8bf9             mov di, cx                               
  0804  eb07             jmp 0x80d                                
  0806  8bc1             mov ax, cx                               
  0808  49               dec cx                                   
  0809  0bc0             or ax, ax                                
  080b  75d3             jne 0x7e0                                
  080d  83ffff           cmp di, -1                               
  0810  740b             je 0x81d                                 
  0812  6aff             push -1                                  
  0814  57               push di                                  
  0815  9a3900bd2f       lcall 0x2fbd, 0x39                       -> ovl20:0e4b
  081a  83c404           add sp, 4                                
  081d  46               inc si                                   
  081e  83fe08           cmp si, 8                                
  0821  7c9f             jl 0x7c2                                 
  0823  33c0             xor ax, ax                               
  0825  eb5d             jmp 0x884                                
  0827  837ef400         cmp word ptr [bp - 0xc], 0               
  082b  7554             jne 0x881                                
  082d  33f6             xor si, si                               
  082f  eb49             jmp 0x87a                                
  0831  8bde             mov bx, si                               
  0833  c1e302           shl bx, 2                                
  0836  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  083a  0b87405e         or ax, word ptr [bx + 0x5e40]            
  083e  7439             je 0x879                                 
  0840  8bde             mov bx, si                               
  0842  c1e302           shl bx, 2                                
  0845  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  0849  2680670ef0       and byte ptr es:[bx + 0xe], 0xf0         
  084e  8bde             mov bx, si                               
  0850  c1e302           shl bx, 2                                
  0853  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  0857  2680670f01       and byte ptr es:[bx + 0xf], 1            
  085c  8bde             mov bx, si                               
  085e  c1e302           shl bx, 2                                
  0861  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  0865  b8ffff           mov ax, 0xffff                           
  0868  26894714         mov word ptr es:[bx + 0x14], ax          
  086c  8bde             mov bx, si                               
  086e  c1e302           shl bx, 2                                
  0871  8b9f3e5e         mov bx, word ptr [bx + 0x5e3e]           
  0875  26894712         mov word ptr es:[bx + 0x12], ax          
  0879  46               inc si                                   
  087a  83fe08           cmp si, 8                                
  087d  7cb2             jl 0x831                                 
  087f  eba2             jmp 0x823                                
  0881  b80100           mov ax, 1                                
  0884  5f               pop di                                   
  0885  5e               pop si                                   
  0886  c9               leave                                    
  0887  cb               retf                                     

ovl22_0888:  ; ENTRY
  0888  55               push bp                                  
  0889  8bec             mov bp, sp                               
  088b  83ec02           sub sp, 2                                
  088e  56               push si                                  
  088f  57               push di                                  
  0890  b8042c           mov ax, 0x2c04                           
  0893  8ec0             mov es, ax                               
  0895  268b3e8101       mov di, word ptr es:[0x181]              
  089a  e9a202           jmp 0xb3f                                
  089d  8bdf             mov bx, di                               
  089f  6bdb16           imul bx, bx, 0x16                        
  08a2  b81d1e           mov ax, 0x1e1d                           
  08a5  8ec0             mov es, ax                               
  08a7  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  08ac  ba042c           mov dx, 0x2c04                           
  08af  8ec2             mov es, dx                               
  08b1  263a061001       cmp al, byte ptr es:[0x110]              
  08b6  7403             je 0x8bb                                 
  08b8  e98402           jmp 0xb3f                                
  08bb  8bdf             mov bx, di                               
  08bd  6bdb16           imul bx, bx, 0x16                        
  08c0  b81d1e           mov ax, 0x1e1d                           
  08c3  8ec0             mov es, ax                               
  08c5  2683bf8088ff     cmp word ptr es:[bx - 0x7780], -1        
  08cb  7503             jne 0x8d0                                
  08cd  e96f02           jmp 0xb3f                                
  08d0  8bdf             mov bx, di                               
  08d2  6bdb16           imul bx, bx, 0x16                        
  08d5  b81d1e           mov ax, 0x1e1d                           
  08d8  8ec0             mov es, ax                               
  08da  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  08df  8bdf             mov bx, di                               
  08e1  6bdb16           imul bx, bx, 0x16                        
  08e4  ba1d1e           mov dx, 0x1e1d                           
  08e7  8ec2             mov es, dx                               
  08e9  263a878688       cmp al, byte ptr es:[bx - 0x777a]        
  08ee  7d03             jge 0x8f3                                
  08f0  e94c02           jmp 0xb3f                                
  08f3  8bdf             mov bx, di                               
  08f5  6bdb16           imul bx, bx, 0x16                        
  08f8  b81d1e           mov ax, 0x1e1d                           
  08fb  8ec0             mov es, ax                               
  08fd  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  0902  98               cwde                                     
  0903  8bdf             mov bx, di                               
  0905  6bdb16           imul bx, bx, 0x16                        
  0908  ba1d1e           mov dx, 0x1e1d                           
  090b  8ec2             mov es, dx                               
  090d  50               push ax                                  
  090e  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  0913  98               cwde                                     
  0914  050200           add ax, 2                                
  0917  5a               pop dx                                   
  0918  3bd0             cmp dx, ax                               
  091a  7403             je 0x91f                                 
  091c  e9a801           jmp 0xac7                                
  091f  8bdf             mov bx, di                               
  0921  6bdb16           imul bx, bx, 0x16                        
  0924  b81d1e           mov ax, 0x1e1d                           
  0927  ba0000           mov dx, 0                                
  092a  81c28088         add dx, 0x8880                           
  092e  03da             add bx, dx                               
  0930  8ec0             mov es, ax                               
  0932  268b07           mov ax, word ptr es:[bx]                 
  0935  d1e0             shl ax, 1                                
  0937  8bdf             mov bx, di                               
  0939  6bdb16           imul bx, bx, 0x16                        
  093c  ba1d1e           mov dx, 0x1e1d                           
  093f  8ec2             mov es, dx                               
  0941  268b9f8288       mov bx, word ptr es:[bx - 0x777e]        
  0946  69dbe000         imul bx, bx, 0xe0                        
  094a  03d8             add bx, ax                               
  094c  b81d1e           mov ax, 0x1e1d                           
  094f  8ec0             mov es, ax                               
  0951  268a9f0000       mov bl, byte ptr es:[bx]                 
  0956  81e3ff00         and bx, 0xff                             
  095a  b8042c           mov ax, 0x2c04                           
  095d  8ec0             mov es, ax                               
  095f  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0965  7503             jne 0x96a                                
  0967  e95d01           jmp 0xac7                                
  096a  8bdf             mov bx, di                               
  096c  6bdb16           imul bx, bx, 0x16                        
  096f  b81d1e           mov ax, 0x1e1d                           
  0972  8ec0             mov es, ax                               
  0974  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0979  250f00           and ax, 0xf                              
  097c  3d0100           cmp ax, 1                                
  097f  7403             je 0x984                                 
  0981  e94301           jmp 0xac7                                
  0984  8bdf             mov bx, di                               
  0986  6bdb16           imul bx, bx, 0x16                        
  0989  b81d1e           mov ax, 0x1e1d                           
  098c  8ec0             mov es, ax                               
  098e  268a9f8f88       mov bl, byte ptr es:[bx - 0x7771]        
  0993  d1eb             shr bx, 1                                
  0995  83e37f           and bx, 0x7f                             
  0998  6bdb41           imul bx, bx, 0x41                        
  099b  b8042c           mov ax, 0x2c04                           
  099e  8ec0             mov es, ax                               
  09a0  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  09a5  69dbe000         imul bx, bx, 0xe0                        
  09a9  8bf7             mov si, di                               
  09ab  6bf616           imul si, si, 0x16                        
  09ae  b81d1e           mov ax, 0x1e1d                           
  09b1  8ec0             mov es, ax                               
  09b3  53               push bx                                  
  09b4  268a9c8f88       mov bl, byte ptr es:[si - 0x7771]        
  09b9  d1eb             shr bx, 1                                
  09bb  83e37f           and bx, 0x7f                             
  09be  6bdb41           imul bx, bx, 0x41                        
  09c1  b8042c           mov ax, 0x2c04                           
  09c4  8ec0             mov es, ax                               
  09c6  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  09cb  d1e0             shl ax, 1                                
  09cd  5b               pop bx                                   
  09ce  03d8             add bx, ax                               
  09d0  b81d1e           mov ax, 0x1e1d                           
  09d3  8ec0             mov es, ax                               
  09d5  268a9f0000       mov bl, byte ptr es:[bx]                 
  09da  81e3ff00         and bx, 0xff                             
  09de  b8042c           mov ax, 0x2c04                           
  09e1  8ec0             mov es, ax                               
  09e3  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  09e9  7503             jne 0x9ee                                
  09eb  e9d900           jmp 0xac7                                
  09ee  8bdf             mov bx, di                               
  09f0  6bdb16           imul bx, bx, 0x16                        
  09f3  b81d1e           mov ax, 0x1e1d                           
  09f6  8ec0             mov es, ax                               
  09f8  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  09fd  d1e8             shr ax, 1                                
  09ff  257f00           and ax, 0x7f                             
  0a02  8946fe           mov word ptr [bp - 2], ax                
  0a05  b8042c           mov ax, 0x2c04                           
  0a08  8ec0             mov es, ax                               
  0a0a  268b0e8101       mov cx, word ptr es:[0x181]              
  0a0f  e9ab00           jmp 0xabd                                
  0a12  8bd9             mov bx, cx                               
  0a14  6bdb16           imul bx, bx, 0x16                        
  0a17  b81d1e           mov ax, 0x1e1d                           
  0a1a  8ec0             mov es, ax                               
  0a1c  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0a21  ba042c           mov dx, 0x2c04                           
  0a24  8ec2             mov es, dx                               
  0a26  263a061001       cmp al, byte ptr es:[0x110]              
  0a2b  7403             je 0xa30                                 
  0a2d  e98d00           jmp 0xabd                                
  0a30  8bd9             mov bx, cx                               
  0a32  6bdb16           imul bx, bx, 0x16                        
  0a35  b81d1e           mov ax, 0x1e1d                           
  0a38  8ec0             mov es, ax                               
  0a3a  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  0a3f  8bdf             mov bx, di                               
  0a41  6bdb16           imul bx, bx, 0x16                        
  0a44  ba1d1e           mov dx, 0x1e1d                           
  0a47  8ec2             mov es, dx                               
  0a49  263b878088       cmp ax, word ptr es:[bx - 0x7780]        
  0a4e  756d             jne 0xabd                                
  0a50  8bd9             mov bx, cx                               
  0a52  6bdb16           imul bx, bx, 0x16                        
  0a55  b81d1e           mov ax, 0x1e1d                           
  0a58  8ec0             mov es, ax                               
  0a5a  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0a5f  8bdf             mov bx, di                               
  0a61  6bdb16           imul bx, bx, 0x16                        
  0a64  ba1d1e           mov dx, 0x1e1d                           
  0a67  8ec2             mov es, dx                               
  0a69  263b878288       cmp ax, word ptr es:[bx - 0x777e]        
  0a6e  754d             jne 0xabd                                
  0a70  8bd9             mov bx, cx                               
  0a72  6bdb16           imul bx, bx, 0x16                        
  0a75  b81d1e           mov ax, 0x1e1d                           
  0a78  8ec0             mov es, ax                               
  0a7a  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0a7f  250f00           and ax, 0xf                              
  0a82  3d0100           cmp ax, 1                                
  0a85  7536             jne 0xabd                                
  0a87  8bd9             mov bx, cx                               
  0a89  6bdb16           imul bx, bx, 0x16                        
  0a8c  b81d1e           mov ax, 0x1e1d                           
  0a8f  8ec0             mov es, ax                               
  0a91  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  0a96  d1e8             shr ax, 1                                
  0a98  257f00           and ax, 0x7f                             
  0a9b  3b46fe           cmp ax, word ptr [bp - 2]                
  0a9e  751d             jne 0xabd                                
  0aa0  8bd9             mov bx, cx                               
  0aa2  6bdb16           imul bx, bx, 0x16                        
  0aa5  b81d1e           mov ax, 0x1e1d                           
  0aa8  8ec0             mov es, ax                               
  0aaa  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  0ab0  8bd9             mov bx, cx                               
  0ab2  6bdb16           imul bx, bx, 0x16                        
  0ab5  8ec0             mov es, ax                               
  0ab7  2680a78e888f     and byte ptr es:[bx - 0x7772], 0x8f      
  0abd  8bc1             mov ax, cx                               
  0abf  49               dec cx                                   
  0ac0  0bc0             or ax, ax                                
  0ac2  7403             je 0xac7                                 
  0ac4  e94bff           jmp 0xa12                                
  0ac7  8bdf             mov bx, di                               
  0ac9  6bdb16           imul bx, bx, 0x16                        
  0acc  b81d1e           mov ax, 0x1e1d                           
  0acf  8ec0             mov es, ax                               
  0ad1  26f7878c882000   test word ptr es:[bx - 0x7774], 0x20     
  0ad8  7565             jne 0xb3f                                
  0ada  8bdf             mov bx, di                               
  0adc  6bdb16           imul bx, bx, 0x16                        
  0adf  b81d1e           mov ax, 0x1e1d                           
  0ae2  8ec0             mov es, ax                               
  0ae4  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0ae9  250f00           and ax, 0xf                              
  0aec  0bc0             or ax, ax                                
  0aee  754f             jne 0xb3f                                
  0af0  8bdf             mov bx, di                               
  0af2  6bdb16           imul bx, bx, 0x16                        
  0af5  b81d1e           mov ax, 0x1e1d                           
  0af8  ba0000           mov dx, 0                                
  0afb  81c28088         add dx, 0x8880                           
  0aff  03da             add bx, dx                               
  0b01  8ec0             mov es, ax                               
  0b03  268b07           mov ax, word ptr es:[bx]                 
  0b06  d1e0             shl ax, 1                                
  0b08  8bdf             mov bx, di                               
  0b0a  6bdb16           imul bx, bx, 0x16                        
  0b0d  ba1d1e           mov dx, 0x1e1d                           
  0b10  8ec2             mov es, dx                               
  0b12  268b9f8288       mov bx, word ptr es:[bx - 0x777e]        
  0b17  69dbe000         imul bx, bx, 0xe0                        
  0b1b  03d8             add bx, ax                               
  0b1d  b81d1e           mov ax, 0x1e1d                           
  0b20  8ec0             mov es, ax                               
  0b22  268a9f0000       mov bl, byte ptr es:[bx]                 
  0b27  81e3ff00         and bx, 0xff                             
  0b2b  b8042c           mov ax, 0x2c04                           
  0b2e  8ec0             mov es, ax                               
  0b30  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0b36  7407             je 0xb3f                                 
  0b38  57               push di                                  
  0b39  90               nop                                      
  0b3a  0e               push cs                                  
  0b3b  e81d01           call 0xc5b                               
  0b3e  59               pop cx                                   
  0b3f  8bc7             mov ax, di                               
  0b41  4f               dec di                                   
  0b42  0bc0             or ax, ax                                
  0b44  7403             je 0xb49                                 
  0b46  e954fd           jmp 0x89d                                
  0b49  5f               pop di                                   
  0b4a  5e               pop si                                   
  0b4b  c9               leave                                    
  0b4c  cb               retf                                     

ovl22_0b4d:  ; ENTRY
  0b4d  55               push bp                                  
  0b4e  8bec             mov bp, sp                               
  0b50  56               push si                                  
  0b51  b8042c           mov ax, 0x2c04                           
  0b54  8ec0             mov es, ax                               
  0b56  268b368101       mov si, word ptr es:[0x181]              
  0b5b  e9f000           jmp 0xc4e                                
  0b5e  8bde             mov bx, si                               
  0b60  6bdb16           imul bx, bx, 0x16                        
  0b63  b81d1e           mov ax, 0x1e1d                           
  0b66  8ec0             mov es, ax                               
  0b68  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0b6d  98               cwde                                     
  0b6e  ba042c           mov dx, 0x2c04                           
  0b71  8ec2             mov es, dx                               
  0b73  263b061001       cmp ax, word ptr es:[0x110]              
  0b78  7403             je 0xb7d                                 
  0b7a  e9d100           jmp 0xc4e                                
  0b7d  8bde             mov bx, si                               
  0b7f  6bdb16           imul bx, bx, 0x16                        
  0b82  b81d1e           mov ax, 0x1e1d                           
  0b85  8ec0             mov es, ax                               
  0b87  2683bf8088ff     cmp word ptr es:[bx - 0x7780], -1        
  0b8d  7503             jne 0xb92                                
  0b8f  e9bc00           jmp 0xc4e                                
  0b92  8bde             mov bx, si                               
  0b94  6bdb16           imul bx, bx, 0x16                        
  0b97  b81d1e           mov ax, 0x1e1d                           
  0b9a  8ec0             mov es, ax                               
  0b9c  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  0ba1  98               cwde                                     
  0ba2  8bde             mov bx, si                               
  0ba4  6bdb16           imul bx, bx, 0x16                        
  0ba7  ba1d1e           mov dx, 0x1e1d                           
  0baa  8ec2             mov es, dx                               
  0bac  50               push ax                                  
  0bad  268a878688       mov al, byte ptr es:[bx - 0x777a]        
  0bb2  98               cwde                                     
  0bb3  050200           add ax, 2                                
  0bb6  5a               pop dx                                   
  0bb7  3bd0             cmp dx, ax                               
  0bb9  7403             je 0xbbe                                 
  0bbb  e99000           jmp 0xc4e                                
  0bbe  8bde             mov bx, si                               
  0bc0  6bdb16           imul bx, bx, 0x16                        
  0bc3  b81d1e           mov ax, 0x1e1d                           
  0bc6  ba0000           mov dx, 0                                
  0bc9  81c28088         add dx, 0x8880                           
  0bcd  03da             add bx, dx                               
  0bcf  8ec0             mov es, ax                               
  0bd1  268b07           mov ax, word ptr es:[bx]                 
  0bd4  d1e0             shl ax, 1                                
  0bd6  8bde             mov bx, si                               
  0bd8  6bdb16           imul bx, bx, 0x16                        
  0bdb  ba1d1e           mov dx, 0x1e1d                           
  0bde  8ec2             mov es, dx                               
  0be0  268b9f8288       mov bx, word ptr es:[bx - 0x777e]        
  0be5  69dbe000         imul bx, bx, 0xe0                        
  0be9  03d8             add bx, ax                               
  0beb  b81d1e           mov ax, 0x1e1d                           
  0bee  8ec0             mov es, ax                               
  0bf0  268a9f0000       mov bl, byte ptr es:[bx]                 
  0bf5  81e3ff00         and bx, 0xff                             
  0bf9  b8042c           mov ax, 0x2c04                           
  0bfc  8ec0             mov es, ax                               
  0bfe  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0c04  7448             je 0xc4e                                 
  0c06  8bde             mov bx, si                               
  0c08  6bdb16           imul bx, bx, 0x16                        
  0c0b  b81d1e           mov ax, 0x1e1d                           
  0c0e  8ec0             mov es, ax                               
  0c10  2681a78c885fff   and word ptr es:[bx - 0x7774], 0xff5f    
  0c17  8bde             mov bx, si                               
  0c19  6bdb16           imul bx, bx, 0x16                        
  0c1c  8ec0             mov es, ax                               
  0c1e  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  0c24  8bde             mov bx, si                               
  0c26  6bdb16           imul bx, bx, 0x16                        
  0c29  b81d1e           mov ax, 0x1e1d                           
  0c2c  baffff           mov dx, 0xffff                           
  0c2f  8ec0             mov es, ax                               
  0c31  2689979488       mov word ptr es:[bx - 0x776c], dx        
  0c36  8bc2             mov ax, dx                               
  0c38  8bde             mov bx, si                               
  0c3a  6bdb16           imul bx, bx, 0x16                        
  0c3d  ba1d1e           mov dx, 0x1e1d                           
  0c40  8ec2             mov es, dx                               
  0c42  2689879288       mov word ptr es:[bx - 0x776e], ax        
  0c47  56               push si                                  
  0c48  90               nop                                      
  0c49  0e               push cs                                  
  0c4a  e80e00           call 0xc5b                               
  0c4d  59               pop cx                                   
  0c4e  8bc6             mov ax, si                               
  0c50  4e               dec si                                   
  0c51  0bc0             or ax, ax                                
  0c53  7403             je 0xc58                                 
  0c55  e906ff           jmp 0xb5e                                
  0c58  5e               pop si                                   
  0c59  5d               pop bp                                   
  0c5a  cb               retf                                     

ovl22_0c5b:  ; ENTRY
  0c5b  55               push bp                                  
  0c5c  8bec             mov bp, sp                               
  0c5e  83ec1c           sub sp, 0x1c                             
  0c61  56               push si                                  
  0c62  57               push di                                  
  0c63  8b7606           mov si, word ptr [bp + 6]                
  0c66  33ff             xor di, di                               
  0c68  b8042c           mov ax, 0x2c04                           
  0c6b  8ec0             mov es, ax                               
  0c6d  26ff361001       push word ptr es:[0x110]                 
  0c72  8bde             mov bx, si                               
  0c74  6bdb16           imul bx, bx, 0x16                        
  0c77  b81d1e           mov ax, 0x1e1d                           
  0c7a  8ec0             mov es, ax                               
  0c7c  26ffb78288       push word ptr es:[bx - 0x777e]           
  0c81  8bde             mov bx, si                               
  0c83  6bdb16           imul bx, bx, 0x16                        
  0c86  b81d1e           mov ax, 0x1e1d                           
  0c89  ba0000           mov dx, 0                                
  0c8c  81c28088         add dx, 0x8880                           
  0c90  03da             add bx, dx                               
  0c92  8ec0             mov es, ax                               
  0c94  26ff37           push word ptr es:[bx]                    
  0c97  9a2f00bd2f       lcall 0x2fbd, 0x2f                       -> ovl20:0981
  0c9c  83c406           add sp, 6                                
  0c9f  8946f6           mov word ptr [bp - 0xa], ax              
  0ca2  8bde             mov bx, si                               
  0ca4  6bdb16           imul bx, bx, 0x16                        
  0ca7  b81d1e           mov ax, 0x1e1d                           
  0caa  8ec0             mov es, ax                               
  0cac  2680bf888803     cmp byte ptr es:[bx - 0x7778], 3         
  0cb2  7c12             jl 0xcc6                                 
  0cb4  8bde             mov bx, si                               
  0cb6  6bdb16           imul bx, bx, 0x16                        
  0cb9  b81d1e           mov ax, 0x1e1d                           
  0cbc  8ec0             mov es, ax                               
  0cbe  2680bf868808     cmp byte ptr es:[bx - 0x777a], 8         
  0cc4  7d03             jge 0xcc9                                
  0cc6  bf0100           mov di, 1                                
  0cc9  8bde             mov bx, si                               
  0ccb  6bdb16           imul bx, bx, 0x16                        
  0cce  b81d1e           mov ax, 0x1e1d                           
  0cd1  8ec0             mov es, ax                               
  0cd3  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0cd8  98               cwde                                     
  0cd9  6bc006           imul ax, ax, 6                           
  0cdc  8bd8             mov bx, ax                               
  0cde  8a87c445         mov al, byte ptr [bx + 0x45c4]           
  0ce2  98               cwde                                     
  0ce3  0bc0             or ax, ax                                
  0ce5  7512             jne 0xcf9                                
  0ce7  0bff             or di, di                                
  0ce9  740e             je 0xcf9                                 
  0ceb  6a01             push 1                                   
  0ced  56               push si                                  
  0cee  9a2a00d62f       lcall 0x2fd6, 0x2a                       -> ovl24:015e
  0cf3  83c404           add sp, 4                                
  0cf6  e93f02           jmp 0xf38                                
  0cf9  6a08             push 8                                   
  0cfb  16               push ss                                  
  0cfc  8d46e4           lea ax, [bp - 0x1c]                      
  0cff  50               push ax                                  
  0d00  8bde             mov bx, si                               
  0d02  6bdb16           imul bx, bx, 0x16                        
  0d05  b81d1e           mov ax, 0x1e1d                           
  0d08  8ec0             mov es, ax                               
  0d0a  26ffb78288       push word ptr es:[bx - 0x777e]           
  0d0f  8bde             mov bx, si                               
  0d11  6bdb16           imul bx, bx, 0x16                        
  0d14  b81d1e           mov ax, 0x1e1d                           
  0d17  ba0000           mov dx, 0                                
  0d1a  81c28088         add dx, 0x8880                           
  0d1e  03da             add bx, dx                               
  0d20  8ec0             mov es, ax                               
  0d22  26ff37           push word ptr es:[bx]                    
  0d25  9a5200f72f       lcall 0x2ff7, 0x52                       -> ovl29:12c9
  0d2a  83c40a           add sp, 0xa                              
  0d2d  8946fe           mov word ptr [bp - 2], ax                
  0d30  0bc0             or ax, ax                                
  0d32  7503             jne 0xd37                                
  0d34  e90102           jmp 0xf38                                
  0d37  33c9             xor cx, cx                               
  0d39  ba0800           mov dx, 8                                
  0d3c  eb38             jmp 0xd76                                
  0d3e  8bda             mov bx, dx                               
  0d40  d1e3             shl bx, 1                                
  0d42  8d46e4           lea ax, [bp - 0x1c]                      
  0d45  03d8             add bx, ax                               
  0d47  368b07           mov ax, word ptr ss:[bx]                 
  0d4a  8946f4           mov word ptr [bp - 0xc], ax              
  0d4d  3dffff           cmp ax, 0xffff                           
  0d50  7424             je 0xd76                                 
  0d52  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0d55  6bdb16           imul bx, bx, 0x16                        
  0d58  b81d1e           mov ax, 0x1e1d                           
  0d5b  8ec0             mov es, ax                               
  0d5d  2680bf878808     cmp byte ptr es:[bx - 0x7779], 8         
  0d63  7d11             jge 0xd76                                
  0d65  8bda             mov bx, dx                               
  0d67  d1e3             shl bx, 1                                
  0d69  8d46e4           lea ax, [bp - 0x1c]                      
  0d6c  03d8             add bx, ax                               
  0d6e  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0d73  b90100           mov cx, 1                                
  0d76  8bc2             mov ax, dx                               
  0d78  4a               dec dx                                   
  0d79  0bc0             or ax, ax                                
  0d7b  75c1             jne 0xd3e                                
  0d7d  33c0             xor ax, ax                               
  0d7f  8946f8           mov word ptr [bp - 8], ax                
  0d82  8946fa           mov word ptr [bp - 6], ax                
  0d85  8946fc           mov word ptr [bp - 4], ax                
  0d88  ba0800           mov dx, 8                                
  0d8b  eb51             jmp 0xdde                                
  0d8d  8bda             mov bx, dx                               
  0d8f  d1e3             shl bx, 1                                
  0d91  8d46e4           lea ax, [bp - 0x1c]                      
  0d94  03d8             add bx, ax                               
  0d96  368b07           mov ax, word ptr ss:[bx]                 
  0d99  8946f4           mov word ptr [bp - 0xc], ax              
  0d9c  3dffff           cmp ax, 0xffff                           
  0d9f  743d             je 0xdde                                 
  0da1  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0da4  6bdb16           imul bx, bx, 0x16                        
  0da7  b81d1e           mov ax, 0x1e1d                           
  0daa  8ec0             mov es, ax                               
  0dac  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0db1  98               cwde                                     
  0db2  6bc006           imul ax, ax, 6                           
  0db5  8bd8             mov bx, ax                               
  0db7  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0dbc  7405             je 0xdc3                                 
  0dbe  ff46fc           inc word ptr [bp - 4]                    
  0dc1  eb1b             jmp 0xdde                                
  0dc3  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0dc6  6bdb16           imul bx, bx, 0x16                        
  0dc9  b81d1e           mov ax, 0x1e1d                           
  0dcc  8ec0             mov es, ax                               
  0dce  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0dd4  7505             jne 0xddb                                
  0dd6  ff46fa           inc word ptr [bp - 6]                    
  0dd9  eb03             jmp 0xdde                                
  0ddb  ff46f8           inc word ptr [bp - 8]                    
  0dde  8bc2             mov ax, dx                               
  0de0  4a               dec dx                                   
  0de1  0bc0             or ax, ax                                
  0de3  75a8             jne 0xd8d                                
  0de5  837efc00         cmp word ptr [bp - 4], 0                 
  0de9  746d             je 0xe58                                 
  0deb  837efa00         cmp word ptr [bp - 6], 0                 
  0def  7467             je 0xe58                                 
  0df1  837ef800         cmp word ptr [bp - 8], 0                 
  0df5  7461             je 0xe58                                 
  0df7  ba0800           mov dx, 8                                
  0dfa  eb55             jmp 0xe51                                
  0dfc  8bda             mov bx, dx                               
  0dfe  d1e3             shl bx, 1                                
  0e00  8d46e4           lea ax, [bp - 0x1c]                      
  0e03  03d8             add bx, ax                               
  0e05  368b07           mov ax, word ptr ss:[bx]                 
  0e08  8946f4           mov word ptr [bp - 0xc], ax              
  0e0b  3dffff           cmp ax, 0xffff                           
  0e0e  7441             je 0xe51                                 
  0e10  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0e13  6bdb16           imul bx, bx, 0x16                        
  0e16  b81d1e           mov ax, 0x1e1d                           
  0e19  8ec0             mov es, ax                               
  0e1b  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  0e20  98               cwde                                     
  0e21  6bc006           imul ax, ax, 6                           
  0e24  8bd8             mov bx, ax                               
  0e26  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0e2b  7524             jne 0xe51                                
  0e2d  8b5ef4           mov bx, word ptr [bp - 0xc]              
  0e30  6bdb16           imul bx, bx, 0x16                        
  0e33  b81d1e           mov ax, 0x1e1d                           
  0e36  8ec0             mov es, ax                               
  0e38  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0e3e  7411             je 0xe51                                 
  0e40  8bda             mov bx, dx                               
  0e42  d1e3             shl bx, 1                                
  0e44  8d46e4           lea ax, [bp - 0x1c]                      
  0e47  03d8             add bx, ax                               
  0e49  36c707ffff       mov word ptr ss:[bx], 0xffff             
  0e4e  b90100           mov cx, 1                                
  0e51  8bc2             mov ax, dx                               
  0e53  4a               dec dx                                   
  0e54  0bc0             or ax, ax                                
  0e56  75a4             jne 0xdfc                                
  0e58  0bc9             or cx, cx                                
  0e5a  740d             je 0xe69                                 
  0e5c  16               push ss                                  
  0e5d  8d46e4           lea ax, [bp - 0x1c]                      
  0e60  50               push ax                                  
  0e61  9a5c00f72f       lcall 0x2ff7, 0x5c                       -> ovl29:14d3
  0e66  83c404           add sp, 4                                
  0e69  837efe02         cmp word ptr [bp - 2], 2                 
  0e6d  7d12             jge 0xe81                                
  0e6f  0bff             or di, di                                
  0e71  740e             je 0xe81                                 
  0e73  6a01             push 1                                   
  0e75  56               push si                                  
  0e76  9a2a00d62f       lcall 0x2fd6, 0x2a                       -> ovl24:015e
  0e7b  83c404           add sp, 4                                
  0e7e  e9b700           jmp 0xf38                                
  0e81  9a29058c0c       lcall 0xc8c, 0x529                       -> 0c8c:0529
  0e86  66833e5e5e00     cmp dword ptr [0x5e5e], 0                
  0e8c  751a             jne 0xea8                                
  0e8e  8bde             mov bx, si                               
  0e90  6bdb16           imul bx, bx, 0x16                        
  0e93  b81d1e           mov ax, 0x1e1d                           
  0e96  8ec0             mov es, ax                               
  0e98  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  0e9d  98               cwde                                     
  0e9e  99               cdq                                      
  0e9f  2bc2             sub ax, dx                               
  0ea1  d1f8             sar ax, 1                                
  0ea3  6bc00a           imul ax, ax, 0xa                         
  0ea6  eb03             jmp 0xeab                                
  0ea8  b83200           mov ax, 0x32                             
  0eab  8bd0             mov dx, ax                               
  0ead  8b46f6           mov ax, word ptr [bp - 0xa]              
  0eb0  050a00           add ax, 0xa                              
  0eb3  3bc2             cmp ax, dx                               
  0eb5  7d08             jge 0xebf                                
  0eb7  8b46f6           mov ax, word ptr [bp - 0xa]              
  0eba  050a00           add ax, 0xa                              
  0ebd  eb02             jmp 0xec1                                
  0ebf  8bc2             mov ax, dx                               
  0ec1  8bd0             mov dx, ax                               
  0ec3  ff36fa5d         push word ptr [0x5dfa]                   
  0ec7  ff36fc5d         push word ptr [0x5dfc]                   
  0ecb  8bde             mov bx, si                               
  0ecd  6bdb16           imul bx, bx, 0x16                        
  0ed0  b81d1e           mov ax, 0x1e1d                           
  0ed3  8ec0             mov es, ax                               
  0ed5  26ffb78288       push word ptr es:[bx - 0x777e]           
  0eda  8bde             mov bx, si                               
  0edc  6bdb16           imul bx, bx, 0x16                        
  0edf  b81d1e           mov ax, 0x1e1d                           
  0ee2  8ec0             mov es, ax                               
  0ee4  26ffb78088       push word ptr es:[bx - 0x7780]           
  0ee9  52               push dx                                  
  0eea  9ab91a5505       lcall 0x555, 0x1ab9                      -> 0555:1ab9
  0eef  83c40a           add sp, 0xa                              
  0ef2  ff76fe           push word ptr [bp - 2]                   
  0ef5  90               nop                                      
  0ef6  0e               push cs                                  
  0ef7  e84200           call 0xf3c                               
  0efa  59               pop cx                                   
  0efb  8bd0             mov dx, ax                               
  0efd  83faff           cmp dx, -1                               
  0f00  7427             je 0xf29                                 
  0f02  6a00             push 0                                   
  0f04  50               push ax                                  
  0f05  6a01             push 1                                   
  0f07  16               push ss                                  
  0f08  8d46e4           lea ax, [bp - 0x1c]                      
  0f0b  50               push ax                                  
  0f0c  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  0f11  83c40a           add sp, 0xa                              
  0f14  6a00             push 0                                   
  0f16  c41e625e         les bx, ptr [0x5e62]                     
  0f1a  26ff7714         push word ptr es:[bx + 0x14]             
  0f1e  26ff7712         push word ptr es:[bx + 0x12]             
  0f22  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  0f27  eb0c             jmp 0xf35                                
  0f29  6a01             push 1                                   
  0f2b  16               push ss                                  
  0f2c  8d46e4           lea ax, [bp - 0x1c]                      
  0f2f  50               push ax                                  
  0f30  9a2f00d62f       lcall 0x2fd6, 0x2f                       -> ovl24:00ca
  0f35  83c406           add sp, 6                                
  0f38  5f               pop di                                   
  0f39  5e               pop si                                   
  0f3a  c9               leave                                    
  0f3b  cb               retf                                     

ovl22_0f3c:  ; ENTRY
  0f3c  55               push bp                                  
  0f3d  8bec             mov bp, sp                               
  0f3f  83ec10           sub sp, 0x10                             
  0f42  56               push si                                  
  0f43  57               push di                                  
  0f44  9a0a1b5505       lcall 0x555, 0x1b0a                      -> 0555:1b0a
  0f49  8956fe           mov word ptr [bp - 2], dx                
  0f4c  8946fc           mov word ptr [bp - 4], ax                
  0f4f  c746f4ffff       mov word ptr [bp - 0xc], 0xffff          
  0f54  c746f2e803       mov word ptr [bp - 0xe], 0x3e8           
  0f59  837e0604         cmp word ptr [bp + 6], 4                 
  0f5d  7c05             jl 0xf64                                 
  0f5f  b80100           mov ax, 1                                
  0f62  eb02             jmp 0xf66                                
  0f64  33c0             xor ax, ax                               
  0f66  8946f0           mov word ptr [bp - 0x10], ax             
  0f69  b8042c           mov ax, 0x2c04                           
  0f6c  8ec0             mov es, ax                               
  0f6e  268b3e7b15       mov di, word ptr es:[0x157b]             
  0f73  e95701           jmp 0x10cd                               
  0f76  8bdf             mov bx, di                               
  0f78  6bdb41           imul bx, bx, 0x41                        
  0f7b  b8042c           mov ax, 0x2c04                           
  0f7e  8ec0             mov es, ax                               
  0f80  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0f85  69dbe000         imul bx, bx, 0xe0                        
  0f89  8bf7             mov si, di                               
  0f8b  6bf641           imul si, si, 0x41                        
  0f8e  b8042c           mov ax, 0x2c04                           
  0f91  8ec0             mov es, ax                               
  0f93  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0f98  d1e0             shl ax, 1                                
  0f9a  03d8             add bx, ax                               
  0f9c  b81d1e           mov ax, 0x1e1d                           
  0f9f  8ec0             mov es, ax                               
  0fa1  268a9f0000       mov bl, byte ptr es:[bx]                 
  0fa6  81e3ff00         and bx, 0xff                             
  0faa  b8042c           mov ax, 0x2c04                           
  0fad  8ec0             mov es, ax                               
  0faf  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0fb5  7403             je 0xfba                                 
  0fb7  e91301           jmp 0x10cd                               
  0fba  c41eee40         les bx, ptr [0x40ee]                     
  0fbe  03df             add bx, di                               
  0fc0  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  0fc6  7403             je 0xfcb                                 
  0fc8  e90201           jmp 0x10cd                               
  0fcb  c41eee40         les bx, ptr [0x40ee]                     
  0fcf  26397f46         cmp word ptr es:[bx + 0x46], di          
  0fd3  7503             jne 0xfd8                                
  0fd5  e9f500           jmp 0x10cd                               
  0fd8  8bdf             mov bx, di                               
  0fda  6bdb41           imul bx, bx, 0x41                        
  0fdd  b8042c           mov ax, 0x2c04                           
  0fe0  8ec0             mov es, ax                               
  0fe2  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  0fe8  744a             je 0x1034                                
  0fea  8bdf             mov bx, di                               
  0fec  6bdb41           imul bx, bx, 0x41                        
  0fef  8ec0             mov es, ax                               
  0ff1  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0ff6  98               cwde                                     
  0ff7  ba042c           mov dx, 0x2c04                           
  0ffa  8ec2             mov es, dx                               
  0ffc  263b061001       cmp ax, word ptr es:[0x110]              
  1001  7431             je 0x1034                                
  1003  8bdf             mov bx, di                               
  1005  6bdb41           imul bx, bx, 0x41                        
  1008  b8042c           mov ax, 0x2c04                           
  100b  8ec0             mov es, ax                               
  100d  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1012  98               cwde                                     
  1013  8ec2             mov es, dx                               
  1015  268b1e1001       mov bx, word ptr es:[0x110]              
  101a  c1e303           shl bx, 3                                
  101d  03d8             add bx, ax                               
  101f  b8042c           mov ax, 0x2c04                           
  1022  8ec0             mov es, ax                               
  1024  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  1029  250300           and ax, 3                                
  102c  3d0200           cmp ax, 2                                
  102f  7403             je 0x1034                                
  1031  e99900           jmp 0x10cd                               
  1034  6a00             push 0                                   
  1036  66ff76fc         push dword ptr [bp - 4]                  
  103a  16               push ss                                  
  103b  8d46f6           lea ax, [bp - 0xa]                       
  103e  50               push ax                                  
  103f  16               push ss                                  
  1040  8d46f8           lea ax, [bp - 8]                         
  1043  50               push ax                                  
  1044  57               push di                                  
  1045  9a3900c52f       lcall 0x2fc5, 0x39                       -> ovl21:0a85
  104a  83c410           add sp, 0x10                             
  104d  8bf0             mov si, ax                               
  104f  837ef8ff         cmp word ptr [bp - 8], -1                
  1053  7478             je 0x10cd                                
  1055  8bdf             mov bx, di                               
  1057  6bdb41           imul bx, bx, 0x41                        
  105a  b8042c           mov ax, 0x2c04                           
  105d  8ec0             mov es, ax                               
  105f  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1064  98               cwde                                     
  1065  ba042c           mov dx, 0x2c04                           
  1068  8ec2             mov es, dx                               
  106a  263b061001       cmp ax, word ptr es:[0x110]              
  106f  7431             je 0x10a2                                
  1071  8bdf             mov bx, di                               
  1073  6bdb41           imul bx, bx, 0x41                        
  1076  b8042c           mov ax, 0x2c04                           
  1079  8ec0             mov es, ax                               
  107b  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1080  8bdf             mov bx, di                               
  1082  6bdb41           imul bx, bx, 0x41                        
  1085  b8042c           mov ax, 0x2c04                           
  1088  8ec0             mov es, ax                               
  108a  26ffb77d15       push word ptr es:[bx + 0x157d]           
  108f  9a6100f72f       lcall 0x2ff7, 0x61                       -> ovl29:15c5
  1094  83c404           add sp, 4                                
  1097  8946fa           mov word ptr [bp - 6], ax                
  109a  837efa4b         cmp word ptr [bp - 6], 0x4b              
  109e  7d22             jge 0x10c2                               
  10a0  eb2b             jmp 0x10cd                               
  10a2  c41eee40         les bx, ptr [0x40ee]                     
  10a6  03df             add bx, di                               
  10a8  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  10ad  7505             jne 0x10b4                               
  10af  b80a00           mov ax, 0xa                              
  10b2  eb03             jmp 0x10b7                               
  10b4  b81e00           mov ax, 0x1e                             
  10b7  03f0             add si, ax                               
  10b9  837ef000         cmp word ptr [bp - 0x10], 0              
  10bd  7403             je 0x10c2                                
  10bf  83c664           add si, 0x64                             
  10c2  3b76f2           cmp si, word ptr [bp - 0xe]              
  10c5  7d06             jge 0x10cd                               
  10c7  897ef4           mov word ptr [bp - 0xc], di              
  10ca  8976f2           mov word ptr [bp - 0xe], si              
  10cd  8bc7             mov ax, di                               
  10cf  4f               dec di                                   
  10d0  0bc0             or ax, ax                                
  10d2  7403             je 0x10d7                                
  10d4  e99ffe           jmp 0xf76                                
  10d7  9a2e1b5505       lcall 0x555, 0x1b2e                      -> 0555:1b2e
  10dc  8b46f4           mov ax, word ptr [bp - 0xc]              
  10df  5f               pop di                                   
  10e0  5e               pop si                                   
  10e1  c9               leave                                    
  10e2  cb               retf                                     

ovl22_10e3:  ; ENTRY
  10e3  55               push bp                                  
  10e4  8bec             mov bp, sp                               
  10e6  83ec10           sub sp, 0x10                             
  10e9  56               push si                                  
  10ea  b8042c           mov ax, 0x2c04                           
  10ed  8ec0             mov es, ax                               
  10ef  268b367b15       mov si, word ptr es:[0x157b]             
  10f4  e9a200           jmp 0x1199                               
  10f7  8bde             mov bx, si                               
  10f9  6bdb41           imul bx, bx, 0x41                        
  10fc  b8042c           mov ax, 0x2c04                           
  10ff  8ec0             mov es, ax                               
  1101  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1106  ba042c           mov dx, 0x2c04                           
  1109  8ec2             mov es, dx                               
  110b  263a061001       cmp al, byte ptr es:[0x110]              
  1110  7403             je 0x1115                                
  1112  e98400           jmp 0x1199                               
  1115  c41eee40         les bx, ptr [0x40ee]                     
  1119  03de             add bx, si                               
  111b  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  1120  b400             mov ah, 0                                
  1122  a92000           test ax, 0x20                            
  1125  7472             je 0x1199                                
  1127  c41eee40         les bx, ptr [0x40ee]                     
  112b  03de             add bx, si                               
  112d  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  1132  7465             je 0x1199                                
  1134  666a00           push 0                                   
  1137  6a00             push 0                                   
  1139  16               push ss                                  
  113a  8d46f0           lea ax, [bp - 0x10]                      
  113d  50               push ax                                  
  113e  8bde             mov bx, si                               
  1140  6bdb41           imul bx, bx, 0x41                        
  1143  b8042c           mov ax, 0x2c04                           
  1146  8ec0             mov es, ax                               
  1148  26ffb77f15       push word ptr es:[bx + 0x157f]           
  114d  8bde             mov bx, si                               
  114f  6bdb41           imul bx, bx, 0x41                        
  1152  b8042c           mov ax, 0x2c04                           
  1155  8ec0             mov es, ax                               
  1157  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  115c  40               inc ax                                   
  115d  50               push ax                                  
  115e  9a5700f72f       lcall 0x2ff7, 0x57                       -> ovl29:13b2
  1163  83c40e           add sp, 0xe                              
  1166  0bc0             or ax, ax                                
  1168  742f             je 0x1199                                
  116a  16               push ss                                  
  116b  8d46f0           lea ax, [bp - 0x10]                      
  116e  50               push ax                                  
  116f  90               nop                                      
  1170  0e               push cs                                  
  1171  e83200           call 0x11a6                              
  1174  83c404           add sp, 4                                
  1177  3d0100           cmp ax, 1                                
  117a  7407             je 0x1183                                
  117c  3d0200           cmp ax, 2                                
  117f  7418             je 0x1199                                
  1181  eb16             jmp 0x1199                               
  1183  56               push si                                  
  1184  9a4d00f72f       lcall 0x2ff7, 0x4d                       -> ovl29:0fd5
  1189  59               pop cx                                   
  118a  0bc0             or ax, ax                                
  118c  750b             jne 0x1199                               
  118e  c41eee40         les bx, ptr [0x40ee]                     
  1192  03de             add bx, si                               
  1194  26c647560d       mov byte ptr es:[bx + 0x56], 0xd         
  1199  8bc6             mov ax, si                               
  119b  4e               dec si                                   
  119c  0bc0             or ax, ax                                
  119e  7403             je 0x11a3                                
  11a0  e954ff           jmp 0x10f7                               
  11a3  5e               pop si                                   
  11a4  c9               leave                                    
  11a5  cb               retf                                     

ovl22_11a6:  ; ENTRY
  11a6  55               push bp                                  
  11a7  8bec             mov bp, sp                               
  11a9  83ec14           sub sp, 0x14                             
  11ac  56               push si                                  
  11ad  57               push di                                  
  11ae  c746f80f00       mov word ptr [bp - 8], 0xf               
  11b3  c746f62800       mov word ptr [bp - 0xa], 0x28            
  11b8  b8ffff           mov ax, 0xffff                           
  11bb  8946fa           mov word ptr [bp - 6], ax                
  11be  8946fc           mov word ptr [bp - 4], ax                
  11c1  8946fe           mov word ptr [bp - 2], ax                
  11c4  8bc8             mov cx, ax                               
  11c6  8bf9             mov di, cx                               
  11c8  33f6             xor si, si                               
  11ca  eb65             jmp 0x1231                               
  11cc  83ffff           cmp di, -1                               
  11cf  7528             jne 0x11f9                               
  11d1  8bc6             mov ax, si                               
  11d3  d1e0             shl ax, 1                                
  11d5  c45e06           les bx, ptr [bp + 6]                     
  11d8  03d8             add bx, ax                               
  11da  268b1f           mov bx, word ptr es:[bx]                 
  11dd  6bdb16           imul bx, bx, 0x16                        
  11e0  b81d1e           mov ax, 0x1e1d                           
  11e3  8ec0             mov es, ax                               
  11e5  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  11eb  750c             jne 0x11f9                               
  11ed  8bc6             mov ax, si                               
  11ef  d1e0             shl ax, 1                                
  11f1  c45e06           les bx, ptr [bp + 6]                     
  11f4  03d8             add bx, ax                               
  11f6  268b3f           mov di, word ptr es:[bx]                 
  11f9  83f9ff           cmp cx, -1                               
  11fc  7532             jne 0x1230                               
  11fe  8bc6             mov ax, si                               
  1200  d1e0             shl ax, 1                                
  1202  c45e06           les bx, ptr [bp + 6]                     
  1205  03d8             add bx, ax                               
  1207  268b1f           mov bx, word ptr es:[bx]                 
  120a  6bdb16           imul bx, bx, 0x16                        
  120d  b81d1e           mov ax, 0x1e1d                           
  1210  8ec0             mov es, ax                               
  1212  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  1217  98               cwde                                     
  1218  6bc006           imul ax, ax, 6                           
  121b  8bd8             mov bx, ax                               
  121d  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  1222  740c             je 0x1230                                
  1224  8bc6             mov ax, si                               
  1226  d1e0             shl ax, 1                                
  1228  c45e06           les bx, ptr [bp + 6]                     
  122b  03d8             add bx, ax                               
  122d  268b0f           mov cx, word ptr es:[bx]                 
  1230  46               inc si                                   
  1231  83fe08           cmp si, 8                                
  1234  7c96             jl 0x11cc                                
  1236  83ffff           cmp di, -1                               
  1239  7503             jne 0x123e                               
  123b  e97f03           jmp 0x15bd                               
  123e  83f9ff           cmp cx, -1                               
  1241  7506             jne 0x1249                               
  1243  b80100           mov ax, 1                                
  1246  e97603           jmp 0x15bf                               
  1249  8bdf             mov bx, di                               
  124b  6bdb16           imul bx, bx, 0x16                        
  124e  b81d1e           mov ax, 0x1e1d                           
  1251  ba0000           mov dx, 0                                
  1254  81c28088         add dx, 0x8880                           
  1258  03da             add bx, dx                               
  125a  8ec0             mov es, ax                               
  125c  268b07           mov ax, word ptr es:[bx]                 
  125f  8946f4           mov word ptr [bp - 0xc], ax              
  1262  8bdf             mov bx, di                               
  1264  6bdb16           imul bx, bx, 0x16                        
  1267  b81d1e           mov ax, 0x1e1d                           
  126a  8ec0             mov es, ax                               
  126c  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  1271  8946f2           mov word ptr [bp - 0xe], ax              
  1274  33f6             xor si, si                               
  1276  eb0f             jmp 0x1287                               
  1278  8bc6             mov ax, si                               
  127a  d1e0             shl ax, 1                                
  127c  c45e06           les bx, ptr [bp + 6]                     
  127f  03d8             add bx, ax                               
  1281  26c707ffff       mov word ptr es:[bx], 0xffff             
  1286  46               inc si                                   
  1287  83fe08           cmp si, 8                                
  128a  7cec             jl 0x1278                                
  128c  c45e06           les bx, ptr [bp + 6]                     
  128f  26893f           mov word ptr es:[bx], di                 
  1292  26894f02         mov word ptr es:[bx + 2], cx             
  1296  8bd9             mov bx, cx                               
  1298  6bdb16           imul bx, bx, 0x16                        
  129b  b81d1e           mov ax, 0x1e1d                           
  129e  8ec0             mov es, ax                               
  12a0  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  12a6  8bdf             mov bx, di                               
  12a8  6bdb16           imul bx, bx, 0x16                        
  12ab  b81d1e           mov ax, 0x1e1d                           
  12ae  8ec0             mov es, ax                               
  12b0  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  12b6  26808f8e8800     or byte ptr es:[bx - 0x7772], 0          
  12bc  8bd9             mov bx, cx                               
  12be  6bdb16           imul bx, bx, 0x16                        
  12c1  b81d1e           mov ax, 0x1e1d                           
  12c4  8ec0             mov es, ax                               
  12c6  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  12cc  b000             mov al, 0                                
  12ce  8bdf             mov bx, di                               
  12d0  6bdb16           imul bx, bx, 0x16                        
  12d3  ba1d1e           mov dx, 0x1e1d                           
  12d6  8ec2             mov es, dx                               
  12d8  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  12de  d0e0             shl al, 1                                
  12e0  2608878f88       or byte ptr es:[bx - 0x7771], al         
  12e5  b8042c           mov ax, 0x2c04                           
  12e8  8ec0             mov es, ax                               
  12ea  268b360f08       mov si, word ptr es:[0x80f]              
  12ef  e97101           jmp 0x1463                               
  12f2  c746f00000       mov word ptr [bp - 0x10], 0              
  12f7  8bde             mov bx, si                               
  12f9  6bdb1f           imul bx, bx, 0x1f                        
  12fc  b8042c           mov ax, 0x2c04                           
  12ff  8ec0             mov es, ax                               
  1301  268b871108       mov ax, word ptr es:[bx + 0x811]         
  1306  8946ee           mov word ptr [bp - 0x12], ax             
  1309  8bde             mov bx, si                               
  130b  6bdb1f           imul bx, bx, 0x1f                        
  130e  b8042c           mov ax, 0x2c04                           
  1311  8ec0             mov es, ax                               
  1313  268b871308       mov ax, word ptr es:[bx + 0x813]         
  1318  8946ec           mov word ptr [bp - 0x14], ax             
  131b  b8042c           mov ax, 0x2c04                           
  131e  8ec0             mov es, ax                               
  1320  268b0e8101       mov cx, word ptr es:[0x181]              
  1325  eb67             jmp 0x138e                               
  1327  8bd9             mov bx, cx                               
  1329  6bdb16           imul bx, bx, 0x16                        
  132c  b81d1e           mov ax, 0x1e1d                           
  132f  8ec0             mov es, ax                               
  1331  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  1336  ba042c           mov dx, 0x2c04                           
  1339  8ec2             mov es, dx                               
  133b  263a061001       cmp al, byte ptr es:[0x110]              
  1340  754c             jne 0x138e                               
  1342  3bf9             cmp di, cx                               
  1344  7448             je 0x138e                                
  1346  8bd9             mov bx, cx                               
  1348  6bdb16           imul bx, bx, 0x16                        
  134b  b81d1e           mov ax, 0x1e1d                           
  134e  8ec0             mov es, ax                               
  1350  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  1356  7536             jne 0x138e                               
  1358  8bd9             mov bx, cx                               
  135a  6bdb16           imul bx, bx, 0x16                        
  135d  b81d1e           mov ax, 0x1e1d                           
  1360  8ec0             mov es, ax                               
  1362  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  1367  250f00           and ax, 0xf                              
  136a  3d0300           cmp ax, 3                                
  136d  751f             jne 0x138e                               
  136f  8bd9             mov bx, cx                               
  1371  6bdb16           imul bx, bx, 0x16                        
  1374  b81d1e           mov ax, 0x1e1d                           
  1377  8ec0             mov es, ax                               
  1379  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  137e  d1e8             shr ax, 1                                
  1380  257f00           and ax, 0x7f                             
  1383  3bc6             cmp ax, si                               
  1385  7507             jne 0x138e                               
  1387  c746f00100       mov word ptr [bp - 0x10], 1              
  138c  eb07             jmp 0x1395                               
  138e  8bc1             mov ax, cx                               
  1390  49               dec cx                                   
  1391  0bc0             or ax, ax                                
  1393  7592             jne 0x1327                               
  1395  837ef000         cmp word ptr [bp - 0x10], 0              
  1399  7403             je 0x139e                                
  139b  e9c500           jmp 0x1463                               
  139e  ff76ec           push word ptr [bp - 0x14]                
  13a1  ff76ee           push word ptr [bp - 0x12]                
  13a4  9a7000f72f       lcall 0x2ff7, 0x70                       -> ovl29:16ae
  13a9  83c404           add sp, 4                                
  13ac  0bc0             or ax, ax                                
  13ae  7503             jne 0x13b3                               
  13b0  e9b000           jmp 0x1463                               
  13b3  8b5eec           mov bx, word ptr [bp - 0x14]             
  13b6  69dbe000         imul bx, bx, 0xe0                        
  13ba  8b46ee           mov ax, word ptr [bp - 0x12]             
  13bd  d1e0             shl ax, 1                                
  13bf  03d8             add bx, ax                               
  13c1  b81d1e           mov ax, 0x1e1d                           
  13c4  8ec0             mov es, ax                               
  13c6  268a9f0000       mov bl, byte ptr es:[bx]                 
  13cb  81e3ff00         and bx, 0xff                             
  13cf  b8042c           mov ax, 0x2c04                           
  13d2  8ec0             mov es, ax                               
  13d4  2680bf10070b     cmp byte ptr es:[bx + 0x710], 0xb        
  13da  7403             je 0x13df                                
  13dc  e98400           jmp 0x1463                               
  13df  8bde             mov bx, si                               
  13e1  6bdb1f           imul bx, bx, 0x1f                        
  13e4  b8042c           mov ax, 0x2c04                           
  13e7  8ec0             mov es, ax                               
  13e9  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  13ef  7472             je 0x1463                                
  13f1  8b5eec           mov bx, word ptr [bp - 0x14]             
  13f4  69dbe000         imul bx, bx, 0xe0                        
  13f8  8b46ee           mov ax, word ptr [bp - 0x12]             
  13fb  d1e0             shl ax, 1                                
  13fd  03d8             add bx, ax                               
  13ff  b81d1e           mov ax, 0x1e1d                           
  1402  8ec0             mov es, ax                               
  1404  268a870100       mov al, byte ptr es:[bx + 1]             
  1409  c1e806           shr ax, 6                                
  140c  250100           and ax, 1                                
  140f  0bc0             or ax, ax                                
  1411  7550             jne 0x1463                               
  1413  ff76ec           push word ptr [bp - 0x14]                
  1416  ff76ee           push word ptr [bp - 0x12]                
  1419  ff76f2           push word ptr [bp - 0xe]                 
  141c  ff76f4           push word ptr [bp - 0xc]                 
  141f  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  1424  83c408           add sp, 8                                
  1427  8bd0             mov dx, ax                               
  1429  3b56f8           cmp dx, word ptr [bp - 8]                
  142c  7d15             jge 0x1443                               
  142e  8b46f8           mov ax, word ptr [bp - 8]                
  1431  05c800           add ax, 0xc8                              ; "Quest"
  1434  2bc2             sub ax, dx                               
  1436  3b46fc           cmp ax, word ptr [bp - 4]                
  1439  7e08             jle 0x1443                               
  143b  8b46f8           mov ax, word ptr [bp - 8]                
  143e  05c800           add ax, 0xc8                              ; "Quest"
  1441  eb18             jmp 0x145b                               
  1443  3b56f6           cmp dx, word ptr [bp - 0xa]              
  1446  7d1b             jge 0x1463                               
  1448  8b46f6           mov ax, word ptr [bp - 0xa]              
  144b  053200           add ax, 0x32                             
  144e  2bc2             sub ax, dx                               
  1450  3b46fc           cmp ax, word ptr [bp - 4]                
  1453  7e0e             jle 0x1463                               
  1455  8b46f6           mov ax, word ptr [bp - 0xa]              
  1458  053200           add ax, 0x32                             
  145b  2bc2             sub ax, dx                               
  145d  8946fc           mov word ptr [bp - 4], ax                
  1460  8976fe           mov word ptr [bp - 2], si                
  1463  8bc6             mov ax, si                               
  1465  4e               dec si                                   
  1466  0bc0             or ax, ax                                
  1468  7403             je 0x146d                                
  146a  e985fe           jmp 0x12f2                               
  146d  b8042c           mov ax, 0x2c04                           
  1470  8ec0             mov es, ax                               
  1472  268b367b15       mov si, word ptr es:[0x157b]             
  1477  e99700           jmp 0x1511                               
  147a  8bde             mov bx, si                               
  147c  6bdb41           imul bx, bx, 0x41                        
  147f  b8042c           mov ax, 0x2c04                           
  1482  8ec0             mov es, ax                               
  1484  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1489  ba042c           mov dx, 0x2c04                           
  148c  8ec2             mov es, dx                               
  148e  263a061001       cmp al, byte ptr es:[0x110]              
  1493  757c             jne 0x1511                               
  1495  8bde             mov bx, si                               
  1497  6bdb41           imul bx, bx, 0x41                        
  149a  b8042c           mov ax, 0x2c04                           
  149d  8ec0             mov es, ax                               
  149f  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  14a4  8946f0           mov word ptr [bp - 0x10], ax             
  14a7  8bde             mov bx, si                               
  14a9  6bdb41           imul bx, bx, 0x41                        
  14ac  b8042c           mov ax, 0x2c04                           
  14af  8ec0             mov es, ax                               
  14b1  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  14b6  8946ee           mov word ptr [bp - 0x12], ax             
  14b9  50               push ax                                  
  14ba  ff76f0           push word ptr [bp - 0x10]                
  14bd  ff76f2           push word ptr [bp - 0xe]                 
  14c0  ff76f4           push word ptr [bp - 0xc]                 
  14c3  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  14c8  83c408           add sp, 8                                
  14cb  8bd0             mov dx, ax                               
  14cd  c41eee40         les bx, ptr [0x40ee]                     
  14d1  03de             add bx, si                               
  14d3  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  14d8  7503             jne 0x14dd                               
  14da  83ea50           sub dx, 0x50                             
  14dd  3b56f8           cmp dx, word ptr [bp - 8]                
  14e0  7d15             jge 0x14f7                               
  14e2  8b46f8           mov ax, word ptr [bp - 8]                
  14e5  056400           add ax, 0x64                             
  14e8  2bc2             sub ax, dx                               
  14ea  3b46fc           cmp ax, word ptr [bp - 4]                
  14ed  7e08             jle 0x14f7                               
  14ef  8b46f8           mov ax, word ptr [bp - 8]                
  14f2  056400           add ax, 0x64                             
  14f5  eb12             jmp 0x1509                               
  14f7  3b56f6           cmp dx, word ptr [bp - 0xa]              
  14fa  7d15             jge 0x1511                               
  14fc  8b46f6           mov ax, word ptr [bp - 0xa]              
  14ff  2bc2             sub ax, dx                               
  1501  3b46fc           cmp ax, word ptr [bp - 4]                
  1504  7e0b             jle 0x1511                               
  1506  8b46f6           mov ax, word ptr [bp - 0xa]              
  1509  2bc2             sub ax, dx                               
  150b  8946fc           mov word ptr [bp - 4], ax                
  150e  8976fa           mov word ptr [bp - 6], si                
  1511  8bc6             mov ax, si                               
  1513  4e               dec si                                   
  1514  0bc0             or ax, ax                                
  1516  7403             je 0x151b                                
  1518  e95fff           jmp 0x147a                               
  151b  837efeff         cmp word ptr [bp - 2], -1                
  151f  7438             je 0x1559                                
  1521  680001           push 0x100                               
  1524  ff76fe           push word ptr [bp - 2]                   
  1527  6a03             push 3                                   
  1529  66ff7606         push dword ptr [bp + 6]                  
  152d  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  1532  83c40a           add sp, 0xa                              
  1535  6a00             push 0                                   
  1537  c41e625e         les bx, ptr [0x5e62]                     
  153b  26ff7714         push word ptr es:[bx + 0x14]             
  153f  26ff7712         push word ptr es:[bx + 0x12]             
  1543  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  1548  83c406           add sp, 6                                
  154b  ff76fe           push word ptr [bp - 2]                   
  154e  57               push di                                  
  154f  90               nop                                      
  1550  0e               push cs                                  
  1551  e86f00           call 0x15c3                              
  1554  83c404           add sp, 4                                
  1557  eb66             jmp 0x15bf                               
  1559  837efaff         cmp word ptr [bp - 6], -1                
  155d  745e             je 0x15bd                                
  155f  8b5efa           mov bx, word ptr [bp - 6]                
  1562  6bdb41           imul bx, bx, 0x41                        
  1565  b8042c           mov ax, 0x2c04                           
  1568  8ec0             mov es, ax                               
  156a  26ffb77f15       push word ptr es:[bx + 0x157f]           
  156f  8b5efa           mov bx, word ptr [bp - 6]                
  1572  6bdb41           imul bx, bx, 0x41                        
  1575  b8042c           mov ax, 0x2c04                           
  1578  8ec0             mov es, ax                               
  157a  26ffb77d15       push word ptr es:[bx + 0x157d]           
  157f  ff76f2           push word ptr [bp - 0xe]                 
  1582  ff76f4           push word ptr [bp - 0xc]                 
  1585  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  158a  83c408           add sp, 8                                
  158d  3d0200           cmp ax, 2                                
  1590  7e2b             jle 0x15bd                               
  1592  6a00             push 0                                   
  1594  ff76fa           push word ptr [bp - 6]                   
  1597  6a01             push 1                                   
  1599  66ff7606         push dword ptr [bp + 6]                  
  159d  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  15a2  83c40a           add sp, 0xa                              
  15a5  6a00             push 0                                   
  15a7  c41e625e         les bx, ptr [0x5e62]                     
  15ab  26ff7714         push word ptr es:[bx + 0x14]             
  15af  26ff7712         push word ptr es:[bx + 0x12]             
  15b3  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  15b8  83c406           add sp, 6                                
  15bb  eb00             jmp 0x15bd                               
  15bd  33c0             xor ax, ax                               
  15bf  5f               pop di                                   
  15c0  5e               pop si                                   
  15c1  c9               leave                                    
  15c2  cb               retf                                     

ovl22_15c3:  ; ENTRY
  15c3  55               push bp                                  
  15c4  8bec             mov bp, sp                               
  15c6  83ec04           sub sp, 4                                
  15c9  56               push si                                  
  15ca  57               push di                                  
  15cb  8b7606           mov si, word ptr [bp + 6]                
  15ce  8b7e08           mov di, word ptr [bp + 8]                
  15d1  8bdf             mov bx, di                               
  15d3  6bdb1f           imul bx, bx, 0x1f                        
  15d6  b8042c           mov ax, 0x2c04                           
  15d9  8ec0             mov es, ax                               
  15db  268b871108       mov ax, word ptr es:[bx + 0x811]         
  15e0  8946fe           mov word ptr [bp - 2], ax                
  15e3  8bdf             mov bx, di                               
  15e5  6bdb1f           imul bx, bx, 0x1f                        
  15e8  b8042c           mov ax, 0x2c04                           
  15eb  8ec0             mov es, ax                               
  15ed  268b871308       mov ax, word ptr es:[bx + 0x813]         
  15f2  8946fc           mov word ptr [bp - 4], ax                
  15f5  8bde             mov bx, si                               
  15f7  6bdb16           imul bx, bx, 0x16                        
  15fa  b81d1e           mov ax, 0x1e1d                           
  15fd  8ec0             mov es, ax                               
  15ff  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  1604  3b46fe           cmp ax, word ptr [bp - 2]                
  1607  7528             jne 0x1631                               
  1609  8bde             mov bx, si                               
  160b  6bdb16           imul bx, bx, 0x16                        
  160e  b81d1e           mov ax, 0x1e1d                           
  1611  8ec0             mov es, ax                               
  1613  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  1618  3b46fc           cmp ax, word ptr [bp - 4]                
  161b  7514             jne 0x1631                               
  161d  8bde             mov bx, si                               
  161f  6bdb16           imul bx, bx, 0x16                        
  1622  b81d1e           mov ax, 0x1e1d                           
  1625  8ec0             mov es, ax                               
  1627  268a878788       mov al, byte ptr es:[bx - 0x7779]        
  162c  98               cwde                                     
  162d  0bc0             or ax, ax                                
  162f  7505             jne 0x1636                               
  1631  33c0             xor ax, ax                               
  1633  e9c901           jmp 0x17ff                               
  1636  8b5efc           mov bx, word ptr [bp - 4]                
  1639  69dbe000         imul bx, bx, 0xe0                        
  163d  8b46fe           mov ax, word ptr [bp - 2]                
  1640  d1e0             shl ax, 1                                
  1642  03d8             add bx, ax                               
  1644  b81d1e           mov ax, 0x1e1d                           
  1647  8ec0             mov es, ax                               
  1649  268a9f0000       mov bl, byte ptr es:[bx]                 
  164e  81e3ff00         and bx, 0xff                             
  1652  b8042c           mov ax, 0x2c04                           
  1655  8ec0             mov es, ax                               
  1657  2680bf10070b     cmp byte ptr es:[bx + 0x710], 0xb        
  165d  7403             je 0x1662                                
  165f  e99a01           jmp 0x17fc                               
  1662  8bdf             mov bx, di                               
  1664  6bdb1f           imul bx, bx, 0x1f                        
  1667  b8042c           mov ax, 0x2c04                           
  166a  8ec0             mov es, ax                               
  166c  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  1672  7425             je 0x1699                                
  1674  8b5efc           mov bx, word ptr [bp - 4]                
  1677  69dbe000         imul bx, bx, 0xe0                        
  167b  8b46fe           mov ax, word ptr [bp - 2]                
  167e  d1e0             shl ax, 1                                
  1680  03d8             add bx, ax                               
  1682  b81d1e           mov ax, 0x1e1d                           
  1685  8ec0             mov es, ax                               
  1687  268a870100       mov al, byte ptr es:[bx + 1]             
  168c  c1e806           shr ax, 6                                
  168f  250100           and ax, 1                                
  1692  0bc0             or ax, ax                                
  1694  7403             je 0x1699                                
  1696  e96301           jmp 0x17fc                               
  1699  8bc6             mov ax, si                               
  169b  6bc016           imul ax, ax, 0x16                        
  169e  ba0000           mov dx, 0                                
  16a1  81c28088         add dx, 0x8880                           
  16a5  03c2             add ax, dx                               
  16a7  c706645e1d1e     mov word ptr [0x5e64], 0x1e1d            
  16ad  a3625e           mov word ptr [0x5e62], ax                
  16b0  9a20001430       lcall 0x3014, 0x20                       -> ovl34:0000
  16b5  8bdf             mov bx, di                               
  16b7  6bdb1f           imul bx, bx, 0x1f                        
  16ba  b8042c           mov ax, 0x2c04                           
  16bd  8ec0             mov es, ax                               
  16bf  2680bf290801     cmp byte ptr es:[bx + 0x829], 1          
  16c5  752c             jne 0x16f3                               
  16c7  b8042c           mov ax, 0x2c04                           
  16ca  8ec0             mov es, ax                               
  16cc  26833e1e0100     cmp word ptr es:[0x11e], 0               
  16d2  741f             je 0x16f3                                
  16d4  8ec0             mov es, ax                               
  16d6  268b1e1001       mov bx, word ptr es:[0x110]              
  16db  6bdb0c           imul bx, bx, 0xc                         
  16de  b8042c           mov ax, 0x2c04                           
  16e1  8ec0             mov es, ax                               
  16e3  2683bf031100     cmp word ptr es:[bx + 0x1103], 0         
  16e9  7508             jne 0x16f3                               
  16eb  6a01             push 1                                   
  16ed  9a2f005b2f       lcall 0x2f5b, 0x2f                       -> ovl01:0d7a
  16f2  59               pop cx                                   
  16f3  8bde             mov bx, si                               
  16f5  6bdb16           imul bx, bx, 0x16                        
  16f8  b81d1e           mov ax, 0x1e1d                           
  16fb  8ec0             mov es, ax                               
  16fd  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  1703  7403             je 0x1708                                
  1705  e929ff           jmp 0x1631                               
  1708  33f6             xor si, si                               
  170a  eb1e             jmp 0x172a                               
  170c  8bde             mov bx, si                               
  170e  c1e302           shl bx, 2                                
  1711  8b873e5e         mov ax, word ptr [bx + 0x5e3e]           
  1715  0b87405e         or ax, word ptr [bx + 0x5e40]            
  1719  740e             je 0x1729                                
  171b  8bde             mov bx, si                               
  171d  c1e302           shl bx, 2                                
  1720  c49f3e5e         les bx, ptr [bx + 0x5e3e]                
  1724  2683670cbf       and word ptr es:[bx + 0xc], 0xffbf       
  1729  46               inc si                                   
  172a  3b36fe5d         cmp si, word ptr [0x5dfe]                
  172e  7cdc             jl 0x170c                                
  1730  b8042c           mov ax, 0x2c04                           
  1733  8ec0             mov es, ax                               
  1735  26833e240100     cmp word ptr es:[0x124], 0               
  173b  7503             jne 0x1740                               
  173d  e9bc00           jmp 0x17fc                               
  1740  8bdf             mov bx, di                               
  1742  6bdb1f           imul bx, bx, 0x1f                        
  1745  b8042c           mov ax, 0x2c04                           
  1748  8ec0             mov es, ax                               
  174a  2680bf290805     cmp byte ptr es:[bx + 0x829], 5          
  1750  7403             je 0x1755                                
  1752  e9a700           jmp 0x17fc                               
  1755  b8042c           mov ax, 0x2c04                           
  1758  8ec0             mov es, ax                               
  175a  268b368101       mov si, word ptr es:[0x181]              
  175f  e99000           jmp 0x17f2                               
  1762  8bde             mov bx, si                               
  1764  6bdb16           imul bx, bx, 0x16                        
  1767  b81d1e           mov ax, 0x1e1d                           
  176a  8ec0             mov es, ax                               
  176c  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  1771  ba042c           mov dx, 0x2c04                           
  1774  8ec2             mov es, dx                               
  1776  263a061001       cmp al, byte ptr es:[0x110]              
  177b  7575             jne 0x17f2                               
  177d  8bde             mov bx, si                               
  177f  6bdb16           imul bx, bx, 0x16                        
  1782  b81d1e           mov ax, 0x1e1d                           
  1785  8ec0             mov es, ax                               
  1787  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  178c  250f00           and ax, 0xf                              
  178f  0bc0             or ax, ax                                
  1791  755f             jne 0x17f2                               
  1793  8bde             mov bx, si                               
  1795  6bdb16           imul bx, bx, 0x16                        
  1798  b81d1e           mov ax, 0x1e1d                           
  179b  8ec0             mov es, ax                               
  179d  268a878488       mov al, byte ptr es:[bx - 0x777c]        
  17a2  98               cwde                                     
  17a3  6bc006           imul ax, ax, 6                           
  17a6  8bd8             mov bx, ax                               
  17a8  80bfc84500       cmp byte ptr [bx + 0x45c8], 0            
  17ad  7443             je 0x17f2                                
  17af  8bde             mov bx, si                               
  17b1  6bdb16           imul bx, bx, 0x16                        
  17b4  b81d1e           mov ax, 0x1e1d                           
  17b7  8ec0             mov es, ax                               
  17b9  268b878088       mov ax, word ptr es:[bx - 0x7780]        
  17be  3b46fe           cmp ax, word ptr [bp - 2]                
  17c1  752f             jne 0x17f2                               
  17c3  8bde             mov bx, si                               
  17c5  6bdb16           imul bx, bx, 0x16                        
  17c8  b81d1e           mov ax, 0x1e1d                           
  17cb  8ec0             mov es, ax                               
  17cd  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  17d2  3b46fc           cmp ax, word ptr [bp - 4]                
  17d5  751b             jne 0x17f2                               
  17d7  8bde             mov bx, si                               
  17d9  6bdb16           imul bx, bx, 0x16                        
  17dc  b81d1e           mov ax, 0x1e1d                           
  17df  8ec0             mov es, ax                               
  17e1  26838f8c8820     or word ptr es:[bx - 0x7774], 0x20       
  17e7  6aff             push -1                                  
  17e9  56               push si                                  
  17ea  9a3900bd2f       lcall 0x2fbd, 0x39                       -> ovl20:0e4b
  17ef  83c404           add sp, 4                                
  17f2  8bc6             mov ax, si                               
  17f4  4e               dec si                                   
  17f5  0bc0             or ax, ax                                
  17f7  7403             je 0x17fc                                
  17f9  e966ff           jmp 0x1762                               
  17fc  b80200           mov ax, 2                                
  17ff  5f               pop di                                   
  1800  5e               pop si                                   
  1801  c9               leave                                    
  1802  cb               retf                                     
