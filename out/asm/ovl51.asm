; ovl51 stub 3090 file_off 0x6ee80 size 0x70b

ovl51_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  66ff760a         push dword ptr [bp + 0xa]                
  0007  1e               push ds                                  
  0008  681648           push 0x4816                              
  000b  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0010  83c408           add sp, 8                                
  0013  8b460e           mov ax, word ptr [bp + 0xe]              
  0016  a33a48           mov word ptr [0x483a], ax                
  0019  668b4606         mov eax, dword ptr [bp + 6]              
  001d  66a32a48         mov dword ptr [0x482a], eax              
  0021  c70630480000     mov word ptr [0x4830], 0                 
  0027  833e2e4801       cmp word ptr [0x482e], 1                 
  002c  7e05             jle 0x33                                 
  002e  b80100           mov ax, 1                                
  0031  eb03             jmp 0x36                                 
  0033  b8ffff           mov ax, 0xffff                           
  0036  a33248           mov word ptr [0x4832], ax                
  0039  833e2e4802       cmp word ptr [0x482e], 2                 
  003e  7e05             jle 0x45                                 
  0040  b80200           mov ax, 2                                
  0043  eb03             jmp 0x48                                 
  0045  b8ffff           mov ax, 0xffff                           
  0048  a33448           mov word ptr [0x4834], ax                
  004b  833e2e4803       cmp word ptr [0x482e], 3                 
  0050  7e05             jle 0x57                                 
  0052  b80300           mov ax, 3                                
  0055  eb03             jmp 0x5a                                 
  0057  b8ffff           mov ax, 0xffff                           
  005a  a33648           mov word ptr [0x4836], ax                
  005d  833e2e4804       cmp word ptr [0x482e], 4                 
  0062  7e05             jle 0x69                                 
  0064  b80400           mov ax, 4                                
  0067  eb03             jmp 0x6c                                 
  0069  b8ffff           mov ax, 0xffff                           
  006c  a33848           mov word ptr [0x4838], ax                
  006f  eb16             jmp 0x87                                 
  0071  ff0e3a48         dec word ptr [0x483a]                    
  0075  33c0             xor ax, ax                               
  0077  eb09             jmp 0x82                                 
  0079  8bd8             mov bx, ax                               
  007b  d1e3             shl bx, 1                                
  007d  ff873048         inc word ptr [bx + 0x4830]               
  0081  40               inc ax                                   
  0082  3d0500           cmp ax, 5                                
  0085  7cf2             jl 0x79                                  
  0087  833e3a4805       cmp word ptr [0x483a], 5                 
  008c  7de3             jge 0x71                                 
  008e  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0093  90               nop                                      
  0094  0e               push cs                                  
  0095  e81a00           call 0xb2                                
  0098  c7066a160100     mov word ptr [0x166a], 1                 
  009e  6a02             push 2                                   
  00a0  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  00a5  59               pop cx                                   
  00a6  90               nop                                      
  00a7  0e               push cs                                  
  00a8  e85602           call 0x301                               
  00ab  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  00b0  5d               pop bp                                   
  00b1  cb               retf                                     

ovl51_00b2:  ; ENTRY
  00b2  55               push bp                                  
  00b3  8bec             mov bp, sp                               
  00b5  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  00ba  6a03             push 3                                   
  00bc  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  00c1  59               pop cx                                   
  00c2  666800000300     push 0x30000                             
  00c8  666802000f00     push 0xf0002                             
  00ce  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  00d3  83c408           add sp, 8                                
  00d6  1e               push ds                                  
  00d7  681648           push 0x4816                              
  00da  66ff36c215       push dword ptr [0x15c2]                  
  00df  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  00e4  83c408           add sp, 8                                
  00e7  90               nop                                      
  00e8  0e               push cs                                  
  00e9  e80700           call 0xf3                                
  00ec  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  00f1  5d               pop bp                                   
  00f2  cb               retf                                     

