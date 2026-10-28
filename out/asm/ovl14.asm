; ovl14 stub 2f9f file_off 0x471d0 size 0x5f3

ovl14_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  0008  6a00             push 0                                   
  000a  9a2000ac2f       lcall 0x2fac, 0x20                       -> ovl17:0000
  000f  59               pop cx                                   
  0010  6a0e             push 0xe                                 
  0012  9a25009930       lcall 0x3099, 0x25                       -> ovl53:056a
  0017  59               pop cx                                   
  0018  6a00             push 0                                   
  001a  90               nop                                      
  001b  0e               push cs                                  
  001c  e82b01           call 0x14a                               
  001f  59               pop cx                                   
  0020  c7066a160100     mov word ptr [0x166a], 1                 
  0026  90               nop                                      
  0027  0e               push cs                                  
  0028  e8d600           call 0x101                               
  002b  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0030  5d               pop bp                                   
  0031  cb               retf                                     

ovl14_0032:  ; ENTRY
  0032  55               push bp                                  
  0033  8bec             mov bp, sp                               
  0035  90               nop                                      
  0036  0e               push cs                                  
  0037  e84104           call 0x47b                               
  003a  90               nop                                      
  003b  0e               push cs                                  
  003c  e8cb02           call 0x30a                               
  003f  9a2500ac2f       lcall 0x2fac, 0x25                       -> ovl17:069c
  0044  666a00           push 0                                   
  0047  6a00             push 0                                   
  0049  9a2500d730       lcall 0x30d7, 0x25                       -> ovl61:011f
  004e  83c406           add sp, 6                                
  0051  5d               pop bp                                   
  0052  cb               retf                                     

ovl14_0053:  ; ENTRY
  0053  55               push bp                                  
  0054  8bec             mov bp, sp                               
  0056  8b1e5a05         mov bx, word ptr [0x55a]                 
  005a  d1e3             shl bx, 1                                
  005c  8b4606           mov ax, word ptr [bp + 6]                
  005f  8987aa3f         mov word ptr [bx + 0x3faa], ax           
  0063  6a01             push 1                                   
  0065  90               nop                                      
  0066  0e               push cs                                  
  0067  e8e000           call 0x14a                               
  006a  59               pop cx                                   
  006b  90               nop                                      
  006c  0e               push cs                                  
  006d  e89100           call 0x101                               
  0070  5d               pop bp                                   
  0071  cb               retf                                     

ovl14_0072:  ; ENTRY
  0072  55               push bp                                  
  0073  8bec             mov bp, sp                               
  0075  8b5e06           mov bx, word ptr [bp + 6]                
  0078  d1e3             shl bx, 1                                
  007a  ffb7a23f         push word ptr [bx + 0x3fa2]              
  007e  9a34009d30       lcall 0x309d, 0x34                       -> ovl54:0000
  0083  59               pop cx                                   
  0084  8bd0             mov dx, ax                               
  0086  0bd2             or dx, dx                                
  0088  7e0b             jle 0x95                                 
  008a  6a00             push 0                                   
  008c  50               push ax                                  
  008d  9a6400be07       lcall 0x7be, 0x64                        -> 07be:0064
  0092  83c404           add sp, 4                                
  0095  833e862a00       cmp word ptr [0x2a86], 0                 
  009a  740c             je 0xa8                                  
  009c  833e6a1600       cmp word ptr [0x166a], 0                 
  00a1  7505             jne 0xa8                                 
  00a3  9a6100d730       lcall 0x30d7, 0x61                       -> ovl61:0174
  00a8  5d               pop bp                                   
  00a9  cb               retf                                     

