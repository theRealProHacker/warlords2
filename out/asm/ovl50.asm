; ovl50 stub 308a file_off 0x6e1d0 size 0xc27

ovl50_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  1e               push ds                                  
  0004  68d347           push 0x47d3                              
  0007  1e               push ds                                  
  0008  68b613           push 0x13b6                              
  000b  1e               push ds                                  
  000c  687b13           push 0x137b                              
  000f  1e               push ds                                  
  0010  68d747           push 0x47d7                              
  0013  1e               push ds                                  
  0014  686714           push 0x1467                               ; "Chance36"
  0017  90               nop                                      
  0018  0e               push cs                                  
  0019  e83d00           call 0x59                                
  001c  83c414           add sp, 0x14                             
  001f  1e               push ds                                  
  0020  68b247           push 0x47b2                              
  0023  1e               push ds                                  
  0024  682c14           push 0x142c                              
  0027  1e               push ds                                  
  0028  68f113           push 0x13f1                              
  002b  1e               push ds                                  
  002c  68b647           push 0x47b6                              
  002f  1e               push ds                                  
  0030  687014           push 0x1470                               ; "Chance17"
  0033  90               nop                                      
  0034  0e               push cs                                  
  0035  e82100           call 0x59                                
  0038  83c414           add sp, 0x14                             
  003b  1e               push ds                                  
  003c  68f447           push 0x47f4                              
  003f  1e               push ds                                  
  0040  684013           push 0x1340                              
  0043  1e               push ds                                  
  0044  680513           push 0x1305                              
  0047  1e               push ds                                  
  0048  68f847           push 0x47f8                              
  004b  1e               push ds                                  
  004c  687914           push 0x1479                               ; "Text"
  004f  90               nop                                      
  0050  0e               push cs                                  
  0051  e80500           call 0x59                                
  0054  83c414           add sp, 0x14                             
  0057  5d               pop bp                                   
  0058  cb               retf                                     

