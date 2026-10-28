; ovl54 stub 309d file_off 0x70820 size 0x365

ovl54_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec04           sub sp, 4                                
  0006  6a00             push 0                                   
  0008  90               nop                                      
  0009  0e               push cs                                  
  000a  e88b01           call 0x198                               
  000d  59               pop cx                                   
  000e  8956fe           mov word ptr [bp - 2], dx                
  0011  8946fc           mov word ptr [bp - 4], ax                
  0014  c45efc           les bx, ptr [bp - 4]                     
  0017  268b570a         mov dx, word ptr es:[bx + 0xa]           
  001b  eb2a             jmp 0x47                                 
  001d  c45efc           les bx, ptr [bp - 4]                     
  0020  26c45f04         les bx, ptr es:[bx + 4]                  
  0024  8bc2             mov ax, dx                               
  0026  c1e003           shl ax, 3                                
  0029  03d8             add bx, ax                               
  002b  268b07           mov ax, word ptr es:[bx]                 
  002e  3b4606           cmp ax, word ptr [bp + 6]                
  0031  7514             jne 0x47                                 
  0033  c45efc           les bx, ptr [bp - 4]                     
  0036  26c45f04         les bx, ptr es:[bx + 4]                  
  003a  8bc2             mov ax, dx                               
  003c  c1e003           shl ax, 3                                
  003f  03d8             add bx, ax                               
  0041  268b4706         mov ax, word ptr es:[bx + 6]             
  0045  eb09             jmp 0x50                                 
  0047  8bc2             mov ax, dx                               
  0049  4a               dec dx                                   
  004a  0bc0             or ax, ax                                
  004c  75cf             jne 0x1d                                 
  004e  33c0             xor ax, ax                               
  0050  c9               leave                                    
  0051  cb               retf                                     