ovl14_00aa:  ; ENTRY
  00aa  55               push bp                                  
  00ab  8bec             mov bp, sp                               
  00ad  83ec02           sub sp, 2                                
  00b0  56               push si                                  
  00b1  33f6             xor si, si                               
  00b3  eb2c             jmp 0xe1                                 
  00b5  8bde             mov bx, si                               
  00b7  d1e3             shl bx, 1                                
  00b9  ffb7a23f         push word ptr [bx + 0x3fa2]              
  00bd  9a9f0f7213       lcall 0x1372, 0xf9f                      -> 1372:0f9f
  00c2  59               pop cx                                   
  00c3  8946fe           mov word ptr [bp - 2], ax                
  00c6  837efe00         cmp word ptr [bp - 2], 0                 
  00ca  7404             je 0xd0                                  
  00cc  6a01             push 1                                   
  00ce  eb02             jmp 0xd2                                 
  00d0  6a02             push 2                                   
  00d2  8bc6             mov ax, si                               
  00d4  05b300           add ax, 0xb3                             
  00d7  50               push ax                                  
  00d8  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  00dd  83c404           add sp, 4                                
  00e0  46               inc si                                   
  00e1  83fe04           cmp si, 4                                
  00e4  7ccf             jl 0xb5                                  
  00e6  5e               pop si                                   
  00e7  c9               leave                                    
  00e8  cb               retf                                     

ovl14_00e9:  ; ENTRY
  00e9  55               push bp                                  
  00ea  8bec             mov bp, sp                               
  00ec  8b4606           mov ax, word ptr [bp + 6]                
  00ef  a35a05           mov word ptr [0x55a], ax                 
  00f2  6a01             push 1                                   
  00f4  90               nop                                      
  00f5  0e               push cs                                  
  00f6  e85100           call 0x14a                               
  00f9  59               pop cx                                   
  00fa  90               nop                                      
  00fb  0e               push cs                                  
  00fc  e80200           call 0x101                               
  00ff  5d               pop bp                                   
  0100  cb               retf                                     

ovl14_0101:  ; ENTRY
  0101  55               push bp                                  
  0102  8bec             mov bp, sp                               
  0104  56               push si                                  
  0105  666826010100     push 0x10126                             
  010b  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0110  83c404           add sp, 4                                
  0113  33f6             xor si, si                               
  0115  eb11             jmp 0x128                                
  0117  6a01             push 1                                   
  0119  8bc6             mov ax, si                               
  011b  052701           add ax, 0x127                            
  011e  50               push ax                                  
  011f  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  0124  83c404           add sp, 4                                
  0127  46               inc si                                   
  0128  83fe15           cmp si, 0x15                             
  012b  7cea             jl 0x117                                 
  012d  33f6             xor si, si                               
  012f  eb11             jmp 0x142                                
  0131  6a01             push 1                                   
  0133  8bc6             mov ax, si                               
  0135  053c01           add ax, 0x13c                            
  0138  50               push ax                                  
  0139  9a6e06a908       lcall 0x8a9, 0x66e                       -> 08a9:066e
  013e  83c404           add sp, 4                                
  0141  46               inc si                                   
  0142  83fe04           cmp si, 4                                
  0145  7cea             jl 0x131                                 
  0147  5e               pop si                                   
  0148  5d               pop bp                                   
  0149  cb               retf                                     