ovl50_0059:  ; ENTRY
  0059  55               push bp                                  
  005a  8bec             mov bp, sp                               
  005c  81ece800         sub sp, 0xe8                             
  0060  56               push si                                  
  0061  57               push di                                  
  0062  c746fa0100       mov word ptr [bp - 6], 1                 
  0067  1e               push ds                                  
  0068  687e14           push 0x147e                              
  006b  16               push ss                                  
  006c  8d8626ff         lea ax, [bp - 0xda]                      
  0070  50               push ax                                  
  0071  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0076  83c408           add sp, 8                                
  0079  66ff7606         push dword ptr [bp + 6]                  
  007d  1e               push ds                                  
  007e  687f14           push 0x147f                               ; "%s.fnt"
  0081  16               push ss                                  
  0082  8d8618ff         lea ax, [bp - 0xe8]                      
  0086  50               push ax                                  
  0087  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  008c  83c40c           add sp, 0xc                              
  008f  16               push ss                                  
  0090  8d8618ff         lea ax, [bp - 0xe8]                      
  0094  50               push ax                                  
  0095  16               push ss                                  
  0096  8d8626ff         lea ax, [bp - 0xda]                      
  009a  50               push ax                                  
  009b  66ff760e         push dword ptr [bp + 0xe]                
  009f  9a05007b09       lcall 0x97b, 5                           -> 097b:0005
  00a4  83c40c           add sp, 0xc                              
  00a7  0bc0             or ax, ax                                
  00a9  7526             jne 0xd1                                 
  00ab  16               push ss                                  
  00ac  8d8618ff         lea ax, [bp - 0xe8]                      
  00b0  50               push ax                                  
  00b1  1e               push ds                                  
  00b2  688614           push 0x1486                               ; "Couldn't load the file '%s'."
  00b5  16               push ss                                  
  00b6  8d8626ff         lea ax, [bp - 0xda]                      
  00ba  50               push ax                                  
  00bb  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  00c0  83c40c           add sp, 0xc                              
  00c3  16               push ss                                  
  00c4  8d8626ff         lea ax, [bp - 0xda]                      
  00c8  50               push ax                                  
  00c9  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  00ce  83c404           add sp, 4                                
  00d1  66ff7606         push dword ptr [bp + 6]                  
  00d5  1e               push ds                                  
  00d6  68a314           push 0x14a3                               ; "%s.fin"
  00d9  16               push ss                                  
  00da  8d8618ff         lea ax, [bp - 0xe8]                      
  00de  50               push ax                                  
  00df  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  00e4  83c40c           add sp, 0xc                              
  00e7  16               push ss                                  
  00e8  8d8618ff         lea ax, [bp - 0xe8]                      
  00ec  50               push ax                                  
  00ed  16               push ss                                  
  00ee  8d8626ff         lea ax, [bp - 0xda]                      
  00f2  50               push ax                                  
  00f3  66ff760e         push dword ptr [bp + 0xe]                
  00f7  66ff760a         push dword ptr [bp + 0xa]                
  00fb  90               nop                                      
  00fc  0e               push cs                                  
  00fd  e8ea02           call 0x3ea                               
  0100  83c410           add sp, 0x10                             
  0103  0bc0             or ax, ax                                
  0105  7526             jne 0x12d                                
  0107  16               push ss                                  
  0108  8d8618ff         lea ax, [bp - 0xe8]                      
  010c  50               push ax                                  
  010d  1e               push ds                                  
  010e  68aa14           push 0x14aa                               ; "Couldn't load the file '%s'."
  0111  16               push ss                                  
  0112  8d8626ff         lea ax, [bp - 0xda]                      
  0116  50               push ax                                  
  0117  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  011c  83c40c           add sp, 0xc                              
  011f  16               push ss                                  
  0120  8d8626ff         lea ax, [bp - 0xda]                      
  0124  50               push ax                                  
  0125  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  012a  83c404           add sp, 4                                
  012d  66837e1200       cmp dword ptr [bp + 0x12], 0             
  0132  7503             jne 0x137                                
  0134  e9f301           jmp 0x32a                                
  0137  c45e0a           les bx, ptr [bp + 0xa]                   
  013a  268b4702         mov ax, word ptr es:[bx + 2]             
  013e  8946f8           mov word ptr [bp - 8], ax                
  0141  268b470d         mov ax, word ptr es:[bx + 0xd]           
  0145  8946f6           mov word ptr [bp - 0xa], ax              
  0148  c706d2120000     mov word ptr [0x12d2], 0                 
  014e  50               push ax                                  
  014f  ff76f8           push word ptr [bp - 8]                   
  0152  1e               push ds                                  
  0153  68ca12           push 0x12ca                              
  0156  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  015b  83c408           add sp, 8                                
  015e  0bc0             or ax, ax                                
  0160  750c             jne 0x16e                                
  0162  1e               push ds                                  
  0163  68c714           push 0x14c7                               ; "Couldn't allocate the temp mask bitmap."
  0166  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  016b  83c404           add sp, 4                                
  016e  6a01             push 1                                   
  0170  ff76f6           push word ptr [bp - 0xa]                 
  0173  ff76f8           push word ptr [bp - 8]                   
  0176  66ff7612         push dword ptr [bp + 0x12]               
  017a  9a32021210       lcall 0x1012, 0x232                      -> 1012:0232
  017f  83c40a           add sp, 0xa                              
  0182  0bc0             or ax, ax                                
  0184  750c             jne 0x192                                
  0186  1e               push ds                                  
  0187  68f014           push 0x14f0                               ; "Couldn't allocate the mask bitmap."
  018a  9a20009630       lcall 0x3096, 0x20                       -> ovl52:0000
  018f  83c404           add sp, 4                                
  0192  66833ed41200     cmp dword ptr [0x12d4], 0                
  0198  7435             je 0x1cf                                 
  019a  f706ff120a00     test word ptr [0x12ff], 0xa              
  01a0  752d             jne 0x1cf                                
  01a2  33f6             xor si, si                               
  01a4  eb20             jmp 0x1c6                                
  01a6  8bde             mov bx, si                               
  01a8  c1e302           shl bx, 2                                
  01ab  66ffb7d412       push dword ptr [bx + 0x12d4]             
  01b0  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  01b5  83c404           add sp, 4                                
  01b8  8bde             mov bx, si                               
  01ba  c1e302           shl bx, 2                                
  01bd  8997e612         mov word ptr [bx + 0x12e6], dx           
  01c1  8987e412         mov word ptr [bx + 0x12e4], ax           
  01c5  46               inc si                                   
  01c6  a0fe12           mov al, byte ptr [0x12fe]                
  01c9  b400             mov ah, 0                                
  01cb  3bc6             cmp ax, si                               
  01cd  7fd7             jg 0x1a6                                 
  01cf  c45e12           les bx, ptr [bp + 0x12]                  
  01d2  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  01d8  7443             je 0x21d                                 
  01da  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  01e0  753b             jne 0x21d                                
  01e2  33ff             xor di, di                               
  01e4  eb2a             jmp 0x210                                
  01e6  8bc7             mov ax, di                               
  01e8  c1e002           shl ax, 2                                
  01eb  c45e12           les bx, ptr [bp + 0x12]                  
  01ee  03d8             add bx, ax                               
  01f0  6626ff770a       push dword ptr es:[bx + 0xa]             
  01f5  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  01fa  83c404           add sp, 4                                
  01fd  8bdf             mov bx, di                               
  01ff  c1e302           shl bx, 2                                
  0202  c47612           les si, ptr [bp + 0x12]                  
  0205  03f3             add si, bx                               
  0207  2689541c         mov word ptr es:[si + 0x1c], dx          
  020b  2689441a         mov word ptr es:[si + 0x1a], ax          
  020f  47               inc di                                   
  0210  c45e12           les bx, ptr [bp + 0x12]                  
  0213  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0217  b400             mov ah, 0                                
  0219  3bc7             cmp ax, di                               
  021b  7fc9             jg 0x1e6                                 
  021d  c45e0e           les bx, ptr [bp + 0xe]                   
  0220  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0226  7443             je 0x26b                                 
  0228  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  022e  753b             jne 0x26b                                
  0230  33ff             xor di, di                               
  0232  eb2a             jmp 0x25e                                
  0234  8bc7             mov ax, di                               
  0236  c1e002           shl ax, 2                                
  0239  c45e0e           les bx, ptr [bp + 0xe]                   
  023c  03d8             add bx, ax                               
  023e  6626ff770a       push dword ptr es:[bx + 0xa]             
  0243  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0248  83c404           add sp, 4                                
  024b  8bdf             mov bx, di                               
  024d  c1e302           shl bx, 2                                
  0250  c4760e           les si, ptr [bp + 0xe]                   
  0253  03f3             add si, bx                               
  0255  2689541c         mov word ptr es:[si + 0x1c], dx          
  0259  2689441a         mov word ptr es:[si + 0x1a], ax          
  025d  47               inc di                                   
  025e  c45e0e           les bx, ptr [bp + 0xe]                   
  0261  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0265  b400             mov ah, 0                                
  0267  3bc7             cmp ax, di                               
  0269  7fc9             jg 0x234                                 
  026b  666a00           push 0                                   
  026e  1e               push ds                                  
  026f  68ca12           push 0x12ca                              
  0272  ff76f6           push word ptr [bp - 0xa]                 
  0275  ff76f8           push word ptr [bp - 8]                   
  0278  666a00           push 0                                   
  027b  66ff760e         push dword ptr [bp + 0xe]                
  027f  ff1ed469         lcall [0x69d4]                           
  0283  83c414           add sp, 0x14                             
  0286  c45e0a           les bx, ptr [bp + 0xa]                   
  0289  26c45f19         les bx, ptr es:[bx + 0x19]               
  028d  26ff7704         push word ptr es:[bx + 4]                
  0291  66ff7612         push dword ptr [bp + 0x12]               
  0295  1e               push ds                                  
  0296  68ca12           push 0x12ca                              
  0299  16               push ss                                  
  029a  8d46fa           lea ax, [bp - 6]                         
  029d  50               push ax                                  
  029e  9acf001d15       lcall 0x151d, 0xcf                       -> 151d:00cf
  02a3  83c40e           add sp, 0xe                              
  02a6  c45e12           les bx, ptr [bp + 0x12]                  
  02a9  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  02af  7431             je 0x2e2                                 
  02b1  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  02b7  7529             jne 0x2e2                                
  02b9  33f6             xor si, si                               
  02bb  eb18             jmp 0x2d5                                
  02bd  8bc6             mov ax, si                               
  02bf  c1e002           shl ax, 2                                
  02c2  c45e12           les bx, ptr [bp + 0x12]                  
  02c5  03d8             add bx, ax                               
  02c7  6626ff770a       push dword ptr es:[bx + 0xa]             
  02cc  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  02d1  83c404           add sp, 4                                
  02d4  46               inc si                                   
  02d5  c45e12           les bx, ptr [bp + 0x12]                  
  02d8  268a4734         mov al, byte ptr es:[bx + 0x34]          
  02dc  b400             mov ah, 0                                
  02de  3bc6             cmp ax, si                               
  02e0  7fdb             jg 0x2bd                                 
  02e2  c45e0e           les bx, ptr [bp + 0xe]                   
  02e5  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  02eb  7431             je 0x31e                                 
  02ed  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  02f3  7529             jne 0x31e                                
  02f5  33f6             xor si, si                               
  02f7  eb18             jmp 0x311                                
  02f9  8bc6             mov ax, si                               
  02fb  c1e002           shl ax, 2                                
  02fe  c45e0e           les bx, ptr [bp + 0xe]                   
  0301  03d8             add bx, ax                               
  0303  6626ff770a       push dword ptr es:[bx + 0xa]             
  0308  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  030d  83c404           add sp, 4                                
  0310  46               inc si                                   
  0311  c45e0e           les bx, ptr [bp + 0xe]                   
  0314  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0318  b400             mov ah, 0                                
  031a  3bc6             cmp ax, si                               
  031c  7fdb             jg 0x2f9                                 
  031e  1e               push ds                                  
  031f  68ca12           push 0x12ca                              
  0322  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  0327  83c404           add sp, 4                                
  032a  c45e0a           les bx, ptr [bp + 0xa]                   
  032d  268b7f0f         mov di, word ptr es:[bx + 0xf]           
  0331  666a00           push 0                                   
  0334  6a20             push 0x20                                
  0336  8bc7             mov ax, di                               
  0338  6bc02a           imul ax, ax, 0x2a                        
  033b  660fb7c0         movzx eax, ax                            
  033f  6650             push eax                                 
  0341  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0346  83c40a           add sp, 0xa                              
  0349  52               push dx                                  
  034a  50               push ax                                  
  034b  9a5d07280d       lcall 0xd28, 0x75d                       -> 0d28:075d
  0350  83c404           add sp, 4                                
  0353  8956fe           mov word ptr [bp - 2], dx                
  0356  8946fc           mov word ptr [bp - 4], ax                
  0359  33f6             xor si, si                               
  035b  eb7a             jmp 0x3d7                                
  035d  c45e0a           les bx, ptr [bp + 0xa]                   
  0360  26ff770d         push word ptr es:[bx + 0xd]              
  0364  26ff7702         push word ptr es:[bx + 2]                
  0368  8bc6             mov ax, si                               
  036a  26f76f0d         imul word ptr es:[bx + 0xd]              
  036e  50               push ax                                  
  036f  6a00             push 0                                   
  0371  16               push ss                                  
  0372  8d46ee           lea ax, [bp - 0x12]                      
  0375  50               push ax                                  
  0376  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  037b  83c40c           add sp, 0xc                              
  037e  c45e0a           les bx, ptr [bp + 0xa]                   
  0381  26c45f19         les bx, ptr es:[bx + 0x19]               
  0385  8bc6             mov ax, si                               
  0387  6bc006           imul ax, ax, 6                           
  038a  03d8             add bx, ax                               
  038c  26ff7704         push word ptr es:[bx + 4]                
  0390  6a00             push 0                                   
  0392  c45e0a           les bx, ptr [bp + 0xa]                   
  0395  268a4708         mov al, byte ptr es:[bx + 8]             
  0399  50               push ax                                  
  039a  6626ff7715       push dword ptr es:[bx + 0x15]            
  039f  6626ff7711       push dword ptr es:[bx + 0x11]            
  03a4  268a4701         mov al, byte ptr es:[bx + 1]             
  03a8  260207           add al, byte ptr es:[bx]                 
  03ab  fec8             dec al                                   
  03ad  50               push ax                                  
  03ae  268a4701         mov al, byte ptr es:[bx + 1]             
  03b2  50               push ax                                  
  03b3  16               push ss                                  
  03b4  8d46ee           lea ax, [bp - 0x12]                      
  03b7  50               push ax                                  
  03b8  66ff7612         push dword ptr [bp + 0x12]               
  03bc  66ff760e         push dword ptr [bp + 0xe]                
  03c0  8bc6             mov ax, si                               
  03c2  6bc02a           imul ax, ax, 0x2a                        
  03c5  8b56fc           mov dx, word ptr [bp - 4]                
  03c8  03d0             add dx, ax                               
  03ca  ff76fe           push word ptr [bp - 2]                   
  03cd  52               push dx                                  
  03ce  9a0800e211       lcall 0x11e2, 8                          -> 11e2:0008
  03d3  83c422           add sp, 0x22                             
  03d6  46               inc si                                   
  03d7  3bf7             cmp si, di                               
  03d9  7c82             jl 0x35d                                 
  03db  c45e16           les bx, ptr [bp + 0x16]                  
  03de  668b46fc         mov eax, dword ptr [bp - 4]              
  03e2  66268907         mov dword ptr es:[bx], eax               
  03e6  5f               pop di                                   
  03e7  5e               pop si                                   
  03e8  c9               leave                                    
  03e9  cb               retf                                     

