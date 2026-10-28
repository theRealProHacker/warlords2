; ovl21 stub 2fc5 file_off 0x4cd60 size 0x10f5

ovl21_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  57               push di                                  
  0005  90               nop                                      
  0006  0e               push cs                                  
  0007  e8c509           call 0x9cf                               
  000a  90               nop                                      
  000b  0e               push cs                                  
  000c  e8460b           call 0xb55                               
  000f  c41eee40         les bx, ptr [0x40ee]                     
  0013  33c0             xor ax, ax                               
  0015  26894708         mov word ptr es:[bx + 8], ax             
  0019  26894706         mov word ptr es:[bx + 6], ax             
  001d  26894704         mov word ptr es:[bx + 4], ax             
  0021  26894702         mov word ptr es:[bx + 2], ax             
  0025  b8042c           mov ax, 0x2c04                           
  0028  8ec0             mov es, ax                               
  002a  268b3e7b15       mov di, word ptr es:[0x157b]             
  002f  e9ea00           jmp 0x11c                                
  0032  8bdf             mov bx, di                               
  0034  6bdb41           imul bx, bx, 0x41                        
  0037  b8042c           mov ax, 0x2c04                           
  003a  8ec0             mov es, ax                               
  003c  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  0041  69dbe000         imul bx, bx, 0xe0                        
  0045  8bf7             mov si, di                               
  0047  6bf641           imul si, si, 0x41                        
  004a  b8042c           mov ax, 0x2c04                           
  004d  8ec0             mov es, ax                               
  004f  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0054  d1e0             shl ax, 1                                
  0056  03d8             add bx, ax                               
  0058  b81d1e           mov ax, 0x1e1d                           
  005b  8ec0             mov es, ax                               
  005d  268a9f0000       mov bl, byte ptr es:[bx]                 
  0062  81e3ff00         and bx, 0xff                             
  0066  b8042c           mov ax, 0x2c04                           
  0069  8ec0             mov es, ax                               
  006b  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0071  741a             je 0x8d                                  
  0073  c41eee40         les bx, ptr [0x40ee]                     
  0077  03df             add bx, di                               
  0079  26c6475600       mov byte ptr es:[bx + 0x56], 0           
  007e  8b1eee40         mov bx, word ptr [0x40ee]                
  0082  03df             add bx, di                               
  0084  26c687ba0000     mov byte ptr es:[bx + 0xba], 0           
  008a  e98f00           jmp 0x11c                                
  008d  8bdf             mov bx, di                               
  008f  6bdb41           imul bx, bx, 0x41                        
  0092  b8042c           mov ax, 0x2c04                           
  0095  8ec0             mov es, ax                               
  0097  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  009c  98               cwde                                     
  009d  3b4606           cmp ax, word ptr [bp + 6]                
  00a0  7453             je 0xf5                                  
  00a2  c41eee40         les bx, ptr [0x40ee]                     
  00a6  03df             add bx, di                               
  00a8  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  00ae  7408             je 0xb8                                  
  00b0  8b1eee40         mov bx, word ptr [0x40ee]                
  00b4  26ff4708         inc word ptr es:[bx + 8]                 
  00b8  c41eee40         les bx, ptr [0x40ee]                     
  00bc  03df             add bx, di                               
  00be  26c6475600       mov byte ptr es:[bx + 0x56], 0           
  00c3  8b1eee40         mov bx, word ptr [0x40ee]                
  00c7  03df             add bx, di                               
  00c9  26c687ba0000     mov byte ptr es:[bx + 0xba], 0           
  00cf  8bdf             mov bx, di                               
  00d1  6bdb41           imul bx, bx, 0x41                        
  00d4  b8042c           mov ax, 0x2c04                           
  00d7  8ec0             mov es, ax                               
  00d9  2680bf92150f     cmp byte ptr es:[bx + 0x1592], 0xf       
  00df  750a             jne 0xeb                                 
  00e1  c41eee40         les bx, ptr [0x40ee]                     
  00e5  26ff4706         inc word ptr es:[bx + 6]                 
  00e9  eb31             jmp 0x11c                                
  00eb  c41eee40         les bx, ptr [0x40ee]                     
  00ef  26ff4704         inc word ptr es:[bx + 4]                 
  00f3  eb27             jmp 0x11c                                
  00f5  c41eee40         les bx, ptr [0x40ee]                     
  00f9  26ff4702         inc word ptr es:[bx + 2]                 
  00fd  03df             add bx, di                               
  00ff  26fe87ba00       inc byte ptr es:[bx + 0xba]              
  0104  8b1eee40         mov bx, word ptr [0x40ee]                
  0108  03df             add bx, di                               
  010a  26807f5600       cmp byte ptr es:[bx + 0x56], 0           
  010f  750b             jne 0x11c                                
  0111  8b1eee40         mov bx, word ptr [0x40ee]                
  0115  03df             add bx, di                               
  0117  26c6475601       mov byte ptr es:[bx + 0x56], 1           
  011c  8bc7             mov ax, di                               
  011e  4f               dec di                                   
  011f  0bc0             or ax, ax                                
  0121  7403             je 0x126                                 
  0123  e90cff           jmp 0x32                                 
  0126  c41eee40         les bx, ptr [0x40ee]                     
  012a  26837f0200       cmp word ptr es:[bx + 2], 0              
  012f  747e             je 0x1af                                 
  0131  b8042c           mov ax, 0x2c04                           
  0134  8ec0             mov es, ax                               
  0136  268b3e7b15       mov di, word ptr es:[0x157b]             
  013b  eb64             jmp 0x1a1                                
  013d  c41eee40         les bx, ptr [0x40ee]                     
  0141  03df             add bx, di                               
  0143  26807f5608       cmp byte ptr es:[bx + 0x56], 8           
  0148  7527             jne 0x171                                
  014a  8b1eee40         mov bx, word ptr [0x40ee]                
  014e  26837f0800       cmp word ptr es:[bx + 8], 0              
  0153  741c             je 0x171                                 
  0155  26837f2405       cmp word ptr es:[bx + 0x24], 5           
  015a  7d15             jge 0x171                                
  015c  03df             add bx, di                               
  015e  26f6871e0102     test byte ptr es:[bx + 0x11e], 2         
  0164  740b             je 0x171                                 
  0166  8b1eee40         mov bx, word ptr [0x40ee]                
  016a  03df             add bx, di                               
  016c  26c647560b       mov byte ptr es:[bx + 0x56], 0xb         
  0171  c41eee40         les bx, ptr [0x40ee]                     
  0175  03df             add bx, di                               
  0177  26807f5601       cmp byte ptr es:[bx + 0x56], 1           
  017c  7523             jne 0x1a1                                
  017e  666a00           push 0                                   
  0181  666a00           push 0                                   
  0184  57               push di                                  
  0185  9a2000bd2f       lcall 0x2fbd, 0x20                       -> ovl20:01f6
  018a  83c40a           add sp, 0xa                              
  018d  0bc0             or ax, ax                                
  018f  7404             je 0x195                                 
  0191  b003             mov al, 3                                
  0193  eb02             jmp 0x197                                
  0195  b005             mov al, 5                                
  0197  c41eee40         les bx, ptr [0x40ee]                     
  019b  03df             add bx, di                               
  019d  26884756         mov byte ptr es:[bx + 0x56], al          
  01a1  8bc7             mov ax, di                               
  01a3  4f               dec di                                   
  01a4  0bc0             or ax, ax                                
  01a6  7595             jne 0x13d                                
  01a8  c41eee40         les bx, ptr [0x40ee]                     
  01ac  26ff07           inc word ptr es:[bx]                     
  01af  5f               pop di                                   
  01b0  5e               pop si                                   
  01b1  5d               pop bp                                   
  01b2  cb               retf                                     

