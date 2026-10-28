; res_151d file_off 0x171d0

res_151d_0009:  ; ENTRY
  0009  55               push bp                                  
  000a  8bec             mov bp, sp                               
  000c  83ec04           sub sp, 4                                
  000f  8c1ed032         mov word ptr [0x32d0], ds                
  0013  c706ce327e37     mov word ptr [0x32ce], 0x377e             ; "SWAP.DAT"
  0019  66680100ffff     push 0xffff0001                          
  001f  666800000200     push 0x20000                             
  0025  66682c018000     push 0x80012c                            
  002b  9a0e00280d       lcall 0xd28, 0xe                         -> 0d28:000e
  0030  83c40c           add sp, 0xc                              
  0033  9a0a00b014       lcall 0x14b0, 0xa                        -> 14b0:000a
  0038  9a0700e211       lcall 0x11e2, 7                          -> 11e2:0007
  003d  833e843300       cmp word ptr [0x3384], 0                 
  0042  743a             je 0x7e                                  
  0044  c41ee734         les bx, ptr [0x34e7]                     
  0048  268b4702         mov ax, word ptr es:[bx + 2]             
  004c  26f76f06         imul word ptr es:[bx + 6]                
  0050  d1e0             shl ax, 1                                
  0052  c1e804           shr ax, 4                                
  0055  268b5708         mov dx, word ptr es:[bx + 8]             
  0059  03d0             add dx, ax                               
  005b  8956fe           mov word ptr [bp - 2], dx                
  005e  268b4702         mov ax, word ptr es:[bx + 2]             
  0062  26f76f06         imul word ptr es:[bx + 6]                
  0066  d1e0             shl ax, 1                                
  0068  33d2             xor dx, dx                               
  006a  2bd0             sub dx, ax                               
  006c  c1ea04           shr dx, 4                                
  006f  8956fc           mov word ptr [bp - 4], dx                
  0072  52               push dx                                  
  0073  ff76fe           push word ptr [bp - 2]                   
  0076  9a0900cc0e       lcall 0xecc, 9                           -> 0ecc:0009
  007b  83c404           add sp, 4                                
  007e  c9               leave                                    
  007f  cb               retf                                     

res_151d_0080:  ; ENTRY
  0080  55               push bp                                  
  0081  8bec             mov bp, sp                               
  0083  9af300280d       lcall 0xd28, 0xf3                        -> 0d28:00f3
  0088  5d               pop bp                                   
  0089  cb               retf                                     

res_151d_008a:  ; ENTRY
  008a  55               push bp                                  
  008b  8bec             mov bp, sp                               
  008d  9aac02bf12       lcall 0x12bf, 0x2ac                      -> 12bf:02ac
  0092  9a8508a908       lcall 0x8a9, 0x885                       -> 08a9:0885
  0097  5d               pop bp                                   
  0098  cb               retf                                     

res_151d_0099:  ; ENTRY
  0099  55               push bp                                  
  009a  8bec             mov bp, sp                               
  009c  81eca400         sub sp, 0xa4                             
  00a0  8d460a           lea ax, [bp + 0xa]                       
  00a3  8c56fe           mov word ptr [bp - 2], ss                
  00a6  8946fc           mov word ptr [bp - 4], ax                
  00a9  ff76fe           push word ptr [bp - 2]                   
  00ac  50               push ax                                  
  00ad  66ff7606         push dword ptr [bp + 6]                  
  00b1  16               push ss                                  
  00b2  8d865cff         lea ax, [bp - 0xa4]                      
  00b6  50               push ax                                  
  00b7  9a66490000       lcall 0, 0x4966                          -> 0000:4966
  00bc  83c40c           add sp, 0xc                              
  00bf  16               push ss                                  
  00c0  8d865cff         lea ax, [bp - 0xa4]                      
  00c4  50               push ax                                  
  00c5  9a8f470000       lcall 0, 0x478f                          -> 0000:478f
  00ca  83c404           add sp, 4                                
  00cd  c9               leave                                    
  00ce  cb               retf                                     