ovl50_03ea:  ; ENTRY
  03ea  55               push bp                                  
  03eb  8bec             mov bp, sp                               
  03ed  81ecca00         sub sp, 0xca                             
  03f1  56               push si                                  
  03f2  57               push di                                  
  03f3  66ff760e         push dword ptr [bp + 0xe]                
  03f7  16               push ss                                  
  03f8  8d8636ff         lea ax, [bp - 0xca]                      
  03fc  50               push ax                                  
  03fd  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0402  83c408           add sp, 8                                
  0405  66ff7612         push dword ptr [bp + 0x12]               
  0409  16               push ss                                  
  040a  8d8636ff         lea ax, [bp - 0xca]                      
  040e  50               push ax                                  
  040f  9a014a0000       lcall 0, 0x4a01                          -> 0000:4a01
  0414  83c408           add sp, 8                                
  0417  6a02             push 2                                   
  0419  16               push ss                                  
  041a  8d8636ff         lea ax, [bp - 0xca]                      
  041e  50               push ax                                  
  041f  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0424  83c406           add sp, 6                                
  0427  8bf0             mov si, ax                               
  0429  3dffff           cmp ax, 0xffff                           
  042c  7505             jne 0x433                                
  042e  33c0             xor ax, ax                               
  0430  e90702           jmp 0x63a                                
  0433  bf0100           mov di, 1                                
  0436  57               push di                                  
  0437  16               push ss                                  
  0438  8d46fe           lea ax, [bp - 2]                         
  043b  50               push ax                                  
  043c  56               push si                                  
  043d  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0442  83c408           add sp, 8                                
  0445  c45e06           les bx, ptr [bp + 6]                     
  0448  8a46fe           mov al, byte ptr [bp - 2]                
  044b  268807           mov byte ptr es:[bx], al                 
  044e  666a00           push 0                                   
  0451  6a20             push 0x20                                
  0453  b400             mov ah, 0                                
  0455  660fb7c0         movzx eax, ax                            
  0459  6650             push eax                                 
  045b  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  0460  83c40a           add sp, 0xa                              
  0463  52               push dx                                  
  0464  50               push ax                                  
  0465  9a5d07280d       lcall 0xd28, 0x75d                       -> 0d28:075d
  046a  83c404           add sp, 4                                
  046d  c45e06           les bx, ptr [bp + 6]                     
  0470  26895713         mov word ptr es:[bx + 0x13], dx          
  0474  26894711         mov word ptr es:[bx + 0x11], ax          
  0478  6626837f1100     cmp dword ptr es:[bx + 0x11], 0          
  047e  7509             jne 0x489                                
  0480  56               push si                                  
  0481  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0486  59               pop cx                                   
  0487  eba5             jmp 0x42e                                
  0489  666a00           push 0                                   
  048c  6a20             push 0x20                                
  048e  8a46fe           mov al, byte ptr [bp - 2]                
  0491  b400             mov ah, 0                                
  0493  660fb7c0         movzx eax, ax                            
  0497  6650             push eax                                 
  0499  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  049e  83c40a           add sp, 0xa                              
  04a1  52               push dx                                  
  04a2  50               push ax                                  
  04a3  9a5d07280d       lcall 0xd28, 0x75d                       -> 0d28:075d
  04a8  83c404           add sp, 4                                
  04ab  c45e06           les bx, ptr [bp + 6]                     
  04ae  26895717         mov word ptr es:[bx + 0x17], dx          
  04b2  26894715         mov word ptr es:[bx + 0x15], ax          
  04b6  6626837f1500     cmp dword ptr es:[bx + 0x15], 0          
  04bc  74c2             je 0x480                                 
  04be  bf0100           mov di, 1                                
  04c1  57               push di                                  
  04c2  16               push ss                                  
  04c3  8d46ff           lea ax, [bp - 1]                         
  04c6  50               push ax                                  
  04c7  56               push si                                  
  04c8  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  04cd  83c408           add sp, 8                                
  04d0  c45e06           les bx, ptr [bp + 6]                     
  04d3  8a46ff           mov al, byte ptr [bp - 1]                
  04d6  26884701         mov byte ptr es:[bx + 1], al             
  04da  56               push si                                  
  04db  90               nop                                      
  04dc  0e               push cs                                  
  04dd  e8bd06           call 0xb9d                               
  04e0  59               pop cx                                   
  04e1  c45e06           les bx, ptr [bp + 6]                     
  04e4  26894702         mov word ptr es:[bx + 2], ax             
  04e8  668b460a         mov eax, dword ptr [bp + 0xa]            
  04ec  6626894704       mov dword ptr es:[bx + 4], eax           
  04f1  bf0100           mov di, 1                                
  04f4  57               push di                                  
  04f5  16               push ss                                  
  04f6  8d46ff           lea ax, [bp - 1]                         
  04f9  50               push ax                                  
  04fa  56               push si                                  
  04fb  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0500  83c408           add sp, 8                                
  0503  c45e06           les bx, ptr [bp + 6]                     
  0506  8a46ff           mov al, byte ptr [bp - 1]                
  0509  26884708         mov byte ptr es:[bx + 8], al             
  050d  bf0100           mov di, 1                                
  0510  57               push di                                  
  0511  16               push ss                                  
  0512  8d46ff           lea ax, [bp - 1]                         
  0515  50               push ax                                  
  0516  56               push si                                  
  0517  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  051c  83c408           add sp, 8                                
  051f  c45e06           les bx, ptr [bp + 6]                     
  0522  8a46ff           mov al, byte ptr [bp - 1]                
  0525  26884709         mov byte ptr es:[bx + 9], al             
  0529  bf0100           mov di, 1                                
  052c  57               push di                                  
  052d  16               push ss                                  
  052e  8d46ff           lea ax, [bp - 1]                         
  0531  50               push ax                                  
  0532  56               push si                                  
  0533  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0538  83c408           add sp, 8                                
  053b  c45e06           les bx, ptr [bp + 6]                     
  053e  8a46ff           mov al, byte ptr [bp - 1]                
  0541  2688470a         mov byte ptr es:[bx + 0xa], al           
  0545  56               push si                                  
  0546  90               nop                                      
  0547  0e               push cs                                  
  0548  e85206           call 0xb9d                               
  054b  59               pop cx                                   
  054c  c45e06           les bx, ptr [bp + 6]                     
  054f  2689470b         mov word ptr es:[bx + 0xb], ax           
  0553  268a4708         mov al, byte ptr es:[bx + 8]             
  0557  b400             mov ah, 0                                
  0559  50               push ax                                  
  055a  268b470b         mov ax, word ptr es:[bx + 0xb]           
  055e  5a               pop dx                                   
  055f  f7ea             imul dx                                  
  0561  2689470d         mov word ptr es:[bx + 0xd], ax           
  0565  56               push si                                  
  0566  90               nop                                      
  0567  0e               push cs                                  
  0568  e83206           call 0xb9d                               
  056b  59               pop cx                                   
  056c  c45e06           les bx, ptr [bp + 6]                     
  056f  2689470f         mov word ptr es:[bx + 0xf], ax           
  0573  268a07           mov al, byte ptr es:[bx]                 
  0576  b400             mov ah, 0                                
  0578  8bf8             mov di, ax                               
  057a  50               push ax                                  
  057b  6626ff7711       push dword ptr es:[bx + 0x11]            
  0580  56               push si                                  
  0581  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0586  83c408           add sp, 8                                
  0589  57               push di                                  
  058a  c45e06           les bx, ptr [bp + 6]                     
  058d  6626ff7715       push dword ptr es:[bx + 0x15]            
  0592  56               push si                                  
  0593  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0598  83c408           add sp, 8                                
  059b  666a00           push 0                                   
  059e  6a20             push 0x20                                
  05a0  c45e06           les bx, ptr [bp + 6]                     
  05a3  268b470f         mov ax, word ptr es:[bx + 0xf]           
  05a7  6bc006           imul ax, ax, 6                           
  05aa  660fb7c0         movzx eax, ax                            
  05ae  6650             push eax                                 
  05b0  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  05b5  83c40a           add sp, 0xa                              
  05b8  52               push dx                                  
  05b9  50               push ax                                  
  05ba  9a5d07280d       lcall 0xd28, 0x75d                       -> 0d28:075d
  05bf  83c404           add sp, 4                                
  05c2  c45e06           les bx, ptr [bp + 6]                     
  05c5  2689571b         mov word ptr es:[bx + 0x1b], dx          
  05c9  26894719         mov word ptr es:[bx + 0x19], ax          
  05cd  6626837f1900     cmp dword ptr es:[bx + 0x19], 0          
  05d3  7503             jne 0x5d8                                
  05d5  e9a8fe           jmp 0x480                                
  05d8  33ff             xor di, di                               
  05da  eb4b             jmp 0x627                                
  05dc  56               push si                                  
  05dd  90               nop                                      
  05de  0e               push cs                                  
  05df  e8bb05           call 0xb9d                               
  05e2  59               pop cx                                   
  05e3  c45e06           les bx, ptr [bp + 6]                     
  05e6  26c45f19         les bx, ptr es:[bx + 0x19]               
  05ea  8bd7             mov dx, di                               
  05ec  6bd206           imul dx, dx, 6                           
  05ef  03da             add bx, dx                               
  05f1  268907           mov word ptr es:[bx], ax                 
  05f4  56               push si                                  
  05f5  90               nop                                      
  05f6  0e               push cs                                  
  05f7  e8a305           call 0xb9d                               
  05fa  59               pop cx                                   
  05fb  c45e06           les bx, ptr [bp + 6]                     
  05fe  26c45f19         les bx, ptr es:[bx + 0x19]               
  0602  8bd7             mov dx, di                               
  0604  6bd206           imul dx, dx, 6                           
  0607  03da             add bx, dx                               
  0609  26894702         mov word ptr es:[bx + 2], ax             
  060d  56               push si                                  
  060e  90               nop                                      
  060f  0e               push cs                                  
  0610  e88a05           call 0xb9d                               
  0613  59               pop cx                                   
  0614  c45e06           les bx, ptr [bp + 6]                     
  0617  26c45f19         les bx, ptr es:[bx + 0x19]               
  061b  8bd7             mov dx, di                               
  061d  6bd206           imul dx, dx, 6                           
  0620  03da             add bx, dx                               
  0622  26894704         mov word ptr es:[bx + 4], ax             
  0626  47               inc di                                   
  0627  c45e06           les bx, ptr [bp + 6]                     
  062a  26397f0f         cmp word ptr es:[bx + 0xf], di           
  062e  7fac             jg 0x5dc                                 
  0630  56               push si                                  
  0631  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0636  59               pop cx                                   
  0637  b80100           mov ax, 1                                
  063a  5f               pop di                                   
  063b  5e               pop si                                   
  063c  c9               leave                                    
  063d  cb               retf                                     