ovl21_01b3:  ; ENTRY
  01b3  55               push bp                                  
  01b4  8bec             mov bp, sp                               
  01b6  83ec24           sub sp, 0x24                             
  01b9  56               push si                                  
  01ba  57               push di                                  
  01bb  c746f20000       mov word ptr [bp - 0xe], 0               
  01c0  c41eee40         les bx, ptr [0x40ee]                     
  01c4  268b8f4a02       mov cx, word ptr es:[bx + 0x24a]         
  01c9  eb16             jmp 0x1e1                                
  01cb  8bc1             mov ax, cx                               
  01cd  6bc05c           imul ax, ax, 0x5c                        
  01d0  c41eee40         les bx, ptr [0x40ee]                     
  01d4  03d8             add bx, ax                               
  01d6  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  01dc  7403             je 0x1e1                                 
  01de  ff46f2           inc word ptr [bp - 0xe]                  
  01e1  8bc1             mov ax, cx                               
  01e3  49               dec cx                                   
  01e4  0bc0             or ax, ax                                
  01e6  75e3             jne 0x1cb                                
  01e8  c41eee40         les bx, ptr [0x40ee]                     
  01ec  33c0             xor ax, ax                               
  01ee  26894740         mov word ptr es:[bx + 0x40], ax          
  01f2  2689473e         mov word ptr es:[bx + 0x3e], ax          
  01f6  2689473c         mov word ptr es:[bx + 0x3c], ax          
  01fa  2689473a         mov word ptr es:[bx + 0x3a], ax          
  01fe  ba0800           mov dx, 8                                
  0201  eb0e             jmp 0x211                                
  0203  8bda             mov bx, dx                               
  0205  d1e3             shl bx, 1                                
  0207  8d46dc           lea ax, [bp - 0x24]                      
  020a  03d8             add bx, ax                               
  020c  36c7070000       mov word ptr ss:[bx], 0                  
  0211  8bc2             mov ax, dx                               
  0213  4a               dec dx                                   
  0214  0bc0             or ax, ax                                
  0216  75eb             jne 0x203                                
  0218  b8042c           mov ax, 0x2c04                           
  021b  8ec0             mov es, ax                               
  021d  268b367b15       mov si, word ptr es:[0x157b]             
  0222  e9e600           jmp 0x30b                                
  0225  8bde             mov bx, si                               
  0227  6bdb41           imul bx, bx, 0x41                        
  022a  b8042c           mov ax, 0x2c04                           
  022d  8ec0             mov es, ax                               
  022f  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0234  98               cwde                                     
  0235  ba042c           mov dx, 0x2c04                           
  0238  8ec2             mov es, dx                               
  023a  263b061001       cmp ax, word ptr es:[0x110]              
  023f  7403             je 0x244                                 
  0241  e9c700           jmp 0x30b                                
  0244  c41eee40         les bx, ptr [0x40ee]                     
  0248  03de             add bx, si                               
  024a  2680a71e0137     and byte ptr es:[bx + 0x11e], 0x37       
  0250  8b1eee40         mov bx, word ptr [0x40ee]                
  0254  03de             add bx, si                               
  0256  26807f5607       cmp byte ptr es:[bx + 0x56], 7           
  025b  7503             jne 0x260                                
  025d  e9ab00           jmp 0x30b                                
  0260  16               push ss                                  
  0261  8d46fe           lea ax, [bp - 2]                         
  0264  50               push ax                                  
  0265  56               push si                                  
  0266  9a8400f72f       lcall 0x2ff7, 0x84                       -> ovl29:1a4d
  026b  83c406           add sp, 6                                
  026e  0bc0             or ax, ax                                
  0270  7503             jne 0x275                                
  0272  e99600           jmp 0x30b                                
  0275  8bcf             mov cx, di                               
  0277  c746fcffff       mov word ptr [bp - 4], 0xffff            
  027c  8bde             mov bx, si                               
  027e  6bdb41           imul bx, bx, 0x41                        
  0281  035efe           add bx, word ptr [bp - 2]                
  0284  b8042c           mov ax, 0x2c04                           
  0287  8ec0             mov es, ax                               
  0289  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  028e  98               cwde                                     
  028f  8bf8             mov di, ax                               
  0291  8bde             mov bx, si                               
  0293  6bdb41           imul bx, bx, 0x41                        
  0296  035efe           add bx, word ptr [bp - 2]                
  0299  b8042c           mov ax, 0x2c04                           
  029c  8ec0             mov es, ax                               
  029e  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  02a3  98               cwde                                     
  02a4  6bc006           imul ax, ax, 6                           
  02a7  8bd8             mov bx, ax                               
  02a9  80bfc94501       cmp byte ptr [bx + 0x45c9], 1            
  02ae  7503             jne 0x2b3                                
  02b0  83c702           add di, 2                                
  02b3  ba0800           mov dx, 8                                
  02b6  eb39             jmp 0x2f1                                
  02b8  8bda             mov bx, dx                               
  02ba  d1e3             shl bx, 1                                
  02bc  8d46dc           lea ax, [bp - 0x24]                      
  02bf  03d8             add bx, ax                               
  02c1  36833f00         cmp word ptr ss:[bx], 0                  
  02c5  7510             jne 0x2d7                                
  02c7  8bda             mov bx, dx                               
  02c9  d1e3             shl bx, 1                                
  02cb  03d8             add bx, ax                               
  02cd  36893f           mov word ptr ss:[bx], di                 
  02d0  c746fcffff       mov word ptr [bp - 4], 0xffff            
  02d5  eb21             jmp 0x2f8                                
  02d7  8bda             mov bx, dx                               
  02d9  d1e3             shl bx, 1                                
  02db  8d46dc           lea ax, [bp - 0x24]                      
  02de  03d8             add bx, ax                               
  02e0  36390f           cmp word ptr ss:[bx], cx                 
  02e3  7d0c             jge 0x2f1                                
  02e5  8bda             mov bx, dx                               
  02e7  d1e3             shl bx, 1                                
  02e9  03d8             add bx, ax                               
  02eb  368b0f           mov cx, word ptr ss:[bx]                 
  02ee  8956fc           mov word ptr [bp - 4], dx                
  02f1  8bc2             mov ax, dx                               
  02f3  4a               dec dx                                   
  02f4  0bc0             or ax, ax                                
  02f6  75c0             jne 0x2b8                                
  02f8  837efcff         cmp word ptr [bp - 4], -1                
  02fc  740d             je 0x30b                                 
  02fe  8b5efc           mov bx, word ptr [bp - 4]                
  0301  d1e3             shl bx, 1                                
  0303  8d46dc           lea ax, [bp - 0x24]                      
  0306  03d8             add bx, ax                               
  0308  36893f           mov word ptr ss:[bx], di                 
  030b  8bc6             mov ax, si                               
  030d  4e               dec si                                   
  030e  0bc0             or ax, ax                                
  0310  7403             je 0x315                                 
  0312  e910ff           jmp 0x225                                
  0315  b96400           mov cx, 0x64                             
  0318  ba0800           mov dx, 8                                
  031b  eb23             jmp 0x340                                
  031d  8bda             mov bx, dx                               
  031f  d1e3             shl bx, 1                                
  0321  8d46dc           lea ax, [bp - 0x24]                      
  0324  03d8             add bx, ax                               
  0326  36833f00         cmp word ptr ss:[bx], 0                  
  032a  7414             je 0x340                                 
  032c  8bda             mov bx, dx                               
  032e  d1e3             shl bx, 1                                
  0330  03d8             add bx, ax                               
  0332  36390f           cmp word ptr ss:[bx], cx                 
  0335  7d09             jge 0x340                                
  0337  8bda             mov bx, dx                               
  0339  d1e3             shl bx, 1                                
  033b  03d8             add bx, ax                               
  033d  368b0f           mov cx, word ptr ss:[bx]                 
  0340  8bc2             mov ax, dx                               
  0342  4a               dec dx                                   
  0343  0bc0             or ax, ax                                
  0345  75d6             jne 0x31d                                
  0347  83f904           cmp cx, 4                                
  034a  7e05             jle 0x351                                
  034c  b80400           mov ax, 4                                
  034f  eb02             jmp 0x353                                
  0351  8bc1             mov ax, cx                               
  0353  c41eee40         les bx, ptr [0x40ee]                     
  0357  2689473a         mov word ptr es:[bx + 0x3a], ax          
  035b  837ef204         cmp word ptr [bp - 0xe], 4               
  035f  7403             je 0x364                                 
  0361  e9b600           jmp 0x41a                                
  0364  b8042c           mov ax, 0x2c04                           
  0367  8ec0             mov es, ax                               
  0369  268b367b15       mov si, word ptr es:[0x157b]             
  036e  e99f00           jmp 0x410                                
  0371  8bde             mov bx, si                               
  0373  6bdb41           imul bx, bx, 0x41                        
  0376  b8042c           mov ax, 0x2c04                           
  0379  8ec0             mov es, ax                               
  037b  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0380  98               cwde                                     
  0381  ba042c           mov dx, 0x2c04                           
  0384  8ec2             mov es, dx                               
  0386  263b061001       cmp ax, word ptr es:[0x110]              
  038b  7403             je 0x390                                 
  038d  e98000           jmp 0x410                                
  0390  6a01             push 1                                   
  0392  56               push si                                  
  0393  9a2f00e82f       lcall 0x2fe8, 0x2f                       -> ovl27:0a7a
  0398  83c404           add sp, 4                                
  039b  0bc0             or ax, ax                                
  039d  7471             je 0x410                                 
  039f  c41eee40         les bx, ptr [0x40ee]                     
  03a3  03de             add bx, si                               
  03a5  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  03aa  b400             mov ah, 0                                
  03ac  a90200           test ax, 2                               
  03af  745f             je 0x410                                 
  03b1  33c9             xor cx, cx                               
  03b3  ba0400           mov dx, 4                                
  03b6  eb3d             jmp 0x3f5                                
  03b8  8bde             mov bx, si                               
  03ba  6bdb41           imul bx, bx, 0x41                        
  03bd  03da             add bx, dx                               
  03bf  b8042c           mov ax, 0x2c04                           
  03c2  8ec0             mov es, ax                               
  03c4  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  03c9  98               cwde                                     
  03ca  8946ec           mov word ptr [bp - 0x14], ax             
  03cd  0bc0             or ax, ax                                
  03cf  7c24             jl 0x3f5                                 
  03d1  8b5eec           mov bx, word ptr [bp - 0x14]             
  03d4  6bdb06           imul bx, bx, 6                           
  03d7  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  03dc  7417             je 0x3f5                                 
  03de  8bde             mov bx, si                               
  03e0  6bdb41           imul bx, bx, 0x41                        
  03e3  03da             add bx, dx                               
  03e5  b8042c           mov ax, 0x2c04                           
  03e8  8ec0             mov es, ax                               
  03ea  2680bf9b1504     cmp byte ptr es:[bx + 0x159b], 4         
  03f0  7e03             jle 0x3f5                                
  03f2  b90100           mov cx, 1                                
  03f5  8bc2             mov ax, dx                               
  03f7  4a               dec dx                                   
  03f8  0bc0             or ax, ax                                
  03fa  75bc             jne 0x3b8                                
  03fc  0bc9             or cx, cx                                
  03fe  7410             je 0x410                                 
  0400  c41eee40         les bx, ptr [0x40ee]                     
  0404  26ff473c         inc word ptr es:[bx + 0x3c]              
  0408  03de             add bx, si                               
  040a  26808f1e0140     or byte ptr es:[bx + 0x11e], 0x40        
  0410  8bc6             mov ax, si                               
  0412  4e               dec si                                   
  0413  0bc0             or ax, ax                                
  0415  7403             je 0x41a                                 
  0417  e957ff           jmp 0x371                                
  041a  c41eee40         les bx, ptr [0x40ee]                     
  041e  26837f3c03       cmp word ptr es:[bx + 0x3c], 3           
  0423  7e0e             jle 0x433                                
  0425  c746fa0100       mov word ptr [bp - 6], 1                 
  042a  268b7f3c         mov di, word ptr es:[bx + 0x3c]          
  042e  83c7fc           add di, -4                               
  0431  eb0d             jmp 0x440                                
  0433  c746fa0000       mov word ptr [bp - 6], 0                 
  0438  c41eee40         les bx, ptr [0x40ee]                     
  043c  268b7f3c         mov di, word ptr es:[bx + 0x3c]          
  0440  837ef203         cmp word ptr [bp - 0xe], 3               
  0444  7d03             jge 0x449                                
  0446  e9ee00           jmp 0x537                                
  0449  b8042c           mov ax, 0x2c04                           
  044c  8ec0             mov es, ax                               
  044e  268b367b15       mov si, word ptr es:[0x157b]             
  0453  e9d700           jmp 0x52d                                
  0456  8bde             mov bx, si                               
  0458  6bdb41           imul bx, bx, 0x41                        
  045b  b8042c           mov ax, 0x2c04                           
  045e  8ec0             mov es, ax                               
  0460  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  0465  98               cwde                                     
  0466  ba042c           mov dx, 0x2c04                           
  0469  8ec2             mov es, dx                               
  046b  263b061001       cmp ax, word ptr es:[0x110]              
  0470  7403             je 0x475                                 
  0472  e9b800           jmp 0x52d                                
  0475  6a01             push 1                                   
  0477  56               push si                                  
  0478  9a2f00e82f       lcall 0x2fe8, 0x2f                       -> ovl27:0a7a
  047d  83c404           add sp, 4                                
  0480  0bc0             or ax, ax                                
  0482  7503             jne 0x487                                
  0484  e9a600           jmp 0x52d                                
  0487  c41eee40         les bx, ptr [0x40ee]                     
  048b  03de             add bx, si                               
  048d  26f6871e0140     test byte ptr es:[bx + 0x11e], 0x40      
  0493  7414             je 0x4a9                                 
  0495  0bff             or di, di                                
  0497  7503             jne 0x49c                                
  0499  e99100           jmp 0x52d                                
  049c  8b1eee40         mov bx, word ptr [0x40ee]                
  04a0  03de             add bx, si                               
  04a2  2680a71e01bf     and byte ptr es:[bx + 0x11e], 0xbf       
  04a8  4f               dec di                                   
  04a9  33c9             xor cx, cx                               
  04ab  ba0400           mov dx, 4                                
  04ae  eb62             jmp 0x512                                
  04b0  8bde             mov bx, si                               
  04b2  6bdb41           imul bx, bx, 0x41                        
  04b5  03da             add bx, dx                               
  04b7  b8042c           mov ax, 0x2c04                           
  04ba  8ec0             mov es, ax                               
  04bc  2680bf931500     cmp byte ptr es:[bx + 0x1593], 0         
  04c2  7c4e             jl 0x512                                 
  04c4  8bde             mov bx, si                               
  04c6  6bdb41           imul bx, bx, 0x41                        
  04c9  03da             add bx, dx                               
  04cb  8ec0             mov es, ax                               
  04cd  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  04d2  98               cwde                                     
  04d3  6bc006           imul ax, ax, 6                           
  04d6  8bd8             mov bx, ax                               
  04d8  80bfc94501       cmp byte ptr [bx + 0x45c9], 1            
  04dd  741c             je 0x4fb                                 
  04df  8bde             mov bx, si                               
  04e1  6bdb41           imul bx, bx, 0x41                        
  04e4  03da             add bx, dx                               
  04e6  b8042c           mov ax, 0x2c04                           
  04e9  8ec0             mov es, ax                               
  04eb  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  04f0  98               cwde                                     
  04f1  c41eee40         les bx, ptr [0x40ee]                     
  04f5  263b473a         cmp ax, word ptr es:[bx + 0x3a]          
  04f9  7c17             jl 0x512                                 
  04fb  8bde             mov bx, si                               
  04fd  6bdb41           imul bx, bx, 0x41                        
  0500  03da             add bx, dx                               
  0502  b8042c           mov ax, 0x2c04                           
  0505  8ec0             mov es, ax                               
  0507  2680bf9f1510     cmp byte ptr es:[bx + 0x159f], 0x10      
  050d  7c03             jl 0x512                                 
  050f  b90100           mov cx, 1                                
  0512  8bc2             mov ax, dx                               
  0514  4a               dec dx                                   
  0515  0bc0             or ax, ax                                
  0517  7597             jne 0x4b0                                
  0519  0bc9             or cx, cx                                
  051b  7410             je 0x52d                                 
  051d  c41eee40         les bx, ptr [0x40ee]                     
  0521  26ff473e         inc word ptr es:[bx + 0x3e]              
  0525  03de             add bx, si                               
  0527  26808f1e0180     or byte ptr es:[bx + 0x11e], 0x80        
  052d  8bc6             mov ax, si                               
  052f  4e               dec si                                   
  0530  0bc0             or ax, ax                                
  0532  7403             je 0x537                                 
  0534  e91fff           jmp 0x456                                
  0537  c41eee40         les bx, ptr [0x40ee]                     
  053b  26837f3e07       cmp word ptr es:[bx + 0x3e], 7           
  0540  7e05             jle 0x547                                
  0542  b80100           mov ax, 1                                
  0545  eb02             jmp 0x549                                
  0547  33c0             xor ax, ax                               
  0549  8946f0           mov word ptr [bp - 0x10], ax             
  054c  c746ee0000       mov word ptr [bp - 0x12], 0              
  0551  c41eee40         les bx, ptr [0x40ee]                     
  0555  26837f3e03       cmp word ptr es:[bx + 0x3e], 3           
  055a  7e0e             jle 0x56a                                
  055c  c746f80100       mov word ptr [bp - 8], 1                 
  0561  268b7f3e         mov di, word ptr es:[bx + 0x3e]          
  0565  83c7fc           add di, -4                               
  0568  eb0d             jmp 0x577                                
  056a  c746f80000       mov word ptr [bp - 8], 0                 
  056f  c41eee40         les bx, ptr [0x40ee]                     
  0573  268b7f3e         mov di, word ptr es:[bx + 0x3e]          
  0577  837ef202         cmp word ptr [bp - 0xe], 2               
  057b  7d03             jge 0x580                                
  057d  e91c01           jmp 0x69c                                
  0580  b8042c           mov ax, 0x2c04                           
  0583  8ec0             mov es, ax                               
  0585  268b367b15       mov si, word ptr es:[0x157b]             
  058a  e90501           jmp 0x692                                
  058d  8bde             mov bx, si                               
  058f  6bdb41           imul bx, bx, 0x41                        
  0592  b8042c           mov ax, 0x2c04                           
  0595  8ec0             mov es, ax                               
  0597  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  059c  98               cwde                                     
  059d  ba042c           mov dx, 0x2c04                           
  05a0  8ec2             mov es, dx                               
  05a2  263b061001       cmp ax, word ptr es:[0x110]              
  05a7  7403             je 0x5ac                                 
  05a9  e9e600           jmp 0x692                                
  05ac  6a01             push 1                                   
  05ae  56               push si                                  
  05af  9a2f00e82f       lcall 0x2fe8, 0x2f                       -> ovl27:0a7a
  05b4  83c404           add sp, 4                                
  05b7  0bc0             or ax, ax                                
  05b9  7503             jne 0x5be                                
  05bb  e9d400           jmp 0x692                                
  05be  c41eee40         les bx, ptr [0x40ee]                     
  05c2  03de             add bx, si                               
  05c4  26f6871e0140     test byte ptr es:[bx + 0x11e], 0x40      
  05ca  7403             je 0x5cf                                 
  05cc  e9c300           jmp 0x692                                
  05cf  c41eee40         les bx, ptr [0x40ee]                     
  05d3  03de             add bx, si                               
  05d5  26f6871e0180     test byte ptr es:[bx + 0x11e], 0x80      
  05db  7414             je 0x5f1                                 
  05dd  0bff             or di, di                                
  05df  7503             jne 0x5e4                                
  05e1  e9ae00           jmp 0x692                                
  05e4  8b1eee40         mov bx, word ptr [0x40ee]                
  05e8  03de             add bx, si                               
  05ea  2680a71e017f     and byte ptr es:[bx + 0x11e], 0x7f       
  05f0  4f               dec di                                   
  05f1  33c9             xor cx, cx                               
  05f3  ba0400           mov dx, 4                                
  05f6  eb7c             jmp 0x674                                
  05f8  8bde             mov bx, si                               
  05fa  6bdb41           imul bx, bx, 0x41                        
  05fd  03da             add bx, dx                               
  05ff  b8042c           mov ax, 0x2c04                           
  0602  8ec0             mov es, ax                               
  0604  2680bf931500     cmp byte ptr es:[bx + 0x1593], 0         
  060a  7c68             jl 0x674                                 
  060c  8bde             mov bx, si                               
  060e  6bdb41           imul bx, bx, 0x41                        
  0611  03da             add bx, dx                               
  0613  8ec0             mov es, ax                               
  0615  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  061a  98               cwde                                     
  061b  6bc006           imul ax, ax, 6                           
  061e  8bd8             mov bx, ax                               
  0620  80bfc94501       cmp byte ptr [bx + 0x45c9], 1            
  0625  741c             je 0x643                                 
  0627  8bde             mov bx, si                               
  0629  6bdb41           imul bx, bx, 0x41                        
  062c  03da             add bx, dx                               
  062e  b8042c           mov ax, 0x2c04                           
  0631  8ec0             mov es, ax                               
  0633  268a879b15       mov al, byte ptr es:[bx + 0x159b]        
  0638  98               cwde                                     
  0639  c41eee40         les bx, ptr [0x40ee]                     
  063d  263b473a         cmp ax, word ptr es:[bx + 0x3a]          
  0641  7c31             jl 0x674                                 
  0643  8bde             mov bx, si                               
  0645  6bdb41           imul bx, bx, 0x41                        
  0648  03da             add bx, dx                               
  064a  b8042c           mov ax, 0x2c04                           
  064d  8ec0             mov es, ax                               
  064f  2680bf9f150c     cmp byte ptr es:[bx + 0x159f], 0xc       
  0655  7c1d             jl 0x674                                 
  0657  ff46ee           inc word ptr [bp - 0x12]                 
  065a  837ef000         cmp word ptr [bp - 0x10], 0              
  065e  7411             je 0x671                                 
  0660  8bde             mov bx, si                               
  0662  6bdb41           imul bx, bx, 0x41                        
  0665  03da             add bx, dx                               
  0667  8ec0             mov es, ax                               
  0669  2680bf9f1510     cmp byte ptr es:[bx + 0x159f], 0x10      
  066f  7c03             jl 0x674                                 
  0671  b90100           mov cx, 1                                
  0674  8bc2             mov ax, dx                               
  0676  4a               dec dx                                   
  0677  0bc0             or ax, ax                                
  0679  7403             je 0x67e                                 
  067b  e97aff           jmp 0x5f8                                
  067e  0bc9             or cx, cx                                
  0680  7410             je 0x692                                 
  0682  c41eee40         les bx, ptr [0x40ee]                     
  0686  26ff4740         inc word ptr es:[bx + 0x40]              
  068a  03de             add bx, si                               
  068c  26808f1e0108     or byte ptr es:[bx + 0x11e], 8           
  0692  8bc6             mov ax, si                               
  0694  4e               dec si                                   
  0695  0bc0             or ax, ax                                
  0697  7403             je 0x69c                                 
  0699  e9f1fe           jmp 0x58d                                
  069c  837eee07         cmp word ptr [bp - 0x12], 7              
  06a0  7e05             jle 0x6a7                                
  06a2  b80100           mov ax, 1                                
  06a5  eb02             jmp 0x6a9                                
  06a7  33c0             xor ax, ax                               
  06a9  8946f4           mov word ptr [bp - 0xc], ax              
  06ac  c41eee40         les bx, ptr [0x40ee]                     
  06b0  26837f4003       cmp word ptr es:[bx + 0x40], 3           
  06b5  7e0e             jle 0x6c5                                
  06b7  c746f60100       mov word ptr [bp - 0xa], 1               
  06bc  268b7f40         mov di, word ptr es:[bx + 0x40]          
  06c0  83c7fc           add di, -4                               
  06c3  eb0d             jmp 0x6d2                                
  06c5  c746f60000       mov word ptr [bp - 0xa], 0               
  06ca  c41eee40         les bx, ptr [0x40ee]                     
  06ce  268b7f40         mov di, word ptr es:[bx + 0x40]          
  06d2  b8042c           mov ax, 0x2c04                           
  06d5  8ec0             mov es, ax                               
  06d7  268b367b15       mov si, word ptr es:[0x157b]             
  06dc  eb49             jmp 0x727                                
  06de  8bde             mov bx, si                               
  06e0  6bdb41           imul bx, bx, 0x41                        
  06e3  b8042c           mov ax, 0x2c04                           
  06e6  8ec0             mov es, ax                               
  06e8  268a879215       mov al, byte ptr es:[bx + 0x1592]        
  06ed  98               cwde                                     
  06ee  ba042c           mov dx, 0x2c04                           
  06f1  8ec2             mov es, dx                               
  06f3  263b061001       cmp ax, word ptr es:[0x110]              
  06f8  752d             jne 0x727                                
  06fa  c41eee40         les bx, ptr [0x40ee]                     
  06fe  03de             add bx, si                               
  0700  26f6871e01c0     test byte ptr es:[bx + 0x11e], 0xc0      
  0706  751f             jne 0x727                                
  0708  c41eee40         les bx, ptr [0x40ee]                     
  070c  03de             add bx, si                               
  070e  26f6871e0108     test byte ptr es:[bx + 0x11e], 8         
  0714  7411             je 0x727                                 
  0716  0bff             or di, di                                
  0718  740d             je 0x727                                 
  071a  8b1eee40         mov bx, word ptr [0x40ee]                
  071e  03de             add bx, si                               
  0720  2680a71e01f7     and byte ptr es:[bx + 0x11e], 0xf7       
  0726  4f               dec di                                   
  0727  8bc6             mov ax, si                               
  0729  4e               dec si                                   
  072a  0bc0             or ax, ax                                
  072c  75b0             jne 0x6de                                
  072e  c41eee40         les bx, ptr [0x40ee]                     
  0732  268b8f4a02       mov cx, word ptr es:[bx + 0x24a]         
  0737  e9fd00           jmp 0x837                                
  073a  8bc1             mov ax, cx                               
  073c  6bc05c           imul ax, ax, 0x5c                        
  073f  c41eee40         les bx, ptr [0x40ee]                     
  0743  03d8             add bx, ax                               
  0745  2683bf4c0200     cmp word ptr es:[bx + 0x24c], 0          
  074b  7503             jne 0x750                                
  074d  e9e700           jmp 0x837                                
  0750  8bc1             mov ax, cx                               
  0752  6bc05c           imul ax, ax, 0x5c                        
  0755  8b1eee40         mov bx, word ptr [0x40ee]                
  0759  03d8             add bx, ax                               
  075b  26c787a4020800   mov word ptr es:[bx + 0x2a4], 8          
  0762  8bd9             mov bx, cx                               
  0764  83fb03           cmp bx, 3                                
  0767  7603             jbe 0x76c                                
  0769  e9cb00           jmp 0x837                                
  076c  d1e3             shl bx, 1                                
  076e  2effa74508       jmp word ptr cs:[bx + 0x845]             
