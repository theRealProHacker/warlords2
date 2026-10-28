; ovl00 stub 2f54 file_off 0x3a4e0 size 0x1262

ovl00_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  b8042c           mov ax, 0x2c04                           
  0006  8ec0             mov es, ax                               
  0008  26833e1c0100     cmp word ptr es:[0x11c], 0               
  000e  7427             je 0x37                                  
  0010  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0015  90               nop                                      
  0016  0e               push cs                                  
  0017  e81f00           call 0x39                                
  001a  c7066a160100     mov word ptr [0x166a], 1                 
  0020  6a15             push 0x15                                
  0022  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0027  59               pop cx                                   
  0028  90               nop                                      
  0029  0e               push cs                                  
  002a  e8bf02           call 0x2ec                               
  002d  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  0032  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0037  5d               pop bp                                   
  0038  cb               retf                                     

ovl00_0039:  ; ENTRY
  0039  55               push bp                                  
  003a  8bec             mov bp, sp                               
  003c  83ec2e           sub sp, 0x2e                             
  003f  56               push si                                  
  0040  57               push di                                  
  0041  833e6a1600       cmp word ptr [0x166a], 0                 
  0046  7508             jne 0x50                                 
  0048  6a0b             push 0xb                                 
  004a  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  004f  59               pop cx                                   
  0050  666800000300     push 0x30000                             
  0056  666801000f00     push 0xf0001                             
  005c  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0061  83c408           add sp, 8                                
  0064  666a6b           push 0x6b                                
  0067  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  006c  83c404           add sp, 4                                
  006f  52               push dx                                  
  0070  50               push ax                                  
  0071  666840014000     push 0x400140                            
  0077  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  007c  83c408           add sp, 8                                
  007f  6a01             push 1                                   
  0081  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0086  59               pop cx                                   
  0087  66688b00e800     push 0xe8008b                            
  008d  6a58             push 0x58                                
  008f  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  0094  83c406           add sp, 6                                
  0097  33f6             xor si, si                               
  0099  eb18             jmp 0xb3                                 
  009b  66686e000501     push 0x105006e                           
  00a1  8bc6             mov ax, si                               
  00a3  c1e005           shl ax, 5                                
  00a6  057800           add ax, 0x78                             
  00a9  50               push ax                                  
  00aa  9a44033311       lcall 0x1133, 0x344                      -> 1133:0344
  00af  83c406           add sp, 6                                
  00b2  46               inc si                                   
  00b3  83fe09           cmp si, 9                                
  00b6  7ce3             jl 0x9b                                  
  00b8  66686e000001     push 0x100006e                           
  00be  6a78             push 0x78                                
  00c0  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  00c5  83c406           add sp, 6                                
  00c8  33f6             xor si, si                               
  00ca  eb17             jmp 0xe3                                 
  00cc  682001           push 0x120                               
  00cf  8bc6             mov ax, si                               
  00d1  6bc01d           imul ax, ax, 0x1d                        
  00d4  058b00           add ax, 0x8b                             
  00d7  50               push ax                                  
  00d8  6a58             push 0x58                                
  00da  9afe023311       lcall 0x1133, 0x2fe                      -> 1133:02fe
  00df  83c406           add sp, 6                                
  00e2  46               inc si                                   
  00e3  83fe09           cmp si, 9                                
  00e6  7ce4             jl 0xcc                                  
  00e8  33f6             xor si, si                               
  00ea  eb46             jmp 0x132                                
  00ec  8bde             mov bx, si                               
  00ee  d1e3             shl bx, 1                                
  00f0  b8042c           mov ax, 0x2c04                           
  00f3  8ec0             mov es, ax                               
  00f5  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  00fb  7434             je 0x131                                 
  00fd  6a75             push 0x75                                
  00ff  8bc6             mov ax, si                               
  0101  c1e005           shl ax, 5                                
  0104  058000           add ax, 0x80                             
  0107  50               push ax                                  
  0108  1e               push ds                                  
  0109  682a34           push 0x342a                              
  010c  6a03             push 3                                   
  010e  56               push si                                  
  010f  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0114  83c40c           add sp, 0xc                              
  0117  8bc6             mov ax, si                               
  0119  6bc01d           imul ax, ax, 0x1d                        
  011c  059200           add ax, 0x92                             
  011f  50               push ax                                  
  0120  6a60             push 0x60                                
  0122  1e               push ds                                  
  0123  682a34           push 0x342a                              
  0126  6a03             push 3                                   
  0128  56               push si                                  
  0129  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  012e  83c40c           add sp, 0xc                              
  0131  46               inc si                                   
  0132  83fe08           cmp si, 8                                
  0135  7cb5             jl 0xec                                  
  0137  33f6             xor si, si                               
  0139  e9d700           jmp 0x213                                
  013c  33ff             xor di, di                               
  013e  e9c900           jmp 0x20a                                
  0141  3bf7             cmp si, di                               
  0143  7425             je 0x16a                                 
  0145  8bde             mov bx, si                               
  0147  d1e3             shl bx, 1                                
  0149  b8042c           mov ax, 0x2c04                           
  014c  8ec0             mov es, ax                               
  014e  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0154  7503             jne 0x159                                
  0156  e9b000           jmp 0x209                                
  0159  8bdf             mov bx, di                               
  015b  d1e3             shl bx, 1                                
  015d  8ec0             mov es, ax                               
  015f  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0165  7503             jne 0x16a                                
  0167  e99f00           jmp 0x209                                
  016a  3bf7             cmp si, di                               
  016c  750d             jne 0x17b                                
  016e  666820001d00     push 0x1d0020                            
  0174  6a1d             push 0x1d                                
  0176  688001           push 0x180                               
  0179  eb47             jmp 0x1c2                                
  017b  8bde             mov bx, si                               
  017d  c1e303           shl bx, 3                                
  0180  03df             add bx, di                               
  0182  b8042c           mov ax, 0x2c04                           
  0185  8ec0             mov es, ax                               
  0187  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  018c  250300           and ax, 3                                
  018f  3d0200           cmp ax, 2                                
  0192  750a             jne 0x19e                                
  0194  666820001d00     push 0x1d0020                            
  019a  6a00             push 0                                   
  019c  ebd8             jmp 0x176                                
  019e  8bde             mov bx, si                               
  01a0  c1e303           shl bx, 3                                
  01a3  03df             add bx, di                               
  01a5  b8042c           mov ax, 0x2c04                           
  01a8  8ec0             mov es, ax                               
  01aa  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  01af  250300           and ax, 3                                
  01b2  0bc0             or ax, ax                                
  01b4  7553             jne 0x209                                
  01b6  666820001d00     push 0x1d0020                            
  01bc  666840010000     push 0x140                               
  01c2  16               push ss                                  
  01c3  8d46f8           lea ax, [bp - 8]                         
  01c6  50               push ax                                  
  01c7  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  01cc  83c40c           add sp, 0xc                              
  01cf  8bc7             mov ax, di                               
  01d1  6bc01d           imul ax, ax, 0x1d                        
  01d4  058b00           add ax, 0x8b                             
  01d7  50               push ax                                  
  01d8  8bc6             mov ax, si                               
  01da  c1e005           shl ax, 5                                
  01dd  057800           add ax, 0x78                             
  01e0  50               push ax                                  
  01e1  16               push ss                                  
  01e2  8d46f4           lea ax, [bp - 0xc]                       
  01e5  50               push ax                                  
  01e6  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  01eb  83c408           add sp, 8                                
  01ee  66ff76f4         push dword ptr [bp - 0xc]                
  01f2  8d46f8           lea ax, [bp - 8]                         
  01f5  8cd2             mov dx, ss                               
  01f7  b90800           mov cx, 8                                
  01fa  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  01ff  6a2f             push 0x2f                                
  0201  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0206  83c40e           add sp, 0xe                              
  0209  47               inc di                                   
  020a  83ff08           cmp di, 8                                
  020d  7d03             jge 0x212                                
  020f  e92fff           jmp 0x141                                
  0212  46               inc si                                   
  0213  83fe08           cmp si, 8                                
  0216  7d03             jge 0x21b                                
  0218  e921ff           jmp 0x13c                                
  021b  6a00             push 0                                   
  021d  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0222  59               pop cx                                   
  0223  6668a0000601     push 0x10600a0                           
  0229  666888016e00     push 0x6e0188                            
  022f  16               push ss                                  
  0230  8d46f8           lea ax, [bp - 8]                         
  0233  50               push ax                                  
  0234  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0239  83c40c           add sp, 0xc                              
  023c  52               push dx                                  
  023d  50               push ax                                  
  023e  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0243  83c404           add sp, 4                                
  0246  666800000300     push 0x30000                             
  024c  666802000f00     push 0xf0002                             
  0252  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0257  83c408           add sp, 8                                
  025a  666a6d           push 0x6d                                
  025d  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0262  83c404           add sp, 4                                
  0265  52               push dx                                  
  0266  50               push ax                                  
  0267  6668d8017400     push 0x7401d8                            
  026d  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0272  83c408           add sp, 8                                
  0275  16               push ss                                  
  0276  8d46d2           lea ax, [bp - 0x2e]                      
  0279  50               push ax                                  
  027a  16               push ss                                  
  027b  8d46e2           lea ax, [bp - 0x1e]                      
  027e  50               push ax                                  
  027f  16               push ss                                  
  0280  8d46f2           lea ax, [bp - 0xe]                       
  0283  50               push ax                                  
  0284  90               nop                                      
  0285  0e               push cs                                  
  0286  e86408           call 0xaed                               
  0289  83c40c           add sp, 0xc                              
  028c  33f6             xor si, si                               
  028e  eb53             jmp 0x2e3                                
  0290  8bc6             mov ax, si                               
  0292  6bc01d           imul ax, ax, 0x1d                        
  0295  059200           add ax, 0x92                             
  0298  50               push ax                                  
  0299  689001           push 0x190                               
  029c  1e               push ds                                  
  029d  682a34           push 0x342a                              
  02a0  6a03             push 3                                   
  02a2  8bde             mov bx, si                               
  02a4  d1e3             shl bx, 1                                
  02a6  8d46e2           lea ax, [bp - 0x1e]                      
  02a9  03d8             add bx, ax                               
  02ab  36ff37           push word ptr ss:[bx]                    
  02ae  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  02b3  83c40c           add sp, 0xc                              
  02b6  8bde             mov bx, si                               
  02b8  d1e3             shl bx, 1                                
  02ba  8d46d2           lea ax, [bp - 0x2e]                      
  02bd  03d8             add bx, ax                               
  02bf  36ff37           push word ptr ss:[bx]                    
  02c2  6a6a             push 0x6a                                
  02c4  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  02c9  83c404           add sp, 4                                
  02cc  52               push dx                                  
  02cd  50               push ax                                  
  02ce  8bc6             mov ax, si                               
  02d0  6bc01d           imul ax, ax, 0x1d                        
  02d3  059200           add ax, 0x92                             
  02d6  50               push ax                                  
  02d7  68b001           push 0x1b0                               
  02da  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  02df  83c408           add sp, 8                                
  02e2  46               inc si                                   
  02e3  3b76f2           cmp si, word ptr [bp - 0xe]              
  02e6  7ca8             jl 0x290                                 
  02e8  5f               pop di                                   
  02e9  5e               pop si                                   
  02ea  c9               leave                                    
  02eb  cb               retf                                     