ovl51_00f3:  ; ENTRY
  00f3  55               push bp                                  
  00f4  8bec             mov bp, sp                               
  00f6  56               push si                                  
  00f7  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  00fc  6a03             push 3                                   
  00fe  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  0103  59               pop cx                                   
  0104  1e               push ds                                  
  0105  68a615           push 0x15a6                              
  0108  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  010d  83c404           add sp, 4                                
  0110  666804000200     push 0x20004                             
  0116  1e               push ds                                  
  0117  68a615           push 0x15a6                              
  011a  9ae502d014       lcall 0x14d0, 0x2e5                      -> 14d0:02e5
  011f  83c408           add sp, 8                                
  0122  33f6             xor si, si                               
  0124  eb58             jmp 0x17e                                
  0126  8bde             mov bx, si                               
  0128  d1e3             shl bx, 1                                
  012a  83bf304800       cmp word ptr [bx + 0x4830], 0            
  012f  7c4c             jl 0x17d                                 
  0131  3b363a48         cmp si, word ptr [0x483a]                
  0135  750a             jne 0x141                                
  0137  666800000300     push 0x30000                             
  013d  6a0f             push 0xf                                 
  013f  eb08             jmp 0x149                                
  0141  666800000300     push 0x30000                             
  0147  6a02             push 2                                   
  0149  6a02             push 2                                   
  014b  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0150  83c408           add sp, 8                                
  0153  8bde             mov bx, si                               
  0155  d1e3             shl bx, 1                                
  0157  8b873048         mov ax, word ptr [bx + 0x4830]           
  015b  c1e005           shl ax, 5                                
  015e  053c48           add ax, 0x483c                           
  0161  1e               push ds                                  
  0162  50               push ax                                  
  0163  8bde             mov bx, si                               
  0165  c1e302           shl bx, 2                                
  0168  ffb7b015         push word ptr [bx + 0x15b0]              
  016c  8bde             mov bx, si                               
  016e  c1e302           shl bx, 2                                
  0171  ffb7ae15         push word ptr [bx + 0x15ae]              
  0175  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  017a  83c408           add sp, 8                                
  017d  46               inc si                                   
  017e  83fe05           cmp si, 5                                
  0181  7ca3             jl 0x126                                 
  0183  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0188  5e               pop si                                   
  0189  5d               pop bp                                   
  018a  cb               retf                                     

ovl51_018b:  ; ENTRY
  018b  55               push bp                                  
  018c  8bec             mov bp, sp                               
  018e  8b5606           mov dx, word ptr [bp + 6]                
  0191  8bda             mov bx, dx                               
  0193  d1e3             shl bx, 1                                
  0195  83bf304800       cmp word ptr [bx + 0x4830], 0            
  019a  7c08             jl 0x1a4                                 
  019c  89163a48         mov word ptr [0x483a], dx                
  01a0  0e               push cs                                  
  01a1  e84fff           call 0xf3                                
  01a4  90               nop                                      
  01a5  0e               push cs                                  
  01a6  e85801           call 0x301                               
  01a9  5d               pop bp                                   
  01aa  cb               retf                                     

ovl51_01ab:  ; ENTRY
  01ab  55               push bp                                  
  01ac  8bec             mov bp, sp                               
  01ae  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  01b3  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  01b8  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  01bd  c7066a160000     mov word ptr [0x166a], 0                 
  01c3  8b1e3a48         mov bx, word ptr [0x483a]                
  01c7  d1e3             shl bx, 1                                
  01c9  ffb73048         push word ptr [bx + 0x4830]              
  01cd  ff1e2a48         lcall [0x482a]                           
  01d1  59               pop cx                                   
  01d2  5d               pop bp                                   
  01d3  cb               retf                                     

ovl51_01d4:  ; ENTRY
  01d4  55               push bp                                  
  01d5  8bec             mov bp, sp                               
  01d7  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  01dc  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  01e1  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  01e6  c7066a160000     mov word ptr [0x166a], 0                 
  01ec  6aff             push -1                                  
  01ee  ff1e2a48         lcall [0x482a]                           
  01f2  59               pop cx                                   
  01f3  5d               pop bp                                   
  01f4  cb               retf                                     

