; ovl56 stub 30a5 file_off 0x70e80 size 0x5d1

ovl56_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  8b5622           mov dx, word ptr [bp + 0x22]             
  0006  c7066a160100     mov word ptr [0x166a], 1                 
  000c  c706d0580000     mov word ptr [0x58d0], 0                 
  0012  8b461e           mov ax, word ptr [bp + 0x1e]             
  0015  a3ce58           mov word ptr [0x58ce], ax                
  0018  8b4620           mov ax, word ptr [bp + 0x20]             
  001b  a3d458           mov word ptr [0x58d4], ax                
  001e  0bd2             or dx, dx                                
  0020  7e04             jle 0x26                                 
  0022  8bc2             mov ax, dx                               
  0024  eb03             jmp 0x29                                 
  0026  b8e800           mov ax, 0xe8                             
  0029  a3d258           mov word ptr [0x58d2], ax                
  002c  668b4616         mov eax, dword ptr [bp + 0x16]           
  0030  66a32c59         mov dword ptr [0x592c], eax              
  0034  668b461a         mov eax, dword ptr [bp + 0x1a]           
  0038  66a32859         mov dword ptr [0x5928], eax              
  003c  66ff7612         push dword ptr [bp + 0x12]               
  0040  1e               push ds                                  
  0041  68d858           push 0x58d8                              
  0044  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0049  83c408           add sp, 8                                
  004c  1e               push ds                                  
  004d  68d858           push 0x58d8                              
  0050  9a994a0000       lcall 0, 0x4a99                          -> 0000:4a99
  0055  83c404           add sp, 4                                
  0058  a3d658           mov word ptr [0x58d6], ax                
  005b  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0060  66ff760e         push dword ptr [bp + 0xe]                
  0064  66ff760a         push dword ptr [bp + 0xa]                
  0068  66ff7606         push dword ptr [bp + 6]                  
  006c  90               nop                                      
  006d  0e               push cs                                  
  006e  e87100           call 0xe2                                
  0071  83c40c           add sp, 0xc                              
  0074  6a05             push 5                                   
  0076  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  007b  59               pop cx                                   
  007c  90               nop                                      
  007d  0e               push cs                                  
  007e  e84602           call 0x2c7                               
  0081  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0086  5d               pop bp                                   
  0087  cb               retf                                     

ovl56_0088:  ; ENTRY
  0088  55               push bp                                  
  0089  8bec             mov bp, sp                               
  008b  c7066a160100     mov word ptr [0x166a], 1                 
  0091  c706d0580100     mov word ptr [0x58d0], 1                 
  0097  c706ce580100     mov word ptr [0x58ce], 1                 
  009d  668b461e         mov eax, dword ptr [bp + 0x1e]           
  00a1  66a33059         mov dword ptr [0x5930], eax              
  00a5  668b461a         mov eax, dword ptr [bp + 0x1a]           
  00a9  66a33459         mov dword ptr [0x5934], eax              
  00ad  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  00b2  66ff7616         push dword ptr [bp + 0x16]               
  00b6  66ff7612         push dword ptr [bp + 0x12]               
  00ba  66ff760e         push dword ptr [bp + 0xe]                
  00be  66ff760a         push dword ptr [bp + 0xa]                
  00c2  66ff7606         push dword ptr [bp + 6]                  
  00c6  90               nop                                      
  00c7  0e               push cs                                  
  00c8  e8e200           call 0x1ad                               
  00cb  83c414           add sp, 0x14                             
  00ce  6a05             push 5                                   
  00d0  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  00d5  59               pop cx                                   
  00d6  90               nop                                      
  00d7  0e               push cs                                  
  00d8  e8ec01           call 0x2c7                               
  00db  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  00e0  5d               pop bp                                   
  00e1  cb               retf                                     