ovl21_0773:  ; case
  0773  837ef400         cmp word ptr [bp - 0xc], 0               
  0777  7405             je 0x77e                                 
  0779  b80c00           mov ax, 0xc                              
  077c  eb03             jmp 0x781                                
  077e  b80800           mov ax, 8                                
  0781  8bd1             mov dx, cx                               
  0783  6bd25c           imul dx, dx, 0x5c                        
  0786  c41eee40         les bx, ptr [0x40ee]                     
  078a  03da             add bx, dx                               
  078c  268987a402       mov word ptr es:[bx + 0x2a4], ax         
  0791  e9a300           jmp 0x837                                
ovl21_0794:  ; case
  0794  8bc1             mov ax, cx                               
  0796  6bc05c           imul ax, ax, 0x5c                        
  0799  c41eee40         les bx, ptr [0x40ee]                     
  079d  03d8             add bx, ax                               
  079f  2683a7a602ef     and word ptr es:[bx + 0x2a6], 0xffef     
  07a5  837ef600         cmp word ptr [bp - 0xa], 0               
  07a9  7503             jne 0x7ae                                
  07ab  e98900           jmp 0x837                                
  07ae  8bc1             mov ax, cx                               
  07b0  6bc05c           imul ax, ax, 0x5c                        
  07b3  c41eee40         les bx, ptr [0x40ee]                     
  07b7  03d8             add bx, ax                               
  07b9  26838fa60210     or word ptr es:[bx + 0x2a6], 0x10        
  07bf  eb64             jmp 0x825                                