ovl51_01f5:  ; ENTRY
  01f5  55               push bp                                  
  01f6  8bec             mov bp, sp                               
  01f8  ba0500           mov dx, 5                                
  01fb  eb1e             jmp 0x21b                                
  01fd  0bd2             or dx, dx                                
  01ff  7e12             jle 0x213                                
  0201  8bda             mov bx, dx                               
  0203  d1e3             shl bx, 1                                
  0205  8b872e48         mov ax, word ptr [bx + 0x482e]           
  0209  8bda             mov bx, dx                               
  020b  d1e3             shl bx, 1                                
  020d  89873048         mov word ptr [bx + 0x4830], ax           
  0211  eb08             jmp 0x21b                                
  0213  8bda             mov bx, dx                               
  0215  d1e3             shl bx, 1                                
  0217  ff8f3048         dec word ptr [bx + 0x4830]               
  021b  8bc2             mov ax, dx                               
  021d  4a               dec dx                                   
  021e  0bc0             or ax, ax                                
  0220  75db             jne 0x1fd                                
  0222  ff063a48         inc word ptr [0x483a]                    
  0226  833e3a4805       cmp word ptr [0x483a], 5                 
  022b  7c06             jl 0x233                                 
  022d  c7063a480400     mov word ptr [0x483a], 4                 
  0233  0e               push cs                                  
  0234  e8bcfe           call 0xf3                                
  0237  90               nop                                      
  0238  0e               push cs                                  
  0239  e8c500           call 0x301                               
  023c  5d               pop bp                                   
  023d  cb               retf                                     

ovl51_023e:  ; ENTRY
  023e  55               push bp                                  
  023f  8bec             mov bp, sp                               
  0241  33d2             xor dx, dx                               
  0243  eb20             jmp 0x265                                
  0245  83fa04           cmp dx, 4                                
  0248  7d12             jge 0x25c                                
  024a  8bda             mov bx, dx                               
  024c  d1e3             shl bx, 1                                
  024e  8b873248         mov ax, word ptr [bx + 0x4832]           
  0252  8bda             mov bx, dx                               
  0254  d1e3             shl bx, 1                                
  0256  89873048         mov word ptr [bx + 0x4830], ax           
  025a  eb08             jmp 0x264                                
  025c  8bda             mov bx, dx                               
  025e  d1e3             shl bx, 1                                
  0260  ff873048         inc word ptr [bx + 0x4830]               
  0264  42               inc dx                                   
  0265  83fa05           cmp dx, 5                                
  0268  7cdb             jl 0x245                                 
  026a  ff0e3a48         dec word ptr [0x483a]                    
  026e  833e3a4800       cmp word ptr [0x483a], 0                 
  0273  7d06             jge 0x27b                                
  0275  c7063a480000     mov word ptr [0x483a], 0                 
  027b  0e               push cs                                  
  027c  e874fe           call 0xf3                                
  027f  90               nop                                      
  0280  0e               push cs                                  
  0281  e87d00           call 0x301                               
  0284  5d               pop bp                                   
  0285  cb               retf                                     

ovl51_0286:  ; ENTRY
  0286  55               push bp                                  
  0287  8bec             mov bp, sp                               
  0289  83ec02           sub sp, 2                                
  028c  833e304805       cmp word ptr [0x4830], 5                 
  0291  7e05             jle 0x298                                
  0293  b80500           mov ax, 5                                
  0296  eb03             jmp 0x29b                                
  0298  a13048           mov ax, word ptr [0x4830]                
  029b  8946fe           mov word ptr [bp - 2], ax                
  029e  33d2             xor dx, dx                               
  02a0  eb0c             jmp 0x2ae                                
  02a2  8bda             mov bx, dx                               
  02a4  d1e3             shl bx, 1                                
  02a6  8b46fe           mov ax, word ptr [bp - 2]                
  02a9  29873048         sub word ptr [bx + 0x4830], ax           
  02ad  42               inc dx                                   
  02ae  83fa05           cmp dx, 5                                
  02b1  7cef             jl 0x2a2                                 
  02b3  0e               push cs                                  
  02b4  e83cfe           call 0xf3                                
  02b7  90               nop                                      
  02b8  0e               push cs                                  
  02b9  e84500           call 0x301                               
  02bc  c9               leave                                    
  02bd  cb               retf                                     

