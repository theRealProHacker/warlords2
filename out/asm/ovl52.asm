; ovl52 stub 3096 file_off 0x6f620 size 0x1a5

ovl52_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec08           sub sp, 8                                
  0006  6a00             push 0                                   
  0008  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  000d  59               pop cx                                   
  000e  666880025e01     push 0x15e0280                           
  0014  666a00           push 0                                   
  0017  16               push ss                                  
  0018  8d46f8           lea ax, [bp - 8]                         
  001b  50               push ax                                  
  001c  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0021  83c40c           add sp, 0xc                              
  0024  52               push dx                                  
  0025  50               push ax                                  
  0026  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  002b  83c404           add sp, 4                                
  002e  9a2500ba30       lcall 0x30ba, 0x25                       -> ovl58:0b5f
  0033  66ff7606         push dword ptr [bp + 6]                  
  0037  1e               push ds                                  
  0038  685616           push 0x1656                              
  003b  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  0040  83c408           add sp, 8                                
  0043  9a2f00c130       lcall 0x30c1, 0x2f                       -> ovl59:012b
  0048  9ab5024c0a       lcall 0xa4c, 0x2b5                       -> 0a4c:02b5
  004d  c9               leave                                    
  004e  cb               retf                                     

ovl52_004f:  ; ENTRY
  004f  55               push bp                                  
  0050  8bec             mov bp, sp                               
  0052  5d               pop bp                                   
  0053  cb               retf                                     

ovl52_0054:  ; ENTRY
  0054  55               push bp                                  
  0055  8bec             mov bp, sp                               
  0057  56               push si                                  
  0058  666a18           push 0x18                                
  005b  9a7000c130       lcall 0x30c1, 0x70                       -> ovl59:0505
  0060  83c404           add sp, 4                                
  0063  52               push dx                                  
  0064  50               push ax                                  
  0065  1e               push ds                                  
  0066  686916           push 0x1669                              
  0069  1e               push ds                                  
  006a  68e015           push 0x15e0                              
  006d  9a05007b09       lcall 0x97b, 5                           -> 097b:0005
  0072  83c40c           add sp, 0xc                              
  0075  0bc0             or ax, ax                                
  0077  7514             jne 0x8d                                 
  0079  666a02           push 2                                   
  007c  9a7500c130       lcall 0x30c1, 0x75                       -> ovl59:051a
  0081  83c404           add sp, 4                                
  0084  52               push dx                                  
  0085  50               push ax                                  
  0086  0e               push cs                                  
  0087  e876ff           call 0                                   
  008a  83c404           add sp, 4                                
  008d  66833eea1500     cmp dword ptr [0x15ea], 0                
  0093  7428             je 0xbd                                  
  0095  f70615160a00     test word ptr [0x1615], 0xa              
  009b  7520             jne 0xbd                                 
  009d  33f6             xor si, si                               
  009f  eb13             jmp 0xb4                                 
  00a1  8bde             mov bx, si                               
  00a3  c1e302           shl bx, 2                                
  00a6  66ffb7ea15       push dword ptr [bx + 0x15ea]             
  00ab  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  00b0  83c404           add sp, 4                                
  00b3  46               inc si                                   
  00b4  a01416           mov al, byte ptr [0x1614]                
  00b7  b400             mov ah, 0                                
  00b9  3bc6             cmp ax, si                               
  00bb  7fe4             jg 0xa1                                  
  00bd  9a8900c130       lcall 0x30c1, 0x89                       -> ovl59:0a1b
  00c2  66833eea1500     cmp dword ptr [0x15ea], 0                
  00c8  7435             je 0xff                                  
  00ca  f70615160a00     test word ptr [0x1615], 0xa              
  00d0  752d             jne 0xff                                 
  00d2  33f6             xor si, si                               
  00d4  eb20             jmp 0xf6                                 
  00d6  8bde             mov bx, si                               
  00d8  c1e302           shl bx, 2                                
  00db  66ffb7ea15       push dword ptr [bx + 0x15ea]             
  00e0  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  00e5  83c404           add sp, 4                                
  00e8  8bde             mov bx, si                               
  00ea  c1e302           shl bx, 2                                
  00ed  8997fc15         mov word ptr [bx + 0x15fc], dx           
  00f1  8987fa15         mov word ptr [bx + 0x15fa], ax           
  00f5  46               inc si                                   
  00f6  a01416           mov al, byte ptr [0x1614]                
  00f9  b400             mov ah, 0                                
  00fb  3bc6             cmp ax, si                               
  00fd  7fd7             jg 0xd6                                  
  00ff  6a01             push 1                                   
  0101  1e               push ds                                  
  0102  68e015           push 0x15e0                              
  0105  9ae3091210       lcall 0x1012, 0x9e3                      -> 1012:09e3
  010a  83c406           add sp, 6                                
  010d  66680a000100     push 0x1000a                             
  0113  1e               push ds                                  
  0114  68e015           push 0x15e0                              
  0117  9a00000907       lcall 0x709, 0                           -> 0709:0000
  011c  83c408           add sp, 8                                
  011f  66833eea1500     cmp dword ptr [0x15ea], 0                
  0125  7428             je 0x14f                                 
  0127  f70615160a00     test word ptr [0x1615], 0xa              
  012d  7520             jne 0x14f                                
  012f  33f6             xor si, si                               
  0131  eb13             jmp 0x146                                
  0133  8bde             mov bx, si                               
  0135  c1e302           shl bx, 2                                
  0138  66ffb7ea15       push dword ptr [bx + 0x15ea]             
  013d  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0142  83c404           add sp, 4                                
  0145  46               inc si                                   
  0146  a01416           mov al, byte ptr [0x1614]                
  0149  b400             mov ah, 0                                
  014b  3bc6             cmp ax, si                               
  014d  7fe4             jg 0x133                                 
  014f  6a0a             push 0xa                                 
  0151  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  0156  59               pop cx                                   
  0157  6a0f             push 0xf                                 
  0159  9a4a039709       lcall 0x997, 0x34a                       -> 0997:034a
  015e  59               pop cx                                   
  015f  1e               push ds                                  
  0160  685955           push 0x5559                              
  0163  9a75091210       lcall 0x1012, 0x975                      -> 1012:0975
  0168  83c404           add sp, 4                                
  016b  666828000400     push 0x40028                             
  0171  6a03             push 3                                   
  0173  1e               push ds                                  
  0174  681b16           push 0x161b                              
  0177  9afb091210       lcall 0x1012, 0x9fb                      -> 1012:09fb
  017c  83c40a           add sp, 0xa                              
  017f  6a00             push 0                                   
  0181  1e               push ds                                  
  0182  681b16           push 0x161b                              
  0185  9acc071210       lcall 0x1012, 0x7cc                      -> 1012:07cc
  018a  83c406           add sp, 6                                
  018d  666838010100     push 0x10138                             
  0193  68e000           push 0xe0                                
  0196  1e               push ds                                  
  0197  68e354           push 0x54e3                              
  019a  9a32021210       lcall 0x1012, 0x232                      -> 1012:0232
  019f  83c40a           add sp, 0xa                              
  01a2  5e               pop si                                   
  01a3  5d               pop bp                                   
  01a4  cb               retf                                     