ovl56_00e2:  ; ENTRY
  00e2  55               push bp                                  
  00e3  8bec             mov bp, sp                               
  00e5  56               push si                                  
  00e6  be0200           mov si, 2                                
  00e9  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  00ee  6a01             push 1                                   
  00f0  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  00f5  59               pop cx                                   
  00f6  666800000300     push 0x30000                             
  00fc  666801000f00     push 0xf0001                             
  0102  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0107  83c408           add sp, 8                                
  010a  66ff7606         push dword ptr [bp + 6]                  
  010e  66ff366823       push dword ptr [0x2368]                  
  0113  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0118  83c408           add sp, 8                                
  011b  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  0120  7401             je 0x123                                 
  0122  46               inc si                                   
  0123  66837e0e00       cmp dword ptr [bp + 0xe], 0              
  0128  7401             je 0x12b                                 
  012a  46               inc si                                   
  012b  666800000300     push 0x30000                             
  0131  666802000f00     push 0xf0002                             
  0137  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  013c  83c408           add sp, 8                                
  013f  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  0144  741e             je 0x164                                 
  0146  66ff760a         push dword ptr [bp + 0xa]                
  014a  8bde             mov bx, si                               
  014c  c1e304           shl bx, 4                                
  014f  ffb71a23         push word ptr [bx + 0x231a]              
  0153  8bde             mov bx, si                               
  0155  c1e304           shl bx, 4                                
  0158  ffb71823         push word ptr [bx + 0x2318]              
  015c  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0161  83c408           add sp, 8                                
  0164  66837e0e00       cmp dword ptr [bp + 0xe], 0              
  0169  7424             je 0x18f                                 
  016b  66ff760e         push dword ptr [bp + 0xe]                
  016f  8bde             mov bx, si                               
  0171  c1e304           shl bx, 4                                
  0174  b81823           mov ax, 0x2318                           
  0177  050600           add ax, 6                                
  017a  03d8             add bx, ax                               
  017c  ff37             push word ptr [bx]                       
  017e  8bde             mov bx, si                               
  0180  c1e304           shl bx, 4                                
  0183  ffb71c23         push word ptr [bx + 0x231c]              
  0187  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  018c  83c408           add sp, 8                                
  018f  1e               push ds                                  
  0190  68d858           push 0x58d8                              
  0193  66ff367023       push dword ptr [0x2370]                  
  0198  66ff366c23       push dword ptr [0x236c]                  
  019d  9a5c00c130       lcall 0x30c1, 0x5c                       -> ovl59:0058
  01a2  83c40c           add sp, 0xc                              
  01a5  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  01aa  5e               pop si                                   
  01ab  5d               pop bp                                   
  01ac  cb               retf                                     

