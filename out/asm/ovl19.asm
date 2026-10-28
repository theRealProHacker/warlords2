; ovl19 stub 2fb5 file_off 0x49200 size 0x1aac

ovl19_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  c41eee40         les bx, ptr [0x40ee]                     
  0008  26833f00         cmp word ptr es:[bx], 0                  
  000c  7503             jne 0x11                                 
  000e  e9b600           jmp 0xc7                                 
  0011  9a2000c52f       lcall 0x2fc5, 0x20                       -> ovl21:01b3
  0016  b8042c           mov ax, 0x2c04                           
  0019  8ec0             mov es, ax                               
  001b  268b0e7b15       mov cx, word ptr es:[0x157b]             
  0020  eb34             jmp 0x56                                 
  0022  8bd9             mov bx, cx                               
  0024  6bdb41           imul bx, bx, 0x41                        
  0027  b8042c           mov ax, 0x2c04                           
  002a  8ec0             mov es, ax                               
  002c  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0031  98               cwde                                     
  0032  ba042c           mov dx, 0x2c04                           
  0035  8ec2             mov es, dx                               
  0037  263b061001       cmp ax, word ptr es:[0x110]              
  003c  7518             jne 0x56                                 
  003e  c41eee40         les bx, ptr [0x40ee]                     
  0042  03d9             add bx, cx                               
  0044  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  0049  750b             jne 0x56                                 
  004b  8b1eee40         mov bx, word ptr [0x40ee]                
  004f  03d9             add bx, cx                               
  0051  26c6475608       mov byte ptr es:[bx + 0x56], 8           
  0056  8bc1             mov ax, cx                               
  0058  49               dec cx                                   
  0059  0bc0             or ax, ax                                
  005b  75c5             jne 0x22                                 
  005d  c41eee40         les bx, ptr [0x40ee]                     
  0061  2683bf4a0200     cmp word ptr es:[bx + 0x24a], 0          
  0067  745e             je 0xc7                                  
  0069  33f6             xor si, si                               
  006b  eb4f             jmp 0xbc                                 
  006d  8bc6             mov ax, si                               
  006f  6bc05c           imul ax, ax, 0x5c                        
  0072  c41eee40         les bx, ptr [0x40ee]                     
  0076  03d8             add bx, ax                               
  0078  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  007e  743b             je 0xbb                                  
  0080  8bc6             mov ax, si                               
  0082  6bc05c           imul ax, ax, 0x5c                        
  0085  8b1eee40         mov bx, word ptr [0x40ee]                
  0089  03d8             add bx, ax                               
  008b  06               push es                                  
  008c  a1ee40           mov ax, word ptr [0x40ee]                
  008f  8cc2             mov dx, es                               
  0091  07               pop es                                   
  0092  2603875002       add ax, word ptr es:[bx + 0x250]         
  0097  8bd8             mov bx, ax                               
  0099  8ec2             mov es, dx                               
  009b  26c6475607       mov byte ptr es:[bx + 0x56], 7           
  00a0  56               push si                                  
  00a1  90               nop                                      
  00a2  0e               push cs                                  
  00a3  e82400           call 0xca                                
  00a6  59               pop cx                                   
  00a7  0bc0             or ax, ax                                
  00a9  7410             je 0xbb                                  
  00ab  8bc6             mov ax, si                               
  00ad  6bc05c           imul ax, ax, 0x5c                        
  00b0  c41eee40         les bx, ptr [0x40ee]                     
  00b4  03d8             add bx, ax                               
  00b6  26ff874c02       inc word ptr es:[bx + 0x24c]             
  00bb  46               inc si                                   
  00bc  c41eee40         les bx, ptr [0x40ee]                     
  00c0  2639b74a02       cmp word ptr es:[bx + 0x24a], si         
  00c5  7fa6             jg 0x6d                                  
  00c7  5e               pop si                                   
  00c8  5d               pop bp                                   
  00c9  cb               retf                                     

ovl19_00ca:  ; ENTRY
  00ca  55               push bp                                  
  00cb  8bec             mov bp, sp                               
  00cd  83ec02           sub sp, 2                                
  00d0  56               push si                                  
  00d1  57               push di                                  
  00d2  8b7606           mov si, word ptr [bp + 6]                
  00d5  b8042c           mov ax, 0x2c04                           
  00d8  8ec0             mov es, ax                               
  00da  268b1e1001       mov bx, word ptr es:[0x110]              
  00df  6bdb14           imul bx, bx, 0x14                        
  00e2  b8042c           mov ax, 0x2c04                           
  00e5  8ec0             mov es, ax                               
  00e7  26ffb79501       push word ptr es:[bx + 0x195]            
  00ec  b8042c           mov ax, 0x2c04                           
  00ef  8ec0             mov es, ax                               
  00f1  268b1e1001       mov bx, word ptr es:[0x110]              
  00f6  6bdb14           imul bx, bx, 0x14                        
  00f9  b8042c           mov ax, 0x2c04                           
  00fc  8ec0             mov es, ax                               
  00fe  26ffb79301       push word ptr es:[bx + 0x193]            
  0103  9a3900e830       lcall 0x30e8, 0x39                       -> ovl62:044a
  0108  83c404           add sp, 4                                
  010b  8bf8             mov di, ax                               
  010d  8bdf             mov bx, di                               
  010f  6bdb41           imul bx, bx, 0x41                        
  0112  b8042c           mov ax, 0x2c04                           
  0115  8ec0             mov es, ax                               
  0117  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  011d  7503             jne 0x122                                
  011f  e98d00           jmp 0x1af                                
  0122  8bdf             mov bx, di                               
  0124  6bdb41           imul bx, bx, 0x41                        
  0127  8ec0             mov es, ax                               
  0129  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  012e  98               cwde                                     
  012f  ba042c           mov dx, 0x2c04                           
  0132  8ec2             mov es, dx                               
  0134  263b061001       cmp ax, word ptr es:[0x110]              
  0139  7474             je 0x1af                                 
  013b  c746fe0000       mov word ptr [bp - 2], 0                 
  0140  c41eee40         les bx, ptr [0x40ee]                     
  0144  268b8f4a02       mov cx, word ptr es:[bx + 0x24a]         
  0149  eb4d             jmp 0x198                                
  014b  8bc1             mov ax, cx                               
  014d  6bc05c           imul ax, ax, 0x5c                        
  0150  c41eee40         les bx, ptr [0x40ee]                     
  0154  03d8             add bx, ax                               
  0156  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  015c  743a             je 0x198                                 
  015e  8bdf             mov bx, di                               
  0160  6bdb41           imul bx, bx, 0x41                        
  0163  b8042c           mov ax, 0x2c04                           
  0166  8ec0             mov es, ax                               
  0168  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  016d  98               cwde                                     
  016e  8bd1             mov dx, cx                               
  0170  6bd25c           imul dx, dx, 0x5c                        
  0173  c41eee40         les bx, ptr [0x40ee]                     
  0177  03da             add bx, dx                               
  0179  263b874e02       cmp ax, word ptr es:[bx + 0x24e]         
  017e  7413             je 0x193                                 
  0180  8bc1             mov ax, cx                               
  0182  6bc05c           imul ax, ax, 0x5c                        
  0185  c41eee40         les bx, ptr [0x40ee]                     
  0189  03d8             add bx, ax                               
  018b  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0191  7505             jne 0x198                                
  0193  c746fe0100       mov word ptr [bp - 2], 1                 
  0198  8bc1             mov ax, cx                               
  019a  49               dec cx                                   
  019b  0bc0             or ax, ax                                
  019d  75ac             jne 0x14b                                
  019f  837efe00         cmp word ptr [bp - 2], 0                 
  01a3  750a             jne 0x1af                                
  01a5  90               nop                                      
  01a6  0e               push cs                                  
  01a7  e85d04           call 0x607                               
  01aa  33c0             xor ax, ax                               
  01ac  e93a01           jmp 0x2e9                                
  01af  56               push si                                  
  01b0  90               nop                                      
  01b1  0e               push cs                                  
  01b2  e86702           call 0x41c                               
  01b5  59               pop cx                                   
  01b6  0bc0             or ax, ax                                
  01b8  750d             jne 0x1c7                                
  01ba  6a00             push 0                                   
  01bc  56               push si                                  
  01bd  90               nop                                      
  01be  0e               push cs                                  
  01bf  e8ab04           call 0x66d                               
  01c2  83c404           add sp, 4                                
  01c5  ebe3             jmp 0x1aa                                
  01c7  56               push si                                  
  01c8  90               nop                                      
  01c9  0e               push cs                                  
  01ca  e8ac13           call 0x1579                              
  01cd  59               pop cx                                   
  01ce  33ff             xor di, di                               
  01d0  c41eee40         les bx, ptr [0x40ee]                     
  01d4  268b8f4a02       mov cx, word ptr es:[bx + 0x24a]         
  01d9  eb3c             jmp 0x217                                
  01db  8bc1             mov ax, cx                               
  01dd  6bc05c           imul ax, ax, 0x5c                        
  01e0  c41eee40         les bx, ptr [0x40ee]                     
  01e4  03d8             add bx, ax                               
  01e6  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  01ec  7429             je 0x217                                 
  01ee  3bce             cmp cx, si                               
  01f0  7425             je 0x217                                 
  01f2  8bc1             mov ax, cx                               
  01f4  6bc05c           imul ax, ax, 0x5c                        
  01f7  8b1eee40         mov bx, word ptr [0x40ee]                
  01fb  03d8             add bx, ax                               
  01fd  268b875002       mov ax, word ptr es:[bx + 0x250]         
  0202  8bd6             mov dx, si                               
  0204  6bd25c           imul dx, dx, 0x5c                        
  0207  8b1eee40         mov bx, word ptr [0x40ee]                
  020b  03da             add bx, dx                               
  020d  263b875002       cmp ax, word ptr es:[bx + 0x250]         
  0212  7503             jne 0x217                                
  0214  bf0100           mov di, 1                                
  0217  8bc1             mov ax, cx                               
  0219  49               dec cx                                   
  021a  0bc0             or ax, ax                                
  021c  75bd             jne 0x1db                                
  021e  0bff             or di, di                                
  0220  752a             jne 0x24c                                
  0222  8bc6             mov ax, si                               
  0224  6bc05c           imul ax, ax, 0x5c                        
  0227  c41eee40         les bx, ptr [0x40ee]                     
  022b  03d8             add bx, ax                               
  022d  268b9f5002       mov bx, word ptr es:[bx + 0x250]         
  0232  6bdb41           imul bx, bx, 0x41                        
  0235  b8042c           mov ax, 0x2c04                           
  0238  8ec0             mov es, ax                               
  023a  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  023f  98               cwde                                     
  0240  ba042c           mov dx, 0x2c04                           
  0243  8ec2             mov es, dx                               
  0245  263b061001       cmp ax, word ptr es:[0x110]              
  024a  740e             je 0x25a                                 
  024c  56               push si                                  
  024d  90               nop                                      
  024e  0e               push cs                                  
  024f  e89b00           call 0x2ed                               
  0252  59               pop cx                                   
  0253  0bc0             or ax, ax                                
  0255  7503             jne 0x25a                                
  0257  e950ff           jmp 0x1aa                                
  025a  56               push si                                  
  025b  90               nop                                      
  025c  0e               push cs                                  
  025d  e83607           call 0x996                               
  0260  59               pop cx                                   
  0261  8bc6             mov ax, si                               
  0263  6bc05c           imul ax, ax, 0x5c                        
  0266  c41eee40         les bx, ptr [0x40ee]                     
  026a  03d8             add bx, ax                               
  026c  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  0272  7503             jne 0x277                                
  0274  e933ff           jmp 0x1aa                                
  0277  6a01             push 1                                   
  0279  8bc6             mov ax, si                               
  027b  6bc05c           imul ax, ax, 0x5c                        
  027e  c41eee40         les bx, ptr [0x40ee]                     
  0282  03d8             add bx, ax                               
  0284  26ffb75002       push word ptr es:[bx + 0x250]            
  0289  9a2500d62f       lcall 0x2fd6, 0x25                       -> ovl24:023f
  028e  83c404           add sp, 4                                
  0291  56               push si                                  
  0292  90               nop                                      
  0293  0e               push cs                                  
  0294  e85204           call 0x6e9                               
  0297  59               pop cx                                   
  0298  0bc0             or ax, ax                                
  029a  742d             je 0x2c9                                 
  029c  8bc6             mov ax, si                               
  029e  6bc05c           imul ax, ax, 0x5c                        
  02a1  c41eee40         les bx, ptr [0x40ee]                     
  02a5  03d8             add bx, ax                               
  02a7  2683bf500200     cmp word ptr es:[bx + 0x250], 0          
  02ad  7c1a             jl 0x2c9                                 
  02af  6a01             push 1                                   
  02b1  8bc6             mov ax, si                               
  02b3  6bc05c           imul ax, ax, 0x5c                        
  02b6  8b1eee40         mov bx, word ptr [0x40ee]                
  02ba  03d8             add bx, ax                               
  02bc  26ffb75002       push word ptr es:[bx + 0x250]            
  02c1  9a2500d62f       lcall 0x2fd6, 0x25                       -> ovl24:023f
  02c6  83c404           add sp, 4                                
  02c9  8bc6             mov ax, si                               
  02cb  6bc05c           imul ax, ax, 0x5c                        
  02ce  c41eee40         les bx, ptr [0x40ee]                     
  02d2  03d8             add bx, ax                               
  02d4  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  02da  7503             jne 0x2df                                
  02dc  e9cbfe           jmp 0x1aa                                
  02df  56               push si                                  
  02e0  90               nop                                      
  02e1  0e               push cs                                  
  02e2  e81814           call 0x16fd                              
  02e5  59               pop cx                                   
  02e6  b80100           mov ax, 1                                
  02e9  5f               pop di                                   
  02ea  5e               pop si                                   
  02eb  c9               leave                                    
  02ec  cb               retf                                     

ovl19_02ed:  ; ENTRY
  02ed  55               push bp                                  
  02ee  8bec             mov bp, sp                               
  02f0  83ec16           sub sp, 0x16                             
  02f3  56               push si                                  
  02f4  57               push di                                  
  02f5  8b7606           mov si, word ptr [bp + 6]                
  02f8  c746fcffff       mov word ptr [bp - 4], 0xffff            
  02fd  c746fae803       mov word ptr [bp - 6], 0x3e8             
  0302  8bc6             mov ax, si                               
  0304  6bc05c           imul ax, ax, 0x5c                        
  0307  c41eee40         les bx, ptr [0x40ee]                     
  030b  03d8             add bx, ax                               
  030d  268b9f5002       mov bx, word ptr es:[bx + 0x250]         
  0312  6bdb41           imul bx, bx, 0x41                        
  0315  b8042c           mov ax, 0x2c04                           
  0318  8ec0             mov es, ax                               
  031a  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  031f  8946f8           mov word ptr [bp - 8], ax                
  0322  8bc6             mov ax, si                               
  0324  6bc05c           imul ax, ax, 0x5c                        
  0327  c41eee40         les bx, ptr [0x40ee]                     
  032b  03d8             add bx, ax                               
  032d  268b9f5002       mov bx, word ptr es:[bx + 0x250]         
  0332  6bdb41           imul bx, bx, 0x41                        
  0335  b8042c           mov ax, 0x2c04                           
  0338  8ec0             mov es, ax                               
  033a  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  033f  8946f6           mov word ptr [bp - 0xa], ax              
  0342  16               push ss                                  
  0343  8d46ea           lea ax, [bp - 0x16]                      
  0346  50               push ax                                  
  0347  16               push ss                                  
  0348  8d46f0           lea ax, [bp - 0x10]                      
  034b  50               push ax                                  
  034c  6a00             push 0                                   
  034e  8bc6             mov ax, si                               
  0350  6bc05c           imul ax, ax, 0x5c                        
  0353  c41eee40         les bx, ptr [0x40ee]                     
  0357  03d8             add bx, ax                               
  0359  26ffb75002       push word ptr es:[bx + 0x250]            
  035e  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  0363  83c40c           add sp, 0xc                              
  0366  c746fe0600       mov word ptr [bp - 2], 6                 
  036b  eb74             jmp 0x3e1                                
  036d  8d46f0           lea ax, [bp - 0x10]                      
  0370  8b5efe           mov bx, word ptr [bp - 2]                
  0373  03d8             add bx, ax                               
  0375  368a07           mov al, byte ptr ss:[bx]                 
  0378  b400             mov ah, 0                                
  037a  8bf8             mov di, ax                               
  037c  3dff00           cmp ax, 0xff                             
  037f  7460             je 0x3e1                                 
  0381  8bdf             mov bx, di                               
  0383  6bdb41           imul bx, bx, 0x41                        
  0386  b8042c           mov ax, 0x2c04                           
  0389  8ec0             mov es, ax                               
  038b  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0390  98               cwde                                     
  0391  ba042c           mov dx, 0x2c04                           
  0394  8ec2             mov es, dx                               
  0396  263b061001       cmp ax, word ptr es:[0x110]              
  039b  7544             jne 0x3e1                                
  039d  57               push di                                  
  039e  9a2500e82f       lcall 0x2fe8, 0x25                       -> ovl27:07f8
  03a3  59               pop cx                                   
  03a4  0bc0             or ax, ax                                
  03a6  7539             jne 0x3e1                                
  03a8  ff76f6           push word ptr [bp - 0xa]                 
  03ab  ff76f8           push word ptr [bp - 8]                   
  03ae  8bdf             mov bx, di                               
  03b0  6bdb41           imul bx, bx, 0x41                        
  03b3  b8042c           mov ax, 0x2c04                           
  03b6  8ec0             mov es, ax                               
  03b8  26ffb77f15       push word ptr es:[bx + 0x157f]           
  03bd  8bdf             mov bx, di                               
  03bf  6bdb41           imul bx, bx, 0x41                        
  03c2  b8042c           mov ax, 0x2c04                           
  03c5  8ec0             mov es, ax                               
  03c7  26ffb77d15       push word ptr es:[bx + 0x157d]           
  03cc  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  03d1  83c408           add sp, 8                                
  03d4  8bd0             mov dx, ax                               
  03d6  3b56fa           cmp dx, word ptr [bp - 6]                
  03d9  7d06             jge 0x3e1                                
  03db  8956fa           mov word ptr [bp - 6], dx                
  03de  897efc           mov word ptr [bp - 4], di                
  03e1  8b46fe           mov ax, word ptr [bp - 2]                
  03e4  ff4efe           dec word ptr [bp - 2]                    
  03e7  0bc0             or ax, ax                                
  03e9  7582             jne 0x36d                                
  03eb  837efcff         cmp word ptr [bp - 4], -1                
  03ef  7415             je 0x406                                 
  03f1  8bc6             mov ax, si                               
  03f3  6bc05c           imul ax, ax, 0x5c                        
  03f6  c41eee40         les bx, ptr [0x40ee]                     
  03fa  03d8             add bx, ax                               
  03fc  8b46fc           mov ax, word ptr [bp - 4]                
  03ff  2689875002       mov word ptr es:[bx + 0x250], ax         
  0404  eb0f             jmp 0x415                                
  0406  6a01             push 1                                   
  0408  56               push si                                  
  0409  90               nop                                      
  040a  0e               push cs                                  
  040b  e85f02           call 0x66d                               
  040e  83c404           add sp, 4                                
  0411  33c0             xor ax, ax                               
  0413  eb03             jmp 0x418                                
  0415  b80100           mov ax, 1                                
  0418  5f               pop di                                   
  0419  5e               pop si                                   
  041a  c9               leave                                    
  041b  cb               retf                                     