ovl14_014a:  ; ENTRY
  014a  55               push bp                                  
  014b  8bec             mov bp, sp                               
  014d  83ec4c           sub sp, 0x4c                             
  0150  56               push si                                  
  0151  57               push di                                  
  0152  8b7e06           mov di, word ptr [bp + 6]                
  0155  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  015a  0bff             or di, di                                
  015c  7525             jne 0x183                                
  015e  666800000300     push 0x30000                             
  0164  666801000f00     push 0xf0001                             
  016a  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  016f  83c408           add sp, 8                                
  0172  1e               push ds                                  
  0173  685c05           push 0x55c                                ; "Menu Shortcuts"
  0176  66ff365205       push dword ptr [0x552]                   
  017b  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  0180  83c408           add sp, 8                                
  0183  666800000300     push 0x30000                             
  0189  666802000f00     push 0xf0002                             
  018f  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  0194  83c408           add sp, 8                                
  0197  33f6             xor si, si                               
  0199  eb75             jmp 0x210                                
  019b  16               push ss                                  
  019c  8d46b4           lea ax, [bp - 0x4c]                      
  019f  50               push ax                                  
  01a0  56               push si                                  
  01a1  90               nop                                      
  01a2  0e               push cs                                  
  01a3  e80603           call 0x4ac                               
  01a6  83c406           add sp, 6                                
  01a9  8b46ec           mov ax, word ptr [bp - 0x14]             
  01ac  99               cdq                                      
  01ad  2bc2             sub ax, dx                               
  01af  d1f8             sar ax, 1                                
  01b1  8946ec           mov word ptr [bp - 0x14], ax             
  01b4  8b1e5a05         mov bx, word ptr [0x55a]                 
  01b8  d1e3             shl bx, 1                                
  01ba  39b7aa3f         cmp word ptr [bx + 0x3faa], si           
  01be  7503             jne 0x1c3                                
  01c0  0146e8           add word ptr [bp - 0x18], ax             
  01c3  8bde             mov bx, si                               
  01c5  c1e302           shl bx, 2                                
  01c8  66ffb7ce04       push dword ptr [bx + 0x4ce]              
  01cd  8d46e8           lea ax, [bp - 0x18]                      
  01d0  8cd2             mov dx, ss                               
  01d2  b90800           mov cx, 8                                
  01d5  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  01da  6a2b             push 0x2b                                
  01dc  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  01e1  83c40e           add sp, 0xe                              
  01e4  0bff             or di, di                                
  01e6  7527             jne 0x20f                                
  01e8  16               push ss                                  
  01e9  8d46b6           lea ax, [bp - 0x4a]                      
  01ec  50               push ax                                  
  01ed  8bde             mov bx, si                               
  01ef  c1e302           shl bx, 2                                
  01f2  8b87d004         mov ax, word ptr [bx + 0x4d0]            
  01f6  050500           add ax, 5                                
  01f9  50               push ax                                  
  01fa  8bde             mov bx, si                               
  01fc  c1e302           shl bx, 2                                
  01ff  8b87ce04         mov ax, word ptr [bx + 0x4ce]            
  0203  052800           add ax, 0x28                             
  0206  50               push ax                                  
  0207  9a4d00c130       lcall 0x30c1, 0x4d                       -> ovl59:00bf
  020c  83c408           add sp, 8                                
  020f  46               inc si                                   
  0210  83fe15           cmp si, 0x15                             
  0213  7c86             jl 0x19b                                 
  0215  0bff             or di, di                                
  0217  7525             jne 0x23e                                
  0219  666800000300     push 0x30000                             
  021f  666802000f00     push 0xf0002                             
  0225  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  022a  83c408           add sp, 8                                
  022d  1e               push ds                                  
  022e  686b05           push 0x56b                                ; "Choose 4 buttons for shortcuts"
  0231  66ff365605       push dword ptr [0x556]                   
  0236  9a5200c130       lcall 0x30c1, 0x52                       -> ovl59:00d6
  023b  83c408           add sp, 8                                
  023e  33f6             xor si, si                               
  0240  e9a700           jmp 0x2ea                                
  0243  8bde             mov bx, si                               
  0245  d1e3             shl bx, 1                                
  0247  83bfaa3f00       cmp word ptr [bx + 0x3faa], 0            
  024c  7c34             jl 0x282                                 
  024e  16               push ss                                  
  024f  8d46b4           lea ax, [bp - 0x4c]                      
  0252  50               push ax                                  
  0253  8bde             mov bx, si                               
  0255  d1e3             shl bx, 1                                
  0257  ffb7aa3f         push word ptr [bx + 0x3faa]              
  025b  90               nop                                      
  025c  0e               push cs                                  
  025d  e84c02           call 0x4ac                               
  0260  83c406           add sp, 6                                
  0263  8d46f8           lea ax, [bp - 8]                         
  0266  16               push ss                                  
  0267  50               push ax                                  
  0268  8d46e8           lea ax, [bp - 0x18]                      
  026b  16               push ss                                  
  026c  50               push ax                                  
  026d  b90800           mov cx, 8                                
  0270  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0275  8bde             mov bx, si                               
  0277  d1e3             shl bx, 1                                
  0279  8b46b4           mov ax, word ptr [bp - 0x4c]             
  027c  8987a23f         mov word ptr [bx + 0x3fa2], ax           
  0280  eb1b             jmp 0x29d                                
  0282  8d46f8           lea ax, [bp - 8]                         
  0285  16               push ss                                  
  0286  50               push ax                                  
  0287  1e               push ds                                  
  0288  689e04           push 0x49e                               
  028b  b90800           mov cx, 8                                
  028e  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0293  8bde             mov bx, si                               
  0295  d1e3             shl bx, 1                                
  0297  c787a23f0000     mov word ptr [bx + 0x3fa2], 0            
  029d  8b46fc           mov ax, word ptr [bp - 4]                
  02a0  99               cdq                                      
  02a1  2bc2             sub ax, dx                               
  02a3  d1f8             sar ax, 1                                
  02a5  8946fc           mov word ptr [bp - 4], ax                
  02a8  8bde             mov bx, si                               
  02aa  c1e302           shl bx, 2                                
  02ad  66ffb72205       push dword ptr [bx + 0x522]              
  02b2  8d46f8           lea ax, [bp - 8]                         
  02b5  8cd2             mov dx, ss                               
  02b7  b90800           mov cx, 8                                
  02ba  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  02bf  6a2b             push 0x2b                                
  02c1  9a29019709       lcall 0x997, 0x129                       -> 0997:0129
  02c6  83c40e           add sp, 0xe                              
  02c9  3b365a05         cmp si, word ptr [0x55a]                 
  02cd  751a             jne 0x2e9                                
  02cf  6a09             push 9                                   
  02d1  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  02d6  59               pop cx                                   
  02d7  1e               push ds                                  
  02d8  8bc6             mov ax, si                               
  02da  c1e003           shl ax, 3                                
  02dd  053205           add ax, 0x532                            
  02e0  50               push ax                                  
  02e1  9afd016d11       lcall 0x116d, 0x1fd                      -> 116d:01fd
  02e6  83c404           add sp, 4                                
  02e9  46               inc si                                   
  02ea  83fe04           cmp si, 4                                
  02ed  7d03             jge 0x2f2                                
  02ef  e951ff           jmp 0x243                                
  02f2  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  02f7  5f               pop di                                   
  02f8  5e               pop si                                   
  02f9  c9               leave                                    
  02fa  cb               retf                                     