ovl56_01ad:  ; ENTRY
  01ad  55               push bp                                  
  01ae  8bec             mov bp, sp                               
  01b0  56               push si                                  
  01b1  33f6             xor si, si                               
  01b3  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  01b8  6a01             push 1                                   
  01ba  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  01bf  59               pop cx                                   
  01c0  666800000300     push 0x30000                             
  01c6  666801000f00     push 0xf0001                             
  01cc  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  01d1  83c408           add sp, 8                                
  01d4  66ff7606         push dword ptr [bp + 6]                  
  01d8  66ff366823       push dword ptr [0x2368]                  
  01dd  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  01e2  83c408           add sp, 8                                
  01e5  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  01ea  7401             je 0x1ed                                 
  01ec  46               inc si                                   
  01ed  66837e0e00       cmp dword ptr [bp + 0xe], 0              
  01f2  7401             je 0x1f5                                 
  01f4  46               inc si                                   
  01f5  66837e1200       cmp dword ptr [bp + 0x12], 0             
  01fa  7401             je 0x1fd                                 
  01fc  46               inc si                                   
  01fd  66837e1600       cmp dword ptr [bp + 0x16], 0             
  0202  7401             je 0x205                                 
  0204  46               inc si                                   
  0205  666800000300     push 0x30000                             
  020b  666802000f00     push 0xf0002                             
  0211  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0216  83c408           add sp, 8                                
  0219  66837e0a00       cmp dword ptr [bp + 0xa], 0              
  021e  741e             je 0x23e                                 
  0220  66ff760a         push dword ptr [bp + 0xa]                
  0224  8bde             mov bx, si                               
  0226  c1e304           shl bx, 4                                
  0229  ffb71a23         push word ptr [bx + 0x231a]              
  022d  8bde             mov bx, si                               
  022f  c1e304           shl bx, 4                                
  0232  ffb71823         push word ptr [bx + 0x2318]              
  0236  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  023b  83c408           add sp, 8                                
  023e  66837e0e00       cmp dword ptr [bp + 0xe], 0              
  0243  7424             je 0x269                                 
  0245  66ff760e         push dword ptr [bp + 0xe]                
  0249  8bde             mov bx, si                               
  024b  c1e304           shl bx, 4                                
  024e  b81823           mov ax, 0x2318                           
  0251  050600           add ax, 6                                
  0254  03d8             add bx, ax                               
  0256  ff37             push word ptr [bx]                       
  0258  8bde             mov bx, si                               
  025a  c1e304           shl bx, 4                                
  025d  ffb71c23         push word ptr [bx + 0x231c]              
  0261  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0266  83c408           add sp, 8                                
  0269  66837e1200       cmp dword ptr [bp + 0x12], 0             
  026e  7424             je 0x294                                 
  0270  66ff7612         push dword ptr [bp + 0x12]               
  0274  8bde             mov bx, si                               
  0276  c1e304           shl bx, 4                                
  0279  b81823           mov ax, 0x2318                           
  027c  050a00           add ax, 0xa                              
  027f  03d8             add bx, ax                               
  0281  ff37             push word ptr [bx]                       
  0283  8bde             mov bx, si                               
  0285  c1e304           shl bx, 4                                
  0288  ffb72023         push word ptr [bx + 0x2320]              
  028c  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0291  83c408           add sp, 8                                
  0294  66837e1600       cmp dword ptr [bp + 0x16], 0             
  0299  7424             je 0x2bf                                 
  029b  66ff7616         push dword ptr [bp + 0x16]               
  029f  8bde             mov bx, si                               
  02a1  c1e304           shl bx, 4                                
  02a4  b81823           mov ax, 0x2318                           
  02a7  050e00           add ax, 0xe                              
  02aa  03d8             add bx, ax                               
  02ac  ff37             push word ptr [bx]                       
  02ae  8bde             mov bx, si                               
  02b0  c1e304           shl bx, 4                                
  02b3  ffb72423         push word ptr [bx + 0x2324]              
  02b7  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  02bc  83c408           add sp, 8                                
  02bf  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  02c4  5e               pop si                                   
  02c5  5d               pop bp                                   
  02c6  cb               retf                                     

ovl56_02c7:  ; ENTRY
  02c7  55               push bp                                  
  02c8  8bec             mov bp, sp                               
  02ca  6668bd000100     push 0x100bd                             
  02d0  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  02d5  83c404           add sp, 4                                
  02d8  833ece5800       cmp word ptr [0x58ce], 0                 
  02dd  7404             je 0x2e3                                 
  02df  6a01             push 1                                   
  02e1  eb02             jmp 0x2e5                                
  02e3  6a02             push 2                                   
  02e5  68be00           push 0xbe                                
  02e8  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  02ed  83c404           add sp, 4                                
  02f0  833ed05800       cmp word ptr [0x58d0], 0                 
  02f5  7510             jne 0x307                                
  02f7  6668bf000100     push 0x100bf                             
  02fd  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0302  83c404           add sp, 4                                
  0305  eb09             jmp 0x310                                
  0307  68bf00           push 0xbf                                
  030a  9ab303a908       lcall 0x8a9, 0x3b3                       -> 08a9:03b3
  030f  59               pop cx                                   
  0310  5d               pop bp                                   
  0311  cb               retf                                     