ovl19_041c:  ; ENTRY
  041c  55               push bp                                  
  041d  8bec             mov bp, sp                               
  041f  83ec16           sub sp, 0x16                             
  0422  56               push si                                  
  0423  57               push di                                  
  0424  8b7606           mov si, word ptr [bp + 6]                
  0427  c746fe0000       mov word ptr [bp - 2], 0                 
  042c  8bc6             mov ax, si                               
  042e  6bc05c           imul ax, ax, 0x5c                        
  0431  c41eee40         les bx, ptr [0x40ee]                     
  0435  03d8             add bx, ax                               
  0437  268b874e02       mov ax, word ptr es:[bx + 0x24e]         
  043c  8946fc           mov word ptr [bp - 4], ax                
  043f  8bc6             mov ax, si                               
  0441  6bc05c           imul ax, ax, 0x5c                        
  0444  8b1eee40         mov bx, word ptr [0x40ee]                
  0448  03d8             add bx, ax                               
  044a  268b875002       mov ax, word ptr es:[bx + 0x250]         
  044f  8946fa           mov word ptr [bp - 6], ax                
  0452  33d2             xor dx, dx                               
  0454  eb58             jmp 0x4ae                                
  0456  8bc6             mov ax, si                               
  0458  6bc05c           imul ax, ax, 0x5c                        
  045b  c41eee40         les bx, ptr [0x40ee]                     
  045f  03d8             add bx, ax                               
  0461  8bc2             mov ax, dx                               
  0463  d1e0             shl ax, 1                                
  0465  03d8             add bx, ax                               
  0467  268b8f5a02       mov cx, word ptr es:[bx + 0x25a]         
  046c  83f9ff           cmp cx, -1                               
  046f  743c             je 0x4ad                                 
  0471  c41eee40         les bx, ptr [0x40ee]                     
  0475  26394f46         cmp word ptr es:[bx + 0x46], cx          
  0479  741a             je 0x495                                 
  047b  8bd9             mov bx, cx                               
  047d  6bdb41           imul bx, bx, 0x41                        
  0480  b8042c           mov ax, 0x2c04                           
  0483  8ec0             mov es, ax                               
  0485  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  048a  98               cwde                                     
  048b  3b46fc           cmp ax, word ptr [bp - 4]                
  048e  7505             jne 0x495                                
  0490  ff46fe           inc word ptr [bp - 2]                    
  0493  eb18             jmp 0x4ad                                
  0495  8bc6             mov ax, si                               
  0497  6bc05c           imul ax, ax, 0x5c                        
  049a  c41eee40         les bx, ptr [0x40ee]                     
  049e  03d8             add bx, ax                               
  04a0  8bc2             mov ax, dx                               
  04a2  d1e0             shl ax, 1                                
  04a4  03d8             add bx, ax                               
  04a6  26c7875a02ffff   mov word ptr es:[bx + 0x25a], 0xffff     
  04ad  42               inc dx                                   
  04ae  83fa06           cmp dx, 6                                
  04b1  7ca3             jl 0x456                                 
  04b3  16               push ss                                  
  04b4  8d46ec           lea ax, [bp - 0x14]                      
  04b7  50               push ax                                  
  04b8  16               push ss                                  
  04b9  8d46f2           lea ax, [bp - 0xe]                       
  04bc  50               push ax                                  
  04bd  6a00             push 0                                   
  04bf  ff76fa           push word ptr [bp - 6]                   
  04c2  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  04c7  83c40c           add sp, 0xc                              
  04ca  bf0600           mov di, 6                                
  04cd  e92601           jmp 0x5f6                                
  04d0  8a43f2           mov al, byte ptr [bp + di - 0xe]         
  04d3  b400             mov ah, 0                                
  04d5  8946f8           mov word ptr [bp - 8], ax                
  04d8  3dff00           cmp ax, 0xff                             
  04db  7503             jne 0x4e0                                
  04dd  e91601           jmp 0x5f6                                
  04e0  8b5ef8           mov bx, word ptr [bp - 8]                
  04e3  6bdb41           imul bx, bx, 0x41                        
  04e6  b8042c           mov ax, 0x2c04                           
  04e9  8ec0             mov es, ax                               
  04eb  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  04f0  98               cwde                                     
  04f1  3b46fc           cmp ax, word ptr [bp - 4]                
  04f4  7403             je 0x4f9                                 
  04f6  e9fd00           jmp 0x5f6                                
  04f9  c41eee40         les bx, ptr [0x40ee]                     
  04fd  035ef8           add bx, word ptr [bp - 8]                
  0500  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  0506  7403             je 0x50b                                 
  0508  e9eb00           jmp 0x5f6                                
  050b  b90100           mov cx, 1                                
  050e  ba0600           mov dx, 6                                
  0511  eb1d             jmp 0x530                                
  0513  8bc6             mov ax, si                               
  0515  6bc05c           imul ax, ax, 0x5c                        
  0518  c41eee40         les bx, ptr [0x40ee]                     
  051c  03d8             add bx, ax                               
  051e  8bc2             mov ax, dx                               
  0520  d1e0             shl ax, 1                                
  0522  03d8             add bx, ax                               
  0524  268b875a02       mov ax, word ptr es:[bx + 0x25a]         
  0529  3b46f8           cmp ax, word ptr [bp - 8]                
  052c  7502             jne 0x530                                
  052e  33c9             xor cx, cx                               
  0530  8bc2             mov ax, dx                               
  0532  4a               dec dx                                   
  0533  0bc0             or ax, ax                                
  0535  75dc             jne 0x513                                
  0537  0bc9             or cx, cx                                
  0539  7503             jne 0x53e                                
  053b  e9b800           jmp 0x5f6                                
  053e  ff46fe           inc word ptr [bp - 2]                    
  0541  b9ffff           mov cx, 0xffff                           
  0544  c746ea0000       mov word ptr [bp - 0x16], 0              
  0549  ba0600           mov dx, 6                                
  054c  eb58             jmp 0x5a6                                
  054e  8bc6             mov ax, si                               
  0550  6bc05c           imul ax, ax, 0x5c                        
  0553  c41eee40         les bx, ptr [0x40ee]                     
  0557  03d8             add bx, ax                               
  0559  8bc2             mov ax, dx                               
  055b  d1e0             shl ax, 1                                
  055d  03d8             add bx, ax                               
  055f  2683bf5a02ff     cmp word ptr es:[bx + 0x25a], -1         
  0565  7509             jne 0x570                                
  0567  8bca             mov cx, dx                               
  0569  c746eaffff       mov word ptr [bp - 0x16], 0xffff         
  056e  eb3d             jmp 0x5ad                                
  0570  8bc6             mov ax, si                               
  0572  6bc05c           imul ax, ax, 0x5c                        
  0575  c41eee40         les bx, ptr [0x40ee]                     
  0579  03d8             add bx, ax                               
  057b  8bc2             mov ax, dx                               
  057d  d1e0             shl ax, 1                                
  057f  03d8             add bx, ax                               
  0581  268b877202       mov ax, word ptr es:[bx + 0x272]         
  0586  3b46ea           cmp ax, word ptr [bp - 0x16]             
  0589  7e1b             jle 0x5a6                                
  058b  8bca             mov cx, dx                               
  058d  8bc6             mov ax, si                               
  058f  6bc05c           imul ax, ax, 0x5c                        
  0592  8b1eee40         mov bx, word ptr [0x40ee]                
  0596  03d8             add bx, ax                               
  0598  8bc2             mov ax, dx                               
  059a  d1e0             shl ax, 1                                
  059c  03d8             add bx, ax                               
  059e  268b877202       mov ax, word ptr es:[bx + 0x272]         
  05a3  8946ea           mov word ptr [bp - 0x16], ax             
  05a6  8bc2             mov ax, dx                               
  05a8  4a               dec dx                                   
  05a9  0bc0             or ax, ax                                
  05ab  75a1             jne 0x54e                                
  05ad  83f9ff           cmp cx, -1                               
  05b0  7444             je 0x5f6                                 
  05b2  837eeaff         cmp word ptr [bp - 0x16], -1             
  05b6  740a             je 0x5c2                                 
  05b8  8a43ec           mov al, byte ptr [bp + di - 0x14]        
  05bb  b400             mov ah, 0                                
  05bd  3b46ea           cmp ax, word ptr [bp - 0x16]             
  05c0  7d34             jge 0x5f6                                
  05c2  8bc6             mov ax, si                               
  05c4  6bc05c           imul ax, ax, 0x5c                        
  05c7  c41eee40         les bx, ptr [0x40ee]                     
  05cb  03d8             add bx, ax                               
  05cd  8bc1             mov ax, cx                               
  05cf  d1e0             shl ax, 1                                
  05d1  03d8             add bx, ax                               
  05d3  8b46f8           mov ax, word ptr [bp - 8]                
  05d6  2689875a02       mov word ptr es:[bx + 0x25a], ax         
  05db  8a43ec           mov al, byte ptr [bp + di - 0x14]        
  05de  b400             mov ah, 0                                
  05e0  8bd6             mov dx, si                               
  05e2  6bd25c           imul dx, dx, 0x5c                        
  05e5  8b1eee40         mov bx, word ptr [0x40ee]                
  05e9  03da             add bx, dx                               
  05eb  8bd1             mov dx, cx                               
  05ed  d1e2             shl dx, 1                                
  05ef  03da             add bx, dx                               
  05f1  2689877202       mov word ptr es:[bx + 0x272], ax         
  05f6  8bc7             mov ax, di                               
  05f8  4f               dec di                                   
  05f9  0bc0             or ax, ax                                
  05fb  7403             je 0x600                                 
  05fd  e9d0fe           jmp 0x4d0                                
  0600  8b46fe           mov ax, word ptr [bp - 2]                
  0603  5f               pop di                                   
  0604  5e               pop si                                   
  0605  c9               leave                                    
  0606  cb               retf                                     

ovl19_0607:  ; ENTRY
  0607  55               push bp                                  
  0608  8bec             mov bp, sp                               
  060a  56               push si                                  
  060b  b9ffff           mov cx, 0xffff                           
  060e  beffff           mov si, 0xffff                           
  0611  c41eee40         les bx, ptr [0x40ee]                     
  0615  268b974a02       mov dx, word ptr es:[bx + 0x24a]         
  061a  eb37             jmp 0x653                                
  061c  8bc2             mov ax, dx                               
  061e  6bc05c           imul ax, ax, 0x5c                        
  0621  c41eee40         les bx, ptr [0x40ee]                     
  0625  03d8             add bx, ax                               
  0627  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  062d  7424             je 0x653                                 
  062f  8bc2             mov ax, dx                               
  0631  6bc05c           imul ax, ax, 0x5c                        
  0634  8b1eee40         mov bx, word ptr [0x40ee]                
  0638  03d8             add bx, ax                               
  063a  2639b74c02       cmp word ptr es:[bx + 0x24c], si         
  063f  7e12             jle 0x653                                
  0641  8bc2             mov ax, dx                               
  0643  6bc05c           imul ax, ax, 0x5c                        
  0646  8b1eee40         mov bx, word ptr [0x40ee]                
  064a  03d8             add bx, ax                               
  064c  268bb74c02       mov si, word ptr es:[bx + 0x24c]         
  0651  8bca             mov cx, dx                               
  0653  8bc2             mov ax, dx                               
  0655  4a               dec dx                                   
  0656  0bc0             or ax, ax                                
  0658  75c2             jne 0x61c                                
  065a  83f9ff           cmp cx, -1                               
  065d  740b             je 0x66a                                 
  065f  6a02             push 2                                   
  0661  51               push cx                                  
  0662  90               nop                                      
  0663  0e               push cs                                  
  0664  e80600           call 0x66d                               
  0667  83c404           add sp, 4                                
  066a  5e               pop si                                   
  066b  5d               pop bp                                   
  066c  cb               retf                                     

ovl19_066d:  ; ENTRY
  066d  55               push bp                                  
  066e  8bec             mov bp, sp                               
  0670  56               push si                                  
  0671  8b4e06           mov cx, word ptr [bp + 6]                
  0674  8bc1             mov ax, cx                               
  0676  6bc05c           imul ax, ax, 0x5c                        
  0679  c41eee40         les bx, ptr [0x40ee]                     
  067d  03d8             add bx, ax                               
  067f  06               push es                                  
  0680  a1ee40           mov ax, word ptr [0x40ee]                
  0683  8cc2             mov dx, es                               
  0685  07               pop es                                   
  0686  2603875002       add ax, word ptr es:[bx + 0x250]         
  068b  8bd8             mov bx, ax                               
  068d  8ec2             mov es, dx                               
  068f  26c6475608       mov byte ptr es:[bx + 0x56], 8           
  0694  be0400           mov si, 4                                
  0697  eb3f             jmp 0x6d8                                
  0699  8bc1             mov ax, cx                               
  069b  6bc05c           imul ax, ax, 0x5c                        
  069e  c41eee40         les bx, ptr [0x40ee]                     
  06a2  03d8             add bx, ax                               
  06a4  8bc6             mov ax, si                               
  06a6  d1e0             shl ax, 1                                
  06a8  03d8             add bx, ax                               
  06aa  2683bf5202ff     cmp word ptr es:[bx + 0x252], -1         
  06b0  7426             je 0x6d8                                 
  06b2  8bc1             mov ax, cx                               
  06b4  6bc05c           imul ax, ax, 0x5c                        
  06b7  8b1eee40         mov bx, word ptr [0x40ee]                
  06bb  03d8             add bx, ax                               
  06bd  8bc6             mov ax, si                               
  06bf  d1e0             shl ax, 1                                
  06c1  03d8             add bx, ax                               
  06c3  06               push es                                  
  06c4  a1ee40           mov ax, word ptr [0x40ee]                
  06c7  8cc2             mov dx, es                               
  06c9  07               pop es                                   
  06ca  2603875202       add ax, word ptr es:[bx + 0x252]         
  06cf  8bd8             mov bx, ax                               
  06d1  8ec2             mov es, dx                               
  06d3  26c6475608       mov byte ptr es:[bx + 0x56], 8           
  06d8  8bc6             mov ax, si                               
  06da  4e               dec si                                   
  06db  0bc0             or ax, ax                                
  06dd  75ba             jne 0x699                                
  06df  51               push cx                                  
  06e0  9a3400e82f       lcall 0x2fe8, 0x34                       -> ovl27:08ba
  06e5  59               pop cx                                   
  06e6  5e               pop si                                   
  06e7  5d               pop bp                                   
  06e8  cb               retf                                     