ovl00_02ec:  ; ENTRY
  02ec  55               push bp                                  
  02ed  8bec             mov bp, sp                               
  02ef  666870010100     push 0x10170                             
  02f5  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  02fa  83c404           add sp, 4                                
  02fd  666871010100     push 0x10171                             
  0303  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0308  83c404           add sp, 4                                
  030b  5d               pop bp                                   
  030c  cb               retf                                     

ovl00_030d:  ; ENTRY
  030d  55               push bp                                  
  030e  8bec             mov bp, sp                               
  0310  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0315  666a00           push 0                                   
  0318  6a00             push 0                                   
  031a  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  031f  83c406           add sp, 6                                
  0322  5d               pop bp                                   
  0323  cb               retf                                     

ovl00_0324:  ; ENTRY
  0324  55               push bp                                  
  0325  8bec             mov bp, sp                               
  0327  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  032c  666a00           push 0                                   
  032f  666a00           push 0                                   
  0332  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  0337  83c408           add sp, 8                                
  033a  90               nop                                      
  033b  0e               push cs                                  
  033c  e80700           call 0x346                               
  033f  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0344  5d               pop bp                                   
  0345  cb               retf                                     

ovl00_0346:  ; ENTRY
  0346  55               push bp                                  
  0347  8bec             mov bp, sp                               
  0349  b8042c           mov ax, 0x2c04                           
  034c  8ec0             mov es, ax                               
  034e  26833e1c0100     cmp word ptr es:[0x11c], 0               
  0354  742a             je 0x380                                 
  0356  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  035b  6a00             push 0                                   
  035d  90               nop                                      
  035e  0e               push cs                                  
  035f  e82000           call 0x382                               
  0362  59               pop cx                                   
  0363  c7066a160100     mov word ptr [0x166a], 1                 
  0369  6a16             push 0x16                                
  036b  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0370  59               pop cx                                   
  0371  90               nop                                      
  0372  0e               push cs                                  
  0373  e85e06           call 0x9d4                               
  0376  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  037b  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0380  5d               pop bp                                   
  0381  cb               retf                                     