ovl14_02fb:  ; ENTRY
  02fb  55               push bp                                  
  02fc  8bec             mov bp, sp                               
  02fe  90               nop                                      
  02ff  0e               push cs                                  
  0300  e82401           call 0x427                               
  0303  90               nop                                      
  0304  0e               push cs                                  
  0305  e80200           call 0x30a                               
  0308  5d               pop bp                                   
  0309  cb               retf                                     

ovl14_030a:  ; ENTRY
  030a  55               push bp                                  
  030b  8bec             mov bp, sp                               
  030d  83ec54           sub sp, 0x54                             
  0310  56               push si                                  
  0311  6a2b             push 0x2b                                
  0313  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0318  59               pop cx                                   
  0319  6a2b             push 0x2b                                
  031b  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  0320  59               pop cx                                   
  0321  6a04             push 4                                   
  0323  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0328  59               pop cx                                   
  0329  6a04             push 4                                   
  032b  9a0a069709       lcall 0x997, 0x60a                       -> 0997:060a
  0330  59               pop cx                                   
  0331  33f6             xor si, si                               
  0333  e9a700           jmp 0x3dd                                
  0336  8bde             mov bx, si                               
  0338  d1e3             shl bx, 1                                
  033a  83bfa23f00       cmp word ptr [bx + 0x3fa2], 0            
  033f  7633             jbe 0x374                                
  0341  16               push ss                                  
  0342  8d46ac           lea ax, [bp - 0x54]                      
  0345  50               push ax                                  
  0346  8bde             mov bx, si                               
  0348  d1e3             shl bx, 1                                
  034a  ffb7a23f         push word ptr [bx + 0x3fa2]              
  034e  90               nop                                      
  034f  0e               push cs                                  
  0350  e8b801           call 0x50b                               
  0353  83c406           add sp, 6                                
  0356  8d46f8           lea ax, [bp - 8]                         
  0359  16               push ss                                  
  035a  50               push ax                                  
  035b  8d46e0           lea ax, [bp - 0x20]                      
  035e  16               push ss                                  
  035f  50               push ax                                  
  0360  b90800           mov cx, 8                                
  0363  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0368  8d46f0           lea ax, [bp - 0x10]                      
  036b  16               push ss                                  
  036c  50               push ax                                  
  036d  8d46e8           lea ax, [bp - 0x18]                      
  0370  16               push ss                                  
  0371  50               push ax                                  
  0372  eb1a             jmp 0x38e                                
  0374  8d46f8           lea ax, [bp - 8]                         
  0377  16               push ss                                  
  0378  50               push ax                                  
  0379  1e               push ds                                  
  037a  689e04           push 0x49e                               
  037d  b90800           mov cx, 8                                
  0380  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0385  8d46f0           lea ax, [bp - 0x10]                      
  0388  16               push ss                                  
  0389  50               push ax                                  
  038a  1e               push ds                                  
  038b  68a604           push 0x4a6                               
  038e  b90800           mov cx, 8                                
  0391  9a021d0000       lcall 0, 0x1d02                          -> 0000:1d02
  0396  8bde             mov bx, si                               
  0398  c1e302           shl bx, 2                                
  039b  66ffb7ae04       push dword ptr [bx + 0x4ae]              
  03a0  6a04             push 4                                   
  03a2  8d46f8           lea ax, [bp - 8]                         
  03a5  8cd2             mov dx, ss                               
  03a7  b90800           mov cx, 8                                
  03aa  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  03af  6a2b             push 0x2b                                
  03b1  9aa2009709       lcall 0x997, 0xa2                        -> 0997:00a2
  03b6  83c410           add sp, 0x10                             
  03b9  8bde             mov bx, si                               
  03bb  c1e302           shl bx, 2                                
  03be  66ffb7be04       push dword ptr [bx + 0x4be]              
  03c3  6a04             push 4                                   
  03c5  8d46f0           lea ax, [bp - 0x10]                      
  03c8  8cd2             mov dx, ss                               
  03ca  b90800           mov cx, 8                                
  03cd  9a791e0000       lcall 0, 0x1e79                          -> 0000:1e79
  03d2  6a2b             push 0x2b                                
  03d4  9aa2009709       lcall 0x997, 0xa2                        -> 0997:00a2
  03d9  83c410           add sp, 0x10                             
  03dc  46               inc si                                   
  03dd  83fe04           cmp si, 4                                
  03e0  7d03             jge 0x3e5                                
  03e2  e951ff           jmp 0x336                                
  03e5  6a2b             push 0x2b                                
  03e7  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  03ec  59               pop cx                                   
  03ed  6a04             push 4                                   
  03ef  9abb069709       lcall 0x997, 0x6bb                       -> 0997:06bb
  03f4  59               pop cx                                   
  03f5  5e               pop si                                   
  03f6  c9               leave                                    
  03f7  cb               retf                                     