ovl19_06e9:  ; ENTRY
  06e9  55               push bp                                  
  06ea  8bec             mov bp, sp                               
  06ec  83ec1c           sub sp, 0x1c                             
  06ef  56               push si                                  
  06f0  57               push di                                  
  06f1  8b7e06           mov di, word ptr [bp + 6]                
  06f4  8bc7             mov ax, di                               
  06f6  6bc05c           imul ax, ax, 0x5c                        
  06f9  c41eee40         les bx, ptr [0x40ee]                     
  06fd  03d8             add bx, ax                               
  06ff  268b975002       mov dx, word ptr es:[bx + 0x250]         
  0704  c746fcffff       mov word ptr [bp - 4], 0xffff            
  0709  c746faffff       mov word ptr [bp - 6], 0xffff            
  070e  6a00             push 0                                   
  0710  16               push ss                                  
  0711  8d46e4           lea ax, [bp - 0x1c]                      
  0714  50               push ax                                  
  0715  8bda             mov bx, dx                               
  0717  6bdb41           imul bx, bx, 0x41                        
  071a  b8042c           mov ax, 0x2c04                           
  071d  8ec0             mov es, ax                               
  071f  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0724  8bda             mov bx, dx                               
  0726  6bdb41           imul bx, bx, 0x41                        
  0729  b8042c           mov ax, 0x2c04                           
  072c  8ec0             mov es, ax                               
  072e  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0733  40               inc ax                                   
  0734  50               push ax                                  
  0735  9a5200f72f       lcall 0x2ff7, 0x52                       -> ovl29:12c9
  073a  83c40a           add sp, 0xa                              
  073d  8946f8           mov word ptr [bp - 8], ax                
  0740  0bc0             or ax, ax                                
  0742  7505             jne 0x749                                
  0744  33c0             xor ax, ax                               
  0746  e96501           jmp 0x8ae                                
  0749  33f6             xor si, si                               
  074b  e9ea00           jmp 0x838                                
  074e  8bc7             mov ax, di                               
  0750  6bc05c           imul ax, ax, 0x5c                        
  0753  c41eee40         les bx, ptr [0x40ee]                     
  0757  03d8             add bx, ax                               
  0759  8bc6             mov ax, si                               
  075b  d1e0             shl ax, 1                                
  075d  03d8             add bx, ax                               
  075f  268b875a02       mov ax, word ptr es:[bx + 0x25a]         
  0764  8946f4           mov word ptr [bp - 0xc], ax              
  0767  837ef4ff         cmp word ptr [bp - 0xc], -1              
  076b  7503             jne 0x770                                
  076d  e9c700           jmp 0x837                                
  0770  8bc7             mov ax, di                               
  0772  6bc05c           imul ax, ax, 0x5c                        
  0775  c41eee40         les bx, ptr [0x40ee]                     
  0779  03d8             add bx, ax                               
  077b  8bc6             mov ax, si                               
  077d  d1e0             shl ax, 1                                
  077f  03d8             add bx, ax                               
  0781  268b877202       mov ax, word ptr es:[bx + 0x272]         
  0786  50               push ax                                  
  0787  a1005e           mov ax, word ptr [0x5e00]                
  078a  05feff           add ax, 0xfffe                           
  078d  3d0100           cmp ax, 1                                
  0790  7d05             jge 0x797                                
  0792  b80100           mov ax, 1                                
  0795  eb06             jmp 0x79d                                
  0797  a1005e           mov ax, word ptr [0x5e00]                
  079a  05feff           add ax, 0xfffe                           
  079d  8bd8             mov bx, ax                               
  079f  58               pop ax                                   
  07a0  99               cdq                                      
  07a1  f7fb             idiv bx                                  
  07a3  40               inc ax                                   
  07a4  8946fe           mov word ptr [bp - 2], ax                
  07a7  8b5ef4           mov bx, word ptr [bp - 0xc]              
  07aa  6bdb41           imul bx, bx, 0x41                        
  07ad  b8042c           mov ax, 0x2c04                           
  07b0  8ec0             mov es, ax                               
  07b2  26ffb77f15       push word ptr es:[bx + 0x157f]           
  07b7  8b5ef4           mov bx, word ptr [bp - 0xc]              
  07ba  6bdb41           imul bx, bx, 0x41                        
  07bd  b8042c           mov ax, 0x2c04                           
  07c0  8ec0             mov es, ax                               
  07c2  26ffb77d15       push word ptr es:[bx + 0x157d]           
  07c7  9a6100f72f       lcall 0x2ff7, 0x61                       -> ovl29:15c5
  07cc  83c404           add sp, 4                                
  07cf  8946f6           mov word ptr [bp - 0xa], ax              
  07d2  666a04           push 4                                   
  07d5  6a01             push 1                                   
  07d7  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  07dc  83c406           add sp, 6                                
  07df  8bd7             mov dx, di                               
  07e1  6bd25c           imul dx, dx, 0x5c                        
  07e4  c41eee40         les bx, ptr [0x40ee]                     
  07e8  03da             add bx, dx                               
  07ea  8bd6             mov dx, si                               
  07ec  d1e2             shl dx, 1                                
  07ee  03da             add bx, dx                               
  07f0  50               push ax                                  
  07f1  06               push es                                  
  07f2  53               push bx                                  
  07f3  b80a00           mov ax, 0xa                              
  07f6  2b46fe           sub ax, word ptr [bp - 2]                
  07f9  7d04             jge 0x7ff                                
  07fb  33c0             xor ax, ax                               
  07fd  eb06             jmp 0x805                                
  07ff  b80a00           mov ax, 0xa                              
  0802  2b46fe           sub ax, word ptr [bp - 2]                
  0805  0346f6           add ax, word ptr [bp - 0xa]              
  0808  5b               pop bx                                   
  0809  07               pop es                                   
  080a  2603877e02       add ax, word ptr es:[bx + 0x27e]         
  080f  5a               pop dx                                   
  0810  03c2             add ax, dx                               
  0812  8bd0             mov dx, ax                               
  0814  837efe01         cmp word ptr [bp - 2], 1                 
  0818  7503             jne 0x81d                                
  081a  83c264           add dx, 0x64                             
  081d  837ef64b         cmp word ptr [bp - 0xa], 0x4b            
  0821  7f06             jg 0x829                                 
  0823  837ef808         cmp word ptr [bp - 8], 8                 
  0827  7c0e             jl 0x837                                 
  0829  3b56fa           cmp dx, word ptr [bp - 6]                
  082c  7e09             jle 0x837                                
  082e  8956fa           mov word ptr [bp - 6], dx                
  0831  8b46f4           mov ax, word ptr [bp - 0xc]              
  0834  8946fc           mov word ptr [bp - 4], ax                
  0837  46               inc si                                   
  0838  83fe06           cmp si, 6                                
  083b  7d03             jge 0x840                                
  083d  e90eff           jmp 0x74e                                
  0840  837efcff         cmp word ptr [bp - 4], -1                
  0844  7503             jne 0x849                                
  0846  e9fbfe           jmp 0x744                                
  0849  16               push ss                                  
  084a  8d46e4           lea ax, [bp - 0x1c]                      
  084d  50               push ax                                  
  084e  57               push di                                  
  084f  90               nop                                      
  0850  0e               push cs                                  
  0851  e85e00           call 0x8b2                               
  0854  83c406           add sp, 6                                
  0857  be0800           mov si, 8                                
  085a  eb37             jmp 0x893                                
  085c  8bde             mov bx, si                               
  085e  d1e3             shl bx, 1                                
  0860  8d46e4           lea ax, [bp - 0x1c]                      
  0863  03d8             add bx, ax                               
  0865  36833fff         cmp word ptr ss:[bx], -1                 
  0869  7428             je 0x893                                 
  086b  8bc7             mov ax, di                               
  086d  40               inc ax                                   
  086e  250700           and ax, 7                                
  0871  8bde             mov bx, si                               
  0873  d1e3             shl bx, 1                                
  0875  8d56e4           lea dx, [bp - 0x1c]                      
  0878  03da             add bx, dx                               
  087a  368b1f           mov bx, word ptr ss:[bx]                 
  087d  6bdb16           imul bx, bx, 0x16                        
  0880  ba1d1e           mov dx, 0x1e1d                           
  0883  8ec2             mov es, dx                               
  0885  2680a78e888f     and byte ptr es:[bx - 0x7772], 0x8f      
  088b  c0e004           shl al, 4                                
  088e  2608878e88       or byte ptr es:[bx - 0x7772], al         
  0893  8bc6             mov ax, si                               
  0895  4e               dec si                                   
  0896  0bc0             or ax, ax                                
  0898  75c2             jne 0x85c                                
  089a  ff76fc           push word ptr [bp - 4]                   
  089d  16               push ss                                  
  089e  8d46e4           lea ax, [bp - 0x1c]                      
  08a1  50               push ax                                  
  08a2  57               push di                                  
  08a3  90               nop                                      
  08a4  0e               push cs                                  
  08a5  e87306           call 0xf1b                               
  08a8  83c408           add sp, 8                                
  08ab  b80100           mov ax, 1                                
  08ae  5f               pop di                                   
  08af  5e               pop si                                   
  08b0  c9               leave                                    
  08b1  cb               retf                                     

ovl19_08b2:  ; ENTRY
  08b2  55               push bp                                  
  08b3  8bec             mov bp, sp                               
  08b5  83ec02           sub sp, 2                                
  08b8  56               push si                                  
  08b9  57               push di                                  
  08ba  8b7e06           mov di, word ptr [bp + 6]                
  08bd  b90400           mov cx, 4                                
  08c0  e9c500           jmp 0x988                                
  08c3  8bc7             mov ax, di                               
  08c5  6bc05c           imul ax, ax, 0x5c                        
  08c8  c41eee40         les bx, ptr [0x40ee]                     
  08cc  03d8             add bx, ax                               
  08ce  8bc1             mov ax, cx                               
  08d0  d1e0             shl ax, 1                                
  08d2  03d8             add bx, ax                               
  08d4  2683bf8a02ff     cmp word ptr es:[bx + 0x28a], -1         
  08da  7403             je 0x8df                                 
  08dc  e9a900           jmp 0x988                                
  08df  beffff           mov si, 0xffff                           
  08e2  c746feffff       mov word ptr [bp - 2], 0xffff            
  08e7  ba0800           mov dx, 8                                
  08ea  eb78             jmp 0x964                                
  08ec  8bc2             mov ax, dx                               
  08ee  d1e0             shl ax, 1                                
  08f0  c45e08           les bx, ptr [bp + 8]                     
  08f3  03d8             add bx, ax                               
  08f5  26833fff         cmp word ptr es:[bx], -1                 
  08f9  7469             je 0x964                                 
  08fb  8bc2             mov ax, dx                               
  08fd  d1e0             shl ax, 1                                
  08ff  c45e08           les bx, ptr [bp + 8]                     
  0902  03d8             add bx, ax                               
  0904  268b1f           mov bx, word ptr es:[bx]                 
  0907  6bdb16           imul bx, bx, 0x16                        
  090a  b81d1e           mov ax, 0x1e1d                           
  090d  8ec0             mov es, ax                               
  090f  2680bf84881c     cmp byte ptr es:[bx - 0x777c], 0x1c      
  0915  750e             jne 0x925                                
  0917  8bc2             mov ax, dx                               
  0919  d1e0             shl ax, 1                                
  091b  c45e08           les bx, ptr [bp + 8]                     
  091e  03d8             add bx, ax                               
  0920  268b37           mov si, word ptr es:[bx]                 
  0923  eb46             jmp 0x96b                                
  0925  8bc2             mov ax, dx                               
  0927  d1e0             shl ax, 1                                
  0929  c45e08           les bx, ptr [bp + 8]                     
  092c  03d8             add bx, ax                               
  092e  268b1f           mov bx, word ptr es:[bx]                 
  0931  6bdb16           imul bx, bx, 0x16                        
  0934  b81d1e           mov ax, 0x1e1d                           
  0937  8ec0             mov es, ax                               
  0939  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  093e  98               cwde                                     
  093f  3b46fe           cmp ax, word ptr [bp - 2]                
  0942  7e20             jle 0x964                                
  0944  8bc2             mov ax, dx                               
  0946  d1e0             shl ax, 1                                
  0948  c45e08           les bx, ptr [bp + 8]                     
  094b  03d8             add bx, ax                               
  094d  268b37           mov si, word ptr es:[bx]                 
  0950  268b1f           mov bx, word ptr es:[bx]                 
  0953  6bdb16           imul bx, bx, 0x16                        
  0956  b81d1e           mov ax, 0x1e1d                           
  0959  8ec0             mov es, ax                               
  095b  268a878888       mov al, byte ptr es:[bx - 0x7778]        
  0960  98               cwde                                     
  0961  8946fe           mov word ptr [bp - 2], ax                
  0964  8bc2             mov ax, dx                               
  0966  4a               dec dx                                   
  0967  0bc0             or ax, ax                                
  0969  7581             jne 0x8ec                                
  096b  83feff           cmp si, -1                               
  096e  7422             je 0x992                                 
  0970  8bc7             mov ax, di                               
  0972  6bc05c           imul ax, ax, 0x5c                        
  0975  c41eee40         les bx, ptr [0x40ee]                     
  0979  03d8             add bx, ax                               
  097b  8bc1             mov ax, cx                               
  097d  d1e0             shl ax, 1                                
  097f  03d8             add bx, ax                               
  0981  2689b78a02       mov word ptr es:[bx + 0x28a], si         
  0986  eb0a             jmp 0x992                                
  0988  8bc1             mov ax, cx                               
  098a  49               dec cx                                   
  098b  0bc0             or ax, ax                                
  098d  7403             je 0x992                                 
  098f  e931ff           jmp 0x8c3                                
  0992  5f               pop di                                   
  0993  5e               pop si                                   
  0994  c9               leave                                    
  0995  cb               retf                                     