ovl56_0312:  ; ENTRY
  0312  55               push bp                                  
  0313  8bec             mov bp, sp                               
  0315  56               push si                                  
  0316  8b7606           mov si, word ptr [bp + 6]                
  0319  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  031e  833ed05800       cmp word ptr [0x58d0], 0                 
  0323  7512             jne 0x337                                
  0325  0bf6             or si, si                                
  0327  7407             je 0x330                                 
  0329  90               nop                                      
  032a  0e               push cs                                  
  032b  e83500           call 0x363                               
  032e  eb1e             jmp 0x34e                                
  0330  90               nop                                      
  0331  0e               push cs                                  
  0332  e83e00           call 0x373                               
  0335  eb17             jmp 0x34e                                
  0337  833ed05801       cmp word ptr [0x58d0], 1                 
  033c  7510             jne 0x34e                                
  033e  0bf6             or si, si                                
  0340  7407             je 0x349                                 
  0342  90               nop                                      
  0343  0e               push cs                                  
  0344  e80a00           call 0x351                               
  0347  eb05             jmp 0x34e                                
  0349  90               nop                                      
  034a  0e               push cs                                  
  034b  e80c00           call 0x35a                               
  034e  5e               pop si                                   
  034f  5d               pop bp                                   
  0350  cb               retf                                     

ovl56_0351:  ; ENTRY
  0351  55               push bp                                  
  0352  8bec             mov bp, sp                               
  0354  ff1e3459         lcall [0x5934]                           
  0358  5d               pop bp                                   
  0359  cb               retf                                     

ovl56_035a:  ; ENTRY
  035a  55               push bp                                  
  035b  8bec             mov bp, sp                               
  035d  ff1e3059         lcall [0x5930]                           
  0361  5d               pop bp                                   
  0362  cb               retf                                     

ovl56_0363:  ; ENTRY
  0363  55               push bp                                  
  0364  8bec             mov bp, sp                               
  0366  1e               push ds                                  
  0367  68d858           push 0x58d8                              
  036a  ff1e2c59         lcall [0x592c]                           
  036e  83c404           add sp, 4                                
  0371  5d               pop bp                                   
  0372  cb               retf                                     

ovl56_0373:  ; ENTRY
  0373  55               push bp                                  
  0374  8bec             mov bp, sp                               
  0376  ff1e2859         lcall [0x5928]                           
  037a  5d               pop bp                                   
  037b  cb               retf                                     

ovl56_037c:  ; ENTRY
  037c  55               push bp                                  
  037d  8bec             mov bp, sp                               
  037f  ff36d258         push word ptr [0x58d2]                   
  0383  ff36d458         push word ptr [0x58d4]                   
  0387  1e               push ds                                  
  0388  68d858           push 0x58d8                              
  038b  b86c23           mov ax, 0x236c                           
  038e  8cda             mov dx, ds                               
  0390  b90800           mov cx, 8                                
  0393  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  0398  90               nop                                      
  0399  0e               push cs                                  
  039a  e80900           call 0x3a6                               
  039d  83c410           add sp, 0x10                             
  03a0  0e               push cs                                  
  03a1  e823ff           call 0x2c7                               
  03a4  5d               pop bp                                   
  03a5  cb               retf                                     

