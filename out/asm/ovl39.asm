; ovl39 stub 3037 file_off 0x60330 size 0x418

ovl39_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  57               push di                                  
  0005  8b560a           mov dx, word ptr [bp + 0xa]              
  0008  83fa0f           cmp dx, 0xf                              
  000b  7503             jne 0x10                                 
  000d  baffff           mov dx, 0xffff                           
  0010  c45e06           les bx, ptr [bp + 6]                     
  0013  268b37           mov si, word ptr es:[bx]                 
  0016  268b7f02         mov di, word ptr es:[bx + 2]             
  001a  83fa06           cmp dx, 6                                
  001d  7c05             jl 0x24                                  
  001f  b88000           mov ax, 0x80                             
  0022  eb03             jmp 0x27                                 
  0024  b86200           mov ax, 0x62                             
  0027  8bc8             mov cx, ax                               
  0029  83fa06           cmp dx, 6                                
  002c  7c09             jl 0x37                                  
  002e  8bc2             mov ax, dx                               
  0030  05faff           add ax, 0xfffa                           
  0033  d1e0             shl ax, 1                                
  0035  eb04             jmp 0x3b                                 
  0037  8bc2             mov ax, dx                               
  0039  d1e0             shl ax, 1                                
  003b  03c8             add cx, ax                               
  003d  8bc1             mov ax, cx                               
  003f  25ff00           and ax, 0xff                             
  0042  8bdf             mov bx, di                               
  0044  69dbe000         imul bx, bx, 0xe0                        
  0048  8bd6             mov dx, si                               
  004a  d1e2             shl dx, 1                                
  004c  03da             add bx, dx                               
  004e  ba1d1e           mov dx, 0x1e1d                           
  0051  8ec2             mov es, dx                               
  0053  2680a7000000     and byte ptr es:[bx], 0                  
  0059  2608870000       or byte ptr es:[bx], al                  
  005e  8bc1             mov ax, cx                               
  0060  40               inc ax                                   
  0061  25ff00           and ax, 0xff                             
  0064  8bdf             mov bx, di                               
  0066  69dbe000         imul bx, bx, 0xe0                        
  006a  8bd6             mov dx, si                               
  006c  d1e2             shl dx, 1                                
  006e  03da             add bx, dx                               
  0070  ba1d1e           mov dx, 0x1e1d                           
  0073  8ec2             mov es, dx                               
  0075  2680a7020000     and byte ptr es:[bx + 2], 0              
  007b  2608870200       or byte ptr es:[bx + 2], al              
  0080  8bc1             mov ax, cx                               
  0082  051000           add ax, 0x10                             
  0085  25ff00           and ax, 0xff                             
  0088  8bdf             mov bx, di                               
  008a  69dbe000         imul bx, bx, 0xe0                        
  008e  8bd6             mov dx, si                               
  0090  d1e2             shl dx, 1                                
  0092  03da             add bx, dx                               
  0094  ba1d1e           mov dx, 0x1e1d                           
  0097  8ec2             mov es, dx                               
  0099  2680a7e00000     and byte ptr es:[bx + 0xe0], 0           
  009f  260887e000       or byte ptr es:[bx + 0xe0], al           
  00a4  8bc1             mov ax, cx                               
  00a6  051100           add ax, 0x11                             
  00a9  25ff00           and ax, 0xff                             
  00ac  8bdf             mov bx, di                               
  00ae  69dbe000         imul bx, bx, 0xe0                        
  00b2  8bd6             mov dx, si                               
  00b4  d1e2             shl dx, 1                                
  00b6  03da             add bx, dx                               
  00b8  ba1d1e           mov dx, 0x1e1d                           
  00bb  8ec2             mov es, dx                               
  00bd  2680a7e20000     and byte ptr es:[bx + 0xe2], 0           
  00c3  260887e200       or byte ptr es:[bx + 0xe2], al           
  00c8  5f               pop di                                   
  00c9  5e               pop si                                   
  00ca  5d               pop bp                                   
  00cb  cb               retf                                     