ovl19_0996:  ; ENTRY
  0996  55               push bp                                  
  0997  8bec             mov bp, sp                               
  0999  83ec18           sub sp, 0x18                             
  099c  56               push si                                  
  099d  57               push di                                  
  099e  8b7606           mov si, word ptr [bp + 6]                
  09a1  c746fa0f00       mov word ptr [bp - 6], 0xf               
  09a6  c746fc0400       mov word ptr [bp - 4], 4                 
  09ab  e98701           jmp 0xb35                                
  09ae  c746fe0100       mov word ptr [bp - 2], 1                 
  09b3  56               push si                                  
  09b4  90               nop                                      
  09b5  0e               push cs                                  
  09b6  e89808           call 0x1251                              
  09b9  59               pop cx                                   
  09ba  8bc6             mov ax, si                               
  09bc  6bc05c           imul ax, ax, 0x5c                        
  09bf  c41eee40         les bx, ptr [0x40ee]                     
  09c3  03d8             add bx, ax                               
  09c5  8b46fc           mov ax, word ptr [bp - 4]                
  09c8  d1e0             shl ax, 1                                
  09ca  03d8             add bx, ax                               
  09cc  2683bf8a02ff     cmp word ptr es:[bx + 0x28a], -1         
  09d2  7503             jne 0x9d7                                
  09d4  e95e01           jmp 0xb35                                
  09d7  8bc6             mov ax, si                               
  09d9  6bc05c           imul ax, ax, 0x5c                        
  09dc  c41eee40         les bx, ptr [0x40ee]                     
  09e0  03d8             add bx, ax                               
  09e2  8b46fc           mov ax, word ptr [bp - 4]                
  09e5  d1e0             shl ax, 1                                
  09e7  03d8             add bx, ax                               
  09e9  268bbf8a02       mov di, word ptr es:[bx + 0x28a]         
  09ee  6a00             push 0                                   
  09f0  8bdf             mov bx, di                               
  09f2  6bdb16           imul bx, bx, 0x16                        
  09f5  b81d1e           mov ax, 0x1e1d                           
  09f8  8ec0             mov es, ax                               
  09fa  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  09ff  250f00           and ax, 0xf                              
  0a02  50               push ax                                  
  0a03  8bdf             mov bx, di                               
  0a05  6bdb16           imul bx, bx, 0x16                        
  0a08  b81d1e           mov ax, 0x1e1d                           
  0a0b  8ec0             mov es, ax                               
  0a0d  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0a12  c1e804           shr ax, 4                                
  0a15  250700           and ax, 7                                
  0a18  50               push ax                                  
  0a19  16               push ss                                  
  0a1a  8d46e8           lea ax, [bp - 0x18]                      
  0a1d  50               push ax                                  
  0a1e  8bdf             mov bx, di                               
  0a20  6bdb16           imul bx, bx, 0x16                        
  0a23  b81d1e           mov ax, 0x1e1d                           
  0a26  8ec0             mov es, ax                               
  0a28  26ffb78288       push word ptr es:[bx - 0x777e]           
  0a2d  8bdf             mov bx, di                               
  0a2f  6bdb16           imul bx, bx, 0x16                        
  0a32  b81d1e           mov ax, 0x1e1d                           
  0a35  8ec0             mov es, ax                               
  0a37  26ffb78088       push word ptr es:[bx - 0x7780]           
  0a3c  9a5700f72f       lcall 0x2ff7, 0x57                       -> ovl29:13b2
  0a41  83c40e           add sp, 0xe                              
  0a44  0bc0             or ax, ax                                
  0a46  7503             jne 0xa4b                                
  0a48  e9ea00           jmp 0xb35                                
  0a4b  9a29058c0c       lcall 0xc8c, 0x529                       -> 0c8c:0529
  0a50  ff36fa5d         push word ptr [0x5dfa]                   
  0a54  ff36fc5d         push word ptr [0x5dfc]                   
  0a58  8bdf             mov bx, di                               
  0a5a  6bdb16           imul bx, bx, 0x16                        
  0a5d  b81d1e           mov ax, 0x1e1d                           
  0a60  8ec0             mov es, ax                               
  0a62  26ffb78288       push word ptr es:[bx - 0x777e]           
  0a67  8bdf             mov bx, di                               
  0a69  6bdb16           imul bx, bx, 0x16                        
  0a6c  b81d1e           mov ax, 0x1e1d                           
  0a6f  8ec0             mov es, ax                               
  0a71  26ffb78088       push word ptr es:[bx - 0x7780]           
  0a76  ff76fa           push word ptr [bp - 6]                   
  0a79  9ab91a5505       lcall 0x555, 0x1ab9                      -> 0555:1ab9
  0a7e  83c40a           add sp, 0xa                              
  0a81  ff76fa           push word ptr [bp - 6]                   
  0a84  8bc6             mov ax, si                               
  0a86  6bc05c           imul ax, ax, 0x5c                        
  0a89  c41eee40         les bx, ptr [0x40ee]                     
  0a8d  03d8             add bx, ax                               
  0a8f  26ffb74e02       push word ptr es:[bx + 0x24e]            
  0a94  16               push ss                                  
  0a95  8d46e8           lea ax, [bp - 0x18]                      
  0a98  50               push ax                                  
  0a99  56               push si                                  
  0a9a  90               nop                                      
  0a9b  0e               push cs                                  
  0a9c  e8aa00           call 0xb49                               
  0a9f  83c40a           add sp, 0xa                              
  0aa2  8946f8           mov word ptr [bp - 8], ax                
  0aa5  0bc0             or ax, ax                                
  0aa7  740c             je 0xab5                                 
  0aa9  3d0100           cmp ax, 1                                
  0aac  7479             je 0xb27                                 
  0aae  3d0300           cmp ax, 3                                
  0ab1  7579             jne 0xb2c                                
  0ab3  eb72             jmp 0xb27                                
  0ab5  b9ffff           mov cx, 0xffff                           
  0ab8  ba0800           mov dx, 8                                
  0abb  eb4f             jmp 0xb0c                                
  0abd  8bda             mov bx, dx                               
  0abf  d1e3             shl bx, 1                                
  0ac1  8d46e8           lea ax, [bp - 0x18]                      
  0ac4  03d8             add bx, ax                               
  0ac6  36833fff         cmp word ptr ss:[bx], -1                 
  0aca  7440             je 0xb0c                                 
  0acc  8bda             mov bx, dx                               
  0ace  d1e3             shl bx, 1                                
  0ad0  03d8             add bx, ax                               
  0ad2  368b1f           mov bx, word ptr ss:[bx]                 
  0ad5  6bdb16           imul bx, bx, 0x16                        
  0ad8  b81d1e           mov ax, 0x1e1d                           
  0adb  8ec0             mov es, ax                               
  0add  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0ae2  250f00           and ax, 0xf                              
  0ae5  3d0100           cmp ax, 1                                
  0ae8  7529             jne 0xb13                                
  0aea  8bda             mov bx, dx                               
  0aec  d1e3             shl bx, 1                                
  0aee  8d46e8           lea ax, [bp - 0x18]                      
  0af1  03d8             add bx, ax                               
  0af3  368b1f           mov bx, word ptr ss:[bx]                 
  0af6  6bdb16           imul bx, bx, 0x16                        
  0af9  b81d1e           mov ax, 0x1e1d                           
  0afc  8ec0             mov es, ax                               
  0afe  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  0b03  d1e8             shr ax, 1                                
  0b05  257f00           and ax, 0x7f                             
  0b08  8bc8             mov cx, ax                               
  0b0a  eb07             jmp 0xb13                                
  0b0c  8bc2             mov ax, dx                               
  0b0e  4a               dec dx                                   
  0b0f  0bc0             or ax, ax                                
  0b11  75aa             jne 0xabd                                
  0b13  83f9ff           cmp cx, -1                               
  0b16  740f             je 0xb27                                 
  0b18  51               push cx                                  
  0b19  16               push ss                                  
  0b1a  8d46e8           lea ax, [bp - 0x18]                      
  0b1d  50               push ax                                  
  0b1e  56               push si                                  
  0b1f  90               nop                                      
  0b20  0e               push cs                                  
  0b21  e8f703           call 0xf1b                               
  0b24  83c408           add sp, 8                                
  0b27  c746fe0000       mov word ptr [bp - 2], 0                 
  0b2c  837efe00         cmp word ptr [bp - 2], 0                 
  0b30  7403             je 0xb35                                 
  0b32  e979fe           jmp 0x9ae                                
  0b35  8b46fc           mov ax, word ptr [bp - 4]                
  0b38  ff4efc           dec word ptr [bp - 4]                    
  0b3b  0bc0             or ax, ax                                
  0b3d  7403             je 0xb42                                 
  0b3f  e96cfe           jmp 0x9ae                                
  0b42  b80100           mov ax, 1                                
  0b45  5f               pop di                                   
  0b46  5e               pop si                                   
  0b47  c9               leave                                    
  0b48  cb               retf                                     

ovl19_0b49:  ; ENTRY
  0b49  55               push bp                                  
  0b4a  8bec             mov bp, sp                               
  0b4c  83ec0e           sub sp, 0xe                              
  0b4f  56               push si                                  
  0b50  57               push di                                  
  0b51  9a0a1b5505       lcall 0x555, 0x1b0a                      -> 0555:1b0a
  0b56  8956fe           mov word ptr [bp - 2], dx                
  0b59  8946fc           mov word ptr [bp - 4], ax                
  0b5c  c746f4ffff       mov word ptr [bp - 0xc], 0xffff          
  0b61  c746f2e803       mov word ptr [bp - 0xe], 0x3e8           
  0b66  b8042c           mov ax, 0x2c04                           
  0b69  8ec0             mov es, ax                               
  0b6b  268b367b15       mov si, word ptr es:[0x157b]             
  0b70  eb75             jmp 0xbe7                                
  0b72  8bde             mov bx, si                               
  0b74  6bdb41           imul bx, bx, 0x41                        
  0b77  b8042c           mov ax, 0x2c04                           
  0b7a  8ec0             mov es, ax                               
  0b7c  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0b81  98               cwde                                     
  0b82  3b460c           cmp ax, word ptr [bp + 0xc]              
  0b85  7560             jne 0xbe7                                
  0b87  6a00             push 0                                   
  0b89  66ff76fc         push dword ptr [bp - 4]                  
  0b8d  16               push ss                                  
  0b8e  8d46f8           lea ax, [bp - 8]                         
  0b91  50               push ax                                  
  0b92  16               push ss                                  
  0b93  8d46fa           lea ax, [bp - 6]                         
  0b96  50               push ax                                  
  0b97  56               push si                                  
  0b98  9a3900c52f       lcall 0x2fc5, 0x39                       -> ovl21:0a85
  0b9d  83c410           add sp, 0x10                             
  0ba0  8bf8             mov di, ax                               
  0ba2  83ff32           cmp di, 0x32                             
  0ba5  7d40             jge 0xbe7                                
  0ba7  3b3e005e         cmp di, word ptr [0x5e00]                
  0bab  7d3a             jge 0xbe7                                
  0bad  8bde             mov bx, si                               
  0baf  6bdb41           imul bx, bx, 0x41                        
  0bb2  b8042c           mov ax, 0x2c04                           
  0bb5  8ec0             mov es, ax                               
  0bb7  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0bbc  8bde             mov bx, si                               
  0bbe  6bdb41           imul bx, bx, 0x41                        
  0bc1  b8042c           mov ax, 0x2c04                           
  0bc4  8ec0             mov es, ax                               
  0bc6  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0bcb  9a6100f72f       lcall 0x2ff7, 0x61                       -> ovl29:15c5
  0bd0  83c404           add sp, 4                                
  0bd3  8946f6           mov word ptr [bp - 0xa], ax              
  0bd6  837ef64b         cmp word ptr [bp - 0xa], 0x4b            
  0bda  7e0b             jle 0xbe7                                
  0bdc  3b7ef2           cmp di, word ptr [bp - 0xe]              
  0bdf  7d06             jge 0xbe7                                
  0be1  8976f4           mov word ptr [bp - 0xc], si              
  0be4  897ef2           mov word ptr [bp - 0xe], di              
  0be7  8bc6             mov ax, si                               
  0be9  4e               dec si                                   
  0bea  0bc0             or ax, ax                                
  0bec  7584             jne 0xb72                                
  0bee  66ff76fc         push dword ptr [bp - 4]                  
  0bf2  ff760e           push word ptr [bp + 0xe]                 
  0bf5  ff760c           push word ptr [bp + 0xc]                 
  0bf8  66ff7608         push dword ptr [bp + 8]                  
  0bfc  ff7606           push word ptr [bp + 6]                   
  0bff  90               nop                                      
  0c00  0e               push cs                                  
  0c01  e82e00           call 0xc32                               
  0c04  83c40e           add sp, 0xe                              
  0c07  8bf0             mov si, ax                               
  0c09  0bf6             or si, si                                
  0c0b  741a             je 0xc27                                 
  0c0d  837ef4ff         cmp word ptr [bp - 0xc], -1              
  0c11  7414             je 0xc27                                 
  0c13  ff76f4           push word ptr [bp - 0xc]                 
  0c16  66ff7608         push dword ptr [bp + 8]                  
  0c1a  ff7606           push word ptr [bp + 6]                   
  0c1d  90               nop                                      
  0c1e  0e               push cs                                  
  0c1f  e8f902           call 0xf1b                               
  0c22  83c408           add sp, 8                                
  0c25  8bf0             mov si, ax                               
  0c27  9a2e1b5505       lcall 0x555, 0x1b2e                      -> 0555:1b2e
  0c2c  8bc6             mov ax, si                               
  0c2e  5f               pop di                                   
  0c2f  5e               pop si                                   
  0c30  c9               leave                                    
  0c31  cb               retf                                     