ovl51_02be:  ; ENTRY
  02be  55               push bp                                  
  02bf  8bec             mov bp, sp                               
  02c1  83ec02           sub sp, 2                                
  02c4  a12e48           mov ax, word ptr [0x482e]                
  02c7  2b063848         sub ax, word ptr [0x4838]                
  02cb  48               dec ax                                   
  02cc  3d0500           cmp ax, 5                                
  02cf  7e05             jle 0x2d6                                
  02d1  b80500           mov ax, 5                                
  02d4  eb08             jmp 0x2de                                
  02d6  a12e48           mov ax, word ptr [0x482e]                
  02d9  2b063848         sub ax, word ptr [0x4838]                
  02dd  48               dec ax                                   
  02de  8946fe           mov word ptr [bp - 2], ax                
  02e1  33d2             xor dx, dx                               
  02e3  eb0c             jmp 0x2f1                                
  02e5  8bda             mov bx, dx                               
  02e7  d1e3             shl bx, 1                                
  02e9  8b46fe           mov ax, word ptr [bp - 2]                
  02ec  01873048         add word ptr [bx + 0x4830], ax           
  02f0  42               inc dx                                   
  02f1  83fa05           cmp dx, 5                                
  02f4  7cef             jl 0x2e5                                 
  02f6  0e               push cs                                  
  02f7  e8f9fd           call 0xf3                                
  02fa  90               nop                                      
  02fb  0e               push cs                                  
  02fc  e80200           call 0x301                               
  02ff  c9               leave                                    
  0300  cb               retf                                     

ovl51_0301:  ; ENTRY
  0301  55               push bp                                  
  0302  8bec             mov bp, sp                               
  0304  83ec06           sub sp, 6                                
  0307  56               push si                                  
  0308  57               push di                                  
  0309  bf0100           mov di, 1                                
  030c  c746fe0100       mov word ptr [bp - 2], 1                 
  0311  c746fc0100       mov word ptr [bp - 4], 1                 
  0316  c746fa0100       mov word ptr [bp - 6], 1                 
  031b  33f6             xor si, si                               
  031d  eb11             jmp 0x330                                
  031f  6a01             push 1                                   
  0321  8bc6             mov ax, si                               
  0323  057200           add ax, 0x72                             
  0326  50               push ax                                  
  0327  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  032c  83c404           add sp, 4                                
  032f  46               inc si                                   
  0330  83fe05           cmp si, 5                                
  0333  7cea             jl 0x31f                                 
  0335  833e2e4805       cmp word ptr [0x482e], 5                 
  033a  7e5d             jle 0x399                                
  033c  a12e48           mov ax, word ptr [0x482e]                
  033f  48               dec ax                                   
  0340  3b063848         cmp ax, word ptr [0x4838]                
  0344  7e07             jle 0x34d                                
  0346  833e384800       cmp word ptr [0x4838], 0                 
  034b  7d09             jge 0x356                                
  034d  b80200           mov ax, 2                                
  0350  8946fc           mov word ptr [bp - 4], ax                
  0353  8946fa           mov word ptr [bp - 6], ax                
  0356  833e304800       cmp word ptr [0x4830], 0                 
  035b  7f08             jg 0x365                                 
  035d  bf0200           mov di, 2                                
  0360  8bc7             mov ax, di                               
  0362  8946fe           mov word ptr [bp - 2], ax                
  0365  57               push di                                  
  0366  6a77             push 0x77                                
  0368  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  036d  83c404           add sp, 4                                
  0370  ff76fe           push word ptr [bp - 2]                   
  0373  6a79             push 0x79                                
  0375  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  037a  83c404           add sp, 4                                
  037d  ff76fa           push word ptr [bp - 6]                   
  0380  6a7a             push 0x7a                                
  0382  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0387  83c404           add sp, 4                                
  038a  ff76fc           push word ptr [bp - 4]                   
  038d  6a78             push 0x78                                
  038f  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0394  83c404           add sp, 4                                
  0397  eb20             jmp 0x3b9                                
  0399  6a77             push 0x77                                
  039b  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03a0  59               pop cx                                   
  03a1  6a79             push 0x79                                
  03a3  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03a8  59               pop cx                                   
  03a9  6a7a             push 0x7a                                
  03ab  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03b0  59               pop cx                                   
  03b1  6a78             push 0x78                                
  03b3  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  03b8  59               pop cx                                   
  03b9  66687b000100     push 0x1007b                             
  03bf  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  03c4  83c404           add sp, 4                                
  03c7  66687c000100     push 0x1007c                             
  03cd  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  03d2  83c404           add sp, 4                                
  03d5  5f               pop di                                   
  03d6  5e               pop si                                   
  03d7  c9               leave                                    
  03d8  cb               retf                                     