ovl39_00cc:  ; ENTRY
  00cc  55               push bp                                  
  00cd  8bec             mov bp, sp                               
  00cf  83ec0a           sub sp, 0xa                              
  00d2  56               push si                                  
  00d3  57               push di                                  
  00d4  b8042c           mov ax, 0x2c04                           
  00d7  8ec0             mov es, ax                               
  00d9  268b3e7b15       mov di, word ptr es:[0x157b]             
  00de  e96b01           jmp 0x24c                                
  00e1  8bdf             mov bx, di                               
  00e3  6bdb41           imul bx, bx, 0x41                        
  00e6  b8042c           mov ax, 0x2c04                           
  00e9  8ec0             mov es, ax                               
  00eb  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  00f0  69dbe000         imul bx, bx, 0xe0                        
  00f4  8bf7             mov si, di                               
  00f6  6bf641           imul si, si, 0x41                        
  00f9  b8042c           mov ax, 0x2c04                           
  00fc  8ec0             mov es, ax                               
  00fe  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0103  d1e0             shl ax, 1                                
  0105  03d8             add bx, ax                               
  0107  b81d1e           mov ax, 0x1e1d                           
  010a  8ec0             mov es, ax                               
  010c  268a9f0000       mov bl, byte ptr es:[bx]                 
  0111  81e3ff00         and bx, 0xff                             
  0115  b8042c           mov ax, 0x2c04                           
  0118  8ec0             mov es, ax                               
  011a  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0120  7403             je 0x125                                 
  0122  e92701           jmp 0x24c                                
  0125  c746fa0000       mov word ptr [bp - 6], 0                 
  012a  8bdf             mov bx, di                               
  012c  6bdb41           imul bx, bx, 0x41                        
  012f  b8042c           mov ax, 0x2c04                           
  0132  8ec0             mov es, ax                               
  0134  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  013a  7407             je 0x143                                 
  013c  c746fc0300       mov word ptr [bp - 4], 3                 
  0141  eb4d             jmp 0x190                                
  0143  b8042c           mov ax, 0x2c04                           
  0146  8ec0             mov es, ax                               
  0148  26833e1a0100     cmp word ptr es:[0x11a], 0               
  014e  7507             jne 0x157                                
  0150  c746fa0100       mov word ptr [bp - 6], 1                 
  0155  eb39             jmp 0x190                                
  0157  b8042c           mov ax, 0x2c04                           
  015a  8ec0             mov es, ax                               
  015c  26833e1a0101     cmp word ptr es:[0x11a], 1               
  0162  7c2c             jl 0x190                                 
  0164  8ec0             mov es, ax                               
  0166  26a11a01         mov ax, word ptr es:[0x11a]              
  016a  05feff           add ax, 0xfffe                           
  016d  50               push ax                                  
  016e  666801000400     push 0x40001                             
  0174  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0179  83c406           add sp, 6                                
  017c  8946fc           mov word ptr [bp - 4], ax                
  017f  837efc03         cmp word ptr [bp - 4], 3                 
  0183  7e05             jle 0x18a                                
  0185  b80300           mov ax, 3                                
  0188  eb03             jmp 0x18d                                
  018a  8b46fc           mov ax, word ptr [bp - 4]                
  018d  8946fc           mov word ptr [bp - 4], ax                
  0190  837efa00         cmp word ptr [bp - 6], 0                 
  0194  7568             jne 0x1fe                                
  0196  6668ffff0000     push 0xffff                              
  019c  8b5efc           mov bx, word ptr [bp - 4]                
  019f  d1e3             shl bx, 1                                
  01a1  ffb7600d         push word ptr [bx + 0xd60]               
  01a5  57               push di                                  
  01a6  9a4800f72f       lcall 0x2ff7, 0x48                       -> ovl29:103d
  01ab  83c408           add sp, 8                                
  01ae  0bc0             or ax, ax                                
  01b0  7447             je 0x1f9                                 
  01b2  8bdf             mov bx, di                               
  01b4  6bdb41           imul bx, bx, 0x41                        
  01b7  b8042c           mov ax, 0x2c04                           
  01ba  8ec0             mov es, ax                               
  01bc  268a87a915       mov al, byte ptr es:[bx + 0x15a9]        
  01c1  98               cwde                                     
  01c2  50               push ax                                  
  01c3  57               push di                                  
  01c4  9a52005830       lcall 0x3058, 0x52                       -> ovl44:0000
  01c9  83c404           add sp, 4                                
  01cc  8946fe           mov word ptr [bp - 2], ax                
  01cf  8bdf             mov bx, di                               
  01d1  6bdb41           imul bx, bx, 0x41                        
  01d4  b8042c           mov ax, 0x2c04                           
  01d7  8bf7             mov si, di                               
  01d9  6bf641           imul si, si, 0x41                        
  01dc  0376fe           add si, word ptr [bp - 2]                
  01df  ba042c           mov dx, 0x2c04                           
  01e2  8ec2             mov es, dx                               
  01e4  268a949315       mov dl, byte ptr es:[si + 0x1593]        
  01e9  8ec0             mov es, ax                               
  01eb  268897a915       mov byte ptr es:[bx + 0x15a9], dl        
  01f0  57               push di                                  
  01f1  90               nop                                      
  01f2  0e               push cs                                  
  01f3  e88b01           call 0x381                               
  01f6  59               pop cx                                   
  01f7  eb05             jmp 0x1fe                                
  01f9  c746fa0100       mov word ptr [bp - 6], 1                 
  01fe  837efa00         cmp word ptr [bp - 6], 0                 
  0202  7448             je 0x24c                                 
  0204  9a0903620b       lcall 0xb62, 0x309                       -> 0b62:0309
  0209  8956f8           mov word ptr [bp - 8], dx                
  020c  8946f6           mov word ptr [bp - 0xa], ax              
  020f  c45ef6           les bx, ptr [bp - 0xa]                   
  0212  26c647050f       mov byte ptr es:[bx + 5], 0xf            
  0217  26c647040b       mov byte ptr es:[bx + 4], 0xb            
  021c  8bdf             mov bx, di                               
  021e  6bdb41           imul bx, bx, 0x41                        
  0221  b8042c           mov ax, 0x2c04                           
  0224  8ec0             mov es, ax                               
  0226  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  022b  c45ef6           les bx, ptr [bp - 0xa]                   
  022e  268907           mov word ptr es:[bx], ax                 
  0231  8bdf             mov bx, di                               
  0233  6bdb41           imul bx, bx, 0x41                        
  0236  b8042c           mov ax, 0x2c04                           
  0239  8ec0             mov es, ax                               
  023b  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0240  c45ef6           les bx, ptr [bp - 0xa]                   
  0243  26894702         mov word ptr es:[bx + 2], ax             
  0247  26c6470801       mov byte ptr es:[bx + 8], 1              
  024c  8bc7             mov ax, di                               
  024e  4f               dec di                                   
  024f  0bc0             or ax, ax                                
  0251  7403             je 0x256                                 
  0253  e98bfe           jmp 0xe1                                 
  0256  5f               pop di                                   
  0257  5e               pop si                                   
  0258  c9               leave                                    
  0259  cb               retf                                     