ovl21_07c1:  ; case
  07c1  8bc1             mov ax, cx                               
  07c3  6bc05c           imul ax, ax, 0x5c                        
  07c6  c41eee40         les bx, ptr [0x40ee]                     
  07ca  03d8             add bx, ax                               
  07cc  2683a7a602f7     and word ptr es:[bx + 0x2a6], 0xfff7     
  07d2  837ef800         cmp word ptr [bp - 8], 0                 
  07d6  745f             je 0x837                                 
  07d8  8bc1             mov ax, cx                               
  07da  6bc05c           imul ax, ax, 0x5c                        
  07dd  c41eee40         les bx, ptr [0x40ee]                     
  07e1  03d8             add bx, ax                               
  07e3  26838fa60208     or word ptr es:[bx + 0x2a6], 8           
  07e9  8bc1             mov ax, cx                               
  07eb  6bc05c           imul ax, ax, 0x5c                        
  07ee  8b1eee40         mov bx, word ptr [0x40ee]                
  07f2  03d8             add bx, ax                               
  07f4  26c787a4021000   mov word ptr es:[bx + 0x2a4], 0x10       
  07fb  eb3a             jmp 0x837                                
ovl21_07fd:  ; case
  07fd  8bc1             mov ax, cx                               
  07ff  6bc05c           imul ax, ax, 0x5c                        
  0802  c41eee40         les bx, ptr [0x40ee]                     
  0806  03d8             add bx, ax                               
  0808  2683a7a602df     and word ptr es:[bx + 0x2a6], 0xffdf     
  080e  837efa00         cmp word ptr [bp - 6], 0                 
  0812  7423             je 0x837                                 
  0814  8bc1             mov ax, cx                               
  0816  6bc05c           imul ax, ax, 0x5c                        
  0819  c41eee40         les bx, ptr [0x40ee]                     
  081d  03d8             add bx, ax                               
  081f  26838fa60220     or word ptr es:[bx + 0x2a6], 0x20        
  0825  8bc1             mov ax, cx                               
  0827  6bc05c           imul ax, ax, 0x5c                        
  082a  c41eee40         les bx, ptr [0x40ee]                     
  082e  03d8             add bx, ax                               
  0830  26c787a4020c00   mov word ptr es:[bx + 0x2a4], 0xc        
  0837  8bc1             mov ax, cx                               
  0839  49               dec cx                                   
  083a  0bc0             or ax, ax                                
  083c  7403             je 0x841                                 
  083e  e9f9fe           jmp 0x73a                                
  0841  5f               pop di                                   
  0842  5e               pop si                                   
  0843  c9               leave                                    
  0844  cb               retf                                     
  0845  73079407c107fd07 dw 0773,0794,07c1,07fd                   jump table