ovl50_063e:  ; ENTRY
  063e  55               push bp                                  
  063f  8bec             mov bp, sp                               
  0641  56               push si                                  
  0642  33f6             xor si, si                               
  0644  eb19             jmp 0x65f                                
  0646  8bc6             mov ax, si                               
  0648  6bc02a           imul ax, ax, 0x2a                        
  064b  8b16f447         mov dx, word ptr [0x47f4]                
  064f  03d0             add dx, ax                               
  0651  ff36f647         push word ptr [0x47f6]                   
  0655  52               push dx                                  
  0656  9a990be211       lcall 0x11e2, 0xb99                      -> 11e2:0b99
  065b  83c404           add sp, 4                                
  065e  46               inc si                                   
  065f  3b360748         cmp si, word ptr [0x4807]                
  0663  7ce1             jl 0x646                                 
  0665  33f6             xor si, si                               
  0667  eb19             jmp 0x682                                
  0669  8bc6             mov ax, si                               
  066b  6bc02a           imul ax, ax, 0x2a                        
  066e  8b16d347         mov dx, word ptr [0x47d3]                
  0672  03d0             add dx, ax                               
  0674  ff36d547         push word ptr [0x47d5]                   
  0678  52               push dx                                  
  0679  9a990be211       lcall 0x11e2, 0xb99                      -> 11e2:0b99
  067e  83c404           add sp, 4                                
  0681  46               inc si                                   
  0682  3b36e647         cmp si, word ptr [0x47e6]                
  0686  7ce1             jl 0x669                                 
  0688  33f6             xor si, si                               
  068a  eb19             jmp 0x6a5                                
  068c  8bc6             mov ax, si                               
  068e  6bc02a           imul ax, ax, 0x2a                        
  0691  8b16b247         mov dx, word ptr [0x47b2]                
  0695  03d0             add dx, ax                               
  0697  ff36b447         push word ptr [0x47b4]                   
  069b  52               push dx                                  
  069c  9a990be211       lcall 0x11e2, 0xb99                      -> 11e2:0b99
  06a1  83c404           add sp, 4                                
  06a4  46               inc si                                   
  06a5  3b36c547         cmp si, word ptr [0x47c5]                
  06a9  7ce1             jl 0x68c                                 
  06ab  5e               pop si                                   
  06ac  5d               pop bp                                   
  06ad  cb               retf                                     