ovl14_03f8:  ; ENTRY
  03f8  55               push bp                                  
  03f9  8bec             mov bp, sp                               
  03fb  83ec44           sub sp, 0x44                             
  03fe  16               push ss                                  
  03ff  8d46bc           lea ax, [bp - 0x44]                      
  0402  50               push ax                                  
  0403  8b5e06           mov bx, word ptr [bp + 6]                
  0406  d1e3             shl bx, 1                                
  0408  ffb7a23f         push word ptr [bx + 0x3fa2]              
  040c  90               nop                                      
  040d  0e               push cs                                  
  040e  e8fa00           call 0x50b                               
  0411  83c406           add sp, 6                                
  0414  16               push ss                                  
  0415  8d46be           lea ax, [bp - 0x42]                      
  0418  50               push ax                                  
  0419  1e               push ds                                  
  041a  68385c           push 0x5c38                              
  041d  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0422  83c408           add sp, 8                                
  0425  c9               leave                                    
  0426  cb               retf                                     

ovl14_0427:  ; ENTRY
  0427  55               push bp                                  
  0428  8bec             mov bp, sp                               
  042a  56               push si                                  
  042b  6a01             push 1                                   
  042d  1e               push ds                                  
  042e  688a05           push 0x58a                                ; "UDB\UDB.CUR"
  0431  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0436  83c406           add sp, 6                                
  0439  8bf0             mov si, ax                               
  043b  0bf6             or si, si                                
  043d  7c39             jl 0x478                                 
  043f  6a08             push 8                                   
  0441  1e               push ds                                  
  0442  68a23f           push 0x3fa2                              
  0445  56               push si                                  
  0446  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  044b  83c408           add sp, 8                                
  044e  56               push si                                  
  044f  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0454  59               pop cx                                   
  0455  33f6             xor si, si                               
  0457  eb1a             jmp 0x473                                
  0459  8bc6             mov ax, si                               
  045b  d1e0             shl ax, 1                                
  045d  05aa3f           add ax, 0x3faa                           
  0460  1e               push ds                                  
  0461  50               push ax                                  
  0462  8bde             mov bx, si                               
  0464  d1e3             shl bx, 1                                
  0466  ffb7a23f         push word ptr [bx + 0x3fa2]              
  046a  90               nop                                      
  046b  0e               push cs                                  
  046c  e80a01           call 0x579                               
  046f  83c406           add sp, 6                                
  0472  46               inc si                                   
  0473  83fe04           cmp si, 4                                
  0476  7ce1             jl 0x459                                 
  0478  5e               pop si                                   
  0479  5d               pop bp                                   
  047a  cb               retf                                     