ovl51_03d9:  ; ENTRY
  03d9  55               push bp                                  
  03da  8bec             mov bp, sp                               
  03dc  83ec04           sub sp, 4                                
  03df  56               push si                                  
  03e0  57               push di                                  
  03e1  c746fe0000       mov word ptr [bp - 2], 0                 
  03e6  c7062e480000     mov word ptr [0x482e], 0                 
  03ec  8b5e06           mov bx, word ptr [bp + 6]                
  03ef  83fb07           cmp bx, 7                                
  03f2  7603             jbe 0x3f7                                
  03f4  e90003           jmp 0x6f7                                
  03f7  d1e3             shl bx, 1                                
  03f9  2effa7fb06       jmp word ptr cs:[bx + 0x6fb]             
ovl51_03fe:  ; case
  03fe  c7062e480000     mov word ptr [0x482e], 0                 
  0404  33f6             xor si, si                               
  0406  eb15             jmp 0x41d                                
  0408  8bde             mov bx, si                               
  040a  d1e3             shl bx, 1                                
  040c  c787fc4b0000     mov word ptr [bx + 0x4bfc], 0            
  0412  8bde             mov bx, si                               
  0414  c1e305           shl bx, 5                                
  0417  c6873c4800       mov byte ptr [bx + 0x483c], 0            
  041c  46               inc si                                   
  041d  83fe1e           cmp si, 0x1e                             
  0420  7ce6             jl 0x408                                 
  0422  e9d202           jmp 0x6f7                                