ovl39_025a:  ; ENTRY
  025a  55               push bp                                  
  025b  8bec             mov bp, sp                               
  025d  83ec02           sub sp, 2                                
  0260  56               push si                                  
  0261  57               push di                                  
  0262  b8042c           mov ax, 0x2c04                           
  0265  8ec0             mov es, ax                               
  0267  26833e1a0102     cmp word ptr es:[0x11a], 2               
  026d  7d03             jge 0x272                                
  026f  e90b01           jmp 0x37d                                
  0272  b8042c           mov ax, 0x2c04                           
  0275  8ec0             mov es, ax                               
  0277  268b3e7b15       mov di, word ptr es:[0x157b]             
  027c  e9f400           jmp 0x373                                
  027f  8bdf             mov bx, di                               
  0281  6bdb41           imul bx, bx, 0x41                        
  0284  b8042c           mov ax, 0x2c04                           
  0287  8ec0             mov es, ax                               
  0289  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  028f  7403             je 0x294                                 
  0291  e9df00           jmp 0x373                                
  0294  8bdf             mov bx, di                               
  0296  6bdb41           imul bx, bx, 0x41                        
  0299  b8042c           mov ax, 0x2c04                           
  029c  8ec0             mov es, ax                               
  029e  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  02a3  69dbe000         imul bx, bx, 0xe0                        
  02a7  8bf7             mov si, di                               
  02a9  6bf641           imul si, si, 0x41                        
  02ac  b8042c           mov ax, 0x2c04                           
  02af  8ec0             mov es, ax                               
  02b1  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  02b6  d1e0             shl ax, 1                                
  02b8  03d8             add bx, ax                               
  02ba  b81d1e           mov ax, 0x1e1d                           
  02bd  8ec0             mov es, ax                               
  02bf  268a9f0000       mov bl, byte ptr es:[bx]                 
  02c4  81e3ff00         and bx, 0xff                             
  02c8  b8042c           mov ax, 0x2c04                           
  02cb  8ec0             mov es, ax                               
  02cd  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  02d3  7403             je 0x2d8                                 
  02d5  e99b00           jmp 0x373                                
  02d8  8bdf             mov bx, di                               
  02da  6bdb41           imul bx, bx, 0x41                        
  02dd  b8042c           mov ax, 0x2c04                           
  02e0  8ec0             mov es, ax                               
  02e2  268a87ad15       mov al, byte ptr es:[bx + 0x15ad]        
  02e7  b400             mov ah, 0                                
  02e9  0bc0             or ax, ax                                
  02eb  7503             jne 0x2f0                                
  02ed  e98300           jmp 0x373                                
  02f0  8bdf             mov bx, di                               
  02f2  6bdb41           imul bx, bx, 0x41                        
  02f5  b8042c           mov ax, 0x2c04                           
  02f8  8ec0             mov es, ax                               
  02fa  2680bfaa1500     cmp byte ptr es:[bx + 0x15aa], 0         
  0300  7424             je 0x326                                 
  0302  8bdf             mov bx, di                               
  0304  6bdb41           imul bx, bx, 0x41                        
  0307  8ec0             mov es, ax                               
  0309  26fe8faa15       dec byte ptr es:[bx + 0x15aa]            
  030e  8bdf             mov bx, di                               
  0310  6bdb41           imul bx, bx, 0x41                        
  0313  8ec0             mov es, ax                               
  0315  268a87aa15       mov al, byte ptr es:[bx + 0x15aa]        
  031a  98               cwde                                     
  031b  0bc0             or ax, ax                                
  031d  7507             jne 0x326                                
  031f  57               push di                                  
  0320  90               nop                                      
  0321  0e               push cs                                  
  0322  e85c00           call 0x381                               
  0325  59               pop cx                                   
  0326  57               push di                                  
  0327  9a4d00f72f       lcall 0x2ff7, 0x4d                       -> ovl29:0fd5
  032c  59               pop cx                                   
  032d  0bc0             or ax, ax                                
  032f  7542             jne 0x373                                
  0331  16               push ss                                  
  0332  8d46fe           lea ax, [bp - 2]                         
  0335  50               push ax                                  
  0336  8bdf             mov bx, di                               
  0338  6bdb41           imul bx, bx, 0x41                        
  033b  b8042c           mov ax, 0x2c04                           
  033e  8ec0             mov es, ax                               
  0340  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0345  8bdf             mov bx, di                               
  0347  6bdb41           imul bx, bx, 0x41                        
  034a  b8042c           mov ax, 0x2c04                           
  034d  8ec0             mov es, ax                               
  034f  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0354  9a7d00620b       lcall 0xb62, 0x7d                        -> 0b62:007d
  0359  83c408           add sp, 8                                
  035c  837efe04         cmp word ptr [bp - 2], 4                 
  0360  7d11             jge 0x373                                
  0362  6668ffff0000     push 0xffff                              
  0368  6a02             push 2                                   
  036a  57               push di                                  
  036b  9a4800f72f       lcall 0x2ff7, 0x48                       -> ovl29:103d
  0370  83c408           add sp, 8                                
  0373  8bc7             mov ax, di                               
  0375  4f               dec di                                   
  0376  0bc0             or ax, ax                                
  0378  7403             je 0x37d                                 
  037a  e902ff           jmp 0x27f                                
  037d  5f               pop di                                   
  037e  5e               pop si                                   
  037f  c9               leave                                    
  0380  cb               retf                                     