ovl14_047b:  ; ENTRY
  047b  55               push bp                                  
  047c  8bec             mov bp, sp                               
  047e  56               push si                                  
  047f  6a01             push 1                                   
  0481  1e               push ds                                  
  0482  689605           push 0x596                                ; "UDB\UDB.CUR"
  0485  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  048a  83c406           add sp, 6                                
  048d  8bf0             mov si, ax                               
  048f  0bf6             or si, si                                
  0491  7c16             jl 0x4a9                                 
  0493  6a08             push 8                                   
  0495  1e               push ds                                  
  0496  68a23f           push 0x3fa2                              
  0499  56               push si                                  
  049a  9a4e000b07       lcall 0x70b, 0x4e                        -> 070b:004e
  049f  83c408           add sp, 8                                
  04a2  56               push si                                  
  04a3  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  04a8  59               pop cx                                   
  04a9  5e               pop si                                   
  04aa  5d               pop bp                                   
  04ab  cb               retf                                     

ovl14_04ac:  ; ENTRY
  04ac  55               push bp                                  
  04ad  8bec             mov bp, sp                               
  04af  83ec02           sub sp, 2                                
  04b2  56               push si                                  
  04b3  57               push di                                  
  04b4  6a02             push 2                                   
  04b6  1e               push ds                                  
  04b7  68a205           push 0x5a2                                ; "UDB\UDB.DAT"
  04ba  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  04bf  83c406           add sp, 6                                
  04c2  8bf0             mov si, ax                               
  04c4  0bf6             or si, si                                
  04c6  7d04             jge 0x4cc                                
  04c8  33c0             xor ax, ax                               
  04ca  eb3b             jmp 0x507                                
  04cc  6a02             push 2                                   
  04ce  16               push ss                                  
  04cf  8d46fe           lea ax, [bp - 2]                         
  04d2  50               push ax                                  
  04d3  56               push si                                  
  04d4  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  04d9  83c408           add sp, 8                                
  04dc  8b4606           mov ax, word ptr [bp + 6]                
  04df  3b46fe           cmp ax, word ptr [bp - 2]                
  04e2  7de4             jge 0x4c8                                
  04e4  33ff             xor di, di                               
  04e6  eb10             jmp 0x4f8                                
  04e8  6a44             push 0x44                                
  04ea  66ff7608         push dword ptr [bp + 8]                  
  04ee  56               push si                                  
  04ef  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  04f4  83c408           add sp, 8                                
  04f7  47               inc di                                   
  04f8  3b7e06           cmp di, word ptr [bp + 6]                
  04fb  7eeb             jle 0x4e8                                
  04fd  56               push si                                  
  04fe  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0503  59               pop cx                                   
  0504  b80100           mov ax, 1                                
  0507  5f               pop di                                   
  0508  5e               pop si                                   
  0509  c9               leave                                    
  050a  cb               retf                                     

