; ovl33 stub 300f file_off 0x589d0 size 0x62f

ovl33_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  6a04             push 4                                   
  0005  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  000a  59               pop cx                                   
  000b  6a09             push 9                                   
  000d  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0012  59               pop cx                                   
  0013  6668ffff0100     push 0x1ffff                             
  0019  90               nop                                      
  001a  0e               push cs                                  
  001b  e81901           call 0x137                               
  001e  83c404           add sp, 4                                
  0021  c7066a160100     mov word ptr [0x166a], 1                 
  0027  8b4606           mov ax, word ptr [bp + 6]                
  002a  a3f00b           mov word ptr [0xbf0], ax                 
  002d  90               nop                                      
  002e  0e               push cs                                  
  002f  e83500           call 0x67                                
  0032  5d               pop bp                                   
  0033  cb               retf                                     

ovl33_0034:  ; ENTRY
  0034  55               push bp                                  
  0035  8bec             mov bp, sp                               
  0037  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  003c  833ef00b00       cmp word ptr [0xbf0], 0                  
  0041  740f             je 0x52                                  
  0043  666a00           push 0                                   
  0046  6a00             push 0                                   
  0048  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  004d  83c406           add sp, 6                                
  0050  eb13             jmp 0x65                                 
  0052  c7066a160000     mov word ptr [0x166a], 0                 
  0058  6a00             push 0                                   
  005a  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  005f  59               pop cx                                   
  0060  9a7a00d730       lcall 0x30d7, 0x7a                       -> ovl61:2123
  0065  5d               pop bp                                   
  0066  cb               retf                                     

ovl33_0067:  ; ENTRY
  0067  55               push bp                                  
  0068  8bec             mov bp, sp                               
  006a  56               push si                                  
  006b  6668fb000100     push 0x100fb                             
  0071  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0076  83c404           add sp, 4                                
  0079  803ea33700       cmp byte ptr [0x37a3], 0                 
  007e  7404             je 0x84                                  
  0080  6a01             push 1                                   
  0082  eb02             jmp 0x86                                 
  0084  6a02             push 2                                   
  0086  681401           push 0x114                               
  0089  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  008e  83c404           add sp, 4                                
  0091  803ea23700       cmp byte ptr [0x37a2], 0                 
  0096  7404             je 0x9c                                  
  0098  6a01             push 1                                   
  009a  eb02             jmp 0x9e                                 
  009c  6a02             push 2                                   
  009e  681501           push 0x115                               
  00a1  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  00a6  83c404           add sp, 4                                
  00a9  666816010100     push 0x10116                             
  00af  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  00b4  83c404           add sp, 4                                
  00b7  33f6             xor si, si                               
  00b9  eb74             jmp 0x12f                                
  00bb  8bde             mov bx, si                               
  00bd  d1e3             shl bx, 1                                
  00bf  b8042c           mov ax, 0x2c04                           
  00c2  8ec0             mov es, ax                               
  00c4  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  00ca  743e             je 0x10a                                 
  00cc  6a01             push 1                                   
  00ce  8bc6             mov ax, si                               
  00d0  05fc00           add ax, 0xfc                             
  00d3  50               push ax                                  
  00d4  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  00d9  83c404           add sp, 4                                
  00dc  6a01             push 1                                   
  00de  8bc6             mov ax, si                               
  00e0  050401           add ax, 0x104                            
  00e3  50               push ax                                  
  00e4  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  00e9  83c404           add sp, 4                                
  00ec  b8d000           mov ax, 0xd0                             
  00ef  0d042c           or ax, 0x2c04                            
  00f2  7512             jne 0x106                                
  00f4  6a02             push 2                                   
  00f6  8bc6             mov ax, si                               
  00f8  050c01           add ax, 0x10c                            
  00fb  50               push ax                                  
  00fc  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0101  83c404           add sp, 4                                
  0104  eb28             jmp 0x12e                                
  0106  6a01             push 1                                   
  0108  ebec             jmp 0xf6                                 
  010a  8bc6             mov ax, si                               
  010c  05fc00           add ax, 0xfc                             
  010f  50               push ax                                  
  0110  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0115  59               pop cx                                   
  0116  8bc6             mov ax, si                               
  0118  050401           add ax, 0x104                            
  011b  50               push ax                                  
  011c  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  0121  59               pop cx                                   
  0122  8bc6             mov ax, si                               
  0124  050c01           add ax, 0x10c                            
  0127  50               push ax                                  
  0128  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  012d  59               pop cx                                   
  012e  46               inc si                                   
  012f  83fe08           cmp si, 8                                
  0132  7c87             jl 0xbb                                  
  0134  5e               pop si                                   
  0135  5d               pop bp                                   
  0136  cb               retf                                     