ovl54_0052:  ; ENTRY
  0052  55               push bp                                  
  0053  8bec             mov bp, sp                               
  0055  83ec0e           sub sp, 0xe                              
  0058  56               push si                                  
  0059  57               push di                                  
  005a  bf0800           mov di, 8                                
  005d  c746fe0800       mov word ptr [bp - 2], 8                 
  0062  ff7606           push word ptr [bp + 6]                   
  0065  90               nop                                      
  0066  0e               push cs                                  
  0067  e82e01           call 0x198                               
  006a  59               pop cx                                   
  006b  8956fc           mov word ptr [bp - 4], dx                
  006e  8946fa           mov word ptr [bp - 6], ax                
  0071  6a01             push 1                                   
  0073  90               nop                                      
  0074  0e               push cs                                  
  0075  e82402           call 0x29c                               
  0078  59               pop cx                                   
  0079  33f6             xor si, si                               
  007b  e9f400           jmp 0x172                                
  007e  c45efa           les bx, ptr [bp - 6]                     
  0081  268b4702         mov ax, word ptr es:[bx + 2]             
  0085  268b17           mov dx, word ptr es:[bx]                 
  0088  8bde             mov bx, si                               
  008a  6bdb2e           imul bx, bx, 0x2e                        
  008d  03d3             add dx, bx                               
  008f  8946f4           mov word ptr [bp - 0xc], ax              
  0092  8956f2           mov word ptr [bp - 0xe], dx              
  0095  8bde             mov bx, si                               
  0097  6bdb0c           imul bx, bx, 0xc                         
  009a  8b87de1a         mov ax, word ptr [bx + 0x1ade]           
  009e  8b97dc1a         mov dx, word ptr [bx + 0x1adc]           
  00a2  c45ef2           les bx, ptr [bp - 0xe]                   
  00a5  26894702         mov word ptr es:[bx + 2], ax             
  00a9  268917           mov word ptr es:[bx], dx                 
  00ac  8bde             mov bx, si                               
  00ae  6bdb0c           imul bx, bx, 0xc                         
  00b1  8b87e21a         mov ax, word ptr [bx + 0x1ae2]           
  00b5  8b97e01a         mov dx, word ptr [bx + 0x1ae0]           
  00b9  8b5ef2           mov bx, word ptr [bp - 0xe]              
  00bc  26894706         mov word ptr es:[bx + 6], ax             
  00c0  26895704         mov word ptr es:[bx + 4], dx             
  00c4  8bde             mov bx, si                               
  00c6  6bdb0c           imul bx, bx, 0xc                         
  00c9  8b87e61a         mov ax, word ptr [bx + 0x1ae6]           
  00cd  8b5ef2           mov bx, word ptr [bp - 0xe]              
  00d0  26894708         mov word ptr es:[bx + 8], ax             
  00d4  8bde             mov bx, si                               
  00d6  6bdb0c           imul bx, bx, 0xc                         
  00d9  8b87e41a         mov ax, word ptr [bx + 0x1ae4]           
  00dd  8b5ef2           mov bx, word ptr [bp - 0xe]              
  00e0  2689470a         mov word ptr es:[bx + 0xa], ax           
  00e4  16               push ss                                  
  00e5  8d46f6           lea ax, [bp - 0xa]                       
  00e8  50               push ax                                  
  00e9  16               push ss                                  
  00ea  8d46f8           lea ax, [bp - 8]                         
  00ed  50               push ax                                  
  00ee  6626ff7704       push dword ptr es:[bx + 4]               
  00f3  9ab80ae211       lcall 0x11e2, 0xab8                      -> 11e2:0ab8
  00f8  83c40c           add sp, 0xc                              
  00fb  8b46f8           mov ax, word ptr [bp - 8]                
  00fe  050700           add ax, 7                                
  0101  c1f803           sar ax, 3                                
  0104  c1e003           shl ax, 3                                
  0107  8946f8           mov word ptr [bp - 8], ax                
  010a  c45ef2           les bx, ptr [bp - 0xe]                   
  010d  8b46f6           mov ax, word ptr [bp - 0xa]              
  0110  a3504c           mov word ptr [0x4c50], ax                
  0113  2689472c         mov word ptr es:[bx + 0x2c], ax          
  0117  8b46f8           mov ax, word ptr [bp - 8]                
  011a  0346fe           add ax, word ptr [bp - 2]                
  011d  2689470c         mov word ptr es:[bx + 0xc], ax           
  0121  26897f0e         mov word ptr es:[bx + 0xe], di           
  0125  26c747100000     mov word ptr es:[bx + 0x10], 0           
  012b  8b46f8           mov ax, word ptr [bp - 8]                
  012e  0346fe           add ax, word ptr [bp - 2]                
  0131  26894712         mov word ptr es:[bx + 0x12], ax          
  0135  8b46f6           mov ax, word ptr [bp - 0xa]              
  0138  050200           add ax, 2                                
  013b  26894714         mov word ptr es:[bx + 0x14], ax          
  013f  26897f16         mov word ptr es:[bx + 0x16], di          
  0143  8b46f6           mov ax, word ptr [bp - 0xa]              
  0146  050300           add ax, 3                                
  0149  26894718         mov word ptr es:[bx + 0x18], ax          
  014d  6626c7471affff00 mov dword ptr es:[bx + 0x1a], 0xffff     
  0156  26c7471e0100     mov word ptr es:[bx + 0x1e], 1           
  015c  6626c74720000000 mov dword ptr es:[bx + 0x20], 0          
  0165  8b46fe           mov ax, word ptr [bp - 2]                
  0168  d1e0             shl ax, 1                                
  016a  8b56f8           mov dx, word ptr [bp - 8]                
  016d  03d0             add dx, ax                               
  016f  03fa             add di, dx                               
  0171  46               inc si                                   
  0172  c45efa           les bx, ptr [bp - 6]                     
  0175  26397708         cmp word ptr es:[bx + 8], si             
  0179  7e03             jle 0x17e                                
  017b  e900ff           jmp 0x7e                                 
  017e  893e524c         mov word ptr [0x4c52], di                
  0182  689d30           push 0x309d                              
  0185  683e00           push 0x3e                                
  0188  ff76fc           push word ptr [bp - 4]                   
  018b  53               push bx                                  
  018c  9a2f127213       lcall 0x1372, 0x122f                     -> 1372:122f
  0191  83c408           add sp, 8                                
  0194  5f               pop di                                   
  0195  5e               pop si                                   
  0196  c9               leave                                    
  0197  cb               retf                                     

ovl54_0198:  ; ENTRY
  0198  55               push bp                                  
  0199  8bec             mov bp, sp                               
  019b  8b4606           mov ax, word ptr [bp + 6]                
  019e  0bc0             or ax, ax                                
  01a0  7507             jne 0x1a9                                
  01a2  8cda             mov dx, ds                               
  01a4  b8ac1c           mov ax, 0x1cac                           
  01a7  eb04             jmp 0x1ad                                
  01a9  33d2             xor dx, dx                               
  01ab  33c0             xor ax, ax                               
  01ad  5d               pop bp                                   
  01ae  cb               retf                                     