ovl14_050b:  ; ENTRY
  050b  55               push bp                                  
  050c  8bec             mov bp, sp                               
  050e  83ec04           sub sp, 4                                
  0511  56               push si                                  
  0512  57               push di                                  
  0513  c746fc0000       mov word ptr [bp - 4], 0                 
  0518  6a02             push 2                                   
  051a  1e               push ds                                  
  051b  68ae05           push 0x5ae                                ; "UDB\UDB.DAT"
  051e  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0523  83c406           add sp, 6                                
  0526  8bf0             mov si, ax                               
  0528  0bf6             or si, si                                
  052a  7d04             jge 0x530                                
  052c  33c0             xor ax, ax                               
  052e  eb45             jmp 0x575                                
  0530  6a02             push 2                                   
  0532  16               push ss                                  
  0533  8d46fe           lea ax, [bp - 2]                         
  0536  50               push ax                                  
  0537  56               push si                                  
  0538  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  053d  83c408           add sp, 8                                
  0540  33ff             xor di, di                               
  0542  eb22             jmp 0x566                                
  0544  6a44             push 0x44                                
  0546  66ff7608         push dword ptr [bp + 8]                  
  054a  56               push si                                  
  054b  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  0550  83c408           add sp, 8                                
  0553  c45e08           les bx, ptr [bp + 8]                     
  0556  268b07           mov ax, word ptr es:[bx]                 
  0559  3b4606           cmp ax, word ptr [bp + 6]                
  055c  7507             jne 0x565                                
  055e  c746fc0100       mov word ptr [bp - 4], 1                 
  0563  eb06             jmp 0x56b                                
  0565  47               inc di                                   
  0566  3b7efe           cmp di, word ptr [bp - 2]                
  0569  7cd9             jl 0x544                                 
  056b  56               push si                                  
  056c  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  0571  59               pop cx                                   
  0572  8b46fc           mov ax, word ptr [bp - 4]                
  0575  5f               pop di                                   
  0576  5e               pop si                                   
  0577  c9               leave                                    
  0578  cb               retf                                     

ovl14_0579:  ; ENTRY
  0579  55               push bp                                  
  057a  8bec             mov bp, sp                               
  057c  83ec48           sub sp, 0x48                             
  057f  56               push si                                  
  0580  57               push di                                  
  0581  c746fc0000       mov word ptr [bp - 4], 0                 
  0586  c45e08           les bx, ptr [bp + 8]                     
  0589  26c707ffff       mov word ptr es:[bx], 0xffff             
  058e  6a02             push 2                                   
  0590  1e               push ds                                  
  0591  68ba05           push 0x5ba                                ; "UDB\UDB.DAT"
  0594  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  0599  83c406           add sp, 6                                
  059c  8bf0             mov si, ax                               
  059e  0bf6             or si, si                                
  05a0  7d04             jge 0x5a6                                
  05a2  33c0             xor ax, ax                               
  05a4  eb49             jmp 0x5ef                                
  05a6  6a02             push 2                                   
  05a8  16               push ss                                  
  05a9  8d46fe           lea ax, [bp - 2]                         
  05ac  50               push ax                                  
  05ad  56               push si                                  
  05ae  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  05b3  83c408           add sp, 8                                
  05b6  33ff             xor di, di                               
  05b8  eb26             jmp 0x5e0                                
  05ba  6a44             push 0x44                                
  05bc  16               push ss                                  
  05bd  8d46b8           lea ax, [bp - 0x48]                      
  05c0  50               push ax                                  
  05c1  56               push si                                  
  05c2  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  05c7  83c408           add sp, 8                                
  05ca  8b46b8           mov ax, word ptr [bp - 0x48]             
  05cd  3b4606           cmp ax, word ptr [bp + 6]                
  05d0  750d             jne 0x5df                                
  05d2  c746fc0100       mov word ptr [bp - 4], 1                 
  05d7  c45e08           les bx, ptr [bp + 8]                     
  05da  26893f           mov word ptr es:[bx], di                 
  05dd  eb06             jmp 0x5e5                                
  05df  47               inc di                                   
  05e0  3b7efe           cmp di, word ptr [bp - 2]                
  05e3  7cd5             jl 0x5ba                                 
  05e5  56               push si                                  
  05e6  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  05eb  59               pop cx                                   
  05ec  8b46fc           mov ax, word ptr [bp - 4]                
  05ef  5f               pop di                                   
  05f0  5e               pop si                                   
  05f1  c9               leave                                    
  05f2  cb               retf                                     