ovl33_0137:  ; ENTRY
  0137  55               push bp                                  
  0138  8bec             mov bp, sp                               
  013a  83ec08           sub sp, 8                                
  013d  56               push si                                  
  013e  57               push di                                  
  013f  8b7e06           mov di, word ptr [bp + 6]                
  0142  0bff             or di, di                                
  0144  7d04             jge 0x14a                                
  0146  33c0             xor ax, ax                               
  0148  eb02             jmp 0x14c                                
  014a  8bc7             mov ax, di                               
  014c  8bf0             mov si, ax                               
  014e  0bff             or di, di                                
  0150  7d05             jge 0x157                                
  0152  b80800           mov ax, 8                                
  0155  eb03             jmp 0x15a                                
  0157  8bc7             mov ax, di                               
  0159  40               inc ax                                   
  015a  8946fe           mov word ptr [bp - 2], ax                
  015d  83fffe           cmp di, -2                               
  0160  7503             jne 0x165                                
  0162  8b76fe           mov si, word ptr [bp - 2]                
  0165  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  016a  0bff             or di, di                                
  016c  7d7c             jge 0x1ea                                
  016e  6a03             push 3                                   
  0170  b8042c           mov ax, 0x2c04                           
  0173  8ec0             mov es, ax                               
  0175  268b1e1001       mov bx, word ptr es:[0x110]              
  017a  d1e3             shl bx, 1                                
  017c  b8042c           mov ax, 0x2c04                           
  017f  8ec0             mov es, ax                               
  0181  26ffb7b000       push word ptr es:[bx + 0xb0]             
  0186  b8042c           mov ax, 0x2c04                           
  0189  8ec0             mov es, ax                               
  018b  268b1e1001       mov bx, word ptr es:[0x110]              
  0190  d1e3             shl bx, 1                                
  0192  b8042c           mov ax, 0x2c04                           
  0195  8ec0             mov es, ax                               
  0197  26ffb7a000       push word ptr es:[bx + 0xa0]             
  019c  6a02             push 2                                   
  019e  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  01a3  83c408           add sp, 8                                
  01a6  1e               push ds                                  
  01a7  680c0c           push 0xc0c                                ; "Name"
  01aa  66ff36e40a       push dword ptr [0xae4]                   
  01af  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  01b4  83c408           add sp, 8                                
  01b7  1e               push ds                                  
  01b8  68110c           push 0xc11                                ; "Human"
  01bb  66ff36e80a       push dword ptr [0xae8]                   
  01c0  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  01c5  83c408           add sp, 8                                
  01c8  1e               push ds                                  
  01c9  68170c           push 0xc17                                ; "Enhanced"
  01cc  66ff36ec0a       push dword ptr [0xaec]                   
  01d1  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  01d6  83c408           add sp, 8                                
  01d9  1e               push ds                                  
  01da  68200c           push 0xc20                                ; "Observe"
  01dd  66ff36f00a       push dword ptr [0xaf0]                   
  01e2  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  01e7  83c408           add sp, 8                                
  01ea  e91702           jmp 0x404                                
  01ed  8bde             mov bx, si                               
  01ef  c1e303           shl bx, 3                                
  01f2  ffb7960b         push word ptr [bx + 0xb96]               
  01f6  8bde             mov bx, si                               
  01f8  c1e303           shl bx, 3                                
  01fb  ffb7940b         push word ptr [bx + 0xb94]               
  01ff  16               push ss                                  
  0200  8d46f8           lea ax, [bp - 8]                         
  0203  50               push ax                                  
  0204  9a0e006d11       lcall 0x116d, 0xe                        -> 116d:000e
  0209  83c408           add sp, 8                                
  020c  0bff             or di, di                                
  020e  7c28             jl 0x238                                 
  0210  8bde             mov bx, si                               
  0212  c1e303           shl bx, 3                                
  0215  8b97960b         mov dx, word ptr [bx + 0xb96]            
  0219  83c2ce           add dx, -0x32                            
  021c  837e0800         cmp word ptr [bp + 8], 0                 
  0220  7416             je 0x238                                 
  0222  b86801           mov ax, 0x168                            
  0225  2bc2             sub ax, dx                               
  0227  05e3ff           add ax, 0xffe3                           
  022a  50               push ax                                  
  022b  6a00             push 0                                   
  022d  52               push dx                                  
  022e  6a00             push 0                                   
  0230  9a2f00ac2f       lcall 0x2fac, 0x2f                       -> ovl17:07e4
  0235  83c408           add sp, 8                                
  0238  6a03             push 3                                   
  023a  8bde             mov bx, si                               
  023c  d1e3             shl bx, 1                                
  023e  b8042c           mov ax, 0x2c04                           
  0241  8ec0             mov es, ax                               
  0243  26ffb7b000       push word ptr es:[bx + 0xb0]             
  0248  8bde             mov bx, si                               
  024a  d1e3             shl bx, 1                                
  024c  b8042c           mov ax, 0x2c04                           
  024f  8ec0             mov es, ax                               
  0251  26ffb7a000       push word ptr es:[bx + 0xa0]             
  0256  6a02             push 2                                   
  0258  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  025d  83c408           add sp, 8                                
  0260  8bc6             mov ax, si                               
  0262  6bc014           imul ax, ax, 0x14                        
  0265  050000           add ax, 0                                
  0268  68042c           push 0x2c04                              
  026b  50               push ax                                  
  026c  8bde             mov bx, si                               
  026e  c1e302           shl bx, 2                                
  0271  ffb7f60a         push word ptr [bx + 0xaf6]               
  0275  8bde             mov bx, si                               
  0277  c1e302           shl bx, 2                                
  027a  ffb7f40a         push word ptr [bx + 0xaf4]               
  027e  9a5700c130       lcall 0x30c1, 0x57                       -> ovl59:0103
  0283  83c408           add sp, 8                                
  0286  666800000300     push 0x30000                             
  028c  666802000f00     push 0xf0002                             
  0292  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0297  83c408           add sp, 8                                
  029a  8bde             mov bx, si                               
  029c  d1e3             shl bx, 1                                
  029e  b8042c           mov ax, 0x2c04                           
  02a1  8ec0             mov es, ax                               
  02a3  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  02a9  753d             jne 0x2e8                                
  02ab  1e               push ds                                  
  02ac  68280c           push 0xc28                                ; "Not used"
  02af  8bc6             mov ax, si                               
  02b1  6bc014           imul ax, ax, 0x14                        
  02b4  050000           add ax, 0                                
  02b7  68042c           push 0x2c04                              
  02ba  50               push ax                                  
  02bb  9a404a0000       lcall 0, 0x4a40                          -> 0000:4a40
  02c0  83c408           add sp, 8                                
  02c3  0bc0             or ax, ax                                
  02c5  7421             je 0x2e8                                 
  02c7  1e               push ds                                  
  02c8  68310c           push 0xc31                                ; "Deceased!"
  02cb  8bde             mov bx, si                               
  02cd  c1e302           shl bx, 2                                
  02d0  ffb7360b         push word ptr [bx + 0xb36]               
  02d4  8bde             mov bx, si                               
  02d6  c1e302           shl bx, 2                                
  02d9  ffb7340b         push word ptr [bx + 0xb34]               
  02dd  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  02e2  83c408           add sp, 8                                
  02e5  e91b01           jmp 0x403                                
  02e8  8bde             mov bx, si                               
  02ea  d1e3             shl bx, 1                                
  02ec  b8042c           mov ax, 0x2c04                           
  02ef  8ec0             mov es, ax                               
  02f1  2683bf370100     cmp word ptr es:[bx + 0x137], 0          
  02f7  7503             jne 0x2fc                                
  02f9  e90701           jmp 0x403                                
  02fc  8bde             mov bx, si                               
  02fe  c1e302           shl bx, 2                                
  0301  66ffb7140b       push dword ptr [bx + 0xb14]              
  0306  8bde             mov bx, si                               
  0308  d1e3             shl bx, 1                                
  030a  b8042c           mov ax, 0x2c04                           
  030d  8ec0             mov es, ax                               
  030f  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0315  7405             je 0x31c                                 
  0317  b80100           mov ax, 1                                
  031a  eb02             jmp 0x31e                                
  031c  33c0             xor ax, ax                               
  031e  c1e003           shl ax, 3                                
  0321  8cda             mov dx, ds                               
  0323  05d40a           add ax, 0xad4                            
  0326  b90800           mov cx, 8                                
  0329  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  032e  6a08             push 8                                   
  0330  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0335  83c40e           add sp, 0xe                              
  0338  8bde             mov bx, si                               
  033a  d1e3             shl bx, 1                                
  033c  b8042c           mov ax, 0x2c04                           
  033f  8ec0             mov es, ax                               
  0341  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  0347  7505             jne 0x34e                                
  0349  b80300           mov ax, 3                                
  034c  eb0e             jmp 0x35c                                
  034e  8bde             mov bx, si                               
  0350  d1e3             shl bx, 1                                
  0352  b8042c           mov ax, 0x2c04                           
  0355  8ec0             mov es, ax                               
  0357  268b87c000       mov ax, word ptr es:[bx + 0xc0]          
  035c  8946fc           mov word ptr [bp - 4], ax                
  035f  8b5efc           mov bx, word ptr [bp - 4]                
  0362  c1e302           shl bx, 2                                
  0365  66ffb7c40a       push dword ptr [bx + 0xac4]              
  036a  8bde             mov bx, si                               
  036c  c1e302           shl bx, 2                                
  036f  ffb7360b         push word ptr [bx + 0xb36]               
  0373  8bde             mov bx, si                               
  0375  c1e302           shl bx, 2                                
  0378  ffb7340b         push word ptr [bx + 0xb34]               
  037c  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0381  83c408           add sp, 8                                
  0384  8bde             mov bx, si                               
  0386  c1e302           shl bx, 2                                
  0389  66ffb7540b       push dword ptr [bx + 0xb54]              
  038e  8bde             mov bx, si                               
  0390  d1e3             shl bx, 1                                
  0392  b8042c           mov ax, 0x2c04                           
  0395  8ec0             mov es, ax                               
  0397  268b87f000       mov ax, word ptr es:[bx + 0xf0]          
  039c  f7d8             neg ax                                   
  039e  1bc0             sbb ax, ax                               
  03a0  40               inc ax                                   
  03a1  c1e003           shl ax, 3                                
  03a4  8cda             mov dx, ds                               
  03a6  05d40a           add ax, 0xad4                            
  03a9  b90800           mov cx, 8                                
  03ac  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  03b1  6a08             push 8                                   
  03b3  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  03b8  83c40e           add sp, 0xe                              
  03bb  8bde             mov bx, si                               
  03bd  d1e3             shl bx, 1                                
  03bf  b8042c           mov ax, 0x2c04                           
  03c2  8ec0             mov es, ax                               
  03c4  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  03ca  7437             je 0x403                                 
  03cc  8bde             mov bx, si                               
  03ce  c1e302           shl bx, 2                                
  03d1  66ffb7740b       push dword ptr [bx + 0xb74]              
  03d6  8bde             mov bx, si                               
  03d8  d1e3             shl bx, 1                                
  03da  b8042c           mov ax, 0x2c04                           
  03dd  8ec0             mov es, ax                               
  03df  268b874701       mov ax, word ptr es:[bx + 0x147]         
  03e4  f7d8             neg ax                                   
  03e6  1bc0             sbb ax, ax                               
  03e8  40               inc ax                                   
  03e9  c1e003           shl ax, 3                                
  03ec  8cda             mov dx, ds                               
  03ee  05d40a           add ax, 0xad4                            
  03f1  b90800           mov cx, 8                                
  03f4  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  03f9  6a08             push 8                                   
  03fb  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0400  83c40e           add sp, 0xe                              
  0403  46               inc si                                   
  0404  3b76fe           cmp si, word ptr [bp - 2]                
  0407  7d03             jge 0x40c                                
  0409  e9e1fd           jmp 0x1ed                                
  040c  666800000300     push 0x30000                             
  0412  666802000f00     push 0xf0002                             
  0418  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  041d  83c408           add sp, 8                                
  0420  66ff36d40b       push dword ptr [0xbd4]                   
  0425  a1ee0b           mov ax, word ptr [0xbee]                 
  0428  f7d8             neg ax                                   
  042a  1bc0             sbb ax, ax                               
  042c  40               inc ax                                   
  042d  c1e003           shl ax, 3                                
  0430  8cda             mov dx, ds                               
  0432  05d40a           add ax, 0xad4                            
  0435  b90800           mov cx, 8                                
  0438  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  043d  6a08             push 8                                   
  043f  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  0444  83c40e           add sp, 0xe                              
  0447  66ff36d80b       push dword ptr [0xbd8]                   
  044c  a1ec0b           mov ax, word ptr [0xbec]                 
  044f  f7d8             neg ax                                   
  0451  1bc0             sbb ax, ax                               
  0453  40               inc ax                                   
  0454  c1e003           shl ax, 3                                
  0457  8cda             mov dx, ds                               
  0459  05d40a           add ax, 0xad4                            
  045c  b90800           mov cx, 8                                
  045f  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0464  6a08             push 8                                   
  0466  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  046b  83c40e           add sp, 0xe                              
  046e  66ff36dc0b       push dword ptr [0xbdc]                   
  0473  a1c826           mov ax, word ptr [0x26c8]                
  0476  c1e003           shl ax, 3                                
  0479  8cda             mov dx, ds                               
  047b  05d40a           add ax, 0xad4                            
  047e  b90800           mov cx, 8                                
  0481  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0486  6a08             push 8                                   
  0488  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  048d  83c40e           add sp, 0xe                              
  0490  1e               push ds                                  
  0491  683b0c           push 0xc3b                                ; "Music"
  0494  66ff36e00b       push dword ptr [0xbe0]                   
  0499  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  049e  83c408           add sp, 8                                
  04a1  1e               push ds                                  
  04a2  68410c           push 0xc41                                ; "Effects"
  04a5  66ff36e40b       push dword ptr [0xbe4]                   
  04aa  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  04af  83c408           add sp, 8                                
  04b2  1e               push ds                                  
  04b3  68490c           push 0xc49                                ; "Speech"
  04b6  66ff36e80b       push dword ptr [0xbe8]                   
  04bb  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  04c0  83c408           add sp, 8                                
  04c3  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  04c8  5f               pop di                                   
  04c9  5e               pop si                                   
  04ca  c9               leave                                    
  04cb  cb               retf                                     