ovl21_084d:  ; ENTRY
  084d  55               push bp                                  
  084e  8bec             mov bp, sp                               
  0850  8b5606           mov dx, word ptr [bp + 6]                
  0853  c41eee40         les bx, ptr [0x40ee]                     
  0857  26c7474a0000     mov word ptr es:[bx + 0x4a], 0           
  085d  26c7070000       mov word ptr es:[bx], 0                  
  0862  26c747200a00     mov word ptr es:[bx + 0x20], 0xa         
  0868  26c747220000     mov word ptr es:[bx + 0x22], 0           
  086e  26c747240000     mov word ptr es:[bx + 0x24], 0           
  0874  26c7470c0000     mov word ptr es:[bx + 0xc], 0            
  087a  26c747160000     mov word ptr es:[bx + 0x16], 0           
  0880  26c747180000     mov word ptr es:[bx + 0x18], 0           
  0886  26c7471a0000     mov word ptr es:[bx + 0x1a], 0           
  088c  26c7471c0000     mov word ptr es:[bx + 0x1c], 0           
  0892  26c7471e0000     mov word ptr es:[bx + 0x1e], 0           
  0898  26c7474c0000     mov word ptr es:[bx + 0x4c], 0           
  089e  26c747260000     mov word ptr es:[bx + 0x26], 0           
  08a4  26c747280000     mov word ptr es:[bx + 0x28], 0           
  08aa  26c7472a0000     mov word ptr es:[bx + 0x2a], 0           
  08b0  26c7472c0000     mov word ptr es:[bx + 0x2c], 0           
  08b6  26c7472e0000     mov word ptr es:[bx + 0x2e], 0           
  08bc  26c747300000     mov word ptr es:[bx + 0x30], 0           
  08c2  26c747320000     mov word ptr es:[bx + 0x32], 0           
  08c8  26c747340000     mov word ptr es:[bx + 0x34], 0           
  08ce  26c747360000     mov word ptr es:[bx + 0x36], 0           
  08d4  b8042c           mov ax, 0x2c04                           
  08d7  8ec0             mov es, ax                               
  08d9  268b0e7b15       mov cx, word ptr es:[0x157b]             
  08de  eb4e             jmp 0x92e                                
  08e0  b8042c           mov ax, 0x2c04                           
  08e3  8ec0             mov es, ax                               
  08e5  26833e280100     cmp word ptr es:[0x128], 0               
  08eb  7404             je 0x8f1                                 
  08ed  b004             mov al, 4                                
  08ef  eb02             jmp 0x8f3                                
  08f1  b000             mov al, 0                                
  08f3  c41eee40         les bx, ptr [0x40ee]                     
  08f7  03d9             add bx, cx                               
  08f9  26884756         mov byte ptr es:[bx + 0x56], al          
  08fd  8b1eee40         mov bx, word ptr [0x40ee]                
  0901  03d9             add bx, cx                               
  0903  26c687ba0000     mov byte ptr es:[bx + 0xba], 0           
  0909  8b1eee40         mov bx, word ptr [0x40ee]                
  090d  03d9             add bx, cx                               
  090f  26c6871e0100     mov byte ptr es:[bx + 0x11e], 0          
  0915  b8042c           mov ax, 0x2c04                           
  0918  8ec0             mov es, ax                               
  091a  26833e240100     cmp word ptr es:[0x124], 0               
  0920  740c             je 0x92e                                 
  0922  c41eee40         les bx, ptr [0x40ee]                     
  0926  03d9             add bx, cx                               
  0928  26808f1e0101     or byte ptr es:[bx + 0x11e], 1           
  092e  8bc1             mov ax, cx                               
  0930  49               dec cx                                   
  0931  0bc0             or ax, ax                                
  0933  75ab             jne 0x8e0                                
  0935  8bda             mov bx, dx                               
  0937  d1e3             shl bx, 1                                
  0939  b8042c           mov ax, 0x2c04                           
  093c  8ec0             mov es, ax                               
  093e  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0944  7423             je 0x969                                 
  0946  8bda             mov bx, dx                               
  0948  d1e3             shl bx, 1                                
  094a  b8042c           mov ax, 0x2c04                           
  094d  8ec0             mov es, ax                               
  094f  268b87c000       mov ax, word ptr es:[bx + 0xc0]          
  0954  0bc0             or ax, ax                                
  0956  7407             je 0x95f                                 
  0958  3d0100           cmp ax, 1                                
  095b  7407             je 0x964                                 
  095d  eb0a             jmp 0x969                                
  095f  52               push dx                                  
  0960  6a00             push 0                                   
  0962  eb08             jmp 0x96c                                
  0964  52               push dx                                  
  0965  6a01             push 1                                   
  0967  eb03             jmp 0x96c                                
  0969  52               push dx                                  
  096a  6a02             push 2                                   
  096c  90               nop                                      
  096d  0e               push cs                                  
  096e  e80a04           call 0xd7b                               
  0971  83c404           add sp, 4                                
  0974  b90400           mov cx, 4                                
  0977  eb12             jmp 0x98b                                
  0979  8bc1             mov ax, cx                               
  097b  6bc05c           imul ax, ax, 0x5c                        
  097e  c41eee40         les bx, ptr [0x40ee]                     
  0982  03d8             add bx, ax                               
  0984  26c7874c020000   mov word ptr es:[bx + 0x24c], 0          
  098b  8bc1             mov ax, cx                               
  098d  49               dec cx                                   
  098e  0bc0             or ax, ax                                
  0990  75e7             jne 0x979                                
  0992  b90800           mov cx, 8                                
  0995  eb2f             jmp 0x9c6                                
  0997  8bc1             mov ax, cx                               
  0999  d1e0             shl ax, 1                                
  099b  c41eee40         les bx, ptr [0x40ee]                     
  099f  03d8             add bx, ax                               
  09a1  33c0             xor ax, ax                               
  09a3  2689871c04       mov word ptr es:[bx + 0x41c], ax         
  09a8  2689870c04       mov word ptr es:[bx + 0x40c], ax         
  09ad  268987fc03       mov word ptr es:[bx + 0x3fc], ax         
  09b2  268987ec03       mov word ptr es:[bx + 0x3ec], ax         
  09b7  268987dc03       mov word ptr es:[bx + 0x3dc], ax         
  09bc  268987cc03       mov word ptr es:[bx + 0x3cc], ax         
  09c1  268987bc03       mov word ptr es:[bx + 0x3bc], ax         
  09c6  8bc1             mov ax, cx                               
  09c8  49               dec cx                                   
  09c9  0bc0             or ax, ax                                
  09cb  75ca             jne 0x997                                
  09cd  5d               pop bp                                   
  09ce  cb               retf                                     

ovl21_09cf:  ; ENTRY
  09cf  55               push bp                                  
  09d0  8bec             mov bp, sp                               
  09d2  83ec02           sub sp, 2                                
  09d5  56               push si                                  
  09d6  b8042c           mov ax, 0x2c04                           
  09d9  8ec0             mov es, ax                               
  09db  268b167b15       mov dx, word ptr es:[0x157b]             
  09e0  e99500           jmp 0xa78                                
  09e3  8bda             mov bx, dx                               
  09e5  6bdb41           imul bx, bx, 0x41                        
  09e8  b8042c           mov ax, 0x2c04                           
  09eb  8ec0             mov es, ax                               
  09ed  268b9f7f15       mov bx, word ptr es:[bx + 0x157f]        
  09f2  69dbe000         imul bx, bx, 0xe0                        
  09f6  8bf2             mov si, dx                               
  09f8  6bf641           imul si, si, 0x41                        
  09fb  b8042c           mov ax, 0x2c04                           
  09fe  8ec0             mov es, ax                               
  0a00  268b847d15       mov ax, word ptr es:[si + 0x157d]        
  0a05  d1e0             shl ax, 1                                
  0a07  03d8             add bx, ax                               
  0a09  b81d1e           mov ax, 0x1e1d                           
  0a0c  8ec0             mov es, ax                               
  0a0e  268a9f0000       mov bl, byte ptr es:[bx]                 
  0a13  81e3ff00         and bx, 0xff                             
  0a17  b8042c           mov ax, 0x2c04                           
  0a1a  8ec0             mov es, ax                               
  0a1c  2680bf10070a     cmp byte ptr es:[bx + 0x710], 0xa        
  0a22  7554             jne 0xa78                                
  0a24  33f6             xor si, si                               
  0a26  c41eee40         les bx, ptr [0x40ee]                     
  0a2a  03da             add bx, dx                               
  0a2c  2680a71e01fd     and byte ptr es:[bx + 0x11e], 0xfd       
  0a32  b90400           mov cx, 4                                
  0a35  eb2a             jmp 0xa61                                
  0a37  8bda             mov bx, dx                               
  0a39  6bdb41           imul bx, bx, 0x41                        
  0a3c  03d9             add bx, cx                               
  0a3e  b8042c           mov ax, 0x2c04                           
  0a41  8ec0             mov es, ax                               
  0a43  268a879315       mov al, byte ptr es:[bx + 0x1593]        
  0a48  98               cwde                                     
  0a49  8946fe           mov word ptr [bp - 2], ax                
  0a4c  3dffff           cmp ax, 0xffff                           
  0a4f  7410             je 0xa61                                 
  0a51  8b5efe           mov bx, word ptr [bp - 2]                
  0a54  6bdb06           imul bx, bx, 6                           
  0a57  80bfc44500       cmp byte ptr [bx + 0x45c4], 0            
  0a5c  7403             je 0xa61                                 
  0a5e  be0100           mov si, 1                                
  0a61  8bc1             mov ax, cx                               
  0a63  49               dec cx                                   
  0a64  0bc0             or ax, ax                                
  0a66  75cf             jne 0xa37                                
  0a68  0bf6             or si, si                                
  0a6a  740c             je 0xa78                                 
  0a6c  c41eee40         les bx, ptr [0x40ee]                     
  0a70  03da             add bx, dx                               
  0a72  26808f1e0102     or byte ptr es:[bx + 0x11e], 2           
  0a78  8bc2             mov ax, dx                               
  0a7a  4a               dec dx                                   
  0a7b  0bc0             or ax, ax                                
  0a7d  7403             je 0xa82                                 
  0a7f  e961ff           jmp 0x9e3                                
  0a82  5e               pop si                                   
  0a83  c9               leave                                    
  0a84  cb               retf                                     