ovl00_0382:  ; ENTRY
  0382  55               push bp                                  
  0383  8bec             mov bp, sp                               
  0385  83ec0c           sub sp, 0xc                              
  0388  56               push si                                  
  0389  57               push di                                  
  038a  833e6a1600       cmp word ptr [0x166a], 0                 
  038f  7508             jne 0x399                                
  0391  6a0b             push 0xb                                 
  0393  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  0398  59               pop cx                                   
  0399  837e0600         cmp word ptr [bp + 6], 0                 
  039d  7403             je 0x3a2                                 
  039f  e95101           jmp 0x4f3                                
  03a2  666800000300     push 0x30000                             
  03a8  666801000f00     push 0xf0001                             
  03ae  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  03b3  83c408           add sp, 8                                
  03b6  666a6c           push 0x6c                                
  03b9  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  03be  83c404           add sp, 4                                
  03c1  52               push dx                                  
  03c2  50               push ax                                  
  03c3  666840014000     push 0x400140                            
  03c9  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  03ce  83c408           add sp, 8                                
  03d1  666860006f00     push 0x6f0060                            
  03d7  1e               push ds                                  
  03d8  682a34           push 0x342a                              
  03db  6a00             push 0                                   
  03dd  b8042c           mov ax, 0x2c04                           
  03e0  8ec0             mov es, ax                               
  03e2  26ff361001       push word ptr es:[0x110]                 
  03e7  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  03ec  83c40c           add sp, 0xc                              
  03ef  666800000300     push 0x30000                             
  03f5  666802000f00     push 0xf0002                             
  03fb  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0400  83c408           add sp, 8                                
  0403  b8042c           mov ax, 0x2c04                           
  0406  8ec0             mov es, ax                               
  0408  26a11001         mov ax, word ptr es:[0x110]              
  040c  6bc014           imul ax, ax, 0x14                        
  040f  050000           add ax, 0                                
  0412  68042c           push 0x2c04                              
  0415  50               push ax                                  
  0416  666890007a00     push 0x7a0090                            
  041c  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0421  83c408           add sp, 8                                
  0424  666a6e           push 0x6e                                
  0427  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  042c  83c404           add sp, 4                                
  042f  52               push dx                                  
  0430  50               push ax                                  
  0431  66686800a500     push 0xa50068                            
  0437  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  043c  83c408           add sp, 8                                
  043f  66686e000100     push 0x1006e                             
  0445  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  044a  83c404           add sp, 4                                
  044d  52               push dx                                  
  044e  50               push ax                                  
  044f  66686800cd00     push 0xcd0068                            
  0455  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  045a  83c408           add sp, 8                                
  045d  66686e000200     push 0x2006e                             
  0463  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0468  83c404           add sp, 4                                
  046b  52               push dx                                  
  046c  50               push ax                                  
  046d  66686800fb00     push 0xfb0068                            
  0473  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0478  83c408           add sp, 8                                
  047b  66686e000300     push 0x3006e                             
  0481  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0486  83c404           add sp, 4                                
  0489  52               push dx                                  
  048a  50               push ax                                  
  048b  666868000f01     push 0x10f0068                           
  0491  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0496  83c408           add sp, 8                                
  0499  66686e000400     push 0x4006e                             
  049f  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  04a4  83c404           add sp, 4                                
  04a7  52               push dx                                  
  04a8  50               push ax                                  
  04a9  666868002301     push 0x1230068                           
  04af  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  04b4  83c408           add sp, 8                                
  04b7  66686e000500     push 0x5006e                             
  04bd  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  04c2  83c404           add sp, 4                                
  04c5  52               push dx                                  
  04c6  50               push ax                                  
  04c7  666868003701     push 0x1370068                           
  04cd  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  04d2  83c408           add sp, 8                                
  04d5  66686e000600     push 0x6006e                             
  04db  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  04e0  83c404           add sp, 4                                
  04e3  52               push dx                                  
  04e4  50               push ax                                  
  04e5  666868004b01     push 0x14b0068                           
  04eb  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  04f0  83c408           add sp, 8                                
  04f3  33f6             xor si, si                               
  04f5  33ff             xor di, di                               
  04f7  e9ce04           jmp 0x9c8                                
  04fa  b8042c           mov ax, 0x2c04                           
  04fd  8ec0             mov es, ax                               
  04ff  2639361001       cmp word ptr es:[0x110], si              
  0504  7503             jne 0x509                                
  0506  e9be04           jmp 0x9c7                                
  0509  6a6f             push 0x6f                                
  050b  8bc7             mov ax, di                               
  050d  6bc028           imul ax, ax, 0x28                        
  0510  051001           add ax, 0x110                            
  0513  50               push ax                                  
  0514  1e               push ds                                  
  0515  682a34           push 0x342a                              
  0518  6a00             push 0                                   
  051a  56               push si                                  
  051b  9a6600f930       lcall 0x30f9, 0x66                       -> ovl64:0bf7
  0520  83c40c           add sp, 0xc                              
  0523  8bde             mov bx, si                               
  0525  d1e3             shl bx, 1                                
  0527  b8042c           mov ax, 0x2c04                           
  052a  8ec0             mov es, ax                               
  052c  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0532  7556             jne 0x58a                                
  0534  6a00             push 0                                   
  0536  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  053b  59               pop cx                                   
  053c  666828002800     push 0x280028                            
  0542  689700           push 0x97                                
  0545  8bc7             mov ax, di                               
  0547  6bc028           imul ax, ax, 0x28                        
  054a  051001           add ax, 0x110                            
  054d  50               push ax                                  
  054e  16               push ss                                  
  054f  8d46f8           lea ax, [bp - 8]                         
  0552  50               push ax                                  
  0553  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0558  83c40c           add sp, 0xc                              
  055b  52               push dx                                  
  055c  50               push ax                                  
  055d  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0562  83c404           add sp, 4                                
  0565  ff46f8           inc word ptr [bp - 8]                    
  0568  ff46fa           inc word ptr [bp - 6]                    
  056b  836efc02         sub word ptr [bp - 4], 2                 
  056f  836efe02         sub word ptr [bp - 2], 2                 
  0573  6a02             push 2                                   
  0575  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  057a  59               pop cx                                   
  057b  16               push ss                                  
  057c  8d46f8           lea ax, [bp - 8]                         
  057f  50               push ax                                  
  0580  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0585  83c404           add sp, 4                                
  0588  eb6e             jmp 0x5f8                                
  058a  666828002800     push 0x280028                            
  0590  6a2d             push 0x2d                                
  0592  8bc6             mov ax, si                               
  0594  c1e003           shl ax, 3                                
  0597  ba042c           mov dx, 0x2c04                           
  059a  8ec2             mov es, dx                               
  059c  2603061001       add ax, word ptr es:[0x110]              
  05a1  ba042c           mov dx, 0x2c04                           
  05a4  8bd8             mov bx, ax                               
  05a6  8ec2             mov es, dx                               
  05a8  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  05ad  250300           and ax, 3                                
  05b0  6bc078           imul ax, ax, 0x78                        
  05b3  055000           add ax, 0x50                             
  05b6  50               push ax                                  
  05b7  16               push ss                                  
  05b8  8d46f8           lea ax, [bp - 8]                         
  05bb  50               push ax                                  
  05bc  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  05c1  83c40c           add sp, 0xc                              
  05c4  689700           push 0x97                                
  05c7  8bc7             mov ax, di                               
  05c9  6bc028           imul ax, ax, 0x28                        
  05cc  051001           add ax, 0x110                            
  05cf  50               push ax                                  
  05d0  16               push ss                                  
  05d1  8d46f4           lea ax, [bp - 0xc]                       
  05d4  50               push ax                                  
  05d5  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  05da  83c408           add sp, 8                                
  05dd  66ff76f4         push dword ptr [bp - 0xc]                
  05e1  8d46f8           lea ax, [bp - 8]                         
  05e4  8cd2             mov dx, ss                               
  05e6  b90800           mov cx, 8                                
  05e9  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  05ee  6a2f             push 0x2f                                
  05f0  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  05f5  83c40e           add sp, 0xe                              
  05f8  8bde             mov bx, si                               
  05fa  d1e3             shl bx, 1                                
  05fc  b8042c           mov ax, 0x2c04                           
  05ff  8ec0             mov es, ax                               
  0601  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0607  7443             je 0x64c                                 
  0609  8bc6             mov ax, si                               
  060b  c1e003           shl ax, 3                                
  060e  ba042c           mov dx, 0x2c04                           
  0611  8ec2             mov es, dx                               
  0613  2603061001       add ax, word ptr es:[0x110]              
  0618  ba042c           mov dx, 0x2c04                           
  061b  8bd8             mov bx, ax                               
  061d  8ec2             mov es, dx                               
  061f  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0624  250300           and ax, 3                                
  0627  8bd6             mov dx, si                               
  0629  c1e203           shl dx, 3                                
  062c  bb042c           mov bx, 0x2c04                           
  062f  8ec3             mov es, bx                               
  0631  2603161001       add dx, word ptr es:[0x110]              
  0636  bb042c           mov bx, 0x2c04                           
  0639  8ec3             mov es, bx                               
  063b  8bda             mov bx, dx                               
  063d  268a973b15       mov dl, byte ptr es:[bx + 0x153b]        
  0642  c1ea02           shr dx, 2                                
  0645  83e203           and dx, 3                                
  0648  3bc2             cmp ax, dx                               
  064a  7556             jne 0x6a2                                
  064c  6a00             push 0                                   
  064e  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0653  59               pop cx                                   
  0654  666828002800     push 0x280028                            
  065a  68bf00           push 0xbf                                
  065d  8bc7             mov ax, di                               
  065f  6bc028           imul ax, ax, 0x28                        
  0662  051001           add ax, 0x110                            
  0665  50               push ax                                  
  0666  16               push ss                                  
  0667  8d46f8           lea ax, [bp - 8]                         
  066a  50               push ax                                  
  066b  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0670  83c40c           add sp, 0xc                              
  0673  52               push dx                                  
  0674  50               push ax                                  
  0675  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  067a  83c404           add sp, 4                                
  067d  ff46f8           inc word ptr [bp - 8]                    
  0680  ff46fa           inc word ptr [bp - 6]                    
  0683  836efc02         sub word ptr [bp - 4], 2                 
  0687  836efe02         sub word ptr [bp - 2], 2                 
  068b  6a02             push 2                                   
  068d  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0692  59               pop cx                                   
  0693  16               push ss                                  
  0694  8d46f8           lea ax, [bp - 8]                         
  0697  50               push ax                                  
  0698  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  069d  83c404           add sp, 4                                
  06a0  eb71             jmp 0x713                                
  06a2  666828002800     push 0x280028                            
  06a8  6a2d             push 0x2d                                
  06aa  8bc6             mov ax, si                               
  06ac  c1e003           shl ax, 3                                
  06af  ba042c           mov dx, 0x2c04                           
  06b2  8ec2             mov es, dx                               
  06b4  2603061001       add ax, word ptr es:[0x110]              
  06b9  ba042c           mov dx, 0x2c04                           
  06bc  8bd8             mov bx, ax                               
  06be  8ec2             mov es, dx                               
  06c0  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  06c5  c1e802           shr ax, 2                                
  06c8  250300           and ax, 3                                
  06cb  6bc078           imul ax, ax, 0x78                        
  06ce  055000           add ax, 0x50                             
  06d1  50               push ax                                  
  06d2  16               push ss                                  
  06d3  8d46f8           lea ax, [bp - 8]                         
  06d6  50               push ax                                  
  06d7  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  06dc  83c40c           add sp, 0xc                              
  06df  68bf00           push 0xbf                                
  06e2  8bc7             mov ax, di                               
  06e4  6bc028           imul ax, ax, 0x28                        
  06e7  051001           add ax, 0x110                            
  06ea  50               push ax                                  
  06eb  16               push ss                                  
  06ec  8d46f4           lea ax, [bp - 0xc]                       
  06ef  50               push ax                                  
  06f0  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  06f5  83c408           add sp, 8                                
  06f8  66ff76f4         push dword ptr [bp - 0xc]                
  06fc  8d46f8           lea ax, [bp - 8]                         
  06ff  8cd2             mov dx, ss                               
  0701  b90800           mov cx, 8                                
  0704  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0709  6a2f             push 0x2f                                
  070b  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0710  83c40e           add sp, 0xe                              
  0713  8bde             mov bx, si                               
  0715  d1e3             shl bx, 1                                
  0717  b8042c           mov ax, 0x2c04                           
  071a  8ec0             mov es, ax                               
  071c  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0722  7556             jne 0x77a                                
  0724  6a00             push 0                                   
  0726  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  072b  59               pop cx                                   
  072c  666828002800     push 0x280028                            
  0732  68f500           push 0xf5                                
  0735  8bc7             mov ax, di                               
  0737  6bc028           imul ax, ax, 0x28                        
  073a  051001           add ax, 0x110                            
  073d  50               push ax                                  
  073e  16               push ss                                  
  073f  8d46f8           lea ax, [bp - 8]                         
  0742  50               push ax                                  
  0743  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0748  83c40c           add sp, 0xc                              
  074b  52               push dx                                  
  074c  50               push ax                                  
  074d  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0752  83c404           add sp, 4                                
  0755  ff46f8           inc word ptr [bp - 8]                    
  0758  ff46fa           inc word ptr [bp - 6]                    
  075b  836efc02         sub word ptr [bp - 4], 2                 
  075f  836efe02         sub word ptr [bp - 2], 2                 
  0763  6a02             push 2                                   
  0765  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  076a  59               pop cx                                   
  076b  16               push ss                                  
  076c  8d46f8           lea ax, [bp - 8]                         
  076f  50               push ax                                  
  0770  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0775  83c404           add sp, 4                                
  0778  eb7e             jmp 0x7f8                                
  077a  b8042c           mov ax, 0x2c04                           
  077d  8ec0             mov es, ax                               
  077f  268b1e1001       mov bx, word ptr es:[0x110]              
  0784  c1e303           shl bx, 3                                
  0787  03de             add bx, si                               
  0789  b8042c           mov ax, 0x2c04                           
  078c  8ec0             mov es, ax                               
  078e  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0793  c1e802           shr ax, 2                                
  0796  250300           and ax, 3                                
  0799  0bc0             or ax, ax                                
  079b  750e             jne 0x7ab                                
  079d  666828002800     push 0x280028                            
  07a3  666828002d00     push 0x2d0028                            
  07a9  eb0c             jmp 0x7b7                                
  07ab  666828002800     push 0x280028                            
  07b1  666800002d00     push 0x2d0000                            
  07b7  16               push ss                                  
  07b8  8d46f8           lea ax, [bp - 8]                         
  07bb  50               push ax                                  
  07bc  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  07c1  83c40c           add sp, 0xc                              
  07c4  68f500           push 0xf5                                
  07c7  8bc7             mov ax, di                               
  07c9  6bc028           imul ax, ax, 0x28                        
  07cc  051001           add ax, 0x110                            
  07cf  50               push ax                                  
  07d0  16               push ss                                  
  07d1  8d46f4           lea ax, [bp - 0xc]                       
  07d4  50               push ax                                  
  07d5  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  07da  83c408           add sp, 8                                
  07dd  66ff76f4         push dword ptr [bp - 0xc]                
  07e1  8d46f8           lea ax, [bp - 8]                         
  07e4  8cd2             mov dx, ss                               
  07e6  b90800           mov cx, 8                                
  07e9  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  07ee  6a2f             push 0x2f                                
  07f0  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  07f5  83c40e           add sp, 0xe                              
  07f8  8bde             mov bx, si                               
  07fa  d1e3             shl bx, 1                                
  07fc  b8042c           mov ax, 0x2c04                           
  07ff  8ec0             mov es, ax                               
  0801  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0807  7557             jne 0x860                                
  0809  6a00             push 0                                   
  080b  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0810  59               pop cx                                   
  0811  666828002800     push 0x280028                            
  0817  681d01           push 0x11d                               
  081a  8bc7             mov ax, di                               
  081c  6bc028           imul ax, ax, 0x28                        
  081f  051001           add ax, 0x110                            
  0822  50               push ax                                  
  0823  16               push ss                                  
  0824  8d46f8           lea ax, [bp - 8]                         
  0827  50               push ax                                  
  0828  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  082d  83c40c           add sp, 0xc                              
  0830  52               push dx                                  
  0831  50               push ax                                  
  0832  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  0837  83c404           add sp, 4                                
  083a  ff46f8           inc word ptr [bp - 8]                    
  083d  ff46fa           inc word ptr [bp - 6]                    
  0840  836efc02         sub word ptr [bp - 4], 2                 
  0844  836efe02         sub word ptr [bp - 2], 2                 
  0848  6a02             push 2                                   
  084a  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  084f  59               pop cx                                   
  0850  16               push ss                                  
  0851  8d46f8           lea ax, [bp - 8]                         
  0854  50               push ax                                  
  0855  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  085a  83c404           add sp, 4                                
  085d  e97f00           jmp 0x8df                                
  0860  b8042c           mov ax, 0x2c04                           
  0863  8ec0             mov es, ax                               
  0865  268b1e1001       mov bx, word ptr es:[0x110]              
  086a  c1e303           shl bx, 3                                
  086d  03de             add bx, si                               
  086f  b8042c           mov ax, 0x2c04                           
  0872  8ec0             mov es, ax                               
  0874  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0879  c1e802           shr ax, 2                                
  087c  250300           and ax, 3                                
  087f  3d0100           cmp ax, 1                                
  0882  750e             jne 0x892                                
  0884  666828002800     push 0x280028                            
  088a  6668a0002d00     push 0x2d00a0                            
  0890  eb0c             jmp 0x89e                                
  0892  666828002800     push 0x280028                            
  0898  666878002d00     push 0x2d0078                            
  089e  16               push ss                                  
  089f  8d46f8           lea ax, [bp - 8]                         
  08a2  50               push ax                                  
  08a3  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  08a8  83c40c           add sp, 0xc                              
  08ab  681d01           push 0x11d                               
  08ae  8bc7             mov ax, di                               
  08b0  6bc028           imul ax, ax, 0x28                        
  08b3  051001           add ax, 0x110                            
  08b6  50               push ax                                  
  08b7  16               push ss                                  
  08b8  8d46f4           lea ax, [bp - 0xc]                       
  08bb  50               push ax                                  
  08bc  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  08c1  83c408           add sp, 8                                
  08c4  66ff76f4         push dword ptr [bp - 0xc]                
  08c8  8d46f8           lea ax, [bp - 8]                         
  08cb  8cd2             mov dx, ss                               
  08cd  b90800           mov cx, 8                                
  08d0  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  08d5  6a2f             push 0x2f                                
  08d7  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  08dc  83c40e           add sp, 0xe                              
  08df  8bde             mov bx, si                               
  08e1  d1e3             shl bx, 1                                
  08e3  b8042c           mov ax, 0x2c04                           
  08e6  8ec0             mov es, ax                               
  08e8  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  08ee  7557             jne 0x947                                
  08f0  6a00             push 0                                   
  08f2  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  08f7  59               pop cx                                   
  08f8  666828002800     push 0x280028                            
  08fe  684501           push 0x145                               
  0901  8bc7             mov ax, di                               
  0903  6bc028           imul ax, ax, 0x28                        
  0906  051001           add ax, 0x110                            
  0909  50               push ax                                  
  090a  16               push ss                                  
  090b  8d46f8           lea ax, [bp - 8]                         
  090e  50               push ax                                  
  090f  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0914  83c40c           add sp, 0xc                              
  0917  52               push dx                                  
  0918  50               push ax                                  
  0919  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  091e  83c404           add sp, 4                                
  0921  ff46f8           inc word ptr [bp - 8]                    
  0924  ff46fa           inc word ptr [bp - 6]                    
  0927  836efc02         sub word ptr [bp - 4], 2                 
  092b  836efe02         sub word ptr [bp - 2], 2                 
  092f  6a02             push 2                                   
  0931  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0936  59               pop cx                                   
  0937  16               push ss                                  
  0938  8d46f8           lea ax, [bp - 8]                         
  093b  50               push ax                                  
  093c  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0941  83c404           add sp, 4                                
  0944  e97f00           jmp 0x9c6                                
  0947  b8042c           mov ax, 0x2c04                           
  094a  8ec0             mov es, ax                               
  094c  268b1e1001       mov bx, word ptr es:[0x110]              
  0951  c1e303           shl bx, 3                                
  0954  03de             add bx, si                               
  0956  b8042c           mov ax, 0x2c04                           
  0959  8ec0             mov es, ax                               
  095b  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0960  c1e802           shr ax, 2                                
  0963  250300           and ax, 3                                
  0966  3d0200           cmp ax, 2                                
  0969  750e             jne 0x979                                
  096b  666828002800     push 0x280028                            
  0971  666818012d00     push 0x2d0118                            
  0977  eb0c             jmp 0x985                                
  0979  666828002800     push 0x280028                            
  097f  6668f0002d00     push 0x2d00f0                            
  0985  16               push ss                                  
  0986  8d46f8           lea ax, [bp - 8]                         
  0989  50               push ax                                  
  098a  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  098f  83c40c           add sp, 0xc                              
  0992  684501           push 0x145                               
  0995  8bc7             mov ax, di                               
  0997  6bc028           imul ax, ax, 0x28                        
  099a  051001           add ax, 0x110                            
  099d  50               push ax                                  
  099e  16               push ss                                  
  099f  8d46f4           lea ax, [bp - 0xc]                       
  09a2  50               push ax                                  
  09a3  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  09a8  83c408           add sp, 8                                
  09ab  66ff76f4         push dword ptr [bp - 0xc]                
  09af  8d46f8           lea ax, [bp - 8]                         
  09b2  8cd2             mov dx, ss                               
  09b4  b90800           mov cx, 8                                
  09b7  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  09bc  6a2f             push 0x2f                                
  09be  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  09c3  83c40e           add sp, 0xe                              
  09c6  47               inc di                                   
  09c7  46               inc si                                   
  09c8  83fe08           cmp si, 8                                
  09cb  7d03             jge 0x9d0                                
  09cd  e92afb           jmp 0x4fa                                
  09d0  5f               pop di                                   
  09d1  5e               pop si                                   
  09d2  c9               leave                                    
  09d3  cb               retf                                     