ovl54_01af:  ; ENTRY
  01af  55               push bp                                  
  01b0  8bec             mov bp, sp                               
  01b2  83ec08           sub sp, 8                                
  01b5  56               push si                                  
  01b6  ff7606           push word ptr [bp + 6]                   
  01b9  0e               push cs                                  
  01ba  e8dbff           call 0x198                               
  01bd  59               pop cx                                   
  01be  8956fe           mov word ptr [bp - 2], dx                
  01c1  8946fc           mov word ptr [bp - 4], ax                
  01c4  c45efc           les bx, ptr [bp - 4]                     
  01c7  268b4f0a         mov cx, word ptr es:[bx + 0xa]           
  01cb  e9c100           jmp 0x28f                                
  01ce  c45efc           les bx, ptr [bp - 4]                     
  01d1  26c45f04         les bx, ptr es:[bx + 4]                  
  01d5  8bc1             mov ax, cx                               
  01d7  c1e003           shl ax, 3                                
  01da  03d8             add bx, ax                               
  01dc  268b07           mov ax, word ptr es:[bx]                 
  01df  3b4608           cmp ax, word ptr [bp + 8]                
  01e2  7403             je 0x1e7                                 
  01e4  e9a800           jmp 0x28f                                
  01e7  c45efc           les bx, ptr [bp - 4]                     
  01ea  26c45f04         les bx, ptr es:[bx + 4]                  
  01ee  8bc1             mov ax, cx                               
  01f0  c1e003           shl ax, 3                                
  01f3  03d8             add bx, ax                               
  01f5  268b4702         mov ax, word ptr es:[bx + 2]             
  01f9  6bc02e           imul ax, ax, 0x2e                        
  01fc  c45efc           les bx, ptr [bp - 4]                     
  01ff  268b5702         mov dx, word ptr es:[bx + 2]             
  0203  268b1f           mov bx, word ptr es:[bx]                 
  0206  03d8             add bx, ax                               
  0208  8956fa           mov word ptr [bp - 6], dx                
  020b  895ef8           mov word ptr [bp - 8], bx                
  020e  8b5efc           mov bx, word ptr [bp - 4]                
  0211  26c45f04         les bx, ptr es:[bx + 4]                  
  0215  8bc1             mov ax, cx                               
  0217  c1e003           shl ax, 3                                
  021a  03d8             add bx, ax                               
  021c  268b7704         mov si, word ptr es:[bx + 4]             
  0220  4e               dec si                                   
  0221  33d2             xor dx, dx                               
  0223  eb3a             jmp 0x25f                                
  0225  c45ef8           les bx, ptr [bp - 8]                     
  0228  26c41f           les bx, ptr es:[bx]                      
  022b  8bc2             mov ax, dx                               
  022d  c1e002           shl ax, 2                                
  0230  03d8             add bx, ax                               
  0232  26c41f           les bx, ptr es:[bx]                      
  0235  26803f25         cmp byte ptr es:[bx], 0x25               
  0239  7503             jne 0x23e                                
  023b  42               inc dx                                   
  023c  eb21             jmp 0x25f                                
  023e  8bc6             mov ax, si                               
  0240  4e               dec si                                   
  0241  0bc0             or ax, ax                                
  0243  7430             je 0x275                                 
  0245  42               inc dx                                   
  0246  c45ef8           les bx, ptr [bp - 8]                     
  0249  26c41f           les bx, ptr es:[bx]                      
  024c  8bc2             mov ax, dx                               
  024e  c1e002           shl ax, 2                                
  0251  03d8             add bx, ax                               
  0253  26c41f           les bx, ptr es:[bx]                      
  0256  26803f26         cmp byte ptr es:[bx], 0x26               
  025a  7503             jne 0x25f                                
  025c  83c202           add dx, 2                                
  025f  c45ef8           les bx, ptr [bp - 8]                     
  0262  26c41f           les bx, ptr es:[bx]                      
  0265  8bc2             mov ax, dx                               
  0267  c1e002           shl ax, 2                                
  026a  03d8             add bx, ax                               
  026c  26c41f           les bx, ptr es:[bx]                      
  026f  26803f00         cmp byte ptr es:[bx], 0                  
  0273  75b0             jne 0x225                                
  0275  c45ef8           les bx, ptr [bp - 8]                     
  0278  26c41f           les bx, ptr es:[bx]                      
  027b  8bc2             mov ax, dx                               
  027d  c1e002           shl ax, 2                                
  0280  03d8             add bx, ax                               
  0282  8b460c           mov ax, word ptr [bp + 0xc]              
  0285  8b560a           mov dx, word ptr [bp + 0xa]              
  0288  26894702         mov word ptr es:[bx + 2], ax             
  028c  268917           mov word ptr es:[bx], dx                 
  028f  8bc1             mov ax, cx                               
  0291  49               dec cx                                   
  0292  0bc0             or ax, ax                                
  0294  7403             je 0x299                                 
  0296  e935ff           jmp 0x1ce                                
  0299  5e               pop si                                   
  029a  c9               leave                                    
  029b  cb               retf                                     