ovl21_0a85:  ; ENTRY
  0a85  55               push bp                                  
  0a86  8bec             mov bp, sp                               
  0a88  83ec04           sub sp, 4                                
  0a8b  56               push si                                  
  0a8c  57               push di                                  
  0a8d  8b5606           mov dx, word ptr [bp + 6]                
  0a90  837e1400         cmp word ptr [bp + 0x14], 0              
  0a94  7405             je 0xa9b                                 
  0a96  b8e803           mov ax, 0x3e8                            
  0a99  eb03             jmp 0xa9e                                
  0a9b  b86400           mov ax, 0x64                             
  0a9e  8bf8             mov di, ax                               
  0aa0  33f6             xor si, si                               
  0aa2  8bda             mov bx, dx                               
  0aa4  6bdb41           imul bx, bx, 0x41                        
  0aa7  b8042c           mov ax, 0x2c04                           
  0aaa  8ec0             mov es, ax                               
  0aac  268b877d15       mov ax, word ptr es:[bx + 0x157d]        
  0ab1  8946fe           mov word ptr [bp - 2], ax                
  0ab4  8bda             mov bx, dx                               
  0ab6  6bdb41           imul bx, bx, 0x41                        
  0ab9  b8042c           mov ax, 0x2c04                           
  0abc  8ec0             mov es, ax                               
  0abe  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0ac3  8946fc           mov word ptr [bp - 4], ax                
  0ac6  c45e0c           les bx, ptr [bp + 0xc]                   
  0ac9  b8ffff           mov ax, 0xffff                           
  0acc  268907           mov word ptr es:[bx], ax                 
  0acf  c45e08           les bx, ptr [bp + 8]                     
  0ad2  268907           mov word ptr es:[bx], ax                 
  0ad5  8bde             mov bx, si                               
  0ad7  d1e3             shl bx, 1                                
  0ad9  83bfd807ff       cmp word ptr [bx + 0x7d8], -1            
  0ade  746f             je 0xb4f                                 
  0ae0  8bde             mov bx, si                               
  0ae2  d1e3             shl bx, 1                                
  0ae4  ffb7d807         push word ptr [bx + 0x7d8]               
  0ae8  16               push ss                                  
  0ae9  8d46fc           lea ax, [bp - 4]                         
  0aec  50               push ax                                  
  0aed  16               push ss                                  
  0aee  8d46fe           lea ax, [bp - 2]                         
  0af1  50               push ax                                  
  0af2  9a4d0b8b0a       lcall 0xa8b, 0xb4d                       -> 0a8b:0b4d
  0af7  83c40a           add sp, 0xa                              
  0afa  0bc0             or ax, ax                                
  0afc  7451             je 0xb4f                                 
  0afe  8b46fe           mov ax, word ptr [bp - 2]                
  0b01  69c03801         imul ax, ax, 0x138                       
  0b05  c45e10           les bx, ptr [bp + 0x10]                  
  0b08  03d8             add bx, ax                               
  0b0a  8b46fc           mov ax, word ptr [bp - 4]                
  0b0d  d1e0             shl ax, 1                                
  0b0f  03d8             add bx, ax                               
  0b11  268b07           mov ax, word ptr es:[bx]                 
  0b14  99               cdq                                      
  0b15  33c2             xor ax, dx                               
  0b17  2bc2             sub ax, dx                               
  0b19  3bc7             cmp ax, di                               
  0b1b  7d2f             jge 0xb4c                                
  0b1d  8b46fe           mov ax, word ptr [bp - 2]                
  0b20  69c03801         imul ax, ax, 0x138                       
  0b24  8b5e10           mov bx, word ptr [bp + 0x10]             
  0b27  03d8             add bx, ax                               
  0b29  8b46fc           mov ax, word ptr [bp - 4]                
  0b2c  d1e0             shl ax, 1                                
  0b2e  03d8             add bx, ax                               
  0b30  268b07           mov ax, word ptr es:[bx]                 
  0b33  99               cdq                                      
  0b34  33c2             xor ax, dx                               
  0b36  2bc2             sub ax, dx                               
  0b38  8bf8             mov di, ax                               
  0b3a  c45e08           les bx, ptr [bp + 8]                     
  0b3d  8b46fe           mov ax, word ptr [bp - 2]                
  0b40  268907           mov word ptr es:[bx], ax                 
  0b43  c45e0c           les bx, ptr [bp + 0xc]                   
  0b46  8b46fc           mov ax, word ptr [bp - 4]                
  0b49  268907           mov word ptr es:[bx], ax                 
  0b4c  46               inc si                                   
  0b4d  eb86             jmp 0xad5                                
  0b4f  8bc7             mov ax, di                               
  0b51  5f               pop di                                   
  0b52  5e               pop si                                   
  0b53  c9               leave                                    
  0b54  cb               retf                                     

ovl21_0b55:  ; ENTRY
  0b55  55               push bp                                  
  0b56  8bec             mov bp, sp                               
  0b58  56               push si                                  
  0b59  b8042c           mov ax, 0x2c04                           
  0b5c  8ec0             mov es, ax                               
  0b5e  26833e240100     cmp word ptr es:[0x124], 0               
  0b64  742c             je 0xb92                                 
  0b66  b8042c           mov ax, 0x2c04                           
  0b69  8ec0             mov es, ax                               
  0b6b  268b367b15       mov si, word ptr es:[0x157b]             
  0b70  eb19             jmp 0xb8b                                
  0b72  c41eee40         les bx, ptr [0x40ee]                     
  0b76  03de             add bx, si                               
  0b78  268a871e01       mov al, byte ptr es:[bx + 0x11e]         
  0b7d  b400             mov ah, 0                                
  0b7f  a90100           test ax, 1                               
  0b82  7407             je 0xb8b                                 
  0b84  56               push si                                  
  0b85  90               nop                                      
  0b86  0e               push cs                                  
  0b87  e80b00           call 0xb95                               
  0b8a  59               pop cx                                   
  0b8b  8bc6             mov ax, si                               
  0b8d  4e               dec si                                   
  0b8e  0bc0             or ax, ax                                
  0b90  75e0             jne 0xb72                                
  0b92  5e               pop si                                   
  0b93  5d               pop bp                                   
  0b94  cb               retf                                     

ovl21_0b95:  ; ENTRY
  0b95  55               push bp                                  
  0b96  8bec             mov bp, sp                               
  0b98  83ec04           sub sp, 4                                
  0b9b  56               push si                                  
  0b9c  57               push di                                  
  0b9d  8b7606           mov si, word ptr [bp + 6]                
  0ba0  c746fc0000       mov word ptr [bp - 4], 0                 
  0ba5  8bde             mov bx, si                               
  0ba7  6bdb41           imul bx, bx, 0x41                        
  0baa  b8042c           mov ax, 0x2c04                           
  0bad  8ec0             mov es, ax                               
  0baf  268bbf7d15       mov di, word ptr es:[bx + 0x157d]        
  0bb4  8bde             mov bx, si                               
  0bb6  6bdb41           imul bx, bx, 0x41                        
  0bb9  b8042c           mov ax, 0x2c04                           
  0bbc  8ec0             mov es, ax                               
  0bbe  268b877f15       mov ax, word ptr es:[bx + 0x157f]        
  0bc3  8946fe           mov word ptr [bp - 2], ax                
  0bc6  8bd7             mov dx, di                               
  0bc8  4a               dec dx                                   
  0bc9  eb32             jmp 0xbfd                                
  0bcb  8b4efe           mov cx, word ptr [bp - 2]                
  0bce  49               dec cx                                   
  0bcf  eb21             jmp 0xbf2                                
  0bd1  8bd9             mov bx, cx                               
  0bd3  6bdb70           imul bx, bx, 0x70                        
  0bd6  03da             add bx, dx                               
  0bd8  b8d919           mov ax, 0x19d9                           
  0bdb  8ec0             mov es, ax                               
  0bdd  268a870000       mov al, byte ptr es:[bx]                 
  0be2  c1e805           shr ax, 5                                
  0be5  250100           and ax, 1                                
  0be8  0bc0             or ax, ax                                
  0bea  7405             je 0xbf1                                 
  0bec  c746fc0100       mov word ptr [bp - 4], 1                 
  0bf1  41               inc cx                                   
  0bf2  8b46fe           mov ax, word ptr [bp - 2]                
  0bf5  050200           add ax, 2                                
  0bf8  3bc1             cmp ax, cx                               
  0bfa  7dd5             jge 0xbd1                                
  0bfc  42               inc dx                                   
  0bfd  8bc7             mov ax, di                               
  0bff  050200           add ax, 2                                
  0c02  3bc2             cmp ax, dx                               
  0c04  7dc5             jge 0xbcb                                
  0c06  837efc00         cmp word ptr [bp - 4], 0                 
  0c0a  740c             je 0xc18                                 
  0c0c  c41eee40         les bx, ptr [0x40ee]                     
  0c10  03de             add bx, si                               
  0c12  2680a71e01fe     and byte ptr es:[bx + 0x11e], 0xfe       
  0c18  5f               pop di                                   
  0c19  5e               pop si                                   
  0c1a  c9               leave                                    
  0c1b  cb               retf                                     

ovl21_0c1c:  ; ENTRY
  0c1c  55               push bp                                  
  0c1d  8bec             mov bp, sp                               
  0c1f  83ec08           sub sp, 8                                
  0c22  56               push si                                  
  0c23  57               push di                                  
  0c24  0e               push cs                                  
  0c25  e82dff           call 0xb55                               
  0c28  b8042c           mov ax, 0x2c04                           
  0c2b  8ec0             mov es, ax                               
  0c2d  268b367b15       mov si, word ptr es:[0x157b]             
  0c32  eb53             jmp 0xc87                                
  0c34  c41eee40         les bx, ptr [0x40ee]                     
  0c38  03de             add bx, si                               
  0c3a  26807f5602       cmp byte ptr es:[bx + 0x56], 2           
  0c3f  7546             jne 0xc87                                
  0c41  666a00           push 0                                   
  0c44  16               push ss                                  
  0c45  8d46f8           lea ax, [bp - 8]                         
  0c48  50               push ax                                  
  0c49  56               push si                                  
  0c4a  9a2000bd2f       lcall 0x2fbd, 0x20                       -> ovl20:01f6
  0c4f  83c40a           add sp, 0xa                              
  0c52  bf0600           mov di, 6                                
  0c55  eb29             jmp 0xc80                                
  0c57  8a43f8           mov al, byte ptr [bp + di - 8]           
  0c5a  b400             mov ah, 0                                
  0c5c  8946fe           mov word ptr [bp - 2], ax                
  0c5f  3dff00           cmp ax, 0xff                             
  0c62  741c             je 0xc80                                 
  0c64  c41eee40         les bx, ptr [0x40ee]                     
  0c68  035efe           add bx, word ptr [bp - 2]                
  0c6b  26f6871e0101     test byte ptr es:[bx + 0x11e], 1         
  0c71  750d             jne 0xc80                                
  0c73  c41eee40         les bx, ptr [0x40ee]                     
  0c77  03de             add bx, si                               
  0c79  26c6475603       mov byte ptr es:[bx + 0x56], 3           
  0c7e  eb07             jmp 0xc87                                
  0c80  8bc7             mov ax, di                               
  0c82  4f               dec di                                   
  0c83  0bc0             or ax, ax                                
  0c85  75d0             jne 0xc57                                
  0c87  8bc6             mov ax, si                               
  0c89  4e               dec si                                   
  0c8a  0bc0             or ax, ax                                
  0c8c  75a6             jne 0xc34                                
  0c8e  5f               pop di                                   
  0c8f  5e               pop si                                   
  0c90  c9               leave                                    
  0c91  cb               retf                                     