ovl51_0425:  ; case
  0425  b8042c           mov ax, 0x2c04                           
  0428  8ec0             mov es, ax                               
  042a  268b3e8101       mov di, word ptr es:[0x181]              
  042f  eb1b             jmp 0x44c                                
  0431  8bc7             mov ax, di                               
  0433  6bc016           imul ax, ax, 0x16                        
  0436  ba1d1e           mov dx, 0x1e1d                           
  0439  bb0000           mov bx, 0                                
  043c  03d8             add bx, ax                               
  043e  81c38088         add bx, 0x8880                           
  0442  3b560e           cmp dx, word ptr [bp + 0xe]              
  0445  7505             jne 0x44c                                
  0447  3b5e0c           cmp bx, word ptr [bp + 0xc]              
  044a  7407             je 0x453                                 
  044c  8bc7             mov ax, di                               
  044e  4f               dec di                                   
  044f  0bc0             or ax, ax                                
  0451  75de             jne 0x431                                
  0453  c45e0c           les bx, ptr [bp + 0xc]                   
  0456  268b07           mov ax, word ptr es:[bx]                 
  0459  894608           mov word ptr [bp + 8], ax                
  045c  268b4702         mov ax, word ptr es:[bx + 2]             
  0460  89460a           mov word ptr [bp + 0xa], ax              
  0463  33f6             xor si, si                               
  0465  eb51             jmp 0x4b8                                
  0467  8bde             mov bx, si                               
  0469  6bdb1d           imul bx, bx, 0x1d                        
  046c  b8042c           mov ax, 0x2c04                           
  046f  8ec0             mov es, ax                               
  0471  2680bfff0c03     cmp byte ptr es:[bx + 0xcff], 3          
  0477  753e             jne 0x4b7                                
  0479  8bde             mov bx, si                               
  047b  6bdb1d           imul bx, bx, 0x1d                        
  047e  b8042c           mov ax, 0x2c04                           
  0481  8ec0             mov es, ax                               
  0483  2639bf000d       cmp word ptr es:[bx + 0xd00], di         
  0488  752d             jne 0x4b7                                
  048a  8b1e2e48         mov bx, word ptr [0x482e]                
  048e  d1e3             shl bx, 1                                
  0490  89b7fc4b         mov word ptr [bx + 0x4bfc], si           
  0494  8bc6             mov ax, si                               
  0496  6bc01d           imul ax, ax, 0x1d                        
  0499  05e90c           add ax, 0xce9                            
  049c  68042c           push 0x2c04                              
  049f  50               push ax                                  
  04a0  a12e48           mov ax, word ptr [0x482e]                
  04a3  c1e005           shl ax, 5                                
  04a6  053c48           add ax, 0x483c                           
  04a9  1e               push ds                                  
  04aa  50               push ax                                  
  04ab  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  04b0  83c408           add sp, 8                                
  04b3  ff062e48         inc word ptr [0x482e]                    
  04b7  46               inc si                                   
  04b8  83fe16           cmp si, 0x16                             
  04bb  7caa             jl 0x467                                 
  04bd  33f6             xor si, si                               
  04bf  eb68             jmp 0x529                                
  04c1  8bde             mov bx, si                               
  04c3  6bdb1d           imul bx, bx, 0x1d                        
  04c6  b8042c           mov ax, 0x2c04                           
  04c9  8ec0             mov es, ax                               
  04cb  268b87020d       mov ax, word ptr es:[bx + 0xd02]         
  04d0  3b4608           cmp ax, word ptr [bp + 8]                
  04d3  7553             jne 0x528                                
  04d5  8bde             mov bx, si                               
  04d7  6bdb1d           imul bx, bx, 0x1d                        
  04da  b8042c           mov ax, 0x2c04                           
  04dd  8ec0             mov es, ax                               
  04df  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  04e4  3b460a           cmp ax, word ptr [bp + 0xa]              
  04e7  753f             jne 0x528                                
  04e9  8bde             mov bx, si                               
  04eb  6bdb1d           imul bx, bx, 0x1d                        
  04ee  b8042c           mov ax, 0x2c04                           
  04f1  8ec0             mov es, ax                               
  04f3  2680bfff0c01     cmp byte ptr es:[bx + 0xcff], 1          
  04f9  752d             jne 0x528                                
  04fb  8b1e2e48         mov bx, word ptr [0x482e]                
  04ff  d1e3             shl bx, 1                                
  0501  89b7fc4b         mov word ptr [bx + 0x4bfc], si           
  0505  8bc6             mov ax, si                               
  0507  6bc01d           imul ax, ax, 0x1d                        
  050a  05e90c           add ax, 0xce9                            
  050d  68042c           push 0x2c04                              
  0510  50               push ax                                  
  0511  a12e48           mov ax, word ptr [0x482e]                
  0514  c1e005           shl ax, 5                                
  0517  053c48           add ax, 0x483c                           
  051a  1e               push ds                                  
  051b  50               push ax                                  
  051c  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0521  83c408           add sp, 8                                
  0524  ff062e48         inc word ptr [0x482e]                    
  0528  46               inc si                                   
  0529  83fe16           cmp si, 0x16                             
  052c  7c93             jl 0x4c1                                 
  052e  e9c601           jmp 0x6f7                                