ovl00_09d4:  ; ENTRY
  09d4  55               push bp                                  
  09d5  8bec             mov bp, sp                               
  09d7  56               push si                                  
  09d8  666872010100     push 0x10172                             
  09de  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  09e3  83c404           add sp, 4                                
  09e6  666873010100     push 0x10173                             
  09ec  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  09f1  83c404           add sp, 4                                
  09f4  33f6             xor si, si                               
  09f6  eb31             jmp 0xa29                                
  09f8  6a01             push 1                                   
  09fa  8bc6             mov ax, si                               
  09fc  057401           add ax, 0x174                            
  09ff  50               push ax                                  
  0a00  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0a05  83c404           add sp, 4                                
  0a08  6a01             push 1                                   
  0a0a  8bc6             mov ax, si                               
  0a0c  057c01           add ax, 0x17c                            
  0a0f  50               push ax                                  
  0a10  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0a15  83c404           add sp, 4                                
  0a18  6a01             push 1                                   
  0a1a  8bc6             mov ax, si                               
  0a1c  058401           add ax, 0x184                            
  0a1f  50               push ax                                  
  0a20  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0a25  83c404           add sp, 4                                
  0a28  46               inc si                                   
  0a29  83fe07           cmp si, 7                                
  0a2c  7cca             jl 0x9f8                                 
  0a2e  5e               pop si                                   
  0a2f  5d               pop bp                                   
  0a30  cb               retf                                     