res_151d_00cf:  ; ENTRY
  00cf  55               push bp                                  
  00d0  8bec             mov bp, sp                               
  00d2  83ec1a           sub sp, 0x1a                             
  00d5  56               push si                                  
  00d6  57               push di                                  
  00d7  8b7e12           mov di, word ptr [bp + 0x12]             
  00da  833e843300       cmp word ptr [0x3384], 0                 
  00df  7503             jne 0xe4                                 
  00e1  e98502           jmp 0x369                                
  00e4  c45e06           les bx, ptr [bp + 6]                     
  00e7  26833f00         cmp word ptr es:[bx], 0                  
  00eb  7534             jne 0x121                                
  00ed  6a01             push 1                                   
  00ef  c45e0a           les bx, ptr [bp + 0xa]                   
  00f2  26ff7706         push word ptr es:[bx + 6]                
  00f6  26ff7704         push word ptr es:[bx + 4]                
  00fa  66ff760e         push dword ptr [bp + 0xe]                
  00fe  9a32021210       lcall 0x1012, 0x232                      -> 1012:0232
  0103  83c40a           add sp, 0xa                              
  0106  0bc0             or ax, ax                                
  0108  750f             jne 0x119                                
  010a  1e               push ds                                  
  010b  688737           push 0x3787                               ; "cannot allocate mask"
  010e  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  0113  83c404           add sp, 4                                
  0116  e95002           jmp 0x369                                
  0119  c45e06           les bx, ptr [bp + 6]                     
  011c  26c7070100       mov word ptr es:[bx], 1                  
  0121  c45e0a           les bx, ptr [bp + 0xa]                   
  0124  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  012a  744b             je 0x177                                 
  012c  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0132  7543             jne 0x177                                
  0134  c746f60000       mov word ptr [bp - 0xa], 0               
  0139  eb2e             jmp 0x169                                
  013b  8b46f6           mov ax, word ptr [bp - 0xa]              
  013e  c1e002           shl ax, 2                                
  0141  c45e0a           les bx, ptr [bp + 0xa]                   
  0144  03d8             add bx, ax                               
  0146  6626ff770a       push dword ptr es:[bx + 0xa]             
  014b  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  0150  83c404           add sp, 4                                
  0153  8b5ef6           mov bx, word ptr [bp - 0xa]              
  0156  c1e302           shl bx, 2                                
  0159  c4760a           les si, ptr [bp + 0xa]                   
  015c  03f3             add si, bx                               
  015e  2689541c         mov word ptr es:[si + 0x1c], dx          
  0162  2689441a         mov word ptr es:[si + 0x1a], ax          
  0166  ff46f6           inc word ptr [bp - 0xa]                  
  0169  c45e0a           les bx, ptr [bp + 0xa]                   
  016c  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0170  b400             mov ah, 0                                
  0172  3b46f6           cmp ax, word ptr [bp - 0xa]              
  0175  7fc4             jg 0x13b                                 
  0177  c45e0e           les bx, ptr [bp + 0xe]                   
  017a  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0180  744b             je 0x1cd                                 
  0182  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0188  7543             jne 0x1cd                                
  018a  c746f60000       mov word ptr [bp - 0xa], 0               
  018f  eb2e             jmp 0x1bf                                
  0191  8b46f6           mov ax, word ptr [bp - 0xa]              
  0194  c1e002           shl ax, 2                                
  0197  c45e0e           les bx, ptr [bp + 0xe]                   
  019a  03d8             add bx, ax                               
  019c  6626ff770a       push dword ptr es:[bx + 0xa]             
  01a1  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  01a6  83c404           add sp, 4                                
  01a9  8b5ef6           mov bx, word ptr [bp - 0xa]              
  01ac  c1e302           shl bx, 2                                
  01af  c4760e           les si, ptr [bp + 0xe]                   
  01b2  03f3             add si, bx                               
  01b4  2689541c         mov word ptr es:[si + 0x1c], dx          
  01b8  2689441a         mov word ptr es:[si + 0x1a], ax          
  01bc  ff46f6           inc word ptr [bp - 0xa]                  
  01bf  c45e0e           les bx, ptr [bp + 0xe]                   
  01c2  268a4734         mov al, byte ptr es:[bx + 0x34]          
  01c6  b400             mov ah, 0                                
  01c8  3b46f6           cmp ax, word ptr [bp - 0xa]              
  01cb  7fc4             jg 0x191                                 
  01cd  c746fc0000       mov word ptr [bp - 4], 0                 
  01d2  eb28             jmp 0x1fc                                
  01d4  8b5efc           mov bx, word ptr [bp - 4]                
  01d7  c1e302           shl bx, 2                                
  01da  8d46e6           lea ax, [bp - 0x1a]                      
  01dd  03d8             add bx, ax                               
  01df  8b46fc           mov ax, word ptr [bp - 4]                
  01e2  c1e002           shl ax, 2                                
  01e5  c4760a           les si, ptr [bp + 0xa]                   
  01e8  03f0             add si, ax                               
  01ea  268b441c         mov ax, word ptr es:[si + 0x1c]          
  01ee  268b541a         mov dx, word ptr es:[si + 0x1a]          
  01f2  36894702         mov word ptr ss:[bx + 2], ax             
  01f6  368917           mov word ptr ss:[bx], dx                 
  01f9  ff46fc           inc word ptr [bp - 4]                    
  01fc  c45e0a           les bx, ptr [bp + 0xa]                   
  01ff  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0203  b400             mov ah, 0                                
  0205  3b46fc           cmp ax, word ptr [bp - 4]                
  0208  77ca             ja 0x1d4                                 
  020a  c45e0e           les bx, ptr [bp + 0xe]                   
  020d  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0212  668946f8         mov dword ptr [bp - 8], eax              
  0216  c45e0a           les bx, ptr [bp + 0xa]                   
  0219  268b4708         mov ax, word ptr es:[bx + 8]             
  021d  26f76f06         imul word ptr es:[bx + 6]                
  0221  8946fe           mov word ptr [bp - 2], ax                
  0224  e9bd00           jmp 0x2e4                                
  0227  f7c70100         test di, 1                               
  022b  7404             je 0x231                                 
  022d  33c0             xor ax, ax                               
  022f  eb06             jmp 0x237                                
  0231  c45ee6           les bx, ptr [bp - 0x1a]                  
  0234  268b07           mov ax, word ptr es:[bx]                 
  0237  50               push ax                                  
  0238  f7c70200         test di, 2                               
  023c  7404             je 0x242                                 
  023e  33c0             xor ax, ax                               
  0240  eb06             jmp 0x248                                
  0242  c45eea           les bx, ptr [bp - 0x16]                  
  0245  268b07           mov ax, word ptr es:[bx]                 
  0248  5a               pop dx                                   
  0249  0bd0             or dx, ax                                
  024b  52               push dx                                  
  024c  f7c70400         test di, 4                               
  0250  7404             je 0x256                                 
  0252  33c0             xor ax, ax                               
  0254  eb06             jmp 0x25c                                
  0256  c45eee           les bx, ptr [bp - 0x12]                  
  0259  268b07           mov ax, word ptr es:[bx]                 
  025c  5a               pop dx                                   
  025d  0bd0             or dx, ax                                
  025f  52               push dx                                  
  0260  f7c70800         test di, 8                               
  0264  7404             je 0x26a                                 
  0266  33c0             xor ax, ax                               
  0268  eb06             jmp 0x270                                
  026a  c45ef2           les bx, ptr [bp - 0xe]                   
  026d  268b07           mov ax, word ptr es:[bx]                 
  0270  5a               pop dx                                   
  0271  0bd0             or dx, ax                                
  0273  83f2ff           xor dx, 0xffff                           
  0276  52               push dx                                  
  0277  f7c70100         test di, 1                               
  027b  7408             je 0x285                                 
  027d  c45ee6           les bx, ptr [bp - 0x1a]                  
  0280  268b07           mov ax, word ptr es:[bx]                 
  0283  eb03             jmp 0x288                                
  0285  b8ffff           mov ax, 0xffff                           
  0288  5a               pop dx                                   
  0289  23d0             and dx, ax                               
  028b  52               push dx                                  
  028c  f7c70200         test di, 2                               
  0290  7408             je 0x29a                                 
  0292  c45eea           les bx, ptr [bp - 0x16]                  
  0295  268b07           mov ax, word ptr es:[bx]                 
  0298  eb03             jmp 0x29d                                
  029a  b8ffff           mov ax, 0xffff                           
  029d  5a               pop dx                                   
  029e  23d0             and dx, ax                               
  02a0  52               push dx                                  
  02a1  f7c70400         test di, 4                               
  02a5  7408             je 0x2af                                 
  02a7  c45eee           les bx, ptr [bp - 0x12]                  
  02aa  268b07           mov ax, word ptr es:[bx]                 
  02ad  eb03             jmp 0x2b2                                
  02af  b8ffff           mov ax, 0xffff                           
  02b2  5a               pop dx                                   
  02b3  23d0             and dx, ax                               
  02b5  52               push dx                                  
  02b6  f7c70800         test di, 8                               
  02ba  7408             je 0x2c4                                 
  02bc  c45ef2           les bx, ptr [bp - 0xe]                   
  02bf  268b07           mov ax, word ptr es:[bx]                 
  02c2  eb03             jmp 0x2c7                                
  02c4  b8ffff           mov ax, 0xffff                           
  02c7  5a               pop dx                                   
  02c8  23d0             and dx, ax                               
  02ca  c45ef8           les bx, ptr [bp - 8]                     
  02cd  268917           mov word ptr es:[bx], dx                 
  02d0  8346e602         add word ptr [bp - 0x1a], 2              
  02d4  8346ea02         add word ptr [bp - 0x16], 2              
  02d8  8346ee02         add word ptr [bp - 0x12], 2              
  02dc  8346f202         add word ptr [bp - 0xe], 2               
  02e0  8346f802         add word ptr [bp - 8], 2                 
  02e4  8b46fe           mov ax, word ptr [bp - 2]                
  02e7  ff4efe           dec word ptr [bp - 2]                    
  02ea  0bc0             or ax, ax                                
  02ec  7403             je 0x2f1                                 
  02ee  e936ff           jmp 0x227                                
  02f1  c45e0a           les bx, ptr [bp + 0xa]                   
  02f4  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  02fa  7431             je 0x32d                                 
  02fc  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  0302  7529             jne 0x32d                                
  0304  33f6             xor si, si                               
  0306  eb18             jmp 0x320                                
  0308  8bc6             mov ax, si                               
  030a  c1e002           shl ax, 2                                
  030d  c45e0a           les bx, ptr [bp + 0xa]                   
  0310  03d8             add bx, ax                               
  0312  6626ff770a       push dword ptr es:[bx + 0xa]             
  0317  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  031c  83c404           add sp, 4                                
  031f  46               inc si                                   
  0320  c45e0a           les bx, ptr [bp + 0xa]                   
  0323  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0327  b400             mov ah, 0                                
  0329  3bc6             cmp ax, si                               
  032b  7fdb             jg 0x308                                 
  032d  c45e0e           les bx, ptr [bp + 0xe]                   
  0330  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0336  7431             je 0x369                                 
  0338  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  033e  7529             jne 0x369                                
  0340  33f6             xor si, si                               
  0342  eb18             jmp 0x35c                                
  0344  8bc6             mov ax, si                               
  0346  c1e002           shl ax, 2                                
  0349  c45e0e           les bx, ptr [bp + 0xe]                   
  034c  03d8             add bx, ax                               
  034e  6626ff770a       push dword ptr es:[bx + 0xa]             
  0353  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  0358  83c404           add sp, 4                                
  035b  46               inc si                                   
  035c  c45e0e           les bx, ptr [bp + 0xe]                   
  035f  268a4734         mov al, byte ptr es:[bx + 0x34]          
  0363  b400             mov ah, 0                                
  0365  3bc6             cmp ax, si                               
  0367  7fdb             jg 0x344                                 
  0369  5f               pop di                                   
  036a  5e               pop si                                   
  036b  c9               leave                                    
  036c  cb               retf                                     
  036d  55               push bp                                  