ovl19_0c32:  ; ENTRY
  0c32  55               push bp                                  
  0c33  8bec             mov bp, sp                               
  0c35  83ec18           sub sp, 0x18                             
  0c38  56               push si                                  
  0c39  57               push di                                  
  0c3a  c45e08           les bx, ptr [bp + 8]                     
  0c3d  268b07           mov ax, word ptr es:[bx]                 
  0c40  8946fe           mov word ptr [bp - 2], ax                
  0c43  8b5efe           mov bx, word ptr [bp - 2]                
  0c46  6bdb16           imul bx, bx, 0x16                        
  0c49  b81d1e           mov ax, 0x1e1d                           
  0c4c  ba0000           mov dx, 0                                
  0c4f  81c28088         add dx, 0x8880                           
  0c53  03da             add bx, dx                               
  0c55  8ec0             mov es, ax                               
  0c57  268b07           mov ax, word ptr es:[bx]                 
  0c5a  8946fc           mov word ptr [bp - 4], ax                
  0c5d  8b5efe           mov bx, word ptr [bp - 2]                
  0c60  6bdb16           imul bx, bx, 0x16                        
  0c63  b81d1e           mov ax, 0x1e1d                           
  0c66  8ec0             mov es, ax                               
  0c68  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  0c6d  8946fa           mov word ptr [bp - 6], ax                
  0c70  8b5efe           mov bx, word ptr [bp - 2]                
  0c73  6bdb16           imul bx, bx, 0x16                        
  0c76  b81d1e           mov ax, 0x1e1d                           
  0c79  8ec0             mov es, ax                               
  0c7b  268b878c88       mov ax, word ptr es:[bx - 0x7774]        
  0c80  250010           and ax, 0x1000                           
  0c83  8946f8           mov word ptr [bp - 8], ax                
  0c86  c746eeffff       mov word ptr [bp - 0x12], 0xffff         
  0c8b  c746ecffff       mov word ptr [bp - 0x14], 0xffff         
  0c90  c746ea0000       mov word ptr [bp - 0x16], 0              
  0c95  c746e80000       mov word ptr [bp - 0x18], 0              
  0c9a  837ef800         cmp word ptr [bp - 8], 0                 
  0c9e  7403             je 0xca3                                 
  0ca0  e97102           jmp 0xf14                                
  0ca3  8b76fc           mov si, word ptr [bp - 4]                
  0ca6  2b760e           sub si, word ptr [bp + 0xe]              
  0ca9  e94401           jmp 0xdf0                                
  0cac  8b7efa           mov di, word ptr [bp - 6]                
  0caf  2b7e0e           sub di, word ptr [bp + 0xe]              
  0cb2  e92d01           jmp 0xde2                                
  0cb5  0bf6             or si, si                                
  0cb7  7d03             jge 0xcbc                                
  0cb9  e92501           jmp 0xde1                                
  0cbc  0bff             or di, di                                
  0cbe  7d03             jge 0xcc3                                
  0cc0  e91e01           jmp 0xde1                                
  0cc3  83fe70           cmp si, 0x70                             
  0cc6  7c03             jl 0xccb                                 
  0cc8  e91601           jmp 0xde1                                
  0ccb  81ff9c00         cmp di, 0x9c                             
  0ccf  7c03             jl 0xcd4                                 
  0cd1  e90d01           jmp 0xde1                                
  0cd4  8bdf             mov bx, di                               
  0cd6  69dbe000         imul bx, bx, 0xe0                        
  0cda  8bc6             mov ax, si                               
  0cdc  d1e0             shl ax, 1                                
  0cde  03d8             add bx, ax                               
  0ce0  b81d1e           mov ax, 0x1e1d                           
  0ce3  8ec0             mov es, ax                               
  0ce5  268a870100       mov al, byte ptr es:[bx + 1]             
  0cea  c1e804           shr ax, 4                                
  0ced  250100           and ax, 1                                
  0cf0  0bc0             or ax, ax                                
  0cf2  7503             jne 0xcf7                                
  0cf4  e9ea00           jmp 0xde1                                
  0cf7  8bdf             mov bx, di                               
  0cf9  69dbe000         imul bx, bx, 0xe0                        
  0cfd  8bc6             mov ax, si                               
  0cff  d1e0             shl ax, 1                                
  0d01  03d8             add bx, ax                               
  0d03  b81d1e           mov ax, 0x1e1d                           
  0d06  8ec0             mov es, ax                               
  0d08  268a870100       mov al, byte ptr es:[bx + 1]             
  0d0d  250f00           and ax, 0xf                              
  0d10  8946f6           mov word ptr [bp - 0xa], ax              
  0d13  3b460c           cmp ax, word ptr [bp + 0xc]              
  0d16  7403             je 0xd1b                                 
  0d18  e9c600           jmp 0xde1                                
  0d1b  8bdf             mov bx, di                               
  0d1d  69dbe000         imul bx, bx, 0xe0                        
  0d21  8bc6             mov ax, si                               
  0d23  d1e0             shl ax, 1                                
  0d25  03d8             add bx, ax                               
  0d27  b81d1e           mov ax, 0x1e1d                           
  0d2a  8ec0             mov es, ax                               
  0d2c  268a9f0000       mov bl, byte ptr es:[bx]                 
  0d31  81e3ff00         and bx, 0xff                             
  0d35  b8042c           mov ax, 0x2c04                           
  0d38  8ec0             mov es, ax                               
  0d3a  268a871007       mov al, byte ptr es:[bx + 0x710]         
  0d3f  98               cwde                                     
  0d40  8bd0             mov dx, ax                               
  0d42  83fa0a           cmp dx, 0xa                              
  0d45  7503             jne 0xd4a                                
  0d47  e99700           jmp 0xde1                                
  0d4a  83fa03           cmp dx, 3                                
  0d4d  7503             jne 0xd52                                
  0d4f  e98f00           jmp 0xde1                                
  0d52  83fa02           cmp dx, 2                                
  0d55  7503             jne 0xd5a                                
  0d57  e98700           jmp 0xde1                                
  0d5a  8bc6             mov ax, si                               
  0d5c  69c03801         imul ax, ax, 0x138                       
  0d60  c45e10           les bx, ptr [bp + 0x10]                  
  0d63  03d8             add bx, ax                               
  0d65  8bc7             mov ax, di                               
  0d67  d1e0             shl ax, 1                                
  0d69  03d8             add bx, ax                               
  0d6b  268b07           mov ax, word ptr es:[bx]                 
  0d6e  99               cdq                                      
  0d6f  33c2             xor ax, dx                               
  0d71  2bc2             sub ax, dx                               
  0d73  8b16005e         mov dx, word ptr [0x5e00]                
  0d77  4a               dec dx                                   
  0d78  3bc2             cmp ax, dx                               
  0d7a  7f65             jg 0xde1                                 
  0d7c  8bdf             mov bx, di                               
  0d7e  6bdb70           imul bx, bx, 0x70                        
  0d81  03de             add bx, si                               
  0d83  b8d919           mov ax, 0x19d9                           
  0d86  8ec0             mov es, ax                               
  0d88  268a870000       mov al, byte ptr es:[bx]                 
  0d8d  c1e805           shr ax, 5                                
  0d90  250100           and ax, 1                                
  0d93  0bc0             or ax, ax                                
  0d95  744a             je 0xde1                                 
  0d97  16               push ss                                  
  0d98  8d46f0           lea ax, [bp - 0x10]                      
  0d9b  50               push ax                                  
  0d9c  16               push ss                                  
  0d9d  8d46f2           lea ax, [bp - 0xe]                       
  0da0  50               push ax                                  
  0da1  16               push ss                                  
  0da2  8d46f4           lea ax, [bp - 0xc]                       
  0da5  50               push ax                                  
  0da6  57               push di                                  
  0da7  56               push si                                  
  0da8  9a6600f72f       lcall 0x2ff7, 0x66                       -> ovl29:1626
  0dad  83c410           add sp, 0x10                             
  0db0  57               push di                                  
  0db1  56               push si                                  
  0db2  9a6100f72f       lcall 0x2ff7, 0x61                       -> ovl29:15c5
  0db7  83c404           add sp, 4                                
  0dba  8bd0             mov dx, ax                               
  0dbc  83fa4b           cmp dx, 0x4b                             
  0dbf  7e20             jle 0xde1                                
  0dc1  837ef402         cmp word ptr [bp - 0xc], 2               
  0dc5  7e06             jle 0xdcd                                
  0dc7  837ef20a         cmp word ptr [bp - 0xe], 0xa             
  0dcb  7f06             jg 0xdd3                                 
  0dcd  837ef000         cmp word ptr [bp - 0x10], 0              
  0dd1  740e             je 0xde1                                 
  0dd3  3b56ea           cmp dx, word ptr [bp - 0x16]             
  0dd6  7e09             jle 0xde1                                
  0dd8  8976ee           mov word ptr [bp - 0x12], si             
  0ddb  897eec           mov word ptr [bp - 0x14], di             
  0dde  8956ea           mov word ptr [bp - 0x16], dx             
  0de1  47               inc di                                   
  0de2  8b46fa           mov ax, word ptr [bp - 6]                
  0de5  03460e           add ax, word ptr [bp + 0xe]              
  0de8  3bc7             cmp ax, di                               
  0dea  7e03             jle 0xdef                                
  0dec  e9c6fe           jmp 0xcb5                                
  0def  46               inc si                                   
  0df0  8b46fc           mov ax, word ptr [bp - 4]                
  0df3  03460e           add ax, word ptr [bp + 0xe]              
  0df6  3bc6             cmp ax, si                               
  0df8  7e03             jle 0xdfd                                
  0dfa  e9affe           jmp 0xcac                                
  0dfd  837eeeff         cmp word ptr [bp - 0x12], -1             
  0e01  7503             jne 0xe06                                
  0e03  e90e01           jmp 0xf14                                
  0e06  8b5efe           mov bx, word ptr [bp - 2]                
  0e09  6bdb16           imul bx, bx, 0x16                        
  0e0c  b81d1e           mov ax, 0x1e1d                           
  0e0f  8ec0             mov es, ax                               
  0e11  268a878e88       mov al, byte ptr es:[bx - 0x7772]        
  0e16  250f00           and ax, 0xf                              
  0e19  3d0100           cmp ax, 1                                
  0e1c  7517             jne 0xe35                                
  0e1e  8b5efe           mov bx, word ptr [bp - 2]                
  0e21  6bdb16           imul bx, bx, 0x16                        
  0e24  b81d1e           mov ax, 0x1e1d                           
  0e27  8ec0             mov es, ax                               
  0e29  268a878f88       mov al, byte ptr es:[bx - 0x7771]        
  0e2e  d1e8             shr ax, 1                                
  0e30  257f00           and ax, 0x7f                             
  0e33  eb03             jmp 0xe38                                
  0e35  b8ffff           mov ax, 0xffff                           
  0e38  8bf0             mov si, ax                               
  0e3a  666800002000     push 0x200000                            
  0e40  6a04             push 4                                   
  0e42  66ff7608         push dword ptr [bp + 8]                  
  0e46  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  0e4b  83c40a           add sp, 0xa                              
  0e4e  c41e625e         les bx, ptr [0x5e62]                     
  0e52  8b46ee           mov ax, word ptr [bp - 0x12]             
  0e55  26894712         mov word ptr es:[bx + 0x12], ax          
  0e59  8b46ec           mov ax, word ptr [bp - 0x14]             
  0e5c  26894714         mov word ptr es:[bx + 0x14], ax          
  0e60  6a00             push 0                                   
  0e62  50               push ax                                  
  0e63  ff76ee           push word ptr [bp - 0x12]                
  0e66  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  0e6b  83c406           add sp, 6                                
  0e6e  33c9             xor cx, cx                               
  0e70  e99400           jmp 0xf07                                
  0e73  8bc1             mov ax, cx                               
  0e75  d1e0             shl ax, 1                                
  0e77  c45e08           les bx, ptr [bp + 8]                     
  0e7a  03d8             add bx, ax                               
  0e7c  26833fff         cmp word ptr es:[bx], -1                 
  0e80  7503             jne 0xe85                                
  0e82  e98100           jmp 0xf06                                
  0e85  8bc1             mov ax, cx                               
  0e87  d1e0             shl ax, 1                                
  0e89  c45e08           les bx, ptr [bp + 8]                     
  0e8c  03d8             add bx, ax                               
  0e8e  268b1f           mov bx, word ptr es:[bx]                 
  0e91  6bdb16           imul bx, bx, 0x16                        
  0e94  b81d1e           mov ax, 0x1e1d                           
  0e97  8ec0             mov es, ax                               
  0e99  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  0e9e  98               cwde                                     
  0e9f  ba042c           mov dx, 0x2c04                           
  0ea2  8ec2             mov es, dx                               
  0ea4  263b061001       cmp ax, word ptr es:[0x110]              
  0ea9  7410             je 0xebb                                 
  0eab  8bc1             mov ax, cx                               
  0ead  d1e0             shl ax, 1                                
  0eaf  c45e08           les bx, ptr [bp + 8]                     
  0eb2  03d8             add bx, ax                               
  0eb4  26c707ffff       mov word ptr es:[bx], 0xffff             
  0eb9  eb4b             jmp 0xf06                                
  0ebb  83feff           cmp si, -1                               
  0ebe  7446             je 0xf06                                 
  0ec0  8bc1             mov ax, cx                               
  0ec2  d1e0             shl ax, 1                                
  0ec4  c45e08           les bx, ptr [bp + 8]                     
  0ec7  03d8             add bx, ax                               
  0ec9  268b1f           mov bx, word ptr es:[bx]                 
  0ecc  6bdb16           imul bx, bx, 0x16                        
  0ecf  b81d1e           mov ax, 0x1e1d                           
  0ed2  8ec0             mov es, ax                               
  0ed4  2680a78e88f0     and byte ptr es:[bx - 0x7772], 0xf0      
  0eda  26808f8e8801     or byte ptr es:[bx - 0x7772], 1          
  0ee0  8bc6             mov ax, si                               
  0ee2  257f00           and ax, 0x7f                             
  0ee5  8bd1             mov dx, cx                               
  0ee7  d1e2             shl dx, 1                                
  0ee9  c45e08           les bx, ptr [bp + 8]                     
  0eec  03da             add bx, dx                               
  0eee  268b1f           mov bx, word ptr es:[bx]                 
  0ef1  6bdb16           imul bx, bx, 0x16                        
  0ef4  ba1d1e           mov dx, 0x1e1d                           
  0ef7  8ec2             mov es, dx                               
  0ef9  2680a78f8801     and byte ptr es:[bx - 0x7771], 1         
  0eff  d0e0             shl al, 1                                
  0f01  2608878f88       or byte ptr es:[bx - 0x7771], al         
  0f06  41               inc cx                                   
  0f07  83f908           cmp cx, 8                                
  0f0a  7d03             jge 0xf0f                                
  0f0c  e964ff           jmp 0xe73                                
  0f0f  c746e80200       mov word ptr [bp - 0x18], 2              
  0f14  8b46e8           mov ax, word ptr [bp - 0x18]             
  0f17  5f               pop di                                   
  0f18  5e               pop si                                   
  0f19  c9               leave                                    
  0f1a  cb               retf                                     