ovl00_0a31:  ; ENTRY
  0a31  55               push bp                                  
  0a32  8bec             mov bp, sp                               
  0a34  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0a39  666a00           push 0                                   
  0a3c  6a00             push 0                                   
  0a3e  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  0a43  83c406           add sp, 6                                
  0a46  5d               pop bp                                   
  0a47  cb               retf                                     

ovl00_0a48:  ; ENTRY
  0a48  55               push bp                                  
  0a49  8bec             mov bp, sp                               
  0a4b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0a50  666a00           push 0                                   
  0a53  666a00           push 0                                   
  0a56  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  0a5b  83c408           add sp, 8                                
  0a5e  0e               push cs                                  
  0a5f  e89ef5           call 0                                   
  0a62  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0a67  5d               pop bp                                   
  0a68  cb               retf                                     

ovl00_0a69:  ; ENTRY
  0a69  55               push bp                                  
  0a6a  8bec             mov bp, sp                               
  0a6c  8b4e08           mov cx, word ptr [bp + 8]                
  0a6f  b8042c           mov ax, 0x2c04                           
  0a72  8ec0             mov es, ax                               
  0a74  268b1e1001       mov bx, word ptr es:[0x110]              
  0a79  d1e3             shl bx, 1                                
  0a7b  b8042c           mov ax, 0x2c04                           
  0a7e  8ec0             mov es, ax                               
  0a80  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0a86  750d             jne 0xa95                                
  0a88  b8042c           mov ax, 0x2c04                           
  0a8b  8ec0             mov es, ax                               
  0a8d  26390e1001       cmp word ptr es:[0x110], cx              
  0a92  7f01             jg 0xa95                                 
  0a94  41               inc cx                                   
  0a95  8b4606           mov ax, word ptr [bp + 6]                
  0a98  250300           and ax, 3                                
  0a9b  ba042c           mov dx, 0x2c04                           
  0a9e  8ec2             mov es, dx                               
  0aa0  268b1e1001       mov bx, word ptr es:[0x110]              
  0aa5  c1e303           shl bx, 3                                
  0aa8  03d9             add bx, cx                               
  0aaa  ba042c           mov dx, 0x2c04                           
  0aad  8ec2             mov es, dx                               
  0aaf  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  0ab5  c0e002           shl al, 2                                
  0ab8  2608873b15       or byte ptr es:[bx + 0x153b], al         
  0abd  b8042c           mov ax, 0x2c04                           
  0ac0  8ec0             mov es, ax                               
  0ac2  268b1e1001       mov bx, word ptr es:[0x110]              
  0ac7  d1e3             shl bx, 1                                
  0ac9  b8042c           mov ax, 0x2c04                           
  0acc  8ec0             mov es, ax                               
  0ace  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0ad4  7515             jne 0xaeb                                
  0ad6  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0adb  6a01             push 1                                   
  0add  0e               push cs                                  
  0ade  e8a1f8           call 0x382                               
  0ae1  59               pop cx                                   
  0ae2  0e               push cs                                  
  0ae3  e8eefe           call 0x9d4                               
  0ae6  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0aeb  5d               pop bp                                   
  0aec  cb               retf                                     

ovl00_0aed:  ; ENTRY
  0aed  55               push bp                                  
  0aee  8bec             mov bp, sp                               
  0af0  83ec02           sub sp, 2                                
  0af3  56               push si                                  
  0af4  33f6             xor si, si                               
  0af6  33c9             xor cx, cx                               
  0af8  eb1f             jmp 0xb19                                
  0afa  8bde             mov bx, si                               
  0afc  d1e3             shl bx, 1                                
  0afe  b8042c           mov ax, 0x2c04                           
  0b01  8ec0             mov es, ax                               
  0b03  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  0b09  740d             je 0xb18                                 
  0b0b  8bc1             mov ax, cx                               
  0b0d  d1e0             shl ax, 1                                
  0b0f  c45e0a           les bx, ptr [bp + 0xa]                   
  0b12  03d8             add bx, ax                               
  0b14  268937           mov word ptr es:[bx], si                 
  0b17  41               inc cx                                   
  0b18  46               inc si                                   
  0b19  83fe08           cmp si, 8                                
  0b1c  7cdc             jl 0xafa                                 
  0b1e  c45e06           les bx, ptr [bp + 6]                     
  0b21  26890f           mov word ptr es:[bx], cx                 
  0b24  be0100           mov si, 1                                
  0b27  eb75             jmp 0xb9e                                
  0b29  8bce             mov cx, si                               
  0b2b  eb39             jmp 0xb66                                
  0b2d  8bc1             mov ax, cx                               
  0b2f  d1e0             shl ax, 1                                
  0b31  c45e0a           les bx, ptr [bp + 0xa]                   
  0b34  03d8             add bx, ax                               
  0b36  268b07           mov ax, word ptr es:[bx]                 
  0b39  8946fe           mov word ptr [bp - 2], ax                
  0b3c  8bc1             mov ax, cx                               
  0b3e  48               dec ax                                   
  0b3f  d1e0             shl ax, 1                                
  0b41  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0b44  03d8             add bx, ax                               
  0b46  268b07           mov ax, word ptr es:[bx]                 
  0b49  8bd1             mov dx, cx                               
  0b4b  d1e2             shl dx, 1                                
  0b4d  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0b50  03da             add bx, dx                               
  0b52  268907           mov word ptr es:[bx], ax                 
  0b55  8bc1             mov ax, cx                               
  0b57  48               dec ax                                   
  0b58  d1e0             shl ax, 1                                
  0b5a  8b5e0a           mov bx, word ptr [bp + 0xa]              
  0b5d  03d8             add bx, ax                               
  0b5f  8b46fe           mov ax, word ptr [bp - 2]                
  0b62  268907           mov word ptr es:[bx], ax                 
  0b65  49               dec cx                                   
  0b66  8bc1             mov ax, cx                               
  0b68  d1e0             shl ax, 1                                
  0b6a  c45e0a           les bx, ptr [bp + 0xa]                   
  0b6d  03d8             add bx, ax                               
  0b6f  268b1f           mov bx, word ptr es:[bx]                 
  0b72  d1e3             shl bx, 1                                
  0b74  b8042c           mov ax, 0x2c04                           
  0b77  8ec0             mov es, ax                               
  0b79  268b87e310       mov ax, word ptr es:[bx + 0x10e3]        
  0b7e  8bd1             mov dx, cx                               
  0b80  4a               dec dx                                   
  0b81  d1e2             shl dx, 1                                
  0b83  c45e0a           les bx, ptr [bp + 0xa]                   
  0b86  03da             add bx, dx                               
  0b88  268b1f           mov bx, word ptr es:[bx]                 
  0b8b  d1e3             shl bx, 1                                
  0b8d  ba042c           mov dx, 0x2c04                           
  0b90  8ec2             mov es, dx                               
  0b92  263b87e310       cmp ax, word ptr es:[bx + 0x10e3]        
  0b97  7d04             jge 0xb9d                                
  0b99  0bc9             or cx, cx                                
  0b9b  7f90             jg 0xb2d                                 
  0b9d  46               inc si                                   
  0b9e  c45e06           les bx, ptr [bp + 6]                     
  0ba1  263937           cmp word ptr es:[bx], si                 
  0ba4  7f83             jg 0xb29                                 
  0ba6  268b1f           mov bx, word ptr es:[bx]                 
  0ba9  4b               dec bx                                   
  0baa  83fb07           cmp bx, 7                                
  0bad  7603             jbe 0xbb2                                
  0baf  e90201           jmp 0xcb4                                
  0bb2  d1e3             shl bx, 1                                
  0bb4  2effa7b70c       jmp word ptr cs:[bx + 0xcb7]             
ovl00_0bb9:  ; case
  0bb9  c45e0e           les bx, ptr [bp + 0xe]                   
  0bbc  26c7070000       mov word ptr es:[bx], 0                  
  0bc1  e9f000           jmp 0xcb4                                
ovl00_0bc4:  ; case
  0bc4  c45e0e           les bx, ptr [bp + 0xe]                   
  0bc7  26c7070000       mov word ptr es:[bx], 0                  
  0bcc  26c747020700     mov word ptr es:[bx + 2], 7              
  0bd2  e9df00           jmp 0xcb4                                
ovl00_0bd5:  ; case
  0bd5  c45e0e           les bx, ptr [bp + 0xe]                   
  0bd8  26c7070000       mov word ptr es:[bx], 0                  
  0bdd  26c747020300     mov word ptr es:[bx + 2], 3              
  0be3  26c747040700     mov word ptr es:[bx + 4], 7              
  0be9  e9c800           jmp 0xcb4                                
ovl00_0bec:  ; case
  0bec  c45e0e           les bx, ptr [bp + 0xe]                   
  0bef  26c7070000       mov word ptr es:[bx], 0                  
  0bf4  26c747020100     mov word ptr es:[bx + 2], 1              
  0bfa  26c747040500     mov word ptr es:[bx + 4], 5              
  0c00  26c747060700     mov word ptr es:[bx + 6], 7              
  0c06  e9ab00           jmp 0xcb4                                