ovl39_0381:  ; ENTRY
  0381  55               push bp                                  
  0382  8bec             mov bp, sp                               
  0384  83ec04           sub sp, 4                                
  0387  56               push si                                  
  0388  57               push di                                  
  0389  8b7e06           mov di, word ptr [bp + 6]                
  038c  6aff             push -1                                  
  038e  8bdf             mov bx, di                               
  0390  6bdb41           imul bx, bx, 0x41                        
  0393  b8042c           mov ax, 0x2c04                           
  0396  8ec0             mov es, ax                               
  0398  26ffb77f15       push word ptr es:[bx + 0x157f]           
  039d  8bdf             mov bx, di                               
  039f  6bdb41           imul bx, bx, 0x41                        
  03a2  b8042c           mov ax, 0x2c04                           
  03a5  8ec0             mov es, ax                               
  03a7  26ffb77d15       push word ptr es:[bx + 0x157d]           
  03ac  57               push di                                  
  03ad  9a20005130       lcall 0x3051, 0x20                       -> ovl43:0dd7
  03b2  83c408           add sp, 8                                
  03b5  8956fe           mov word ptr [bp - 2], dx                
  03b8  8946fc           mov word ptr [bp - 4], ax                
  03bb  c45efc           les bx, ptr [bp - 4]                     
  03be  26c6470700       mov byte ptr es:[bx + 7], 0              
  03c3  8bdf             mov bx, di                               
  03c5  6bdb41           imul bx, bx, 0x41                        
  03c8  b8042c           mov ax, 0x2c04                           
  03cb  8ec0             mov es, ax                               
  03cd  26c687a915ff     mov byte ptr es:[bx + 0x15a9], 0xff      
  03d3  8bdf             mov bx, di                               
  03d5  6bdb41           imul bx, bx, 0x41                        
  03d8  b8042c           mov ax, 0x2c04                           
  03db  8ec0             mov es, ax                               
  03dd  26c687aa1500     mov byte ptr es:[bx + 0x15aa], 0         
  03e3  8bdf             mov bx, di                               
  03e5  6bdb41           imul bx, bx, 0x41                        
  03e8  b8042c           mov ax, 0x2c04                           
  03eb  8ec0             mov es, ax                               
  03ed  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  03f2  69dbe000         imul bx, bx, 0xe0                        
  03f6  8bf7             mov si, di                               
  03f8  6bf641           imul si, si, 0x41                        
  03fb  b8042c           mov ax, 0x2c04                           
  03fe  8ec0             mov es, ax                               
  0400  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0405  d1e0             shl ax, 1                                
  0407  03d8             add bx, ax                               
  0409  b81d1e           mov ax, 0x1e1d                           
  040c  8ec0             mov es, ax                               
  040e  26808f010010     or byte ptr es:[bx + 1], 0x10            
  0414  5f               pop di                                   
  0415  5e               pop si                                   
  0416  c9               leave                                    
  0417  cb               retf                                     