ovl33_04cc:  ; ENTRY
  04cc  55               push bp                                  
  04cd  8bec             mov bp, sp                               
  04cf  8b4e06           mov cx, word ptr [bp + 6]                
  04d2  8bd9             mov bx, cx                               
  04d4  d1e3             shl bx, 1                                
  04d6  b8042c           mov ax, 0x2c04                           
  04d9  8ec0             mov es, ax                               
  04db  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  04e1  7505             jne 0x4e8                                
  04e3  b80100           mov ax, 1                                
  04e6  eb02             jmp 0x4ea                                
  04e8  33c0             xor ax, ax                               
  04ea  8bd9             mov bx, cx                               
  04ec  d1e3             shl bx, 1                                
  04ee  ba042c           mov dx, 0x2c04                           
  04f1  8ec2             mov es, dx                               
  04f3  268987d000       mov word ptr es:[bx + 0xd0], ax          
  04f8  6a01             push 1                                   
  04fa  51               push cx                                  
  04fb  0e               push cs                                  
  04fc  e838fc           call 0x137                               
  04ff  83c404           add sp, 4                                
  0502  0e               push cs                                  
  0503  e861fb           call 0x67                                
  0506  5d               pop bp                                   
  0507  cb               retf                                     

ovl33_0508:  ; ENTRY
  0508  55               push bp                                  
  0509  8bec             mov bp, sp                               
  050b  8b4e06           mov cx, word ptr [bp + 6]                
  050e  8bd9             mov bx, cx                               
  0510  d1e3             shl bx, 1                                
  0512  b8042c           mov ax, 0x2c04                           
  0515  8ec0             mov es, ax                               
  0517  268b87f000       mov ax, word ptr es:[bx + 0xf0]          
  051c  f7d8             neg ax                                   
  051e  1bc0             sbb ax, ax                               
  0520  40               inc ax                                   
  0521  8bd9             mov bx, cx                               
  0523  d1e3             shl bx, 1                                
  0525  ba042c           mov dx, 0x2c04                           
  0528  8ec2             mov es, dx                               
  052a  268987f000       mov word ptr es:[bx + 0xf0], ax          
  052f  6a00             push 0                                   
  0531  51               push cx                                  
  0532  0e               push cs                                  
  0533  e801fc           call 0x137                               
  0536  83c404           add sp, 4                                
  0539  0e               push cs                                  
  053a  e82afb           call 0x67                                
  053d  5d               pop bp                                   
  053e  cb               retf                                     