ovl51_0531:  ; case
  0531  b8042c           mov ax, 0x2c04                           
  0534  8ec0             mov es, ax                               
  0536  268b3e8101       mov di, word ptr es:[0x181]              
  053b  eb1b             jmp 0x558                                
  053d  8bc7             mov ax, di                               
  053f  6bc016           imul ax, ax, 0x16                        
  0542  ba1d1e           mov dx, 0x1e1d                           
  0545  bb0000           mov bx, 0                                
  0548  03d8             add bx, ax                               
  054a  81c38088         add bx, 0x8880                           
  054e  3b560e           cmp dx, word ptr [bp + 0xe]              
  0551  7505             jne 0x558                                
  0553  3b5e0c           cmp bx, word ptr [bp + 0xc]              
  0556  7407             je 0x55f                                 
  0558  8bc7             mov ax, di                               
  055a  4f               dec di                                   
  055b  0bc0             or ax, ax                                
  055d  75de             jne 0x53d                                
  055f  33f6             xor si, si                               
  0561  eb51             jmp 0x5b4                                
  0563  8bde             mov bx, si                               
  0565  6bdb1d           imul bx, bx, 0x1d                        
  0568  b8042c           mov ax, 0x2c04                           
  056b  8ec0             mov es, ax                               
  056d  2680bfff0c03     cmp byte ptr es:[bx + 0xcff], 3          
  0573  753e             jne 0x5b3                                
  0575  8bde             mov bx, si                               
  0577  6bdb1d           imul bx, bx, 0x1d                        
  057a  b8042c           mov ax, 0x2c04                           
  057d  8ec0             mov es, ax                               
  057f  2639bf000d       cmp word ptr es:[bx + 0xd00], di         
  0584  752d             jne 0x5b3                                
  0586  8b1e2e48         mov bx, word ptr [0x482e]                
  058a  d1e3             shl bx, 1                                
  058c  89b7fc4b         mov word ptr [bx + 0x4bfc], si           
  0590  8bc6             mov ax, si                               
  0592  6bc01d           imul ax, ax, 0x1d                        
  0595  05e90c           add ax, 0xce9                            
  0598  68042c           push 0x2c04                              
  059b  50               push ax                                  
  059c  a12e48           mov ax, word ptr [0x482e]                
  059f  c1e005           shl ax, 5                                
  05a2  053c48           add ax, 0x483c                           
  05a5  1e               push ds                                  
  05a6  50               push ax                                  
  05a7  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  05ac  83c408           add sp, 8                                
  05af  ff062e48         inc word ptr [0x482e]                    
  05b3  46               inc si                                   
  05b4  83fe16           cmp si, 0x16                             
  05b7  7caa             jl 0x563                                 
  05b9  e93b01           jmp 0x6f7                                
ovl51_05bc:  ; case
  05bc  c7062e480000     mov word ptr [0x482e], 0                 
  05c2  33f6             xor si, si                               
  05c4  eb68             jmp 0x62e                                
  05c6  8bde             mov bx, si                               
  05c8  6bdb1d           imul bx, bx, 0x1d                        
  05cb  b8042c           mov ax, 0x2c04                           
  05ce  8ec0             mov es, ax                               
  05d0  268b87020d       mov ax, word ptr es:[bx + 0xd02]         
  05d5  3b4608           cmp ax, word ptr [bp + 8]                
  05d8  7553             jne 0x62d                                
  05da  8bde             mov bx, si                               
  05dc  6bdb1d           imul bx, bx, 0x1d                        
  05df  b8042c           mov ax, 0x2c04                           
  05e2  8ec0             mov es, ax                               
  05e4  268b87040d       mov ax, word ptr es:[bx + 0xd04]         
  05e9  3b460a           cmp ax, word ptr [bp + 0xa]              
  05ec  753f             jne 0x62d                                
  05ee  8bde             mov bx, si                               
  05f0  6bdb1d           imul bx, bx, 0x1d                        
  05f3  b8042c           mov ax, 0x2c04                           
  05f6  8ec0             mov es, ax                               
  05f8  2680bfff0c01     cmp byte ptr es:[bx + 0xcff], 1          
  05fe  752d             jne 0x62d                                
  0600  8b1e2e48         mov bx, word ptr [0x482e]                
  0604  d1e3             shl bx, 1                                
  0606  89b7fc4b         mov word ptr [bx + 0x4bfc], si           
  060a  8bc6             mov ax, si                               
  060c  6bc01d           imul ax, ax, 0x1d                        
  060f  05e90c           add ax, 0xce9                            
  0612  68042c           push 0x2c04                              
  0615  50               push ax                                  
  0616  a12e48           mov ax, word ptr [0x482e]                
  0619  c1e005           shl ax, 5                                
  061c  053c48           add ax, 0x483c                           
  061f  1e               push ds                                  
  0620  50               push ax                                  
  0621  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0626  83c408           add sp, 8                                
  0629  ff062e48         inc word ptr [0x482e]                    
  062d  46               inc si                                   
  062e  83fe16           cmp si, 0x16                             
  0631  7c93             jl 0x5c6                                 
  0633  e9c100           jmp 0x6f7                                