ovl50_06ae:  ; ENTRY
  06ae  55               push bp                                  
  06af  8bec             mov bp, sp                               
  06b1  83ec14           sub sp, 0x14                             
  06b4  56               push si                                  
  06b5  57               push di                                  
  06b6  8b7608           mov si, word ptr [bp + 8]                
  06b9  8b7e0a           mov di, word ptr [bp + 0xa]              
  06bc  8b4606           mov ax, word ptr [bp + 6]                
  06bf  0bc0             or ax, ax                                
  06c1  740c             je 0x6cf                                 
  06c3  3d0100           cmp ax, 1                                
  06c6  741d             je 0x6e5                                 
  06c8  3d0200           cmp ax, 2                                
  06cb  742e             je 0x6fb                                 
  06cd  eb40             jmp 0x70f                                
  06cf  8c5efe           mov word ptr [bp - 2], ds                
  06d2  c746fcf847       mov word ptr [bp - 4], 0x47f8            
  06d7  66a1f447         mov eax, dword ptr [0x47f4]              
  06db  668946f8         mov dword ptr [bp - 8], eax              
  06df  8b160748         mov dx, word ptr [0x4807]                
  06e3  eb2a             jmp 0x70f                                
  06e5  8c5efe           mov word ptr [bp - 2], ds                
  06e8  c746fcd747       mov word ptr [bp - 4], 0x47d7            
  06ed  66a1d347         mov eax, dword ptr [0x47d3]              
  06f1  668946f8         mov dword ptr [bp - 8], eax              
  06f5  8b16e647         mov dx, word ptr [0x47e6]                
  06f9  eb14             jmp 0x70f                                
  06fb  8c5efe           mov word ptr [bp - 2], ds                
  06fe  c746fcb647       mov word ptr [bp - 4], 0x47b6            
  0703  66a1b247         mov eax, dword ptr [0x47b2]              
  0707  668946f8         mov dword ptr [bp - 8], eax              
  070b  8b16c547         mov dx, word ptr [0x47c5]                
  070f  c746f40000       mov word ptr [bp - 0xc], 0               
  0714  33c9             xor cx, cx                               
  0716  eb44             jmp 0x75c                                
  0718  c45efc           les bx, ptr [bp - 4]                     
  071b  26c45f19         les bx, ptr es:[bx + 0x19]               
  071f  8bc1             mov ax, cx                               
  0721  6bc006           imul ax, ax, 6                           
  0724  03d8             add bx, ax                               
  0726  263937           cmp word ptr es:[bx], si                 
  0729  7530             jne 0x75b                                
  072b  c45efc           les bx, ptr [bp - 4]                     
  072e  26c45f19         les bx, ptr es:[bx + 0x19]               
  0732  8bc1             mov ax, cx                               
  0734  6bc006           imul ax, ax, 6                           
  0737  03d8             add bx, ax                               
  0739  26397f02         cmp word ptr es:[bx + 2], di             
  073d  751c             jne 0x75b                                
  073f  c45efc           les bx, ptr [bp - 4]                     
  0742  26c45f19         les bx, ptr es:[bx + 0x19]               
  0746  8bc1             mov ax, cx                               
  0748  6bc006           imul ax, ax, 6                           
  074b  03d8             add bx, ax                               
  074d  268b4704         mov ax, word ptr es:[bx + 4]             
  0751  3b460c           cmp ax, word ptr [bp + 0xc]              
  0754  7505             jne 0x75b                                
  0756  c746f40100       mov word ptr [bp - 0xc], 1               
  075b  41               inc cx                                   
  075c  837ef400         cmp word ptr [bp - 0xc], 0               
  0760  7504             jne 0x766                                
  0762  3bca             cmp cx, dx                               
  0764  7cb2             jl 0x718                                 
  0766  837ef400         cmp word ptr [bp - 0xc], 0               
  076a  7415             je 0x781                                 
  076c  b8f32e           mov ax, 0x2ef3                           
  076f  668b56f8         mov edx, dword ptr [bp - 8]              
  0773  8ec0             mov es, ax                               
  0775  662689160000     mov dword ptr es:[0], edx                
  077b  49               dec cx                                   
  077c  8bc1             mov ax, cx                               
  077e  e9a000           jmp 0x821                                
  0781  8bc2             mov ax, dx                               
  0783  48               dec ax                                   
  0784  8946f6           mov word ptr [bp - 0xa], ax              
  0787  c45efc           les bx, ptr [bp - 4]                     
  078a  66268b4719       mov eax, dword ptr es:[bx + 0x19]        
  078f  668946f0         mov dword ptr [bp - 0x10], eax           
  0793  268b471b         mov ax, word ptr es:[bx + 0x1b]          
  0797  268b5719         mov dx, word ptr es:[bx + 0x19]          
  079b  8b5ef6           mov bx, word ptr [bp - 0xa]              
  079e  6bdb06           imul bx, bx, 6                           
  07a1  03d3             add dx, bx                               
  07a3  8946ee           mov word ptr [bp - 0x12], ax             
  07a6  8956ec           mov word ptr [bp - 0x14], dx             
  07a9  c45eec           les bx, ptr [bp - 0x14]                  
  07ac  263937           cmp word ptr es:[bx], si                 
  07af  7416             je 0x7c7                                 
  07b1  268937           mov word ptr es:[bx], si                 
  07b4  56               push si                                  
  07b5  c45ef0           les bx, ptr [bp - 0x10]                  
  07b8  26ff37           push word ptr es:[bx]                    
  07bb  66ff76fc         push dword ptr [bp - 4]                  
  07bf  90               nop                                      
  07c0  0e               push cs                                  
  07c1  e87500           call 0x839                               
  07c4  83c408           add sp, 8                                
  07c7  c45eec           les bx, ptr [bp - 0x14]                  
  07ca  26397f02         cmp word ptr es:[bx + 2], di             
  07ce  7418             je 0x7e8                                 
  07d0  26897f02         mov word ptr es:[bx + 2], di             
  07d4  57               push di                                  
  07d5  c45ef0           les bx, ptr [bp - 0x10]                  
  07d8  26ff7702         push word ptr es:[bx + 2]                
  07dc  66ff76fc         push dword ptr [bp - 4]                  
  07e0  90               nop                                      
  07e1  0e               push cs                                  
  07e2  e85400           call 0x839                               
  07e5  83c408           add sp, 8                                
  07e8  c45eec           les bx, ptr [bp - 0x14]                  
  07eb  268b4704         mov ax, word ptr es:[bx + 4]             
  07ef  3b460c           cmp ax, word ptr [bp + 0xc]              
  07f2  741b             je 0x80f                                 
  07f4  8b460c           mov ax, word ptr [bp + 0xc]              
  07f7  26894704         mov word ptr es:[bx + 4], ax             
  07fb  50               push ax                                  
  07fc  c45ef0           les bx, ptr [bp - 0x10]                  
  07ff  26ff7704         push word ptr es:[bx + 4]                
  0803  66ff76fc         push dword ptr [bp - 4]                  
  0807  90               nop                                      
  0808  0e               push cs                                  
  0809  e82d00           call 0x839                               
  080c  83c408           add sp, 8                                
  080f  b8f32e           mov ax, 0x2ef3                           
  0812  668b56f8         mov edx, dword ptr [bp - 8]              
  0816  8ec0             mov es, ax                               
  0818  662689160000     mov dword ptr es:[0], edx                
  081e  8b46f6           mov ax, word ptr [bp - 0xa]              
  0821  6bc02a           imul ax, ax, 0x2a                        
  0824  8b56f8           mov dx, word ptr [bp - 8]                
  0827  03d0             add dx, ax                               
  0829  ff76fa           push word ptr [bp - 6]                   
  082c  52               push dx                                  
  082d  9af001b014       lcall 0x14b0, 0x1f0                      -> 14b0:01f0
  0832  83c404           add sp, 4                                
  0835  5f               pop di                                   
  0836  5e               pop si                                   
  0837  c9               leave                                    
  0838  cb               retf                                     