ovl00_0c09:  ; case
  0c09  c45e0e           les bx, ptr [bp + 0xe]                   
  0c0c  26c7070000       mov word ptr es:[bx], 0                  
  0c11  26c747020100     mov word ptr es:[bx + 2], 1              
  0c17  26c747040300     mov word ptr es:[bx + 4], 3              
  0c1d  26c747060500     mov word ptr es:[bx + 6], 5              
  0c23  26c747080700     mov word ptr es:[bx + 8], 7              
  0c29  e98800           jmp 0xcb4                                
ovl00_0c2c:  ; case
  0c2c  c45e0e           les bx, ptr [bp + 0xe]                   
  0c2f  26c7070000       mov word ptr es:[bx], 0                  
  0c34  26c747020100     mov word ptr es:[bx + 2], 1              
  0c3a  26c747040300     mov word ptr es:[bx + 4], 3              
  0c40  26c747060500     mov word ptr es:[bx + 6], 5              
  0c46  26c747080600     mov word ptr es:[bx + 8], 6              
  0c4c  26c7470a0700     mov word ptr es:[bx + 0xa], 7            
  0c52  eb60             jmp 0xcb4                                
ovl00_0c54:  ; case
  0c54  c45e0e           les bx, ptr [bp + 0xe]                   
  0c57  26c7070000       mov word ptr es:[bx], 0                  
  0c5c  26c747020100     mov word ptr es:[bx + 2], 1              
  0c62  26c747040300     mov word ptr es:[bx + 4], 3              
  0c68  26c747060400     mov word ptr es:[bx + 6], 4              
  0c6e  26c747080500     mov word ptr es:[bx + 8], 5              
  0c74  26c7470a0600     mov word ptr es:[bx + 0xa], 6            
  0c7a  26c7470c0700     mov word ptr es:[bx + 0xc], 7            
  0c80  eb32             jmp 0xcb4                                
ovl00_0c82:  ; case
  0c82  c45e0e           les bx, ptr [bp + 0xe]                   
  0c85  26c7070000       mov word ptr es:[bx], 0                  
  0c8a  26c747020100     mov word ptr es:[bx + 2], 1              
  0c90  26c747040200     mov word ptr es:[bx + 4], 2              
  0c96  26c747060300     mov word ptr es:[bx + 6], 3              
  0c9c  26c747080400     mov word ptr es:[bx + 8], 4              
  0ca2  26c7470a0500     mov word ptr es:[bx + 0xa], 5            
  0ca8  26c7470c0600     mov word ptr es:[bx + 0xc], 6            
  0cae  26c7470e0700     mov word ptr es:[bx + 0xe], 7            
  0cb4  5e               pop si                                   
  0cb5  c9               leave                                    
  0cb6  cb               retf                                     
  0cb7  b90bc40bd50bec0b dw 0bb9,0bc4,0bd5,0bec,0c09,0c2c,0c54,0c82 jump table

ovl00_0cc7:  ; ENTRY
  0cc7  55               push bp                                  
  0cc8  8bec             mov bp, sp                               
  0cca  83ec02           sub sp, 2                                
  0ccd  56               push si                                  
  0cce  57               push di                                  
  0ccf  b8042c           mov ax, 0x2c04                           
  0cd2  8ec0             mov es, ax                               
  0cd4  268b0e1001       mov cx, word ptr es:[0x110]              
  0cd9  33ff             xor di, di                               
  0cdb  c746fe0000       mov word ptr [bp - 2], 0                 
  0ce0  8bd9             mov bx, cx                               
  0ce2  c1e303           shl bx, 3                                
  0ce5  03d9             add bx, cx                               
  0ce7  b8042c           mov ax, 0x2c04                           
  0cea  8ec0             mov es, ax                               
  0cec  2680a73b15ef     and byte ptr es:[bx + 0x153b], 0xef      
  0cf2  8bd9             mov bx, cx                               
  0cf4  c1e303           shl bx, 3                                
  0cf7  03d9             add bx, cx                               
  0cf9  8ec0             mov es, ax                               
  0cfb  2680a73b15df     and byte ptr es:[bx + 0x153b], 0xdf      
  0d01  33f6             xor si, si                               
  0d03  eb6d             jmp 0xd72                                
  0d05  3bf1             cmp si, cx                               
  0d07  7468             je 0xd71                                 
  0d09  8bde             mov bx, si                               
  0d0b  c1e303           shl bx, 3                                
  0d0e  03d9             add bx, cx                               
  0d10  b8042c           mov ax, 0x2c04                           
  0d13  8ec0             mov es, ax                               
  0d15  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0d1a  250300           and ax, 3                                
  0d1d  8bde             mov bx, si                               
  0d1f  c1e303           shl bx, 3                                
  0d22  03d9             add bx, cx                               
  0d24  ba042c           mov dx, 0x2c04                           
  0d27  8ec2             mov es, dx                               
  0d29  268a973b15       mov dl, byte ptr es:[bx + 0x153b]        
  0d2e  c1ea02           shr dx, 2                                
  0d31  83e203           and dx, 3                                
  0d34  3bc2             cmp ax, dx                               
  0d36  7439             je 0xd71                                 
  0d38  8bde             mov bx, si                               
  0d3a  c1e303           shl bx, 3                                
  0d3d  03d9             add bx, cx                               
  0d3f  b8042c           mov ax, 0x2c04                           
  0d42  8ec0             mov es, ax                               
  0d44  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0d49  c1e802           shr ax, 2                                
  0d4c  250300           and ax, 3                                
  0d4f  8bde             mov bx, si                               
  0d51  c1e303           shl bx, 3                                
  0d54  03d9             add bx, cx                               
  0d56  ba042c           mov dx, 0x2c04                           
  0d59  8ec2             mov es, dx                               
  0d5b  268a973b15       mov dl, byte ptr es:[bx + 0x153b]        
  0d60  83e203           and dx, 3                                
  0d63  3bc2             cmp ax, dx                               
  0d65  7305             jae 0xd6c                                
  0d67  bf0100           mov di, 1                                
  0d6a  eb05             jmp 0xd71                                
  0d6c  c746fe0100       mov word ptr [bp - 2], 1                 
  0d71  46               inc si                                   
  0d72  83fe08           cmp si, 8                                
  0d75  7c8e             jl 0xd05                                 
  0d77  0bff             or di, di                                
  0d79  7506             jne 0xd81                                
  0d7b  837efe00         cmp word ptr [bp - 2], 0                 
  0d7f  7412             je 0xd93                                 
  0d81  8bd9             mov bx, cx                               
  0d83  c1e303           shl bx, 3                                
  0d86  03d9             add bx, cx                               
  0d88  b8042c           mov ax, 0x2c04                           
  0d8b  8ec0             mov es, ax                               
  0d8d  26808f3b1510     or byte ptr es:[bx + 0x153b], 0x10       
  0d93  0bff             or di, di                                
  0d95  7418             je 0xdaf                                 
  0d97  837efe00         cmp word ptr [bp - 2], 0                 
  0d9b  7512             jne 0xdaf                                
  0d9d  8bd9             mov bx, cx                               
  0d9f  c1e303           shl bx, 3                                
  0da2  03d9             add bx, cx                               
  0da4  b8042c           mov ax, 0x2c04                           
  0da7  8ec0             mov es, ax                               
  0da9  26808f3b1520     or byte ptr es:[bx + 0x153b], 0x20       
  0daf  5f               pop di                                   
  0db0  5e               pop si                                   
  0db1  c9               leave                                    
  0db2  cb               retf                                     