ovl51_0636:  ; case
  0636  c7062e480000     mov word ptr [0x482e], 0                 
  063c  33ff             xor di, di                               
  063e  1e               push ds                                  
  063f  68c615           push 0x15c6                              
  0642  1e               push ds                                  
  0643  68885c           push 0x5c88                              
  0646  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  064b  83c408           add sp, 8                                
  064e  e99800           jmp 0x6e9                                
  0651  57               push di                                  
  0652  8b5e08           mov bx, word ptr [bp + 8]                
  0655  8a87885c         mov al, byte ptr [bx + 0x5c88]           
  0659  98               cwde                                     
  065a  50               push ax                                  
  065b  1e               push ds                                  
  065c  68ca15           push 0x15ca                               ; "CARDS\%c%03d.DSC"
  065f  1e               push ds                                  
  0660  68385c           push 0x5c38                              
  0663  9a44490000       lcall 0, 0x4944                          -> 0000:4944
  0668  83c40c           add sp, 0xc                              
  066b  1e               push ds                                  
  066c  68385c           push 0x5c38                              
  066f  9a2a00c130       lcall 0x30c1, 0x2a                       -> ovl59:0375
  0674  83c404           add sp, 4                                
  0677  0bc0             or ax, ax                                
  0679  7469             je 0x6e4                                 
  067b  6a02             push 2                                   
  067d  1e               push ds                                  
  067e  68385c           push 0x5c38                              
  0681  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0686  83c406           add sp, 6                                
  0689  8946fc           mov word ptr [bp - 4], ax                
  068c  6a28             push 0x28                                
  068e  1e               push ds                                  
  068f  68385c           push 0x5c38                              
  0692  50               push ax                                  
  0693  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0698  83c408           add sp, 8                                
  069b  33f6             xor si, si                               
  069d  eb0f             jmp 0x6ae                                
  069f  80bc385c0d       cmp byte ptr [si + 0x5c38], 0xd          
  06a4  7507             jne 0x6ad                                
  06a6  c684385c00       mov byte ptr [si + 0x5c38], 0            
  06ab  eb06             jmp 0x6b3                                
  06ad  46               inc si                                   
  06ae  83fe28           cmp si, 0x28                             
  06b1  7cec             jl 0x69f                                 
  06b3  ff76fc           push word ptr [bp - 4]                   
  06b6  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  06bb  59               pop cx                                   
  06bc  8b1e2e48         mov bx, word ptr [0x482e]                
  06c0  d1e3             shl bx, 1                                
  06c2  89bffc4b         mov word ptr [bx + 0x4bfc], di           
  06c6  1e               push ds                                  
  06c7  68385c           push 0x5c38                              
  06ca  a12e48           mov ax, word ptr [0x482e]                
  06cd  c1e005           shl ax, 5                                
  06d0  053c48           add ax, 0x483c                           
  06d3  1e               push ds                                  
  06d4  50               push ax                                  
  06d5  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  06da  83c408           add sp, 8                                
  06dd  ff062e48         inc word ptr [0x482e]                    
  06e1  47               inc di                                   
  06e2  eb05             jmp 0x6e9                                
  06e4  c746fe0100       mov word ptr [bp - 2], 1                 
  06e9  837efe00         cmp word ptr [bp - 2], 0                 
  06ed  7508             jne 0x6f7                                
  06ef  83ff1e           cmp di, 0x1e                             
  06f2  7d03             jge 0x6f7                                
  06f4  e95aff           jmp 0x651                                
ovl51_06f7:  ; case
  06f7  5f               pop di                                   
  06f8  5e               pop si                                   
  06f9  c9               leave                                    
  06fa  cb               retf                                     
  06fb  fe03f7063105bc05 dw 03fe,06f7,0531,05bc,06f7,06f7,0425,0636 jump table