ovl19_0f1b:  ; ENTRY
  0f1b  55               push bp                                  
  0f1c  8bec             mov bp, sp                               
  0f1e  83ec0a           sub sp, 0xa                              
  0f21  56               push si                                  
  0f22  57               push di                                  
  0f23  c45e08           les bx, ptr [bp + 8]                     
  0f26  268b07           mov ax, word ptr es:[bx]                 
  0f29  8946fc           mov word ptr [bp - 4], ax                
  0f2c  837efcff         cmp word ptr [bp - 4], -1                
  0f30  7503             jne 0xf35                                
  0f32  e92e01           jmp 0x1063                               
  0f35  8b5e0c           mov bx, word ptr [bp + 0xc]              
  0f38  6bdb41           imul bx, bx, 0x41                        
  0f3b  b8042c           mov ax, 0x2c04                           
  0f3e  8ec0             mov es, ax                               
  0f40  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0f45  69dbe000         imul bx, bx, 0xe0                        
  0f49  8b760c           mov si, word ptr [bp + 0xc]              
  0f4c  6bf641           imul si, si, 0x41                        
  0f4f  b8042c           mov ax, 0x2c04                           
  0f52  8ec0             mov es, ax                               
  0f54  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0f59  d1e0             shl ax, 1                                
  0f5b  03d8             add bx, ax                               
  0f5d  b81d1e           mov ax, 0x1e1d                           
  0f60  8ec0             mov es, ax                               
  0f62  268a9f0000       mov bl, byte ptr es:[bx]                 
  0f67  81e3ff00         and bx, 0xff                             
  0f6b  b8042c           mov ax, 0x2c04                           
  0f6e  8ec0             mov es, ax                               
  0f70  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0f76  7503             jne 0xf7b                                
  0f78  e9e800           jmp 0x1063                               
  0f7b  c746f8e803       mov word ptr [bp - 8], 0x3e8             
  0f80  c746f6ffff       mov word ptr [bp - 0xa], 0xffff          
  0f85  33ff             xor di, di                               
  0f87  e9c500           jmp 0x104f                               
  0f8a  8b4606           mov ax, word ptr [bp + 6]                
  0f8d  6bc05c           imul ax, ax, 0x5c                        
  0f90  c41eee40         les bx, ptr [0x40ee]                     
  0f94  03d8             add bx, ax                               
  0f96  8bc7             mov ax, di                               
  0f98  d1e0             shl ax, 1                                
  0f9a  03d8             add bx, ax                               
  0f9c  268b875a02       mov ax, word ptr es:[bx + 0x25a]         
  0fa1  8946fa           mov word ptr [bp - 6], ax                
  0fa4  3dffff           cmp ax, 0xffff                           
  0fa7  7503             jne 0xfac                                
  0fa9  e9a200           jmp 0x104e                               
  0fac  8b5efa           mov bx, word ptr [bp - 6]                
  0faf  6bdb41           imul bx, bx, 0x41                        
  0fb2  b8042c           mov ax, 0x2c04                           
  0fb5  8ec0             mov es, ax                               
  0fb7  26ffb77f15       push word ptr es:[bx + 0x157f]           
  0fbc  8b5efa           mov bx, word ptr [bp - 6]                
  0fbf  6bdb41           imul bx, bx, 0x41                        
  0fc2  b8042c           mov ax, 0x2c04                           
  0fc5  8ec0             mov es, ax                               
  0fc7  26ffb77d15       push word ptr es:[bx + 0x157d]           
  0fcc  8b5efc           mov bx, word ptr [bp - 4]                
  0fcf  6bdb16           imul bx, bx, 0x16                        
  0fd2  b81d1e           mov ax, 0x1e1d                           
  0fd5  8ec0             mov es, ax                               
  0fd7  26ffb78288       push word ptr es:[bx - 0x777e]           
  0fdc  8b5efc           mov bx, word ptr [bp - 4]                
  0fdf  6bdb16           imul bx, bx, 0x16                        
  0fe2  b81d1e           mov ax, 0x1e1d                           
  0fe5  ba0000           mov dx, 0                                
  0fe8  81c28088         add dx, 0x8880                           
  0fec  03da             add bx, dx                               
  0fee  8ec0             mov es, ax                               
  0ff0  26ff37           push word ptr es:[bx]                    
  0ff3  9acc0a8b0a       lcall 0xa8b, 0xacc                       -> 0a8b:0acc
  0ff8  83c408           add sp, 8                                
  0ffb  8bd0             mov dx, ax                               
  0ffd  3b56f8           cmp dx, word ptr [bp - 8]                
  1000  7d4c             jge 0x104e                               
  1002  8b5efa           mov bx, word ptr [bp - 6]                
  1005  6bdb41           imul bx, bx, 0x41                        
  1008  b8042c           mov ax, 0x2c04                           
  100b  8ec0             mov es, ax                               
  100d  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  1012  69dbe000         imul bx, bx, 0xe0                        
  1016  8b76fa           mov si, word ptr [bp - 6]                
  1019  6bf641           imul si, si, 0x41                        
  101c  b8042c           mov ax, 0x2c04                           
  101f  8ec0             mov es, ax                               
  1021  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  1026  d1e0             shl ax, 1                                
  1028  03d8             add bx, ax                               
  102a  b81d1e           mov ax, 0x1e1d                           
  102d  8ec0             mov es, ax                               
  102f  268a9f0000       mov bl, byte ptr es:[bx]                 
  1034  81e3ff00         and bx, 0xff                             
  1038  b8042c           mov ax, 0x2c04                           
  103b  8ec0             mov es, ax                               
  103d  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  1043  7509             jne 0x104e                               
  1045  8b46fa           mov ax, word ptr [bp - 6]                
  1048  8946f6           mov word ptr [bp - 0xa], ax              
  104b  8956f8           mov word ptr [bp - 8], dx                
  104e  47               inc di                                   
  104f  83ff06           cmp di, 6                                
  1052  7d03             jge 0x1057                               
  1054  e933ff           jmp 0xf8a                                
  1057  837ef6ff         cmp word ptr [bp - 0xa], -1              
  105b  7406             je 0x1063                                
  105d  8b46f6           mov ax, word ptr [bp - 0xa]              
  1060  89460c           mov word ptr [bp + 0xc], ax              
  1063  33f6             xor si, si                               
  1065  33ff             xor di, di                               
  1067  eb1c             jmp 0x1085                               
  1069  8b4606           mov ax, word ptr [bp + 6]                
  106c  6bc05c           imul ax, ax, 0x5c                        
  106f  c41eee40         les bx, ptr [0x40ee]                     
  1073  03d8             add bx, ax                               
  1075  8bc7             mov ax, di                               
  1077  d1e0             shl ax, 1                                
  1079  03d8             add bx, ax                               
  107b  2683bf5a02ff     cmp word ptr es:[bx + 0x25a], -1         
  1081  7401             je 0x1084                                
  1083  46               inc si                                   
  1084  47               inc di                                   
  1085  83ff06           cmp di, 6                                
  1088  7cdf             jl 0x1069                                
  108a  33ff             xor di, di                               
  108c  eb40             jmp 0x10ce                               
  108e  8bc7             mov ax, di                               
  1090  d1e0             shl ax, 1                                
  1092  c45e08           les bx, ptr [bp + 8]                     
  1095  03d8             add bx, ax                               
  1097  268b07           mov ax, word ptr es:[bx]                 
  109a  8946fc           mov word ptr [bp - 4], ax                
  109d  3dffff           cmp ax, 0xffff                           
  10a0  742b             je 0x10cd                                
  10a2  8b5efc           mov bx, word ptr [bp - 4]                
  10a5  6bdb16           imul bx, bx, 0x16                        
  10a8  b81d1e           mov ax, 0x1e1d                           
  10ab  8ec0             mov es, ax                               
  10ad  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  10b2  98               cwde                                     
  10b3  ba042c           mov dx, 0x2c04                           
  10b6  8ec2             mov es, dx                               
  10b8  263b061001       cmp ax, word ptr es:[0x110]              
  10bd  740e             je 0x10cd                                
  10bf  8bc7             mov ax, di                               
  10c1  d1e0             shl ax, 1                                
  10c3  c45e08           les bx, ptr [bp + 8]                     
  10c6  03d8             add bx, ax                               
  10c8  26c707ffff       mov word ptr es:[bx], 0xffff             
  10cd  47               inc di                                   
  10ce  83ff08           cmp di, 8                                
  10d1  7cbb             jl 0x108e                                
  10d3  8b5e0c           mov bx, word ptr [bp + 0xc]              
  10d6  6bdb41           imul bx, bx, 0x41                        
  10d9  b8042c           mov ax, 0x2c04                           
  10dc  8ec0             mov es, ax                               
  10de  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  10e3  98               cwde                                     
  10e4  8946fe           mov word ptr [bp - 2], ax                
  10e7  6a00             push 0                                   
  10e9  ff760c           push word ptr [bp + 0xc]                 
  10ec  6a01             push 1                                   
  10ee  66ff7608         push dword ptr [bp + 8]                  
  10f2  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  10f7  83c40a           add sp, 0xa                              
  10fa  6a00             push 0                                   
  10fc  c41e625e         les bx, ptr [0x5e62]                     
  1100  26ff7714         push word ptr es:[bx + 0x14]             
  1104  26ff7712         push word ptr es:[bx + 0x12]             
  1108  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  110d  83c406           add sp, 6                                
  1110  3d0100           cmp ax, 1                                
  1113  7517             jne 0x112c                               
  1115  6a01             push 1                                   
  1117  9a3900d62f       lcall 0x2fd6, 0x39                       -> ovl24:0000
  111c  59               pop cx                                   
  111d  ff7606           push word ptr [bp + 6]                   
  1120  90               nop                                      
  1121  0e               push cs                                  
  1122  e82c01           call 0x1251                              
  1125  59               pop cx                                   
  1126  b80300           mov ax, 3                                
  1129  e92101           jmp 0x124d                               
  112c  ff7606           push word ptr [bp + 6]                   
  112f  90               nop                                      
  1130  0e               push cs                                  
  1131  e81d01           call 0x1251                              
  1134  59               pop cx                                   
  1135  8b5e0c           mov bx, word ptr [bp + 0xc]              
  1138  6bdb41           imul bx, bx, 0x41                        
  113b  b8042c           mov ax, 0x2c04                           
  113e  8ec0             mov es, ax                               
  1140  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1145  98               cwde                                     
  1146  ba042c           mov dx, 0x2c04                           
  1149  8ec2             mov es, dx                               
  114b  263b061001       cmp ax, word ptr es:[0x110]              
  1150  75d4             jne 0x1126                               
  1152  b8042c           mov ax, 0x2c04                           
  1155  8ec0             mov es, ax                               
  1157  26a11001         mov ax, word ptr es:[0x110]              
  115b  3b46fe           cmp ax, word ptr [bp - 2]                
  115e  74c6             je 0x1126                                
  1160  8b5e0c           mov bx, word ptr [bp + 0xc]              
  1163  6bdb41           imul bx, bx, 0x41                        
  1166  b8042c           mov ax, 0x2c04                           
  1169  8ec0             mov es, ax                               
  116b  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  1170  8ec2             mov es, dx                               
  1172  268b1e1001       mov bx, word ptr es:[0x110]              
  1177  6bdb14           imul bx, bx, 0x14                        
  117a  ba042c           mov dx, 0x2c04                           
  117d  8ec2             mov es, dx                               
  117f  263b879301       cmp ax, word ptr es:[bx + 0x193]         
  1184  752e             jne 0x11b4                               
  1186  8b5e0c           mov bx, word ptr [bp + 0xc]              
  1189  6bdb41           imul bx, bx, 0x41                        
  118c  b8042c           mov ax, 0x2c04                           
  118f  8ec0             mov es, ax                               
  1191  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  1196  ba042c           mov dx, 0x2c04                           
  1199  8ec2             mov es, dx                               
  119b  268b1e1001       mov bx, word ptr es:[0x110]              
  11a0  6bdb14           imul bx, bx, 0x14                        
  11a3  ba042c           mov dx, 0x2c04                           
  11a6  8ec2             mov es, dx                               
  11a8  263b879501       cmp ax, word ptr es:[bx + 0x195]         
  11ad  7505             jne 0x11b4                               
  11af  b80100           mov ax, 1                                
  11b2  eb02             jmp 0x11b6                               
  11b4  33c0             xor ax, ax                               
  11b6  8bd0             mov dx, ax                               
  11b8  0bd2             or dx, dx                                
  11ba  7535             jne 0x11f1                               
  11bc  83fe01           cmp si, 1                                
  11bf  7e30             jle 0x11f1                               
  11c1  8b4606           mov ax, word ptr [bp + 6]                
  11c4  6bc05c           imul ax, ax, 0x5c                        
  11c7  c41eee40         les bx, ptr [0x40ee]                     
  11cb  03d8             add bx, ax                               
  11cd  26f787a6020100   test word ptr es:[bx + 0x2a6], 1         
  11d4  741b             je 0x11f1                                
  11d6  6a00             push 0                                   
  11d8  ff760c           push word ptr [bp + 0xc]                 
  11db  90               nop                                      
  11dc  0e               push cs                                  
  11dd  e88406           call 0x1864                              
  11e0  83c404           add sp, 4                                
  11e3  89460c           mov word ptr [bp + 0xc], ax              
  11e6  837e0cff         cmp word ptr [bp + 0xc], -1              
  11ea  7403             je 0x11ef                                
  11ec  e974fe           jmp 0x1063                               
  11ef  eb53             jmp 0x1244                               
  11f1  0bd2             or dx, dx                                
  11f3  751f             jne 0x1214                               
  11f5  8b4606           mov ax, word ptr [bp + 6]                
  11f8  6bc05c           imul ax, ax, 0x5c                        
  11fb  c41eee40         les bx, ptr [0x40ee]                     
  11ff  03d8             add bx, ax                               
  1201  26f787a6020200   test word ptr es:[bx + 0x2a6], 2         
  1208  740a             je 0x1214                                
  120a  ff760c           push word ptr [bp + 0xc]                 
  120d  90               nop                                      
  120e  0e               push cs                                  
  120f  e88a07           call 0x199c                              
  1212  eb21             jmp 0x1235                               
  1214  0bd2             or dx, dx                                
  1216  751e             jne 0x1236                               
  1218  8b4606           mov ax, word ptr [bp + 6]                
  121b  6bc05c           imul ax, ax, 0x5c                        
  121e  c41eee40         les bx, ptr [0x40ee]                     
  1222  03d8             add bx, ax                               
  1224  26f787a6020400   test word ptr es:[bx + 0x2a6], 4         
  122b  7409             je 0x1236                                
  122d  ff760c           push word ptr [bp + 0xc]                 
  1230  90               nop                                      
  1231  0e               push cs                                  
  1232  e8f507           call 0x1a2a                              
  1235  59               pop cx                                   
  1236  ff760c           push word ptr [bp + 0xc]                 
  1239  ff7606           push word ptr [bp + 6]                   
  123c  90               nop                                      
  123d  0e               push cs                                  
  123e  e80b01           call 0x134c                              
  1241  83c404           add sp, 4                                
  1244  b80100           mov ax, 1                                
  1247  e9dffe           jmp 0x1129                               
  124a  e9d9fe           jmp 0x1126                               
  124d  5f               pop di                                   
  124e  5e               pop si                                   
  124f  c9               leave                                    
  1250  cb               retf                                     

ovl19_1251:  ; ENTRY
  1251  55               push bp                                  
  1252  8bec             mov bp, sp                               
  1254  83ec10           sub sp, 0x10                             
  1257  56               push si                                  
  1258  57               push di                                  
  1259  8b7606           mov si, word ptr [bp + 6]                
  125c  b90400           mov cx, 4                                
  125f  e9dc00           jmp 0x133e                               
  1262  8bd9             mov bx, cx                               
  1264  d1e3             shl bx, 1                                
  1266  8d46f0           lea ax, [bp - 0x10]                      
  1269  03d8             add bx, ax                               
  126b  b8ffff           mov ax, 0xffff                           
  126e  368907           mov word ptr ss:[bx], ax                 
  1271  8bd9             mov bx, cx                               
  1273  d1e3             shl bx, 1                                
  1275  8d56f8           lea dx, [bp - 8]                         
  1278  03da             add bx, dx                               
  127a  368907           mov word ptr ss:[bx], ax                 
  127d  8bc6             mov ax, si                               
  127f  6bc05c           imul ax, ax, 0x5c                        
  1282  c41eee40         les bx, ptr [0x40ee]                     
  1286  03d8             add bx, ax                               
  1288  8bc1             mov ax, cx                               
  128a  d1e0             shl ax, 1                                
  128c  03d8             add bx, ax                               
  128e  2683bf8a02ff     cmp word ptr es:[bx + 0x28a], -1         
  1294  7503             jne 0x1299                               
  1296  e9a500           jmp 0x133e                               
  1299  8bc6             mov ax, si                               
  129b  6bc05c           imul ax, ax, 0x5c                        
  129e  c41eee40         les bx, ptr [0x40ee]                     
  12a2  03d8             add bx, ax                               
  12a4  8bc1             mov ax, cx                               
  12a6  d1e0             shl ax, 1                                
  12a8  03d8             add bx, ax                               
  12aa  268bbf8a02       mov di, word ptr es:[bx + 0x28a]         
  12af  8bdf             mov bx, di                               
  12b1  6bdb16           imul bx, bx, 0x16                        
  12b4  b81d1e           mov ax, 0x1e1d                           
  12b7  8ec0             mov es, ax                               
  12b9  268a878588       mov al, byte ptr es:[bx - 0x777b]        
  12be  98               cwde                                     
  12bf  ba042c           mov dx, 0x2c04                           
  12c2  8ec2             mov es, dx                               
  12c4  263b061001       cmp ax, word ptr es:[0x110]              
  12c9  755b             jne 0x1326                               
  12cb  8bc6             mov ax, si                               
  12cd  40               inc ax                                   
  12ce  8bdf             mov bx, di                               
  12d0  6bdb16           imul bx, bx, 0x16                        
  12d3  ba1d1e           mov dx, 0x1e1d                           
  12d6  8ec2             mov es, dx                               
  12d8  268a978e88       mov dl, byte ptr es:[bx - 0x7772]        
  12dd  c1ea04           shr dx, 4                                
  12e0  83e207           and dx, 7                                
  12e3  3bc2             cmp ax, dx                               
  12e5  753f             jne 0x1326                               
  12e7  8bdf             mov bx, di                               
  12e9  6bdb16           imul bx, bx, 0x16                        
  12ec  b81d1e           mov ax, 0x1e1d                           
  12ef  ba0000           mov dx, 0                                
  12f2  81c28088         add dx, 0x8880                           
  12f6  03da             add bx, dx                               
  12f8  8ec0             mov es, ax                               
  12fa  268b07           mov ax, word ptr es:[bx]                 
  12fd  8bd9             mov bx, cx                               
  12ff  d1e3             shl bx, 1                                
  1301  8d56f8           lea dx, [bp - 8]                         
  1304  03da             add bx, dx                               
  1306  368907           mov word ptr ss:[bx], ax                 
  1309  8bdf             mov bx, di                               
  130b  6bdb16           imul bx, bx, 0x16                        
  130e  b81d1e           mov ax, 0x1e1d                           
  1311  8ec0             mov es, ax                               
  1313  268b878288       mov ax, word ptr es:[bx - 0x777e]        
  1318  8bd9             mov bx, cx                               
  131a  d1e3             shl bx, 1                                
  131c  8d56f0           lea dx, [bp - 0x10]                      
  131f  03da             add bx, dx                               
  1321  368907           mov word ptr ss:[bx], ax                 
  1324  eb18             jmp 0x133e                               
  1326  8bc6             mov ax, si                               
  1328  6bc05c           imul ax, ax, 0x5c                        
  132b  c41eee40         les bx, ptr [0x40ee]                     
  132f  03d8             add bx, ax                               
  1331  8bc1             mov ax, cx                               
  1333  d1e0             shl ax, 1                                
  1335  03d8             add bx, ax                               
  1337  26c7878a02ffff   mov word ptr es:[bx + 0x28a], 0xffff     
  133e  8bc1             mov ax, cx                               
  1340  49               dec cx                                   
  1341  0bc0             or ax, ax                                
  1343  7403             je 0x1348                                
  1345  e91aff           jmp 0x1262                               
  1348  5f               pop di                                   
  1349  5e               pop si                                   
  134a  c9               leave                                    
  134b  cb               retf                                     