ovl33_053f:  ; ENTRY
  053f  55               push bp                                  
  0540  8bec             mov bp, sp                               
  0542  8b4e06           mov cx, word ptr [bp + 6]                
  0545  8bd9             mov bx, cx                               
  0547  d1e3             shl bx, 1                                
  0549  b8042c           mov ax, 0x2c04                           
  054c  8ec0             mov es, ax                               
  054e  268b874701       mov ax, word ptr es:[bx + 0x147]         
  0553  f7d8             neg ax                                   
  0555  1bc0             sbb ax, ax                               
  0557  40               inc ax                                   
  0558  8bd9             mov bx, cx                               
  055a  d1e3             shl bx, 1                                
  055c  ba042c           mov dx, 0x2c04                           
  055f  8ec2             mov es, dx                               
  0561  2689874701       mov word ptr es:[bx + 0x147], ax         
  0566  6a00             push 0                                   
  0568  51               push cx                                  
  0569  0e               push cs                                  
  056a  e8cafb           call 0x137                               
  056d  83c404           add sp, 4                                
  0570  0e               push cs                                  
  0571  e8f3fa           call 0x67                                
  0574  5d               pop bp                                   
  0575  cb               retf                                     

ovl33_0576:  ; ENTRY
  0576  55               push bp                                  
  0577  8bec             mov bp, sp                               
  0579  83ec04           sub sp, 4                                
  057c  56               push si                                  
  057d  8b4606           mov ax, word ptr [bp + 6]                
  0580  0bc0             or ax, ax                                
  0582  7526             jne 0x5aa                                
  0584  9a82075e15       lcall 0x155e, 0x782                      -> 155e:0782
  0589  9a75075e15       lcall 0x155e, 0x775                      -> 155e:0775
  058e  a1ee0b           mov ax, word ptr [0xbee]                 
  0591  f7d8             neg ax                                   
  0593  1bc0             sbb ax, ax                               
  0595  40               inc ax                                   
  0596  a3ee0b           mov word ptr [0xbee], ax                 
  0599  833eee0b00       cmp word ptr [0xbee], 0                  
  059e  7427             je 0x5c7                                 
  05a0  6a01             push 1                                   
  05a2  9a2000ba30       lcall 0x30ba, 0x20                       -> ovl58:0000
  05a7  59               pop cx                                   
  05a8  eb1d             jmp 0x5c7                                
  05aa  3d0200           cmp ax, 2                                
  05ad  750d             jne 0x5bc                                
  05af  a1c826           mov ax, word ptr [0x26c8]                
  05b2  f7d8             neg ax                                   
  05b4  1bc0             sbb ax, ax                               
  05b6  40               inc ax                                   
  05b7  a3c826           mov word ptr [0x26c8], ax                
  05ba  eb0b             jmp 0x5c7                                
  05bc  a1ec0b           mov ax, word ptr [0xbec]                 
  05bf  f7d8             neg ax                                   
  05c1  1bc0             sbb ax, ax                               
  05c3  40               inc ax                                   
  05c4  a3ec0b           mov word ptr [0xbec], ax                 
  05c7  6668feff0000     push 0xfffe                              
  05cd  0e               push cs                                  
  05ce  e866fb           call 0x137                               
  05d1  83c404           add sp, 4                                
  05d4  0e               push cs                                  
  05d5  e88ffa           call 0x67                                
  05d8  666800000900     push 0x90000                             
  05de  6a44             push 0x44                                
  05e0  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  05e5  83c404           add sp, 4                                
  05e8  52               push dx                                  
  05e9  50               push ax                                  
  05ea  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  05ef  83c406           add sp, 6                                
  05f2  8bf0             mov si, ax                               
  05f4  0bf6             or si, si                                
  05f6  7c34             jl 0x62c                                 
  05f8  a0ee0b           mov al, byte ptr [0xbee]                 
  05fb  0430             add al, 0x30                             
  05fd  8846fc           mov byte ptr [bp - 4], al                
  0600  a0ec0b           mov al, byte ptr [0xbec]                 
  0603  0430             add al, 0x30                             
  0605  8846fd           mov byte ptr [bp - 3], al                
  0608  a1c826           mov ax, word ptr [0x26c8]                
  060b  f7d8             neg ax                                   
  060d  1bc0             sbb ax, ax                               
  060f  40               inc ax                                   
  0610  0430             add al, 0x30                             
  0612  8846fe           mov byte ptr [bp - 2], al                
  0615  6a03             push 3                                   
  0617  16               push ss                                  
  0618  8d46fc           lea ax, [bp - 4]                         
  061b  50               push ax                                  
  061c  56               push si                                  
  061d  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  0622  83c408           add sp, 8                                
  0625  56               push si                                  
  0626  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  062b  59               pop cx                                   
  062c  5e               pop si                                   
  062d  c9               leave                                    
  062e  cb               retf                                     