ovl21_0c92:  ; ENTRY
  0c92  55               push bp                                  
  0c93  8bec             mov bp, sp                               
  0c95  b8042c           mov ax, 0x2c04                           
  0c98  8ec0             mov es, ax                               
  0c9a  26ff361001       push word ptr es:[0x110]                 
  0c9f  9a2f00db2f       lcall 0x2fdb, 0x2f                       -> ovl25:056c
  0ca4  59               pop cx                                   
  0ca5  8916f040         mov word ptr [0x40f0], dx                
  0ca9  a3ee40           mov word ptr [0x40ee], ax                
  0cac  90               nop                                      
  0cad  0e               push cs                                  
  0cae  e81200           call 0xcc3                               
  0cb1  b8042c           mov ax, 0x2c04                           
  0cb4  8ec0             mov es, ax                               
  0cb6  26ff361001       push word ptr es:[0x110]                 
  0cbb  9a3400db2f       lcall 0x2fdb, 0x34                       -> ovl25:05b9
  0cc0  59               pop cx                                   
  0cc1  5d               pop bp                                   
  0cc2  cb               retf                                     

ovl21_0cc3:  ; ENTRY
  0cc3  55               push bp                                  
  0cc4  8bec             mov bp, sp                               
  0cc6  5d               pop bp                                   
  0cc7  cb               retf                                     
  0cc8  55               push bp                                  
  0cc9  8bec             mov bp, sp                               
  0ccb  5d               pop bp                                   
  0ccc  cb               retf                                     
  0ccd  55               push bp                                  
  0cce  8bec             mov bp, sp                               
  0cd0  5d               pop bp                                   
  0cd1  cb               retf                                     
  0cd2  55               push bp                                  
  0cd3  8bec             mov bp, sp                               
  0cd5  5d               pop bp                                   
  0cd6  cb               retf                                     

ovl21_0cd7:  ; ENTRY
  0cd7  55               push bp                                  
  0cd8  8bec             mov bp, sp                               
  0cda  56               push si                                  
  0cdb  57               push di                                  
  0cdc  8b7e06           mov di, word ptr [bp + 6]                
  0cdf  666800002d00     push 0x2d0000                            
  0ce5  6a0f             push 0xf                                 
  0ce7  66ff760a         push dword ptr [bp + 0xa]                
  0ceb  ff7608           push word ptr [bp + 8]                   
  0cee  57               push di                                  
  0cef  9a2f00d12f       lcall 0x2fd1, 0x2f                       -> ovl23:0000
  0cf4  83c40e           add sp, 0xe                              
  0cf7  33f6             xor si, si                               
  0cf9  eb77             jmp 0xd72                                
  0cfb  837e1208         cmp word ptr [bp + 0x12], 8              
  0cff  750a             jne 0xd0b                                
  0d01  8bde             mov bx, si                               
  0d03  d1e3             shl bx, 1                                
  0d05  8b87c807         mov ax, word ptr [bx + 0x7c8]            
  0d09  eb03             jmp 0xd0e                                
  0d0b  b80f00           mov ax, 0xf                              
  0d0e  8bc8             mov cx, ax                               
  0d10  8bc6             mov ax, si                               
  0d12  d1e0             shl ax, 1                                
  0d14  c45e0e           les bx, ptr [bp + 0xe]                   
  0d17  03d8             add bx, ax                               
  0d19  268b17           mov dx, word ptr es:[bx]                 
  0d1c  035614           add dx, word ptr [bp + 0x14]             
  0d1f  0bd2             or dx, dx                                
  0d21  742f             je 0xd52                                 
  0d23  83faff           cmp dx, -1                               
  0d26  742a             je 0xd52                                 
  0d28  6a00             push 0                                   
  0d2a  51               push cx                                  
  0d2b  6a03             push 3                                   
  0d2d  81fae803         cmp dx, 0x3e8                            
  0d31  7e05             jle 0xd38                                
  0d33  b8e703           mov ax, 0x3e7                            
  0d36  eb02             jmp 0xd3a                                
  0d38  8bc2             mov ax, dx                               
  0d3a  50               push ax                                  
  0d3b  ff7608           push word ptr [bp + 8]                   
  0d3e  8bc6             mov ax, si                               
  0d40  c1e002           shl ax, 2                                
  0d43  8bd7             mov dx, di                               
  0d45  03d0             add dx, ax                               
  0d47  83c20a           add dx, 0xa                              
  0d4a  52               push dx                                  
  0d4b  9a3900d12f       lcall 0x2fd1, 0x39                       -> ovl23:0099
  0d50  eb1c             jmp 0xd6e                                
  0d52  6a00             push 0                                   
  0d54  51               push cx                                  
  0d55  1e               push ds                                  
  0d56  68f207           push 0x7f2                               
  0d59  ff7608           push word ptr [bp + 8]                   
  0d5c  8bc6             mov ax, si                               
  0d5e  c1e002           shl ax, 2                                
  0d61  8bd7             mov dx, di                               
  0d63  03d0             add dx, ax                               
  0d65  83c20a           add dx, 0xa                              
  0d68  52               push dx                                  
  0d69  9a3400d12f       lcall 0x2fd1, 0x34                       -> ovl23:005a
  0d6e  83c40c           add sp, 0xc                              
  0d71  46               inc si                                   
  0d72  3b7612           cmp si, word ptr [bp + 0x12]             
  0d75  7c84             jl 0xcfb                                 
  0d77  5f               pop di                                   
  0d78  5e               pop si                                   
  0d79  5d               pop bp                                   
  0d7a  cb               retf                                     