ovl50_0839:  ; ENTRY
  0839  55               push bp                                  
  083a  8bec             mov bp, sp                               
  083c  83ec3a           sub sp, 0x3a                             
  083f  56               push si                                  
  0840  57               push di                                  
  0841  8b4e0a           mov cx, word ptr [bp + 0xa]              
  0844  8b760c           mov si, word ptr [bp + 0xc]              
  0847  c45e06           les bx, ptr [bp + 6]                     
  084a  66268b4704       mov eax, dword ptr es:[bx + 4]           
  084f  668946fc         mov dword ptr [bp - 4], eax              
  0853  c746f20000       mov word ptr [bp - 0xe], 0               
  0858  268b470d         mov ax, word ptr es:[bx + 0xd]           
  085c  8946f0           mov word ptr [bp - 0x10], ax             
  085f  268b470f         mov ax, word ptr es:[bx + 0xf]           
  0863  48               dec ax                                   
  0864  26f76f0d         imul word ptr es:[bx + 0xd]              
  0868  8946ee           mov word ptr [bp - 0x12], ax             
  086b  8bc1             mov ax, cx                               
  086d  250100           and ax, 1                                
  0870  8946ec           mov word ptr [bp - 0x14], ax             
  0873  8bc1             mov ax, cx                               
  0875  250200           and ax, 2                                
  0878  8946ea           mov word ptr [bp - 0x16], ax             
  087b  8bc1             mov ax, cx                               
  087d  250400           and ax, 4                                
  0880  8946e8           mov word ptr [bp - 0x18], ax             
  0883  8bc1             mov ax, cx                               
  0885  250800           and ax, 8                                
  0888  8946e6           mov word ptr [bp - 0x1a], ax             
  088b  f7c60100         test si, 1                               
  088f  7405             je 0x896                                 
  0891  b8ffff           mov ax, 0xffff                           
  0894  eb02             jmp 0x898                                
  0896  33c0             xor ax, ax                               
  0898  8946f4           mov word ptr [bp - 0xc], ax              
  089b  f7c60200         test si, 2                               
  089f  7405             je 0x8a6                                 
  08a1  b8ffff           mov ax, 0xffff                           
  08a4  eb02             jmp 0x8a8                                
  08a6  33c0             xor ax, ax                               
  08a8  8946f6           mov word ptr [bp - 0xa], ax              
  08ab  f7c60400         test si, 4                               
  08af  7405             je 0x8b6                                 
  08b1  b8ffff           mov ax, 0xffff                           
  08b4  eb02             jmp 0x8b8                                
  08b6  33c0             xor ax, ax                               
  08b8  8946f8           mov word ptr [bp - 8], ax                
  08bb  f7c60800         test si, 8                               
  08bf  7405             je 0x8c6                                 
  08c1  b8ffff           mov ax, 0xffff                           
  08c4  eb02             jmp 0x8c8                                
  08c6  33c0             xor ax, ax                               
  08c8  8946fa           mov word ptr [bp - 6], ax                
  08cb  c45efc           les bx, ptr [bp - 4]                     
  08ce  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  08d4  7443             je 0x919                                 
  08d6  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  08dc  753b             jne 0x919                                
  08de  33ff             xor di, di                               
  08e0  eb2a             jmp 0x90c                                
  08e2  8bc7             mov ax, di                               
  08e4  c1e002           shl ax, 2                                
  08e7  c45efc           les bx, ptr [bp - 4]                     
  08ea  03d8             add bx, ax                               
  08ec  6626ff770a       push dword ptr es:[bx + 0xa]             
  08f1  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  08f6  83c404           add sp, 4                                
  08f9  8bdf             mov bx, di                               
  08fb  c1e302           shl bx, 2                                
  08fe  c476fc           les si, ptr [bp - 4]                     
  0901  03f3             add si, bx                               
  0903  2689541c         mov word ptr es:[si + 0x1c], dx          
  0907  2689441a         mov word ptr es:[si + 0x1a], ax          
  090b  47               inc di                                   
  090c  c45efc           les bx, ptr [bp - 4]                     
  090f  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0913  b400             mov ah, 0                                
  0915  3bc7             cmp ax, di                               
  0917  7fc9             jg 0x8e2                                 
  0919  33c9             xor cx, cx                               
  091b  eb36             jmp 0x953                                
  091d  8bc1             mov ax, cx                               
  091f  c1e002           shl ax, 2                                
  0922  c45efc           les bx, ptr [bp - 4]                     
  0925  03d8             add bx, ax                               
  0927  268b471c         mov ax, word ptr es:[bx + 0x1c]          
  092b  268b571a         mov dx, word ptr es:[bx + 0x1a]          
  092f  8b5efc           mov bx, word ptr [bp - 4]                
  0932  50               push ax                                  
  0933  268b4708         mov ax, word ptr es:[bx + 8]             
  0937  52               push dx                                  
  0938  f76ef2           imul word ptr [bp - 0xe]                 
  093b  d1e0             shl ax, 1                                
  093d  5a               pop dx                                   
  093e  03d0             add dx, ax                               
  0940  8bd9             mov bx, cx                               
  0942  c1e302           shl bx, 2                                
  0945  8d46d6           lea ax, [bp - 0x2a]                      
  0948  03d8             add bx, ax                               
  094a  58               pop ax                                   
  094b  36894702         mov word ptr ss:[bx + 2], ax             
  094f  368917           mov word ptr ss:[bx], dx                 
  0952  41               inc cx                                   
  0953  c45efc           les bx, ptr [bp - 4]                     
  0956  268a4734         mov al, byte ptr es:[bx + 0x34]          
  095a  b400             mov ah, 0                                
  095c  3bc1             cmp ax, cx                               
  095e  7fbd             jg 0x91d                                 
  0960  33c9             xor cx, cx                               
  0962  eb36             jmp 0x99a                                
  0964  8bc1             mov ax, cx                               
  0966  c1e002           shl ax, 2                                
  0969  c45efc           les bx, ptr [bp - 4]                     
  096c  03d8             add bx, ax                               
  096e  268b471c         mov ax, word ptr es:[bx + 0x1c]          
  0972  268b571a         mov dx, word ptr es:[bx + 0x1a]          
  0976  8b5efc           mov bx, word ptr [bp - 4]                
  0979  50               push ax                                  
  097a  268b4708         mov ax, word ptr es:[bx + 8]             
  097e  52               push dx                                  
  097f  f76eee           imul word ptr [bp - 0x12]                
  0982  d1e0             shl ax, 1                                
  0984  5a               pop dx                                   
  0985  03d0             add dx, ax                               
  0987  8bd9             mov bx, cx                               
  0989  c1e302           shl bx, 2                                
  098c  8d46c6           lea ax, [bp - 0x3a]                      
  098f  03d8             add bx, ax                               
  0991  58               pop ax                                   
  0992  36894702         mov word ptr ss:[bx + 2], ax             
  0996  368917           mov word ptr ss:[bx], dx                 
  0999  41               inc cx                                   
  099a  c45efc           les bx, ptr [bp - 4]                     
  099d  268a4734         mov al, byte ptr es:[bx + 0x34]          
  09a1  b400             mov ah, 0                                
  09a3  3bc1             cmp ax, cx                               
  09a5  7fbd             jg 0x964                                 
  09a7  8b46f0           mov ax, word ptr [bp - 0x10]             
  09aa  2b46f2           sub ax, word ptr [bp - 0xe]              
  09ad  26f76f08         imul word ptr es:[bx + 8]                
  09b1  8bf8             mov di, ax                               
  09b3  e91c01           jmp 0xad2                                
  09b6  837eec00         cmp word ptr [bp - 0x14], 0              
  09ba  7404             je 0x9c0                                 
  09bc  33c0             xor ax, ax                               
  09be  eb06             jmp 0x9c6                                
  09c0  c45ed6           les bx, ptr [bp - 0x2a]                  
  09c3  268b07           mov ax, word ptr es:[bx]                 
  09c6  50               push ax                                  
  09c7  837eea00         cmp word ptr [bp - 0x16], 0              
  09cb  7404             je 0x9d1                                 
  09cd  33c0             xor ax, ax                               
  09cf  eb06             jmp 0x9d7                                
  09d1  c45eda           les bx, ptr [bp - 0x26]                  
  09d4  268b07           mov ax, word ptr es:[bx]                 
  09d7  59               pop cx                                   
  09d8  0bc8             or cx, ax                                
  09da  51               push cx                                  
  09db  837ee800         cmp word ptr [bp - 0x18], 0              
  09df  7404             je 0x9e5                                 
  09e1  33c0             xor ax, ax                               
  09e3  eb06             jmp 0x9eb                                
  09e5  c45ede           les bx, ptr [bp - 0x22]                  
  09e8  268b07           mov ax, word ptr es:[bx]                 
  09eb  59               pop cx                                   
  09ec  0bc8             or cx, ax                                
  09ee  51               push cx                                  
  09ef  837ee600         cmp word ptr [bp - 0x1a], 0              
  09f3  7404             je 0x9f9                                 
  09f5  33c0             xor ax, ax                               
  09f7  eb06             jmp 0x9ff                                
  09f9  c45ee2           les bx, ptr [bp - 0x1e]                  
  09fc  268b07           mov ax, word ptr es:[bx]                 
  09ff  59               pop cx                                   
  0a00  0bc8             or cx, ax                                
  0a02  83f1ff           xor cx, 0xffff                           
  0a05  51               push cx                                  
  0a06  837eec00         cmp word ptr [bp - 0x14], 0              
  0a0a  7408             je 0xa14                                 
  0a0c  c45ed6           les bx, ptr [bp - 0x2a]                  
  0a0f  268b07           mov ax, word ptr es:[bx]                 
  0a12  eb03             jmp 0xa17                                
  0a14  b8ffff           mov ax, 0xffff                           
  0a17  59               pop cx                                   
  0a18  23c8             and cx, ax                               
  0a1a  51               push cx                                  
  0a1b  837eea00         cmp word ptr [bp - 0x16], 0              
  0a1f  7408             je 0xa29                                 
  0a21  c45eda           les bx, ptr [bp - 0x26]                  
  0a24  268b07           mov ax, word ptr es:[bx]                 
  0a27  eb03             jmp 0xa2c                                
  0a29  b8ffff           mov ax, 0xffff                           
  0a2c  59               pop cx                                   
  0a2d  23c8             and cx, ax                               
  0a2f  51               push cx                                  
  0a30  837ee800         cmp word ptr [bp - 0x18], 0              
  0a34  7408             je 0xa3e                                 
  0a36  c45ede           les bx, ptr [bp - 0x22]                  
  0a39  268b07           mov ax, word ptr es:[bx]                 
  0a3c  eb03             jmp 0xa41                                
  0a3e  b8ffff           mov ax, 0xffff                           
  0a41  59               pop cx                                   
  0a42  23c8             and cx, ax                               
  0a44  51               push cx                                  
  0a45  837ee600         cmp word ptr [bp - 0x1a], 0              
  0a49  7408             je 0xa53                                 
  0a4b  c45ee2           les bx, ptr [bp - 0x1e]                  
  0a4e  268b07           mov ax, word ptr es:[bx]                 
  0a51  eb03             jmp 0xa56                                
  0a53  b8ffff           mov ax, 0xffff                           
  0a56  59               pop cx                                   
  0a57  23c8             and cx, ax                               
  0a59  8bf1             mov si, cx                               
  0a5b  83f6ff           xor si, 0xffff                           
  0a5e  8b46f4           mov ax, word ptr [bp - 0xc]              
  0a61  23c1             and ax, cx                               
  0a63  c45ec6           les bx, ptr [bp - 0x3a]                  
  0a66  268b17           mov dx, word ptr es:[bx]                 
  0a69  23d6             and dx, si                               
  0a6b  0bc2             or ax, dx                                
  0a6d  8b5ec6           mov bx, word ptr [bp - 0x3a]             
  0a70  8346c602         add word ptr [bp - 0x3a], 2              
  0a74  268907           mov word ptr es:[bx], ax                 
  0a77  8b46f6           mov ax, word ptr [bp - 0xa]              
  0a7a  23c1             and ax, cx                               
  0a7c  c45eca           les bx, ptr [bp - 0x36]                  
  0a7f  268b17           mov dx, word ptr es:[bx]                 
  0a82  23d6             and dx, si                               
  0a84  0bc2             or ax, dx                                
  0a86  8b5eca           mov bx, word ptr [bp - 0x36]             
  0a89  8346ca02         add word ptr [bp - 0x36], 2              
  0a8d  268907           mov word ptr es:[bx], ax                 
  0a90  8b46f8           mov ax, word ptr [bp - 8]                
  0a93  23c1             and ax, cx                               
  0a95  c45ece           les bx, ptr [bp - 0x32]                  
  0a98  268b17           mov dx, word ptr es:[bx]                 
  0a9b  23d6             and dx, si                               
  0a9d  0bc2             or ax, dx                                
  0a9f  8b5ece           mov bx, word ptr [bp - 0x32]             
  0aa2  8346ce02         add word ptr [bp - 0x32], 2              
  0aa6  268907           mov word ptr es:[bx], ax                 
  0aa9  8b46fa           mov ax, word ptr [bp - 6]                
  0aac  23c1             and ax, cx                               
  0aae  c45ed2           les bx, ptr [bp - 0x2e]                  
  0ab1  268b17           mov dx, word ptr es:[bx]                 
  0ab4  23d6             and dx, si                               
  0ab6  0bc2             or ax, dx                                
  0ab8  8b5ed2           mov bx, word ptr [bp - 0x2e]             
  0abb  8346d202         add word ptr [bp - 0x2e], 2              
  0abf  268907           mov word ptr es:[bx], ax                 
  0ac2  8346d602         add word ptr [bp - 0x2a], 2              
  0ac6  8346da02         add word ptr [bp - 0x26], 2              
  0aca  8346de02         add word ptr [bp - 0x22], 2              
  0ace  8346e202         add word ptr [bp - 0x1e], 2              
  0ad2  8bc7             mov ax, di                               
  0ad4  4f               dec di                                   
  0ad5  0bc0             or ax, ax                                
  0ad7  7403             je 0xadc                                 
  0ad9  e9dafe           jmp 0x9b6                                
  0adc  c45efc           les bx, ptr [bp - 4]                     
  0adf  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0ae5  7431             je 0xb18                                 
  0ae7  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0aed  7529             jne 0xb18                                
  0aef  33f6             xor si, si                               
  0af1  eb18             jmp 0xb0b                                
  0af3  8bc6             mov ax, si                               
  0af5  c1e002           shl ax, 2                                
  0af8  c45efc           les bx, ptr [bp - 4]                     
  0afb  03d8             add bx, ax                               
  0afd  6626ff770a       push dword ptr es:[bx + 0xa]             
  0b02  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0b07  83c404           add sp, 4                                
  0b0a  46               inc si                                   
  0b0b  c45efc           les bx, ptr [bp - 4]                     
  0b0e  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0b12  b400             mov ah, 0                                
  0b14  3bc6             cmp ax, si                               
  0b16  7fdb             jg 0xaf3                                 
  0b18  5f               pop di                                   
  0b19  5e               pop si                                   
  0b1a  c9               leave                                    
  0b1b  cb               retf                                     