ovl19_134c:  ; ENTRY
  134c  55               push bp                                  
  134d  8bec             mov bp, sp                               
  134f  83ec16           sub sp, 0x16                             
  1352  56               push si                                  
  1353  57               push di                                  
  1354  8b7e06           mov di, word ptr [bp + 6]                
  1357  c746fa0000       mov word ptr [bp - 6], 0                 
  135c  8bc7             mov ax, di                               
  135e  6bc05c           imul ax, ax, 0x5c                        
  1361  c41eee40         les bx, ptr [0x40ee]                     
  1365  03d8             add bx, ax                               
  1367  268b875002       mov ax, word ptr es:[bx + 0x250]         
  136c  8946f8           mov word ptr [bp - 8], ax                
  136f  8bc7             mov ax, di                               
  1371  6bc05c           imul ax, ax, 0x5c                        
  1374  8b1eee40         mov bx, word ptr [0x40ee]                
  1378  03d8             add bx, ax                               
  137a  268b874e02       mov ax, word ptr es:[bx + 0x24e]         
  137f  8946f6           mov word ptr [bp - 0xa], ax              
  1382  8b46f8           mov ax, word ptr [bp - 8]                
  1385  3b4608           cmp ax, word ptr [bp + 8]                
  1388  7505             jne 0x138f                               
  138a  33c0             xor ax, ax                               
  138c  e9e601           jmp 0x1575                               
  138f  6a01             push 1                                   
  1391  ff7608           push word ptr [bp + 8]                   
  1394  9a2500d62f       lcall 0x2fd6, 0x25                       -> ovl24:023f
  1399  83c404           add sp, 4                                
  139c  33d2             xor dx, dx                               
  139e  eb36             jmp 0x13d6                               
  13a0  8bc7             mov ax, di                               
  13a2  6bc05c           imul ax, ax, 0x5c                        
  13a5  c41eee40         les bx, ptr [0x40ee]                     
  13a9  03d8             add bx, ax                               
  13ab  8bc2             mov ax, dx                               
  13ad  d1e0             shl ax, 1                                
  13af  03d8             add bx, ax                               
  13b1  268b875a02       mov ax, word ptr es:[bx + 0x25a]         
  13b6  3b4608           cmp ax, word ptr [bp + 8]                
  13b9  751a             jne 0x13d5                               
  13bb  8bc7             mov ax, di                               
  13bd  6bc05c           imul ax, ax, 0x5c                        
  13c0  8b1eee40         mov bx, word ptr [0x40ee]                
  13c4  03d8             add bx, ax                               
  13c6  8bc2             mov ax, dx                               
  13c8  d1e0             shl ax, 1                                
  13ca  03d8             add bx, ax                               
  13cc  26c7875a02ffff   mov word ptr es:[bx + 0x25a], 0xffff     
  13d3  eb06             jmp 0x13db                               
  13d5  42               inc dx                                   
  13d6  83fa06           cmp dx, 6                                
  13d9  7cc5             jl 0x13a0                                
  13db  c746fe0000       mov word ptr [bp - 2], 0                 
  13e0  16               push ss                                  
  13e1  8d46ea           lea ax, [bp - 0x16]                      
  13e4  50               push ax                                  
  13e5  16               push ss                                  
  13e6  8d46f0           lea ax, [bp - 0x10]                      
  13e9  50               push ax                                  
  13ea  6a00             push 0                                   
  13ec  ff7608           push word ptr [bp + 8]                   
  13ef  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  13f4  83c40c           add sp, 0xc                              
  13f7  33f6             xor si, si                               
  13f9  eb46             jmp 0x1441                               
  13fb  8a42f0           mov al, byte ptr [bp + si - 0x10]        
  13fe  b400             mov ah, 0                                
  1400  8bd0             mov dx, ax                               
  1402  3dff00           cmp ax, 0xff                             
  1405  7439             je 0x1440                                
  1407  8bda             mov bx, dx                               
  1409  6bdb41           imul bx, bx, 0x41                        
  140c  b8042c           mov ax, 0x2c04                           
  140f  8ec0             mov es, ax                               
  1411  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1416  98               cwde                                     
  1417  3b46f6           cmp ax, word ptr [bp - 0xa]              
  141a  7524             jne 0x1440                               
  141c  807aea0a         cmp byte ptr [bp + si - 0x16], 0xa       
  1420  7303             jae 0x1425                               
  1422  ff46fe           inc word ptr [bp - 2]                    
  1425  807aea14         cmp byte ptr [bp + si - 0x16], 0x14      
  1429  7303             jae 0x142e                               
  142b  ff46fe           inc word ptr [bp - 2]                    
  142e  807aea1e         cmp byte ptr [bp + si - 0x16], 0x1e      
  1432  7303             jae 0x1437                               
  1434  ff46fe           inc word ptr [bp - 2]                    
  1437  807aea32         cmp byte ptr [bp + si - 0x16], 0x32      
  143b  7303             jae 0x1440                               
  143d  ff46fe           inc word ptr [bp - 2]                    
  1440  46               inc si                                   
  1441  83fe06           cmp si, 6                                
  1444  7cb5             jl 0x13fb                                
  1446  c746fc0000       mov word ptr [bp - 4], 0                 
  144b  16               push ss                                  
  144c  8d46ea           lea ax, [bp - 0x16]                      
  144f  50               push ax                                  
  1450  16               push ss                                  
  1451  8d46f0           lea ax, [bp - 0x10]                      
  1454  50               push ax                                  
  1455  6a00             push 0                                   
  1457  ff76f8           push word ptr [bp - 8]                   
  145a  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  145f  83c40c           add sp, 0xc                              
  1462  33f6             xor si, si                               
  1464  eb46             jmp 0x14ac                               
  1466  8a42f0           mov al, byte ptr [bp + si - 0x10]        
  1469  b400             mov ah, 0                                
  146b  8bd0             mov dx, ax                               
  146d  3dff00           cmp ax, 0xff                             
  1470  7439             je 0x14ab                                
  1472  8bda             mov bx, dx                               
  1474  6bdb41           imul bx, bx, 0x41                        
  1477  b8042c           mov ax, 0x2c04                           
  147a  8ec0             mov es, ax                               
  147c  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1481  98               cwde                                     
  1482  3b46f6           cmp ax, word ptr [bp - 0xa]              
  1485  7524             jne 0x14ab                               
  1487  807aea0a         cmp byte ptr [bp + si - 0x16], 0xa       
  148b  7303             jae 0x1490                               
  148d  ff46fc           inc word ptr [bp - 4]                    
  1490  807aea14         cmp byte ptr [bp + si - 0x16], 0x14      
  1494  7303             jae 0x1499                               
  1496  ff46fc           inc word ptr [bp - 4]                    
  1499  807aea1e         cmp byte ptr [bp + si - 0x16], 0x1e      
  149d  7303             jae 0x14a2                               
  149f  ff46fc           inc word ptr [bp - 4]                    
  14a2  807aea32         cmp byte ptr [bp + si - 0x16], 0x32      
  14a6  7303             jae 0x14ab                               
  14a8  ff46fc           inc word ptr [bp - 4]                    
  14ab  46               inc si                                   
  14ac  83fe06           cmp si, 6                                
  14af  7cb5             jl 0x1466                                
  14b1  837efe00         cmp word ptr [bp - 2], 0                 
  14b5  750b             jne 0x14c2                               
  14b7  837efc00         cmp word ptr [bp - 4], 0                 
  14bb  7505             jne 0x14c2                               
  14bd  c746fa0100       mov word ptr [bp - 6], 1                 
  14c2  8b46fe           mov ax, word ptr [bp - 2]                
  14c5  3b46fc           cmp ax, word ptr [bp - 4]                
  14c8  7e05             jle 0x14cf                               
  14ca  8b4608           mov ax, word ptr [bp + 8]                
  14cd  eb03             jmp 0x14d2                               
  14cf  8b46f8           mov ax, word ptr [bp - 8]                
  14d2  8bc8             mov cx, ax                               
  14d4  33f6             xor si, si                               
  14d6  33d2             xor dx, dx                               
  14d8  eb1e             jmp 0x14f8                               
  14da  8bc7             mov ax, di                               
  14dc  6bc05c           imul ax, ax, 0x5c                        
  14df  c41eee40         les bx, ptr [0x40ee]                     
  14e3  03d8             add bx, ax                               
  14e5  8bc2             mov ax, dx                               
  14e7  d1e0             shl ax, 1                                
  14e9  03d8             add bx, ax                               
  14eb  26398f9202       cmp word ptr es:[bx + 0x292], cx         
  14f0  7505             jne 0x14f7                               
  14f2  be0100           mov si, 1                                
  14f5  eb06             jmp 0x14fd                               
  14f7  42               inc dx                                   
  14f8  83fa06           cmp dx, 6                                
  14fb  7cdd             jl 0x14da                                
  14fd  0bf6             or si, si                                
  14ff  753b             jne 0x153c                               
  1501  33d2             xor dx, dx                               
  1503  eb32             jmp 0x1537                               
  1505  8bc7             mov ax, di                               
  1507  6bc05c           imul ax, ax, 0x5c                        
  150a  c41eee40         les bx, ptr [0x40ee]                     
  150e  03d8             add bx, ax                               
  1510  8bc2             mov ax, dx                               
  1512  d1e0             shl ax, 1                                
  1514  03d8             add bx, ax                               
  1516  2683bf9202ff     cmp word ptr es:[bx + 0x292], -1         
  151c  7518             jne 0x1536                               
  151e  8bc7             mov ax, di                               
  1520  6bc05c           imul ax, ax, 0x5c                        
  1523  8b1eee40         mov bx, word ptr [0x40ee]                
  1527  03d8             add bx, ax                               
  1529  8bc2             mov ax, dx                               
  152b  d1e0             shl ax, 1                                
  152d  03d8             add bx, ax                               
  152f  26898f9202       mov word ptr es:[bx + 0x292], cx         
  1534  eb06             jmp 0x153c                               
  1536  42               inc dx                                   
  1537  83fa06           cmp dx, 6                                
  153a  7cc9             jl 0x1505                                
  153c  837efa00         cmp word ptr [bp - 6], 0                 
  1540  740d             je 0x154f                                
  1542  6a03             push 3                                   
  1544  57               push di                                  
  1545  0e               push cs                                  
  1546  e824f1           call 0x66d                               
  1549  83c404           add sp, 4                                
  154c  e93bfe           jmp 0x138a                               
  154f  8bc7             mov ax, di                               
  1551  6bc05c           imul ax, ax, 0x5c                        
  1554  c41eee40         les bx, ptr [0x40ee]                     
  1558  03d8             add bx, ax                               
  155a  26898f5002       mov word ptr es:[bx + 0x250], cx         
  155f  8b1eee40         mov bx, word ptr [0x40ee]                
  1563  035e08           add bx, word ptr [bp + 8]                
  1566  26c6475607       mov byte ptr es:[bx + 0x56], 7           
  156b  57               push di                                  
  156c  90               nop                                      
  156d  0e               push cs                                  
  156e  e88c01           call 0x16fd                              
  1571  59               pop cx                                   
  1572  b80100           mov ax, 1                                
  1575  5f               pop di                                   
  1576  5e               pop si                                   
  1577  c9               leave                                    
  1578  cb               retf                                     

ovl19_1579:  ; ENTRY
  1579  55               push bp                                  
  157a  8bec             mov bp, sp                               
  157c  83ec18           sub sp, 0x18                             
  157f  56               push si                                  
  1580  57               push di                                  
  1581  8b7606           mov si, word ptr [bp + 6]                
  1584  c746fa0000       mov word ptr [bp - 6], 0                 
  1589  c746f8ffff       mov word ptr [bp - 8], 0xffff            
  158e  33c9             xor cx, cx                               
  1590  8bc6             mov ax, si                               
  1592  6bc05c           imul ax, ax, 0x5c                        
  1595  c41eee40         les bx, ptr [0x40ee]                     
  1599  03d8             add bx, ax                               
  159b  268b875002       mov ax, word ptr es:[bx + 0x250]         
  15a0  8946f6           mov word ptr [bp - 0xa], ax              
  15a3  8bc6             mov ax, si                               
  15a5  6bc05c           imul ax, ax, 0x5c                        
  15a8  8b1eee40         mov bx, word ptr [0x40ee]                
  15ac  03d8             add bx, ax                               
  15ae  268b874e02       mov ax, word ptr es:[bx + 0x24e]         
  15b3  8946f4           mov word ptr [bp - 0xc], ax              
  15b6  33d2             xor dx, dx                               
  15b8  eb34             jmp 0x15ee                               
  15ba  8bc6             mov ax, si                               
  15bc  6bc05c           imul ax, ax, 0x5c                        
  15bf  c41eee40         les bx, ptr [0x40ee]                     
  15c3  03d8             add bx, ax                               
  15c5  8bc2             mov ax, dx                               
  15c7  d1e0             shl ax, 1                                
  15c9  03d8             add bx, ax                               
  15cb  2683bf5a02ff     cmp word ptr es:[bx + 0x25a], -1         
  15d1  741a             je 0x15ed                                
  15d3  8bc6             mov ax, si                               
  15d5  6bc05c           imul ax, ax, 0x5c                        
  15d8  8b1eee40         mov bx, word ptr [0x40ee]                
  15dc  03d8             add bx, ax                               
  15de  8bc2             mov ax, dx                               
  15e0  d1e0             shl ax, 1                                
  15e2  03d8             add bx, ax                               
  15e4  268b875a02       mov ax, word ptr es:[bx + 0x25a]         
  15e9  8946fc           mov word ptr [bp - 4], ax                
  15ec  41               inc cx                                   
  15ed  42               inc dx                                   
  15ee  83fa06           cmp dx, 6                                
  15f1  7cc7             jl 0x15ba                                
  15f3  83f901           cmp cx, 1                                
  15f6  7403             je 0x15fb                                
  15f8  e9fe00           jmp 0x16f9                               
  15fb  16               push ss                                  
  15fc  8d46e8           lea ax, [bp - 0x18]                      
  15ff  50               push ax                                  
  1600  16               push ss                                  
  1601  8d46ee           lea ax, [bp - 0x12]                      
  1604  50               push ax                                  
  1605  6a00             push 0                                   
  1607  ff76fc           push word ptr [bp - 4]                   
  160a  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  160f  83c40c           add sp, 0xc                              
  1612  c746fe0000       mov word ptr [bp - 2], 0                 
  1617  e9b700           jmp 0x16d1                               
  161a  8d46ee           lea ax, [bp - 0x12]                      
  161d  8b5efe           mov bx, word ptr [bp - 2]                
  1620  03d8             add bx, ax                               
  1622  368a07           mov al, byte ptr ss:[bx]                 
  1625  b400             mov ah, 0                                
  1627  8bf8             mov di, ax                               
  1629  3dff00           cmp ax, 0xff                             
  162c  7503             jne 0x1631                               
  162e  e99d00           jmp 0x16ce                               
  1631  c41eee40         les bx, ptr [0x40ee]                     
  1635  03df             add bx, di                               
  1637  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  163d  7403             je 0x1642                                
  163f  e98c00           jmp 0x16ce                               
  1642  8bdf             mov bx, di                               
  1644  6bdb41           imul bx, bx, 0x41                        
  1647  b8042c           mov ax, 0x2c04                           
  164a  8ec0             mov es, ax                               
  164c  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  1651  98               cwde                                     
  1652  3b46f4           cmp ax, word ptr [bp - 0xc]              
  1655  753d             jne 0x1694                               
  1657  33d2             xor dx, dx                               
  1659  eb32             jmp 0x168d                               
  165b  8bc6             mov ax, si                               
  165d  6bc05c           imul ax, ax, 0x5c                        
  1660  c41eee40         les bx, ptr [0x40ee]                     
  1664  03d8             add bx, ax                               
  1666  8bc2             mov ax, dx                               
  1668  d1e0             shl ax, 1                                
  166a  03d8             add bx, ax                               
  166c  2683bf5a02ff     cmp word ptr es:[bx + 0x25a], -1         
  1672  7518             jne 0x168c                               
  1674  8bc6             mov ax, si                               
  1676  6bc05c           imul ax, ax, 0x5c                        
  1679  8b1eee40         mov bx, word ptr [0x40ee]                
  167d  03d8             add bx, ax                               
  167f  8bc2             mov ax, dx                               
  1681  d1e0             shl ax, 1                                
  1683  03d8             add bx, ax                               
  1685  2689bf5a02       mov word ptr es:[bx + 0x25a], di         
  168a  eb42             jmp 0x16ce                               
  168c  42               inc dx                                   
  168d  83fa06           cmp dx, 6                                
  1690  7cc9             jl 0x165b                                
  1692  eb3a             jmp 0x16ce                               
  1694  8bdf             mov bx, di                               
  1696  6bdb41           imul bx, bx, 0x41                        
  1699  b8042c           mov ax, 0x2c04                           
  169c  8ec0             mov es, ax                               
  169e  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  16a3  98               cwde                                     
  16a4  ba042c           mov dx, 0x2c04                           
  16a7  8ec2             mov es, dx                               
  16a9  263b061001       cmp ax, word ptr es:[0x110]              
  16ae  751e             jne 0x16ce                               
  16b0  397ef6           cmp word ptr [bp - 0xa], di              
  16b3  7505             jne 0x16ba                               
  16b5  c746fa0100       mov word ptr [bp - 6], 1                 
  16ba  57               push di                                  
  16bb  9a2500e82f       lcall 0x2fe8, 0x25                       -> ovl27:07f8
  16c0  59               pop cx                                   
  16c1  0bc0             or ax, ax                                
  16c3  7509             jne 0x16ce                               
  16c5  837ef8ff         cmp word ptr [bp - 8], -1                
  16c9  7503             jne 0x16ce                               
  16cb  897ef8           mov word ptr [bp - 8], di                
  16ce  ff46fe           inc word ptr [bp - 2]                    
  16d1  837efe06         cmp word ptr [bp - 2], 6                 
  16d5  7d03             jge 0x16da                               
  16d7  e940ff           jmp 0x161a                               
  16da  837efa00         cmp word ptr [bp - 6], 0                 
  16de  7519             jne 0x16f9                               
  16e0  837ef8ff         cmp word ptr [bp - 8], -1                
  16e4  7413             je 0x16f9                                
  16e6  8bc6             mov ax, si                               
  16e8  6bc05c           imul ax, ax, 0x5c                        
  16eb  c41eee40         les bx, ptr [0x40ee]                     
  16ef  03d8             add bx, ax                               
  16f1  8b46f8           mov ax, word ptr [bp - 8]                
  16f4  2689875002       mov word ptr es:[bx + 0x250], ax         
  16f9  5f               pop di                                   
  16fa  5e               pop si                                   
  16fb  c9               leave                                    
  16fc  cb               retf                                     