ovl00_0db3:  ; ENTRY
  0db3  55               push bp                                  
  0db4  8bec             mov bp, sp                               
  0db6  56               push si                                  
  0db7  57               push di                                  
  0db8  b8042c           mov ax, 0x2c04                           
  0dbb  8ec0             mov es, ax                               
  0dbd  268b3e1001       mov di, word ptr es:[0x110]              
  0dc2  33f6             xor si, si                               
  0dc4  e99002           jmp 0x1057                               
  0dc7  3bf7             cmp si, di                               
  0dc9  7503             jne 0xdce                                
  0dcb  e98802           jmp 0x1056                               
  0dce  8bdf             mov bx, di                               
  0dd0  c1e303           shl bx, 3                                
  0dd3  03de             add bx, si                               
  0dd5  b8042c           mov ax, 0x2c04                           
  0dd8  8ec0             mov es, ax                               
  0dda  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0ddf  250300           and ax, 3                                
  0de2  8bdf             mov bx, di                               
  0de4  c1e303           shl bx, 3                                
  0de7  03de             add bx, si                               
  0de9  ba042c           mov dx, 0x2c04                           
  0dec  8ec2             mov es, dx                               
  0dee  268a973b15       mov dl, byte ptr es:[bx + 0x153b]        
  0df3  c1ea02           shr dx, 2                                
  0df6  83e203           and dx, 3                                
  0df9  3bc2             cmp ax, dx                               
  0dfb  7503             jne 0xe00                                
  0dfd  e95602           jmp 0x1056                               
  0e00  8bdf             mov bx, di                               
  0e02  c1e303           shl bx, 3                                
  0e05  03de             add bx, si                               
  0e07  b8042c           mov ax, 0x2c04                           
  0e0a  8ec0             mov es, ax                               
  0e0c  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0e11  250300           and ax, 3                                
  0e14  8bdf             mov bx, di                               
  0e16  c1e303           shl bx, 3                                
  0e19  03de             add bx, si                               
  0e1b  ba042c           mov dx, 0x2c04                           
  0e1e  8ec2             mov es, dx                               
  0e20  268a973b15       mov dl, byte ptr es:[bx + 0x153b]        
  0e25  c1ea02           shr dx, 2                                
  0e28  83e203           and dx, 3                                
  0e2b  3bc2             cmp ax, dx                               
  0e2d  7203             jb 0xe32                                 
  0e2f  e93e01           jmp 0xf70                                
  0e32  8bdf             mov bx, di                               
  0e34  c1e303           shl bx, 3                                
  0e37  03de             add bx, si                               
  0e39  b8042c           mov ax, 0x2c04                           
  0e3c  8ec0             mov es, ax                               
  0e3e  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0e43  c1e802           shr ax, 2                                
  0e46  250300           and ax, 3                                
  0e49  250300           and ax, 3                                
  0e4c  8bdf             mov bx, di                               
  0e4e  c1e303           shl bx, 3                                
  0e51  03de             add bx, si                               
  0e53  ba042c           mov dx, 0x2c04                           
  0e56  8ec2             mov es, dx                               
  0e58  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  0e5e  2608873b15       or byte ptr es:[bx + 0x153b], al         
  0e63  8bdf             mov bx, di                               
  0e65  c1e303           shl bx, 3                                
  0e68  03de             add bx, si                               
  0e6a  b8042c           mov ax, 0x2c04                           
  0e6d  8ec0             mov es, ax                               
  0e6f  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0e74  c1e802           shr ax, 2                                
  0e77  250300           and ax, 3                                
  0e7a  250300           and ax, 3                                
  0e7d  8bde             mov bx, si                               
  0e7f  c1e303           shl bx, 3                                
  0e82  03df             add bx, di                               
  0e84  8ec2             mov es, dx                               
  0e86  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  0e8c  2608873b15       or byte ptr es:[bx + 0x153b], al         
  0e91  8bde             mov bx, si                               
  0e93  c1e303           shl bx, 3                                
  0e96  03df             add bx, di                               
  0e98  b8042c           mov ax, 0x2c04                           
  0e9b  8ec0             mov es, ax                               
  0e9d  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0ea2  c1e802           shr ax, 2                                
  0ea5  250300           and ax, 3                                
  0ea8  8bde             mov bx, si                               
  0eaa  c1e303           shl bx, 3                                
  0ead  03df             add bx, di                               
  0eaf  8ec2             mov es, dx                               
  0eb1  268a973b15       mov dl, byte ptr es:[bx + 0x153b]        
  0eb6  83e203           and dx, 3                                
  0eb9  3bc2             cmp ax, dx                               
  0ebb  7331             jae 0xeee                                
  0ebd  8bde             mov bx, si                               
  0ebf  c1e303           shl bx, 3                                
  0ec2  03df             add bx, di                               
  0ec4  b8042c           mov ax, 0x2c04                           
  0ec7  8ec0             mov es, ax                               
  0ec9  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0ece  250300           and ax, 3                                
  0ed1  250300           and ax, 3                                
  0ed4  8bde             mov bx, si                               
  0ed6  c1e303           shl bx, 3                                
  0ed9  03df             add bx, di                               
  0edb  ba042c           mov dx, 0x2c04                           
  0ede  8ec2             mov es, dx                               
  0ee0  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  0ee6  c0e002           shl al, 2                                
  0ee9  2608873b15       or byte ptr es:[bx + 0x153b], al         
  0eee  8bdf             mov bx, di                               
  0ef0  c1e303           shl bx, 3                                
  0ef3  03de             add bx, si                               
  0ef5  b8042c           mov ax, 0x2c04                           
  0ef8  8ec0             mov es, ax                               
  0efa  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0eff  c1e802           shr ax, 2                                
  0f02  250300           and ax, 3                                
  0f05  3d0200           cmp ax, 2                                
  0f08  7403             je 0xf0d                                 
  0f0a  e94901           jmp 0x1056                               
  0f0d  666a00           push 0                                   
  0f10  56               push si                                  
  0f11  57               push di                                  
  0f12  6a09             push 9                                   
  0f14  57               push di                                  
  0f15  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  0f1a  83c40c           add sp, 0xc                              
  0f1d  b8042c           mov ax, 0x2c04                           
  0f20  8ec0             mov es, ax                               
  0f22  26833e590100     cmp word ptr es:[0x159], 0               
  0f28  7503             jne 0xf2d                                
  0f2a  e92901           jmp 0x1056                               
  0f2d  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  0f32  0bc0             or ax, ax                                
  0f34  7503             jne 0xf39                                
  0f36  e91d01           jmp 0x1056                               
  0f39  8bc6             mov ax, si                               
  0f3b  6bc014           imul ax, ax, 0x14                        
  0f3e  050000           add ax, 0                                
  0f41  68042c           push 0x2c04                              
  0f44  50               push ax                                  
  0f45  6a01             push 1                                   
  0f47  6a6f             push 0x6f                                
  0f49  9a6b00c130       lcall 0x30c1, 0x6b                       -> ovl59:04f0
  0f4e  83c404           add sp, 4                                
  0f51  52               push dx                                  
  0f52  50               push ax                                  
  0f53  1e               push ds                                  
  0f54  68885c           push 0x5c88                              
  0f57  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0f5c  83c40c           add sp, 0xc                              
  0f5f  6a14             push 0x14                                
  0f61  1e               push ds                                  
  0f62  68885c           push 0x5c88                              
  0f65  9a9300d730       lcall 0x30d7, 0x93                       -> ovl61:11d1
  0f6a  83c406           add sp, 6                                
  0f6d  e9e600           jmp 0x1056                               
  0f70  8bde             mov bx, si                               
  0f72  c1e303           shl bx, 3                                
  0f75  03df             add bx, di                               
  0f77  b8042c           mov ax, 0x2c04                           
  0f7a  8ec0             mov es, ax                               
  0f7c  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0f81  c1e802           shr ax, 2                                
  0f84  250300           and ax, 3                                
  0f87  8bdf             mov bx, di                               
  0f89  c1e303           shl bx, 3                                
  0f8c  03de             add bx, si                               
  0f8e  ba042c           mov dx, 0x2c04                           
  0f91  8ec2             mov es, dx                               
  0f93  268a973b15       mov dl, byte ptr es:[bx + 0x153b]        
  0f98  c1ea02           shr dx, 2                                
  0f9b  83e203           and dx, 3                                
  0f9e  3bc2             cmp ax, dx                               
  0fa0  7603             jbe 0xfa5                                
  0fa2  e9b100           jmp 0x1056                               
  0fa5  8bdf             mov bx, di                               
  0fa7  c1e303           shl bx, 3                                
  0faa  03de             add bx, si                               
  0fac  b8042c           mov ax, 0x2c04                           
  0faf  8ec0             mov es, ax                               
  0fb1  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0fb6  c1e802           shr ax, 2                                
  0fb9  250300           and ax, 3                                
  0fbc  250300           and ax, 3                                
  0fbf  8bdf             mov bx, di                               
  0fc1  c1e303           shl bx, 3                                
  0fc4  03de             add bx, si                               
  0fc6  ba042c           mov dx, 0x2c04                           
  0fc9  8ec2             mov es, dx                               
  0fcb  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  0fd1  2608873b15       or byte ptr es:[bx + 0x153b], al         
  0fd6  8bdf             mov bx, di                               
  0fd8  c1e303           shl bx, 3                                
  0fdb  03de             add bx, si                               
  0fdd  b8042c           mov ax, 0x2c04                           
  0fe0  8ec0             mov es, ax                               
  0fe2  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  0fe7  c1e802           shr ax, 2                                
  0fea  250300           and ax, 3                                
  0fed  250300           and ax, 3                                
  0ff0  8bde             mov bx, si                               
  0ff2  c1e303           shl bx, 3                                
  0ff5  03df             add bx, di                               
  0ff7  8ec2             mov es, dx                               
  0ff9  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  0fff  2608873b15       or byte ptr es:[bx + 0x153b], al         
  1004  8bdf             mov bx, di                               
  1006  c1e303           shl bx, 3                                
  1009  03de             add bx, si                               
  100b  b8042c           mov ax, 0x2c04                           
  100e  8ec0             mov es, ax                               
  1010  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  1015  c1e802           shr ax, 2                                
  1018  250300           and ax, 3                                
  101b  0bc0             or ax, ax                                
  101d  7537             jne 0x1056                               
  101f  666a00           push 0                                   
  1022  56               push si                                  
  1023  57               push di                                  
  1024  6a0a             push 0xa                                 
  1026  57               push di                                  
  1027  9a57004230       lcall 0x3042, 0x57                       -> ovl41:1244
  102c  83c40c           add sp, 0xc                              
  102f  b8042c           mov ax, 0x2c04                           
  1032  8ec0             mov es, ax                               
  1034  26833e590100     cmp word ptr es:[0x159], 0               
  103a  741a             je 0x1056                                
  103c  9a4800db2f       lcall 0x2fdb, 0x48                       -> ovl25:09ab
  1041  0bc0             or ax, ax                                
  1043  7411             je 0x1056                                
  1045  8bc6             mov ax, si                               
  1047  6bc014           imul ax, ax, 0x14                        
  104a  050000           add ax, 0                                
  104d  68042c           push 0x2c04                              
  1050  50               push ax                                  
  1051  6a00             push 0                                   
  1053  e9f1fe           jmp 0xf47                                
  1056  46               inc si                                   
  1057  83fe08           cmp si, 8                                
  105a  7d03             jge 0x105f                               
  105c  e968fd           jmp 0xdc7                                
  105f  5f               pop di                                   
  1060  5e               pop si                                   
  1061  5d               pop bp                                   
  1062  cb               retf                                     