ovl50_0b1c:  ; ENTRY
  0b1c  55               push bp                                  
  0b1d  8bec             mov bp, sp                               
  0b1f  8b4606           mov ax, word ptr [bp + 6]                
  0b22  0bc0             or ax, ax                                
  0b24  740c             je 0xb32                                 
  0b26  3d0100           cmp ax, 1                                
  0b29  740e             je 0xb39                                 
  0b2b  3d0200           cmp ax, 2                                
  0b2e  740e             je 0xb3e                                 
  0b30  eb11             jmp 0xb43                                
  0b32  a00048           mov al, byte ptr [0x4800]                
  0b35  b400             mov ah, 0                                
  0b37  eb0c             jmp 0xb45                                
  0b39  a0df47           mov al, byte ptr [0x47df]                
  0b3c  ebf7             jmp 0xb35                                
  0b3e  a0be47           mov al, byte ptr [0x47be]                
  0b41  ebf2             jmp 0xb35                                
  0b43  33c0             xor ax, ax                               
  0b45  5d               pop bp                                   
  0b46  cb               retf                                     

ovl50_0b47:  ; ENTRY
  0b47  55               push bp                                  
  0b48  8bec             mov bp, sp                               
  0b4a  8b4606           mov ax, word ptr [bp + 6]                
  0b4d  0bc0             or ax, ax                                
  0b4f  740c             je 0xb5d                                 
  0b51  3d0100           cmp ax, 1                                
  0b54  740e             je 0xb64                                 
  0b56  3d0200           cmp ax, 2                                
  0b59  740e             je 0xb69                                 
  0b5b  eb11             jmp 0xb6e                                
  0b5d  a00148           mov al, byte ptr [0x4801]                
  0b60  b400             mov ah, 0                                
  0b62  eb0c             jmp 0xb70                                
  0b64  a0e047           mov al, byte ptr [0x47e0]                
  0b67  ebf7             jmp 0xb60                                
  0b69  a0bf47           mov al, byte ptr [0x47bf]                
  0b6c  ebf2             jmp 0xb60                                
  0b6e  33c0             xor ax, ax                               
  0b70  5d               pop bp                                   
  0b71  cb               retf                                     