ovl19_16fd:  ; ENTRY
  16fd  55               push bp                                  
  16fe  8bec             mov bp, sp                               
  1700  83ec24           sub sp, 0x24                             
  1703  56               push si                                  
  1704  57               push di                                  
  1705  8b4606           mov ax, word ptr [bp + 6]                
  1708  6bc05c           imul ax, ax, 0x5c                        
  170b  c41eee40         les bx, ptr [0x40ee]                     
  170f  03d8             add bx, ax                               
  1711  268b875002       mov ax, word ptr es:[bx + 0x250]         
  1716  8946fa           mov word ptr [bp - 6], ax                
  1719  8b4606           mov ax, word ptr [bp + 6]                
  171c  6bc05c           imul ax, ax, 0x5c                        
  171f  8b1eee40         mov bx, word ptr [0x40ee]                
  1723  03d8             add bx, ax                               
  1725  268b87a402       mov ax, word ptr es:[bx + 0x2a4]         
  172a  8946f8           mov word ptr [bp - 8], ax                
  172d  c746fe0000       mov word ptr [bp - 2], 0                 
  1732  e92201           jmp 0x1857                               
  1735  8b4606           mov ax, word ptr [bp + 6]                
  1738  6bc05c           imul ax, ax, 0x5c                        
  173b  c41eee40         les bx, ptr [0x40ee]                     
  173f  03d8             add bx, ax                               
  1741  8b46fe           mov ax, word ptr [bp - 2]                
  1744  d1e0             shl ax, 1                                
  1746  03d8             add bx, ax                               
  1748  268bb79202       mov si, word ptr es:[bx + 0x292]         
  174d  8bc6             mov ax, si                               
  174f  3dffff           cmp ax, 0xffff                           
  1752  7503             jne 0x1757                               
  1754  e9fd00           jmp 0x1854                               
  1757  3b76fa           cmp si, word ptr [bp - 6]                
  175a  7503             jne 0x175f                               
  175c  e9f500           jmp 0x1854                               
  175f  8bde             mov bx, si                               
  1761  6bdb41           imul bx, bx, 0x41                        
  1764  b8042c           mov ax, 0x2c04                           
  1767  8ec0             mov es, ax                               
  1769  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  176e  98               cwde                                     
  176f  ba042c           mov dx, 0x2c04                           
  1772  8ec2             mov es, dx                               
  1774  263b061001       cmp ax, word ptr es:[0x110]              
  1779  7403             je 0x177e                                
  177b  e9d600           jmp 0x1854                               
  177e  16               push ss                                  
  177f  8d46ec           lea ax, [bp - 0x14]                      
  1782  50               push ax                                  
  1783  16               push ss                                  
  1784  8d46f2           lea ax, [bp - 0xe]                       
  1787  50               push ax                                  
  1788  6a00             push 0                                   
  178a  56               push si                                  
  178b  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  1790  83c40c           add sp, 0xc                              
  1793  33c9             xor cx, cx                               
  1795  bf0600           mov di, 6                                
  1798  eb3e             jmp 0x17d8                               
  179a  8a43f2           mov al, byte ptr [bp + di - 0xe]         
  179d  b400             mov ah, 0                                
  179f  8bd0             mov dx, ax                               
  17a1  3dff00           cmp ax, 0xff                             
  17a4  7432             je 0x17d8                                
  17a6  8bda             mov bx, dx                               
  17a8  6bdb41           imul bx, bx, 0x41                        
  17ab  b8042c           mov ax, 0x2c04                           
  17ae  8ec0             mov es, ax                               
  17b0  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  17b6  7420             je 0x17d8                                
  17b8  8bda             mov bx, dx                               
  17ba  6bdb41           imul bx, bx, 0x41                        
  17bd  8ec0             mov es, ax                               
  17bf  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  17c4  98               cwde                                     
  17c5  ba042c           mov dx, 0x2c04                           
  17c8  8ec2             mov es, dx                               
  17ca  263b061001       cmp ax, word ptr es:[0x110]              
  17cf  7407             je 0x17d8                                
  17d1  807bec19         cmp byte ptr [bp + di - 0x14], 0x19      
  17d5  7301             jae 0x17d8                               
  17d7  41               inc cx                                   
  17d8  8bc7             mov ax, di                               
  17da  4f               dec di                                   
  17db  0bc0             or ax, ax                                
  17dd  75bb             jne 0x179a                               
  17df  0bc9             or cx, cx                                
  17e1  7571             jne 0x1854                               
  17e3  6a01             push 1                                   
  17e5  56               push si                                  
  17e6  9a2500d62f       lcall 0x2fd6, 0x25                       -> ovl24:023f
  17eb  83c404           add sp, 4                                
  17ee  ff76f8           push word ptr [bp - 8]                   
  17f1  666a00           push 0                                   
  17f4  16               push ss                                  
  17f5  8d46dc           lea ax, [bp - 0x24]                      
  17f8  50               push ax                                  
  17f9  8bde             mov bx, si                               
  17fb  6bdb41           imul bx, bx, 0x41                        
  17fe  b8042c           mov ax, 0x2c04                           
  1801  8ec0             mov es, ax                               
  1803  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1808  8bde             mov bx, si                               
  180a  6bdb41           imul bx, bx, 0x41                        
  180d  b8042c           mov ax, 0x2c04                           
  1810  8ec0             mov es, ax                               
  1812  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  1817  40               inc ax                                   
  1818  50               push ax                                  
  1819  9a5700f72f       lcall 0x2ff7, 0x57                       -> ovl29:13b2
  181e  83c40e           add sp, 0xe                              
  1821  8946fc           mov word ptr [bp - 4], ax                
  1824  837efc03         cmp word ptr [bp - 4], 3                 
  1828  7e2a             jle 0x1854                               
  182a  6a00             push 0                                   
  182c  ff76fa           push word ptr [bp - 6]                   
  182f  6a01             push 1                                   
  1831  16               push ss                                  
  1832  8d46dc           lea ax, [bp - 0x24]                      
  1835  50               push ax                                  
  1836  9a2a00f72f       lcall 0x2ff7, 0x2a                       -> ovl29:0ae7
  183b  83c40a           add sp, 0xa                              
  183e  6a00             push 0                                   
  1840  c41e625e         les bx, ptr [0x5e62]                     
  1844  26ff7714         push word ptr es:[bx + 0x14]             
  1848  26ff7712         push word ptr es:[bx + 0x12]             
  184c  9a01008b0a       lcall 0xa8b, 1                           -> 0a8b:0001
  1851  83c406           add sp, 6                                
  1854  ff46fe           inc word ptr [bp - 2]                    
  1857  837efe06         cmp word ptr [bp - 2], 6                 
  185b  7d03             jge 0x1860                               
  185d  e9d5fe           jmp 0x1735                               
  1860  5f               pop di                                   
  1861  5e               pop si                                   
  1862  c9               leave                                    
  1863  cb               retf                                     

ovl19_1864:  ; ENTRY
  1864  55               push bp                                  
  1865  8bec             mov bp, sp                               
  1867  83ec14           sub sp, 0x14                             
  186a  56               push si                                  
  186b  57               push di                                  
  186c  8b7606           mov si, word ptr [bp + 6]                
  186f  56               push si                                  
  1870  9a39000530       lcall 0x3005, 0x39                       -> ovl31:07d0
  1875  59               pop cx                                   
  1876  8946fc           mov word ptr [bp - 4], ax                
  1879  837e0800         cmp word ptr [bp + 8], 0                 
  187d  7565             jne 0x18e4                               
  187f  c746f80000       mov word ptr [bp - 8], 0                 
  1884  16               push ss                                  
  1885  8d46ec           lea ax, [bp - 0x14]                      
  1888  50               push ax                                  
  1889  16               push ss                                  
  188a  8d46f2           lea ax, [bp - 0xe]                       
  188d  50               push ax                                  
  188e  6a00             push 0                                   
  1890  56               push si                                  
  1891  9a5c00db2f       lcall 0x2fdb, 0x5c                       -> ovl25:0656
  1896  83c40c           add sp, 0xc                              
  1899  bf0600           mov di, 6                                
  189c  eb33             jmp 0x18d1                               
  189e  8a43f2           mov al, byte ptr [bp + di - 0xe]         
  18a1  b400             mov ah, 0                                
  18a3  8946fa           mov word ptr [bp - 6], ax                
  18a6  3dff00           cmp ax, 0xff                             
  18a9  7426             je 0x18d1                                
  18ab  8b5efa           mov bx, word ptr [bp - 6]                
  18ae  6bdb41           imul bx, bx, 0x41                        
  18b1  b8042c           mov ax, 0x2c04                           
  18b4  8ec0             mov es, ax                               
  18b6  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  18bb  98               cwde                                     
  18bc  ba042c           mov dx, 0x2c04                           
  18bf  8ec2             mov es, dx                               
  18c1  263b061001       cmp ax, word ptr es:[0x110]              
  18c6  7509             jne 0x18d1                               
  18c8  807bec2d         cmp byte ptr [bp + di - 0x14], 0x2d      
  18cc  7303             jae 0x18d1                               
  18ce  ff46f8           inc word ptr [bp - 8]                    
  18d1  8bc7             mov ax, di                               
  18d3  4f               dec di                                   
  18d4  0bc0             or ax, ax                                
  18d6  75c6             jne 0x189e                               
  18d8  837ef803         cmp word ptr [bp - 8], 3                 
  18dc  7c06             jl 0x18e4                                
  18de  b8ffff           mov ax, 0xffff                           
  18e1  e9b400           jmp 0x1998                               
  18e4  817efc9001       cmp word ptr [bp - 4], 0x190             
  18e9  7c09             jl 0x18f4                                
  18eb  56               push si                                  
  18ec  90               nop                                      
  18ed  0e               push cs                                  
  18ee  e8ab00           call 0x199c                              
  18f1  59               pop cx                                   
  18f2  ebea             jmp 0x18de                               
  18f4  8bc6             mov ax, si                               
  18f6  6bc041           imul ax, ax, 0x41                        
  18f9  058115           add ax, 0x1581                           
  18fc  68042c           push 0x2c04                              
  18ff  50               push ax                                  
  1900  1e               push ds                                  
  1901  688807           push 0x788                                ; "%s is being razed!"
  1904  1e               push ds                                  
  1905  68885c           push 0x5c88                              
  1908  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  190d  83c40c           add sp, 0xc                              
  1910  1e               push ds                                  
  1911  68885c           push 0x5c88                              
  1914  9a43002430       lcall 0x3024, 0x43                       -> ovl36:16b3
  1919  83c404           add sp, 4                                
  191c  6a01             push 1                                   
  191e  8bde             mov bx, si                               
  1920  6bdb41           imul bx, bx, 0x41                        
  1923  b8042c           mov ax, 0x2c04                           
  1926  8ec0             mov es, ax                               
  1928  26ffb77f15       push word ptr es:[bx + 0x157f]           
  192d  8bde             mov bx, si                               
  192f  6bdb41           imul bx, bx, 0x41                        
  1932  b8042c           mov ax, 0x2c04                           
  1935  8ec0             mov es, ax                               
  1937  26ffb77d15       push word ptr es:[bx + 0x157d]           
  193c  9a34000b30       lcall 0x300b, 0x34                       -> ovl32:016b
  1941  83c406           add sp, 6                                
  1944  666a0f           push 0xf                                 
  1947  6a01             push 1                                   
  1949  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  194e  83c406           add sp, 6                                
  1951  050a00           add ax, 0xa                              
  1954  ba042c           mov dx, 0x2c04                           
  1957  8ec2             mov es, dx                               
  1959  268b1e1001       mov bx, word ptr es:[0x110]              
  195e  d1e3             shl bx, 1                                
  1960  ba042c           mov dx, 0x2c04                           
  1963  8ec2             mov es, dx                               
  1965  260187e310       add word ptr es:[bx + 0x10e3], ax        
  196a  8bde             mov bx, si                               
  196c  6bdb41           imul bx, bx, 0x41                        
  196f  b8042c           mov ax, 0x2c04                           
  1972  8ec0             mov es, ax                               
  1974  26ffb77f15       push word ptr es:[bx + 0x157f]           
  1979  8bde             mov bx, si                               
  197b  6bdb41           imul bx, bx, 0x41                        
  197e  b8042c           mov ax, 0x2c04                           
  1981  8ec0             mov es, ax                               
  1983  26ffb77d15       push word ptr es:[bx + 0x157d]           
  1988  9a3400d62f       lcall 0x2fd6, 0x34                       -> ovl24:10a1
  198d  83c404           add sp, 4                                
  1990  9a7f00f72f       lcall 0x2ff7, 0x7f                       -> ovl29:1851
  1995  8946fe           mov word ptr [bp - 2], ax                
  1998  5f               pop di                                   
  1999  5e               pop si                                   
  199a  c9               leave                                    
  199b  cb               retf                                     

ovl19_199c:  ; ENTRY
  199c  55               push bp                                  
  199d  8bec             mov bp, sp                               
  199f  56               push si                                  
  19a0  57               push di                                  
  19a1  8b7606           mov si, word ptr [bp + 6]                
  19a4  56               push si                                  
  19a5  9a39000530       lcall 0x3005, 0x39                       -> ovl31:07d0
  19aa  59               pop cx                                   
  19ab  8bf8             mov di, ax                               
  19ad  0bff             or di, di                                
  19af  7509             jne 0x19ba                               
  19b1  56               push si                                  
  19b2  90               nop                                      
  19b3  0e               push cs                                  
  19b4  e87300           call 0x1a2a                              
  19b7  59               pop cx                                   
  19b8  eb6c             jmp 0x1a26                               
  19ba  8bc6             mov ax, si                               
  19bc  6bc041           imul ax, ax, 0x41                        
  19bf  058115           add ax, 0x1581                           
  19c2  68042c           push 0x2c04                              
  19c5  50               push ax                                  
  19c6  1e               push ds                                  
  19c7  689b07           push 0x79b                                ; "%s is being sacked!"
  19ca  1e               push ds                                  
  19cb  68885c           push 0x5c88                              
  19ce  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  19d3  83c40c           add sp, 0xc                              
  19d6  1e               push ds                                  
  19d7  68885c           push 0x5c88                              
  19da  9a43002430       lcall 0x3024, 0x43                       -> ovl36:16b3
  19df  83c404           add sp, 4                                
  19e2  56               push si                                  
  19e3  9a48000530       lcall 0x3005, 0x48                       -> ovl31:0941
  19e8  59               pop cx                                   
  19e9  666a0a           push 0xa                                 
  19ec  6a01             push 1                                   
  19ee  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  19f3  83c406           add sp, 6                                
  19f6  050500           add ax, 5                                
  19f9  ba042c           mov dx, 0x2c04                           
  19fc  8ec2             mov es, dx                               
  19fe  268b1e1001       mov bx, word ptr es:[0x110]              
  1a03  d1e3             shl bx, 1                                
  1a05  ba042c           mov dx, 0x2c04                           
  1a08  8ec2             mov es, dx                               
  1a0a  260187e310       add word ptr es:[bx + 0x10e3], ax        
  1a0f  b8042c           mov ax, 0x2c04                           
  1a12  8ec0             mov es, ax                               
  1a14  268b1e1001       mov bx, word ptr es:[0x110]              
  1a19  6bdb14           imul bx, bx, 0x14                        
  1a1c  b8042c           mov ax, 0x2c04                           
  1a1f  8ec0             mov es, ax                               
  1a21  2601bf8501       add word ptr es:[bx + 0x185], di         
  1a26  5f               pop di                                   
  1a27  5e               pop si                                   
  1a28  5d               pop bp                                   
  1a29  cb               retf                                     

ovl19_1a2a:  ; ENTRY
  1a2a  55               push bp                                  
  1a2b  8bec             mov bp, sp                               
  1a2d  56               push si                                  
  1a2e  57               push di                                  
  1a2f  8b7606           mov si, word ptr [bp + 6]                
  1a32  56               push si                                  
  1a33  9a3e000530       lcall 0x3005, 0x3e                       -> ovl31:0834
  1a38  59               pop cx                                   
  1a39  8bf8             mov di, ax                               
  1a3b  0bff             or di, di                                
  1a3d  7469             je 0x1aa8                                
  1a3f  8bc6             mov ax, si                               
  1a41  6bc041           imul ax, ax, 0x41                        
  1a44  058115           add ax, 0x1581                           
  1a47  68042c           push 0x2c04                              
  1a4a  50               push ax                                  
  1a4b  1e               push ds                                  
  1a4c  68af07           push 0x7af                                ; "%s is being pillaged!"
  1a4f  1e               push ds                                  
  1a50  68885c           push 0x5c88                              
  1a53  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  1a58  83c40c           add sp, 0xc                              
  1a5b  1e               push ds                                  
  1a5c  68885c           push 0x5c88                              
  1a5f  9a43002430       lcall 0x3024, 0x43                       -> ovl36:16b3
  1a64  83c404           add sp, 4                                
  1a67  b8042c           mov ax, 0x2c04                           
  1a6a  8ec0             mov es, ax                               
  1a6c  268b1e1001       mov bx, word ptr es:[0x110]              
  1a71  6bdb14           imul bx, bx, 0x14                        
  1a74  b8042c           mov ax, 0x2c04                           
  1a77  8ec0             mov es, ax                               
  1a79  2601bf8501       add word ptr es:[bx + 0x185], di         
  1a7e  56               push si                                  
  1a7f  9a43000530       lcall 0x3005, 0x43                       -> ovl31:0886
  1a84  59               pop cx                                   
  1a85  666a05           push 5                                   
  1a88  6a01             push 1                                   
  1a8a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1a8f  83c406           add sp, 6                                
  1a92  ba042c           mov dx, 0x2c04                           
  1a95  8ec2             mov es, dx                               
  1a97  268b1e1001       mov bx, word ptr es:[0x110]              
  1a9c  d1e3             shl bx, 1                                
  1a9e  ba042c           mov dx, 0x2c04                           
  1aa1  8ec2             mov es, dx                               
  1aa3  260187e310       add word ptr es:[bx + 0x10e3], ax        
  1aa8  5f               pop di                                   
  1aa9  5e               pop si                                   
  1aaa  5d               pop bp                                   
  1aab  cb               retf                                     