ovl00_1063:  ; ENTRY
  1063  55               push bp                                  
  1064  8bec             mov bp, sp                               
  1066  56               push si                                  
  1067  57               push di                                  
  1068  b8042c           mov ax, 0x2c04                           
  106b  8ec0             mov es, ax                               
  106d  268b361001       mov si, word ptr es:[0x110]              
  1072  33ff             xor di, di                               
  1074  e93a01           jmp 0x11b1                               
  1077  3bfe             cmp di, si                               
  1079  7503             jne 0x107e                               
  107b  e93201           jmp 0x11b0                               
  107e  8bde             mov bx, si                               
  1080  c1e303           shl bx, 3                                
  1083  03df             add bx, di                               
  1085  b8042c           mov ax, 0x2c04                           
  1088  8ec0             mov es, ax                               
  108a  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  108f  c1e802           shr ax, 2                                
  1092  250300           and ax, 3                                
  1095  8bde             mov bx, si                               
  1097  c1e303           shl bx, 3                                
  109a  03df             add bx, di                               
  109c  ba042c           mov dx, 0x2c04                           
  109f  8ec2             mov es, dx                               
  10a1  268a973b15       mov dl, byte ptr es:[bx + 0x153b]        
  10a6  83e203           and dx, 3                                
  10a9  3bc2             cmp ax, dx                               
  10ab  7203             jb 0x10b0                                
  10ad  e90001           jmp 0x11b0                               
  10b0  8bde             mov bx, si                               
  10b2  c1e303           shl bx, 3                                
  10b5  03df             add bx, di                               
  10b7  b8042c           mov ax, 0x2c04                           
  10ba  8ec0             mov es, ax                               
  10bc  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  10c1  c1e802           shr ax, 2                                
  10c4  250300           and ax, 3                                
  10c7  8bdf             mov bx, di                               
  10c9  c1e303           shl bx, 3                                
  10cc  03de             add bx, si                               
  10ce  ba042c           mov dx, 0x2c04                           
  10d1  8ec2             mov es, dx                               
  10d3  268a973b15       mov dl, byte ptr es:[bx + 0x153b]        
  10d8  c1ea02           shr dx, 2                                
  10db  83e203           and dx, 3                                
  10de  3bc2             cmp ax, dx                               
  10e0  7203             jb 0x10e5                                
  10e2  e9cb00           jmp 0x11b0                               
  10e5  8bde             mov bx, si                               
  10e7  c1e303           shl bx, 3                                
  10ea  03df             add bx, di                               
  10ec  b8042c           mov ax, 0x2c04                           
  10ef  8ec0             mov es, ax                               
  10f1  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  10f6  c1e802           shr ax, 2                                
  10f9  250300           and ax, 3                                
  10fc  0bc0             or ax, ax                                
  10fe  7519             jne 0x1119                               
  1100  8bde             mov bx, si                               
  1102  c1e303           shl bx, 3                                
  1105  03df             add bx, di                               
  1107  b8042c           mov ax, 0x2c04                           
  110a  8ec0             mov es, ax                               
  110c  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  1111  250300           and ax, 3                                
  1114  3d0100           cmp ax, 1                                
  1117  747b             je 0x1194                                
  1119  8bde             mov bx, si                               
  111b  c1e303           shl bx, 3                                
  111e  03df             add bx, di                               
  1120  b8042c           mov ax, 0x2c04                           
  1123  8ec0             mov es, ax                               
  1125  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  112a  c1e802           shr ax, 2                                
  112d  250300           and ax, 3                                
  1130  0bc0             or ax, ax                                
  1132  752b             jne 0x115f                               
  1134  8bde             mov bx, si                               
  1136  c1e303           shl bx, 3                                
  1139  03df             add bx, di                               
  113b  b8042c           mov ax, 0x2c04                           
  113e  8ec0             mov es, ax                               
  1140  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  1145  250300           and ax, 3                                
  1148  3d0200           cmp ax, 2                                
  114b  7512             jne 0x115f                               
  114d  666a0a           push 0xa                                 
  1150  6a01             push 1                                   
  1152  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  1157  83c406           add sp, 6                                
  115a  050a00           add ax, 0xa                              
  115d  eb43             jmp 0x11a2                               
  115f  8bde             mov bx, si                               
  1161  c1e303           shl bx, 3                                
  1164  03df             add bx, di                               
  1166  b8042c           mov ax, 0x2c04                           
  1169  8ec0             mov es, ax                               
  116b  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  1170  c1e802           shr ax, 2                                
  1173  250300           and ax, 3                                
  1176  3d0100           cmp ax, 1                                
  1179  7535             jne 0x11b0                               
  117b  8bde             mov bx, si                               
  117d  c1e303           shl bx, 3                                
  1180  03df             add bx, di                               
  1182  b8042c           mov ax, 0x2c04                           
  1185  8ec0             mov es, ax                               
  1187  268a873b15       mov al, byte ptr es:[bx + 0x153b]        
  118c  250300           and ax, 3                                
  118f  3d0200           cmp ax, 2                                
  1192  751c             jne 0x11b0                               
  1194  666a02           push 2                                   
  1197  6a01             push 1                                   
  1199  9a3e00c130       lcall 0x30c1, 0x3e                       -> ovl59:02bf
  119e  83c406           add sp, 6                                
  11a1  40               inc ax                                   
  11a2  8bde             mov bx, si                               
  11a4  d1e3             shl bx, 1                                
  11a6  ba042c           mov dx, 0x2c04                           
  11a9  8ec2             mov es, dx                               
  11ab  260187e310       add word ptr es:[bx + 0x10e3], ax        
  11b0  47               inc di                                   
  11b1  83ff08           cmp di, 8                                
  11b4  7d03             jge 0x11b9                               
  11b6  e9befe           jmp 0x1077                               
  11b9  5f               pop di                                   
  11ba  5e               pop si                                   
  11bb  5d               pop bp                                   
  11bc  cb               retf                                     

ovl00_11bd:  ; ENTRY
  11bd  55               push bp                                  
  11be  8bec             mov bp, sp                               
  11c0  33d2             xor dx, dx                               
  11c2  e99300           jmp 0x1258                               
  11c5  33c9             xor cx, cx                               
  11c7  e98500           jmp 0x124f                               
  11ca  b8042c           mov ax, 0x2c04                           
  11cd  8ec0             mov es, ax                               
  11cf  26833e1c0100     cmp word ptr es:[0x11c], 0               
  11d5  7429             je 0x1200                                
  11d7  8bda             mov bx, dx                               
  11d9  c1e303           shl bx, 3                                
  11dc  03d9             add bx, cx                               
  11de  b8042c           mov ax, 0x2c04                           
  11e1  8ec0             mov es, ax                               
  11e3  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  11e9  8bda             mov bx, dx                               
  11eb  c1e303           shl bx, 3                                
  11ee  03d9             add bx, cx                               
  11f0  8ec0             mov es, ax                               
  11f2  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  11f8  26808f3b1500     or byte ptr es:[bx + 0x153b], 0          
  11fe  eb2d             jmp 0x122d                               
  1200  8bda             mov bx, dx                               
  1202  c1e303           shl bx, 3                                
  1205  03d9             add bx, cx                               
  1207  b8042c           mov ax, 0x2c04                           
  120a  8ec0             mov es, ax                               
  120c  2680a73b15f3     and byte ptr es:[bx + 0x153b], 0xf3      
  1212  26808f3b1508     or byte ptr es:[bx + 0x153b], 8          
  1218  8bda             mov bx, dx                               
  121a  c1e303           shl bx, 3                                
  121d  03d9             add bx, cx                               
  121f  8ec0             mov es, ax                               
  1221  2680a73b15fc     and byte ptr es:[bx + 0x153b], 0xfc      
  1227  26808f3b1502     or byte ptr es:[bx + 0x153b], 2          
  122d  8bda             mov bx, dx                               
  122f  c1e303           shl bx, 3                                
  1232  03d9             add bx, cx                               
  1234  b8042c           mov ax, 0x2c04                           
  1237  8ec0             mov es, ax                               
  1239  2680a73b15ef     and byte ptr es:[bx + 0x153b], 0xef      
  123f  8bda             mov bx, dx                               
  1241  c1e303           shl bx, 3                                
  1244  03d9             add bx, cx                               
  1246  8ec0             mov es, ax                               
  1248  2680a73b15df     and byte ptr es:[bx + 0x153b], 0xdf      
  124e  41               inc cx                                   
  124f  83f908           cmp cx, 8                                
  1252  7d03             jge 0x1257                               
  1254  e973ff           jmp 0x11ca                               
  1257  42               inc dx                                   
  1258  83fa08           cmp dx, 8                                
  125b  7d03             jge 0x1260                               
  125d  e965ff           jmp 0x11c5                               
  1260  5d               pop bp                                   
  1261  cb               retf                                     
