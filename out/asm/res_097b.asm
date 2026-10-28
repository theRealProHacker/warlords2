; res_097b file_off 0xb7b0

res_097b_0005:  ; ENTRY
  0005  55               push bp                                  
  0006  8bec             mov bp, sp                               
  0008  83ec6e           sub sp, 0x6e                             
  000b  56               push si                                  
  000c  57               push di                                  
  000d  66ff760a         push dword ptr [bp + 0xa]                
  0011  16               push ss                                  
  0012  8d4692           lea ax, [bp - 0x6e]                      
  0015  50               push ax                                  
  0016  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  001b  83c408           add sp, 8                                
  001e  66ff760e         push dword ptr [bp + 0xe]                
  0022  16               push ss                                  
  0023  8d4692           lea ax, [bp - 0x6e]                      
  0026  50               push ax                                  
  0027  9a014a0000       lcall 0, 0x4a01                          -> 0000:4a01
  002c  83c408           add sp, 8                                
  002f  6a02             push 2                                   
  0031  16               push ss                                  
  0032  8d4692           lea ax, [bp - 0x6e]                      
  0035  50               push ax                                  
  0036  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  003b  83c406           add sp, 6                                
  003e  a35a4c           mov word ptr [0x4c5a], ax                
  0041  3dffff           cmp ax, 0xffff                           
  0044  7505             jne 0x4b                                 
  0046  33c0             xor ax, ax                               
  0048  e97f01           jmp 0x1ca                                
  004b  6a06             push 6                                   
  004d  1e               push ds                                  
  004e  68544c           push 0x4c54                              
  0051  ff365a4c         push word ptr [0x4c5a]                   
  0055  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  005a  83c408           add sp, 8                                
  005d  66ff36564c       push dword ptr [0x4c56]                  
  0062  66ff7606         push dword ptr [bp + 6]                  
  0066  9afe011210       lcall 0x1012, 0x1fe                      -> 1012:01fe
  006b  83c408           add sp, 8                                
  006e  0bc0             or ax, ax                                
  0070  750e             jne 0x80                                 
  0072  1e               push ds                                  
  0073  68f61e           push 0x1ef6                              
  0076  9aac430000       lcall 0, 0x43ac                          -> 0000:43ac
  007b  83c404           add sp, 4                                
  007e  ebc6             jmp 0x46                                 
  0080  6a00             push 0                                   
  0082  66ff7606         push dword ptr [bp + 6]                  
  0086  9acc071210       lcall 0x1012, 0x7cc                      -> 1012:07cc
  008b  83c406           add sp, 6                                
  008e  c45e06           les bx, ptr [bp + 6]                     
  0091  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0097  7443             je 0xdc                                  
  0099  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  009f  753b             jne 0xdc                                 
  00a1  33ff             xor di, di                               
  00a3  eb2a             jmp 0xcf                                 
  00a5  8bc7             mov ax, di                               
  00a7  c1e002           shl ax, 2                                
  00aa  c45e06           les bx, ptr [bp + 6]                     
  00ad  03d8             add bx, ax                               
  00af  6626ff770a       push dword ptr es:[bx + 0xa]             
  00b4  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  00b9  83c404           add sp, 4                                
  00bc  8bdf             mov bx, di                               
  00be  c1e302           shl bx, 2                                
  00c1  c47606           les si, ptr [bp + 6]                     
  00c4  03f3             add si, bx                               
  00c6  2689541c         mov word ptr es:[si + 0x1c], dx          
  00ca  2689441a         mov word ptr es:[si + 0x1a], ax          
  00ce  47               inc di                                   
  00cf  c45e06           les bx, ptr [bp + 6]                     
  00d2  268a4734         mov al, byte ptr es:[bx + 0x34]          
  00d6  b400             mov ah, 0                                
  00d8  3bc7             cmp ax, di                               
  00da  7fc9             jg 0xa5                                  
  00dc  666a00           push 0                                   
  00df  6a00             push 0                                   
  00e1  666800080000     push 0x800                               
  00e7  9a1f01280d       lcall 0xd28, 0x11f                       -> 0d28:011f
  00ec  83c40a           add sp, 0xa                              
  00ef  8956e4           mov word ptr [bp - 0x1c], dx             
  00f2  8946e2           mov word ptr [bp - 0x1e], ax             
  00f5  52               push dx                                  
  00f6  50               push ax                                  
  00f7  9a9a06280d       lcall 0xd28, 0x69a                       -> 0d28:069a
  00fc  83c404           add sp, 4                                
  00ff  8956fe           mov word ptr [bp - 2], dx                
  0102  8946fc           mov word ptr [bp - 4], ax                
  0105  8956fa           mov word ptr [bp - 6], dx                
  0108  8946f8           mov word ptr [bp - 8], ax                
  010b  8146f80004       add word ptr [bp - 8], 0x400             
  0110  a1564c           mov ax, word ptr [0x4c56]                
  0113  bb0800           mov bx, 8                                
  0116  99               cdq                                      
  0117  f7fb             idiv bx                                  
  0119  f72e584c         imul word ptr [0x4c58]                   
  011d  8946f6           mov word ptr [bp - 0xa], ax              
  0120  c45e06           les bx, ptr [bp + 6]                     
  0123  66268b471a       mov eax, dword ptr es:[bx + 0x1a]        
  0128  668946f2         mov dword ptr [bp - 0xe], eax            
  012c  66268b471e       mov eax, dword ptr es:[bx + 0x1e]        
  0131  668946ee         mov dword ptr [bp - 0x12], eax           
  0135  66268b4722       mov eax, dword ptr es:[bx + 0x22]        
  013a  668946ea         mov dword ptr [bp - 0x16], eax           
  013e  66268b4726       mov eax, dword ptr es:[bx + 0x26]        
  0143  668946e6         mov dword ptr [bp - 0x1a], eax           
  0147  6a00             push 0                                   
  0149  66ff76e6         push dword ptr [bp - 0x1a]               
  014d  66ff76ea         push dword ptr [bp - 0x16]               
  0151  66ff76ee         push dword ptr [bp - 0x12]               
  0155  6a04             push 4                                   
  0157  ff76f6           push word ptr [bp - 0xa]                 
  015a  680004           push 0x400                               
  015d  66ff76f8         push dword ptr [bp - 8]                  
  0161  66ff76fc         push dword ptr [bp - 4]                  
  0165  ff365a4c         push word ptr [0x4c5a]                   
  0169  66ff76f2         push dword ptr [bp - 0xe]                
  016d  9a59001907       lcall 0x719, 0x59                        -> 0719:0059
  0172  83c422           add sp, 0x22                             
  0175  66ff76e2         push dword ptr [bp - 0x1e]               
  0179  9a8e04280d       lcall 0xd28, 0x48e                       -> 0d28:048e
  017e  83c404           add sp, 4                                
  0181  ff365a4c         push word ptr [0x4c5a]                   
  0185  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  018a  59               pop cx                                   
  018b  c45e06           les bx, ptr [bp + 6]                     
  018e  6626837f0a00     cmp dword ptr es:[bx + 0xa], 0           
  0194  7431             je 0x1c7                                 
  0196  26f747350a00     test word ptr es:[bx + 0x35], 0xa        
  019c  7529             jne 0x1c7                                
  019e  33f6             xor si, si                               
  01a0  eb18             jmp 0x1ba                                
  01a2  8bc6             mov ax, si                               
  01a4  c1e002           shl ax, 2                                
  01a7  c45e06           les bx, ptr [bp + 6]                     
  01aa  03d8             add bx, ax                               
  01ac  6626ff770a       push dword ptr es:[bx + 0xa]             
  01b1  9aa907280d       lcall 0xd28, 0x7a9                       -> 0d28:07a9
  01b6  83c404           add sp, 4                                
  01b9  46               inc si                                   
  01ba  c45e06           les bx, ptr [bp + 6]                     
  01bd  268a4734         mov al, byte ptr es:[bx + 0x34]          
  01c1  b400             mov ah, 0                                
  01c3  3bc6             cmp ax, si                               
  01c5  7fdb             jg 0x1a2                                 
  01c7  b80100           mov ax, 1                                
  01ca  5f               pop di                                   
  01cb  5e               pop si                                   
  01cc  c9               leave                                    
  01cd  cb               retf                                     
  01ce  55               push bp                                  