ovl21_0d7b:  ; ENTRY
  0d7b  55               push bp                                  
  0d7c  8bec             mov bp, sp                               
  0d7e  83ec68           sub sp, 0x68                             
  0d81  56               push si                                  
  0d82  57               push di                                  
  0d83  8b7e08           mov di, word ptr [bp + 8]                
  0d86  8b4606           mov ax, word ptr [bp + 6]                
  0d89  0bc0             or ax, ax                                
  0d8b  7413             je 0xda0                                 
  0d8d  3d0100           cmp ax, 1                                
  0d90  7503             jne 0xd95                                
  0d92  e9b800           jmp 0xe4d                                
  0d95  3d0200           cmp ax, 2                                
  0d98  7503             jne 0xd9d                                
  0d9a  e95801           jmp 0xef5                                
  0d9d  e90402           jmp 0xfa4                                
  0da0  c41eee40         les bx, ptr [0x40ee]                     
  0da4  26c7470a1e00     mov word ptr es:[bx + 0xa], 0x1e         
  0daa  26c747480100     mov word ptr es:[bx + 0x48], 1           
  0db0  666a04           push 4                                   
  0db3  6a01             push 1                                   
  0db5  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0dba  83c406           add sp, 6                                
  0dbd  c41eee40         les bx, ptr [0x40ee]                     
  0dc1  26894718         mov word ptr es:[bx + 0x18], ax          
  0dc5  666a04           push 4                                   
  0dc8  6a01             push 1                                   
  0dca  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0dcf  83c406           add sp, 6                                
  0dd2  c41eee40         les bx, ptr [0x40ee]                     
  0dd6  2689471e         mov word ptr es:[bx + 0x1e], ax          
  0dda  666a04           push 4                                   
  0ddd  6a01             push 1                                   
  0ddf  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0de4  83c406           add sp, 6                                
  0de7  c41eee40         les bx, ptr [0x40ee]                     
  0deb  2689471a         mov word ptr es:[bx + 0x1a], ax          
  0def  26c7874a020100   mov word ptr es:[bx + 0x24a], 1          
  0df6  26c747380000     mov word ptr es:[bx + 0x38], 0           
  0dfc  26c747100300     mov word ptr es:[bx + 0x10], 3           
  0e02  26c747120300     mov word ptr es:[bx + 0x12], 3           
  0e08  26c747260000     mov word ptr es:[bx + 0x26], 0           
  0e0e  26c747280000     mov word ptr es:[bx + 0x28], 0           
  0e14  26c7472a0000     mov word ptr es:[bx + 0x2a], 0           
  0e1a  26c7472c0000     mov word ptr es:[bx + 0x2c], 0           
  0e20  26c7472e0000     mov word ptr es:[bx + 0x2e], 0           
  0e26  26c747300000     mov word ptr es:[bx + 0x30], 0           
  0e2c  26c747320000     mov word ptr es:[bx + 0x32], 0           
  0e32  26c747340000     mov word ptr es:[bx + 0x34], 0           
  0e38  26c747360000     mov word ptr es:[bx + 0x36], 0           
  0e3e  26c747420000     mov word ptr es:[bx + 0x42], 0           
  0e44  26c747445000     mov word ptr es:[bx + 0x44], 0x50        
  0e4a  e95701           jmp 0xfa4                                
  0e4d  c41eee40         les bx, ptr [0x40ee]                     
  0e51  26c7470a1400     mov word ptr es:[bx + 0xa], 0x14         
  0e57  26c747480000     mov word ptr es:[bx + 0x48], 0           
  0e5d  666a04           push 4                                   
  0e60  6a01             push 1                                   
  0e62  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0e67  83c406           add sp, 6                                
  0e6a  c41eee40         les bx, ptr [0x40ee]                     
  0e6e  26894718         mov word ptr es:[bx + 0x18], ax          
  0e72  666a04           push 4                                   
  0e75  6a01             push 1                                   
  0e77  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0e7c  83c406           add sp, 6                                
  0e7f  c41eee40         les bx, ptr [0x40ee]                     
  0e83  2689471e         mov word ptr es:[bx + 0x1e], ax          
  0e87  666a08           push 8                                   
  0e8a  6a01             push 1                                   
  0e8c  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0e91  83c406           add sp, 6                                
  0e94  c41eee40         les bx, ptr [0x40ee]                     
  0e98  2689471c         mov word ptr es:[bx + 0x1c], ax          
  0e9c  26834f0c01       or word ptr es:[bx + 0xc], 1             
  0ea1  26c747380000     mov word ptr es:[bx + 0x38], 0           
  0ea7  26c7874a020200   mov word ptr es:[bx + 0x24a], 2          
  0eae  26c747100600     mov word ptr es:[bx + 0x10], 6           
  0eb4  26c747121200     mov word ptr es:[bx + 0x12], 0x12        
  0eba  26c747260500     mov word ptr es:[bx + 0x26], 5           
  0ec0  26c747280a00     mov word ptr es:[bx + 0x28], 0xa         
  0ec6  26c7472a1400     mov word ptr es:[bx + 0x2a], 0x14        
  0ecc  26c7472c0100     mov word ptr es:[bx + 0x2c], 1           
  0ed2  26c7472e0500     mov word ptr es:[bx + 0x2e], 5           
  0ed8  33c0             xor ax, ax                               
  0eda  26894734         mov word ptr es:[bx + 0x34], ax          
  0ede  26894732         mov word ptr es:[bx + 0x32], ax          
  0ee2  26894730         mov word ptr es:[bx + 0x30], ax          
  0ee6  26c747360000     mov word ptr es:[bx + 0x36], 0           
  0eec  26c747420000     mov word ptr es:[bx + 0x42], 0           
  0ef2  e9a500           jmp 0xf9a                                
  0ef5  c41eee40         les bx, ptr [0x40ee]                     
  0ef9  26c7470a0a00     mov word ptr es:[bx + 0xa], 0xa          
  0eff  26c747480000     mov word ptr es:[bx + 0x48], 0           
  0f05  666a0a           push 0xa                                 
  0f08  6a01             push 1                                   
  0f0a  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0f0f  83c406           add sp, 6                                
  0f12  c41eee40         les bx, ptr [0x40ee]                     
  0f16  26894718         mov word ptr es:[bx + 0x18], ax          
  0f1a  666a08           push 8                                   
  0f1d  6a01             push 1                                   
  0f1f  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0f24  83c406           add sp, 6                                
  0f27  c41eee40         les bx, ptr [0x40ee]                     
  0f2b  2689471a         mov word ptr es:[bx + 0x1a], ax          
  0f2f  666a06           push 6                                   
  0f32  6a01             push 1                                   
  0f34  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0f39  83c406           add sp, 6                                
  0f3c  c41eee40         les bx, ptr [0x40ee]                     
  0f40  2689471c         mov word ptr es:[bx + 0x1c], ax          
  0f44  26c7874a020400   mov word ptr es:[bx + 0x24a], 4          
  0f4b  26c747380100     mov word ptr es:[bx + 0x38], 1           
  0f51  26834f0c01       or word ptr es:[bx + 0xc], 1             
  0f56  26c747100700     mov word ptr es:[bx + 0x10], 7           
  0f5c  26c747120000     mov word ptr es:[bx + 0x12], 0           
  0f62  26c747260500     mov word ptr es:[bx + 0x26], 5           
  0f68  26c747280a00     mov word ptr es:[bx + 0x28], 0xa         
  0f6e  26c7472a1400     mov word ptr es:[bx + 0x2a], 0x14        
  0f74  26c7472c0500     mov word ptr es:[bx + 0x2c], 5           
  0f7a  26c7472e3200     mov word ptr es:[bx + 0x2e], 0x32        
  0f80  33c0             xor ax, ax                               
  0f82  26894734         mov word ptr es:[bx + 0x34], ax          
  0f86  26894732         mov word ptr es:[bx + 0x32], ax          
  0f8a  26894730         mov word ptr es:[bx + 0x30], ax          
  0f8e  26c747363200     mov word ptr es:[bx + 0x36], 0x32        
  0f94  26c747420100     mov word ptr es:[bx + 0x42], 1           
  0f9a  c41eee40         les bx, ptr [0x40ee]                     
  0f9e  26c747442300     mov word ptr es:[bx + 0x44], 0x23        
  0fa4  8bdf             mov bx, di                               
  0fa6  d1e3             shl bx, 1                                
  0fa8  b8042c           mov ax, 0x2c04                           
  0fab  8ec0             mov es, ax                               
  0fad  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0fb3  7503             jne 0xfb8                                
  0fb5  e93901           jmp 0x10f1                               
  0fb8  8bdf             mov bx, di                               
  0fba  d1e3             shl bx, 1                                
  0fbc  b8042c           mov ax, 0x2c04                           
  0fbf  8ec0             mov es, ax                               
  0fc1  2683bfd00001     cmp word ptr es:[bx + 0xd0], 1           
  0fc7  7403             je 0xfcc                                 
  0fc9  e92501           jmp 0x10f1                               
  0fcc  16               push ss                                  
  0fcd  8d4698           lea ax, [bp - 0x68]                      
  0fd0  50               push ax                                  
  0fd1  57               push di                                  
  0fd2  9a25007c30       lcall 0x307c, 0x25                       -> ovl48:006a
  0fd7  83c406           add sp, 6                                
  0fda  6a00             push 0                                   
  0fdc  ff76ed           push word ptr [bp - 0x13]                
  0fdf  6a01             push 1                                   
  0fe1  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0fe6  83c406           add sp, 6                                
  0fe9  c41eee40         les bx, ptr [0x40ee]                     
  0fed  26894718         mov word ptr es:[bx + 0x18], ax          
  0ff1  6a00             push 0                                   
  0ff3  ff76f1           push word ptr [bp - 0xf]                 
  0ff6  6a01             push 1                                   
  0ff8  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  0ffd  83c406           add sp, 6                                
  1000  c41eee40         les bx, ptr [0x40ee]                     
  1004  2689471a         mov word ptr es:[bx + 0x1a], ax          
  1008  6a00             push 0                                   
  100a  ff76ef           push word ptr [bp - 0x11]                
  100d  6a01             push 1                                   
  100f  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1014  83c406           add sp, 6                                
  1017  c41eee40         les bx, ptr [0x40ee]                     
  101b  2689471c         mov word ptr es:[bx + 0x1c], ax          
  101f  6a00             push 0                                   
  1021  ff76f3           push word ptr [bp - 0xd]                 
  1024  6a01             push 1                                   
  1026  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  102b  83c406           add sp, 6                                
  102e  c41eee40         les bx, ptr [0x40ee]                     
  1032  2689471e         mov word ptr es:[bx + 0x1e], ax          
  1036  8b46a0           mov ax, word ptr [bp - 0x60]             
  1039  2689874a02       mov word ptr es:[bx + 0x24a], ax         
  103e  8b46fd           mov ax, word ptr [bp - 3]                
  1041  26894738         mov word ptr es:[bx + 0x38], ax          
  1045  837ea200         cmp word ptr [bp - 0x5e], 0              
  1049  7405             je 0x1050                                
  104b  26834f0c01       or word ptr es:[bx + 0xc], 1             
  1050  c41eee40         les bx, ptr [0x40ee]                     
  1054  8b46c3           mov ax, word ptr [bp - 0x3d]             
  1057  26894748         mov word ptr es:[bx + 0x48], ax          
  105b  8b46c5           mov ax, word ptr [bp - 0x3b]             
  105e  26894710         mov word ptr es:[bx + 0x10], ax          
  1062  8b46c7           mov ax, word ptr [bp - 0x39]             
  1065  26894712         mov word ptr es:[bx + 0x12], ax          
  1069  8b46c9           mov ax, word ptr [bp - 0x37]             
  106c  2689470a         mov word ptr es:[bx + 0xa], ax           
  1070  8b46dd           mov ax, word ptr [bp - 0x23]             
  1073  26894726         mov word ptr es:[bx + 0x26], ax          
  1077  8b46df           mov ax, word ptr [bp - 0x21]             
  107a  26894728         mov word ptr es:[bx + 0x28], ax          
  107e  8b46e1           mov ax, word ptr [bp - 0x1f]             
  1081  2689472a         mov word ptr es:[bx + 0x2a], ax          
  1085  8b46e3           mov ax, word ptr [bp - 0x1d]             
  1088  2689472c         mov word ptr es:[bx + 0x2c], ax          
  108c  8b46e5           mov ax, word ptr [bp - 0x1b]             
  108f  2689472e         mov word ptr es:[bx + 0x2e], ax          
  1093  8b46eb           mov ax, word ptr [bp - 0x15]             
  1096  26894730         mov word ptr es:[bx + 0x30], ax          
  109a  8b46e9           mov ax, word ptr [bp - 0x17]             
  109d  26894732         mov word ptr es:[bx + 0x32], ax          
  10a1  8b46e7           mov ax, word ptr [bp - 0x19]             
  10a4  26894734         mov word ptr es:[bx + 0x34], ax          
  10a8  8b46f7           mov ax, word ptr [bp - 9]                
  10ab  26894736         mov word ptr es:[bx + 0x36], ax          
  10af  8b46f9           mov ax, word ptr [bp - 7]                
  10b2  26894742         mov word ptr es:[bx + 0x42], ax          
  10b6  666a0a           push 0xa                                 
  10b9  6a01             push 1                                   
  10bb  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  10c0  83c406           add sp, 6                                
  10c3  8b56fb           mov dx, word ptr [bp - 5]                
  10c6  6bd20a           imul dx, dx, 0xa                         
  10c9  03d0             add dx, ax                               
  10cb  c41eee40         les bx, ptr [0x40ee]                     
  10cf  26895744         mov word ptr es:[bx + 0x44], dx          
  10d3  33f6             xor si, si                               
  10d5  eb15             jmp 0x10ec                               
  10d7  8a42a6           mov al, byte ptr [bp + si - 0x5a]        
  10da  8bdf             mov bx, di                               
  10dc  6bdb1d           imul bx, bx, 0x1d                        
  10df  03de             add bx, si                               
  10e1  ba042c           mov dx, 0x2c04                           
  10e4  8ec2             mov es, dx                               
  10e6  2688870b06       mov byte ptr es:[bx + 0x60b], al         
  10eb  46               inc si                                   
  10ec  83fe1d           cmp si, 0x1d                             
  10ef  7ce6             jl 0x10d7                                
  10f1  5f               pop di                                   
  10f2  5e               pop si                                   
  10f3  c9               leave                                    
  10f4  cb               retf                                     