ovl56_03a6:  ; ENTRY
  03a6  55               push bp                                  
  03a7  8bec             mov bp, sp                               
  03a9  83ec74           sub sp, 0x74                             
  03ac  56               push si                                  
  03ad  8d46f0           lea ax, [bp - 0x10]                      
  03b0  16               push ss                                  
  03b1  50               push ax                                  
  03b2  8d4606           lea ax, [bp + 6]                         
  03b5  16               push ss                                  
  03b6  50               push ax                                  
  03b7  b90800           mov cx, 8                                
  03ba  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  03bf  ff46f0           inc word ptr [bp - 0x10]                 
  03c2  ff46f2           inc word ptr [bp - 0xe]                  
  03c5  836ef402         sub word ptr [bp - 0xc], 2               
  03c9  836ef602         sub word ptr [bp - 0xa], 2               
  03cd  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  03d2  be3200           mov si, 0x32                             
  03d5  eb04             jmp 0x3db                                
  03d7  c642be00         mov byte ptr [bp + si - 0x42], 0         
  03db  8bc6             mov ax, si                               
  03dd  4e               dec si                                   
  03de  0bc0             or ax, ax                                
  03e0  75f5             jne 0x3d7                                
  03e2  1e               push ds                                  
  03e3  687423           push 0x2374                              
  03e6  16               push ss                                  
  03e7  8d46be           lea ax, [bp - 0x42]                      
  03ea  50               push ax                                  
  03eb  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  03f0  83c408           add sp, 8                                
  03f3  666800000300     push 0x30000                             
  03f9  666802000f00     push 0xf0002                             
  03ff  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0404  83c408           add sp, 8                                
  0407  6a03             push 3                                   
  0409  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  040e  59               pop cx                                   
  040f  16               push ss                                  
  0410  8d46f0           lea ax, [bp - 0x10]                      
  0413  50               push ax                                  
  0414  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0419  83c404           add sp, 4                                
  041c  16               push ss                                  
  041d  8d46be           lea ax, [bp - 0x42]                      
  0420  50               push ax                                  
  0421  8b4608           mov ax, word ptr [bp + 8]                
  0424  050200           add ax, 2                                
  0427  50               push ax                                  
  0428  8b4606           mov ax, word ptr [bp + 6]                
  042b  050300           add ax, 3                                
  042e  50               push ax                                  
  042f  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  0434  83c408           add sp, 8                                
  0437  c646ff00         mov byte ptr [bp - 1], 0                 
  043b  33f6             xor si, si                               
  043d  8076ff01         xor byte ptr [bp - 1], 1                 
  0441  6a00             push 0                                   
  0443  9a3900c130       lcall 0x30c1, 0x39                       -> ovl59:020d
  0448  59               pop cx                                   
  0449  8946fc           mov word ptr [bp - 4], ax                
  044c  837efc0d         cmp word ptr [bp - 4], 0xd               
  0450  7503             jne 0x455                                
  0452  e92001           jmp 0x575                                
  0455  837efc1b         cmp word ptr [bp - 4], 0x1b              
  0459  7514             jne 0x46f                                
  045b  66ff760e         push dword ptr [bp + 0xe]                
  045f  16               push ss                                  
  0460  8d46be           lea ax, [bp - 0x42]                      
  0463  50               push ax                                  
  0464  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0469  83c408           add sp, 8                                
  046c  e90601           jmp 0x575                                
  046f  837efc08         cmp word ptr [bp - 4], 8                 
  0473  750a             jne 0x47f                                
  0475  0bf6             or si, si                                
  0477  7f03             jg 0x47c                                 
  0479  e9a400           jmp 0x520                                
  047c  4e               dec si                                   
  047d  eb59             jmp 0x4d8                                
  047f  837efc20         cmp word ptr [bp - 4], 0x20              
  0483  7303             jae 0x488                                
  0485  e99800           jmp 0x520                                
  0488  837efc7a         cmp word ptr [bp - 4], 0x7a              
  048c  7603             jbe 0x491                                
  048e  e98f00           jmp 0x520                                
  0491  c646ff00         mov byte ptr [bp - 1], 0                 
  0495  16               push ss                                  
  0496  8d46be           lea ax, [bp - 0x42]                      
  0499  50               push ax                                  
  049a  16               push ss                                  
  049b  8d468c           lea ax, [bp - 0x74]                      
  049e  50               push ax                                  
  049f  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  04a4  83c408           add sp, 8                                
  04a7  8a46fc           mov al, byte ptr [bp - 4]                
  04aa  88428c           mov byte ptr [bp + si - 0x74], al        
  04ad  c6428d00         mov byte ptr [bp + si - 0x73], 0         
  04b1  16               push ss                                  
  04b2  8d46be           lea ax, [bp - 0x42]                      
  04b5  50               push ax                                  
  04b6  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  04bb  83c404           add sp, 4                                
  04be  8946f8           mov word ptr [bp - 8], ax                
  04c1  8b4612           mov ax, word ptr [bp + 0x12]             
  04c4  48               dec ax                                   
  04c5  3bc6             cmp ax, si                               
  04c7  7e57             jle 0x520                                
  04c9  8b46f8           mov ax, word ptr [bp - 8]                
  04cc  3b4614           cmp ax, word ptr [bp + 0x14]             
  04cf  7d4f             jge 0x520                                
  04d1  8a46fc           mov al, byte ptr [bp - 4]                
  04d4  8842be           mov byte ptr [bp + si - 0x42], al        
  04d7  46               inc si                                   
  04d8  c642be00         mov byte ptr [bp + si - 0x42], 0         
  04dc  666800000300     push 0x30000                             
  04e2  666802000f00     push 0xf0002                             
  04e8  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  04ed  83c408           add sp, 8                                
  04f0  6a03             push 3                                   
  04f2  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  04f7  59               pop cx                                   
  04f8  16               push ss                                  
  04f9  8d46f0           lea ax, [bp - 0x10]                      
  04fc  50               push ax                                  
  04fd  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  0502  83c404           add sp, 4                                
  0505  16               push ss                                  
  0506  8d46be           lea ax, [bp - 0x42]                      
  0509  50               push ax                                  
  050a  8b4608           mov ax, word ptr [bp + 8]                
  050d  050200           add ax, 2                                
  0510  50               push ax                                  
  0511  8b4606           mov ax, word ptr [bp + 6]                
  0514  050300           add ax, 3                                
  0517  50               push ax                                  
  0518  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  051d  83c408           add sp, 8                                
  0520  8a46ff           mov al, byte ptr [bp - 1]                
  0523  b400             mov ah, 0                                
  0525  0bc0             or ax, ax                                
  0527  750a             jne 0x533                                
  0529  666800000300     push 0x30000                             
  052f  6a0f             push 0xf                                 
  0531  eb08             jmp 0x53b                                
  0533  666800000300     push 0x30000                             
  0539  6a09             push 9                                   
  053b  6a02             push 2                                   
  053d  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0542  83c408           add sp, 8                                
  0545  16               push ss                                  
  0546  8d46be           lea ax, [bp - 0x42]                      
  0549  50               push ax                                  
  054a  9a8e0ae211       lcall 0x11e2, 0xa8e                      -> 11e2:0a8e
  054f  83c404           add sp, 4                                
  0552  8946fa           mov word ptr [bp - 6], ax                
  0555  1e               push ds                                  
  0556  687523           push 0x2375                              
  0559  8b4608           mov ax, word ptr [bp + 8]                
  055c  050200           add ax, 2                                
  055f  50               push ax                                  
  0560  8b4606           mov ax, word ptr [bp + 6]                
  0563  0346fa           add ax, word ptr [bp - 6]                
  0566  050500           add ax, 5                                
  0569  50               push ax                                  
  056a  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  056f  83c408           add sp, 8                                
  0572  e9c8fe           jmp 0x43d                                
  0575  16               push ss                                  
  0576  8d46be           lea ax, [bp - 0x42]                      
  0579  50               push ax                                  
  057a  66ff760e         push dword ptr [bp + 0xe]                
  057e  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0583  83c408           add sp, 8                                
  0586  666800000300     push 0x30000                             
  058c  666802000f00     push 0xf0002                             
  0592  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0597  83c408           add sp, 8                                
  059a  6a03             push 3                                   
  059c  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  05a1  59               pop cx                                   
  05a2  16               push ss                                  
  05a3  8d46f0           lea ax, [bp - 0x10]                      
  05a6  50               push ax                                  
  05a7  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  05ac  83c404           add sp, 4                                
  05af  66ff760e         push dword ptr [bp + 0xe]                
  05b3  8b4608           mov ax, word ptr [bp + 8]                
  05b6  050200           add ax, 2                                
  05b9  50               push ax                                  
  05ba  8b4606           mov ax, word ptr [bp + 6]                
  05bd  050300           add ax, 3                                
  05c0  50               push ax                                  
  05c1  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  05c6  83c408           add sp, 8                                
  05c9  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  05ce  5e               pop si                                   
  05cf  c9               leave                                    
  05d0  cb               retf                                     