ovl50_0b72:  ; ENTRY
  0b72  55               push bp                                  
  0b73  8bec             mov bp, sp                               
  0b75  8b4606           mov ax, word ptr [bp + 6]                
  0b78  0bc0             or ax, ax                                
  0b7a  740c             je 0xb88                                 
  0b7c  3d0100           cmp ax, 1                                
  0b7f  740e             je 0xb8f                                 
  0b81  3d0200           cmp ax, 2                                
  0b84  740e             je 0xb94                                 
  0b86  eb11             jmp 0xb99                                
  0b88  a00248           mov al, byte ptr [0x4802]                
  0b8b  b400             mov ah, 0                                
  0b8d  eb0c             jmp 0xb9b                                
  0b8f  a0e147           mov al, byte ptr [0x47e1]                
  0b92  ebf7             jmp 0xb8b                                
  0b94  a0c047           mov al, byte ptr [0x47c0]                
  0b97  ebf2             jmp 0xb8b                                
  0b99  33c0             xor ax, ax                               
  0b9b  5d               pop bp                                   
  0b9c  cb               retf                                     

ovl50_0b9d:  ; ENTRY
  0b9d  55               push bp                                  
  0b9e  8bec             mov bp, sp                               
  0ba0  83ec02           sub sp, 2                                
  0ba3  56               push si                                  
  0ba4  57               push di                                  
  0ba5  8b7606           mov si, word ptr [bp + 6]                
  0ba8  bf0100           mov di, 1                                
  0bab  57               push di                                  
  0bac  16               push ss                                  
  0bad  8d46ff           lea ax, [bp - 1]                         
  0bb0  50               push ax                                  
  0bb1  56               push si                                  
  0bb2  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0bb7  83c408           add sp, 8                                
  0bba  57               push di                                  
  0bbb  16               push ss                                  
  0bbc  8d46fe           lea ax, [bp - 2]                         
  0bbf  50               push ax                                  
  0bc0  56               push si                                  
  0bc1  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0bc6  83c408           add sp, 8                                
  0bc9  8b46fe           mov ax, word ptr [bp - 2]                
  0bcc  5f               pop di                                   
  0bcd  5e               pop si                                   
  0bce  c9               leave                                    
  0bcf  cb               retf                                     

ovl50_0bd0:  ; ENTRY
  0bd0  55               push bp                                  
  0bd1  8bec             mov bp, sp                               
  0bd3  83ec04           sub sp, 4                                
  0bd6  56               push si                                  
  0bd7  57               push di                                  
  0bd8  8b7606           mov si, word ptr [bp + 6]                
  0bdb  bf0100           mov di, 1                                
  0bde  57               push di                                  
  0bdf  16               push ss                                  
  0be0  8d46ff           lea ax, [bp - 1]                         
  0be3  50               push ax                                  
  0be4  56               push si                                  
  0be5  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0bea  83c408           add sp, 8                                
  0bed  57               push di                                  
  0bee  16               push ss                                  
  0bef  8d46fe           lea ax, [bp - 2]                         
  0bf2  50               push ax                                  
  0bf3  56               push si                                  
  0bf4  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0bf9  83c408           add sp, 8                                
  0bfc  57               push di                                  
  0bfd  16               push ss                                  
  0bfe  8d46fd           lea ax, [bp - 3]                         
  0c01  50               push ax                                  
  0c02  56               push si                                  
  0c03  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0c08  83c408           add sp, 8                                
  0c0b  57               push di                                  
  0c0c  16               push ss                                  
  0c0d  8d46fc           lea ax, [bp - 4]                         
  0c10  50               push ax                                  
  0c11  56               push si                                  
  0c12  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0c17  83c408           add sp, 8                                
  0c1a  668b46fc         mov eax, dword ptr [bp - 4]              
  0c1e  660fa4c210       shld edx, eax, 0x10                      
  0c23  5f               pop di                                   
  0c24  5e               pop si                                   
  0c25  c9               leave                                    
  0c26  cb               retf                                     