ovl54_029c:  ; ENTRY
  029c  55               push bp                                  
  029d  8bec             mov bp, sp                               
  029f  8b4606           mov ax, word ptr [bp + 6]                
  02a2  0bc0             or ax, ax                                
  02a4  740c             je 0x2b2                                 
  02a6  3d0100           cmp ax, 1                                
  02a9  7411             je 0x2bc                                 
  02ab  3d0200           cmp ax, 2                                
  02ae  7414             je 0x2c4                                 
  02b0  eb24             jmp 0x2d6                                
  02b2  666808000800     push 0x80008                             
  02b8  6a00             push 0                                   
  02ba  eb10             jmp 0x2cc                                
  02bc  66680f000f00     push 0xf000f                             
  02c2  ebf4             jmp 0x2b8                                
  02c4  66680f000f00     push 0xf000f                             
  02ca  6a03             push 3                                   
  02cc  6a00             push 0                                   
  02ce  9a2a008a30       lcall 0x308a, 0x2a                       -> ovl50:06ae
  02d3  83c408           add sp, 8                                
  02d6  5d               pop bp                                   
  02d7  cb               retf                                     

ovl54_02d8:  ; ENTRY
  02d8  55               push bp                                  
  02d9  8bec             mov bp, sp                               
  02db  83ec08           sub sp, 8                                
  02de  a1504c           mov ax, word ptr [0x4c50]                
  02e1  050200           add ax, 2                                
  02e4  50               push ax                                  
  02e5  666800008002     push 0x2800000                           
  02eb  6a00             push 0                                   
  02ed  16               push ss                                  
  02ee  8d46f8           lea ax, [bp - 8]                         
  02f1  50               push ax                                  
  02f2  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  02f7  83c40c           add sp, 0xc                              
  02fa  52               push dx                                  
  02fb  50               push ax                                  
  02fc  9ae807bf12       lcall 0x12bf, 0x7e8                      -> 12bf:07e8
  0301  83c404           add sp, 4                                
  0304  6a0f             push 0xf                                 
  0306  9a0200d014       lcall 0x14d0, 2                          -> 14d0:0002
  030b  59               pop cx                                   
  030c  a1504c           mov ax, word ptr [0x4c50]                
  030f  050200           add ax, 2                                
  0312  50               push ax                                  
  0313  666800008002     push 0x2800000                           
  0319  6a00             push 0                                   
  031b  16               push ss                                  
  031c  8d46f8           lea ax, [bp - 8]                         
  031f  50               push ax                                  
  0320  9a2e006d11       lcall 0x116d, 0x2e                       -> 116d:002e
  0325  83c40c           add sp, 0xc                              
  0328  52               push dx                                  
  0329  50               push ax                                  
  032a  9a88026d11       lcall 0x116d, 0x288                      -> 116d:0288
  032f  83c404           add sp, 4                                
  0332  9a6a08bf12       lcall 0x12bf, 0x86a                      -> 12bf:086a
  0337  6a00             push 0                                   
  0339  9a2f137213       lcall 0x1372, 0x132f                     -> 1372:132f
  033e  59               pop cx                                   
  033f  c9               leave                                    
  0340  cb               retf                                     

ovl54_0341:  ; ENTRY
  0341  55               push bp                                  
  0342  8bec             mov bp, sp                               
  0344  c45e06           les bx, ptr [bp + 6]                     
  0347  26c7070000       mov word ptr es:[bx], 0                  
  034c  26c747020000     mov word ptr es:[bx + 2], 0              
  0352  a1524c           mov ax, word ptr [0x4c52]                
  0355  26894704         mov word ptr es:[bx + 4], ax             
  0359  a1504c           mov ax, word ptr [0x4c50]                
  035c  050200           add ax, 2                                
  035f  26894706         mov word ptr es:[bx + 6], ax             
  0363  5d               pop bp                                   
  0364  cb               retf                                     
