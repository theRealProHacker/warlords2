; ovl23 stub 2fd1 file_off 0x4f900 size 0x536

ovl23_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  56               push si                                  
  0004  57               push di                                  
  0005  8b7e06           mov di, word ptr [bp + 6]                
  0008  33f6             xor si, si                               
  000a  eb45             jmp 0x51                                 
  000c  c45e0a           les bx, ptr [bp + 0xa]                   
  000f  26803f00         cmp byte ptr es:[bx], 0                  
  0013  7423             je 0x38                                  
  0015  ff7610           push word ptr [bp + 0x10]                
  0018  ff760e           push word ptr [bp + 0xe]                 
  001b  c45e0a           les bx, ptr [bp + 0xa]                   
  001e  268a07           mov al, byte ptr es:[bx]                 
  0021  98               cwde                                     
  0022  50               push ax                                  
  0023  ff7608           push word ptr [bp + 8]                   
  0026  8bc7             mov ax, di                               
  0028  03c6             add ax, si                               
  002a  50               push ax                                  
  002b  90               nop                                      
  002c  0e               push cs                                  
  002d  e81401           call 0x144                               
  0030  83c40a           add sp, 0xa                              
  0033  ff460a           inc word ptr [bp + 0xa]                  
  0036  eb18             jmp 0x50                                 
  0038  ff7610           push word ptr [bp + 0x10]                
  003b  ff760e           push word ptr [bp + 0xe]                 
  003e  6a20             push 0x20                                
  0040  ff7608           push word ptr [bp + 8]                   
  0043  8bc7             mov ax, di                               
  0045  03c6             add ax, si                               
  0047  50               push ax                                  
  0048  90               nop                                      
  0049  0e               push cs                                  
  004a  e8f700           call 0x144                               
  004d  83c40a           add sp, 0xa                              
  0050  46               inc si                                   
  0051  3b7612           cmp si, word ptr [bp + 0x12]             
  0054  72b6             jb 0xc                                   
  0056  5f               pop di                                   
  0057  5e               pop si                                   
  0058  5d               pop bp                                   
  0059  cb               retf                                     

ovl23_005a:  ; ENTRY
  005a  55               push bp                                  
  005b  8bec             mov bp, sp                               
  005d  56               push si                                  
  005e  57               push di                                  
  005f  8b7606           mov si, word ptr [bp + 6]                
  0062  33ff             xor di, di                               
  0064  eb26             jmp 0x8c                                 
  0066  ff7610           push word ptr [bp + 0x10]                
  0069  ff760e           push word ptr [bp + 0xe]                 
  006c  c45e0a           les bx, ptr [bp + 0xa]                   
  006f  268a07           mov al, byte ptr es:[bx]                 
  0072  98               cwde                                     
  0073  50               push ax                                  
  0074  ff7608           push word ptr [bp + 8]                   
  0077  56               push si                                  
  0078  90               nop                                      
  0079  0e               push cs                                  
  007a  e8c700           call 0x144                               
  007d  83c40a           add sp, 0xa                              
  0080  ff460a           inc word ptr [bp + 0xa]                  
  0083  46               inc si                                   
  0084  47               inc di                                   
  0085  83ff50           cmp di, 0x50                             
  0088  7502             jne 0x8c                                 
  008a  eb09             jmp 0x95                                 
  008c  c45e0a           les bx, ptr [bp + 0xa]                   
  008f  26803f00         cmp byte ptr es:[bx], 0                  
  0093  75d1             jne 0x66                                 
  0095  5f               pop di                                   
  0096  5e               pop si                                   
  0097  5d               pop bp                                   
  0098  cb               retf                                     

ovl23_0099:  ; ENTRY
  0099  55               push bp                                  
  009a  8bec             mov bp, sp                               
  009c  83ec0a           sub sp, 0xa                              
  009f  56               push si                                  
  00a0  57               push di                                  
  00a1  bf1027           mov di, 0x2710                           
  00a4  33f6             xor si, si                               
  00a6  eb26             jmp 0xce                                 
  00a8  8b460a           mov ax, word ptr [bp + 0xa]              
  00ab  33d2             xor dx, dx                               
  00ad  f7f7             div di                                   
  00af  8946f8           mov word ptr [bp - 8], ax                
  00b2  8a46f8           mov al, byte ptr [bp - 8]                
  00b5  0430             add al, 0x30                             
  00b7  8842fa           mov byte ptr [bp + si - 6], al           
  00ba  8b46f8           mov ax, word ptr [bp - 8]                
  00bd  f7ef             imul di                                  
  00bf  29460a           sub word ptr [bp + 0xa], ax              
  00c2  8bc7             mov ax, di                               
  00c4  bb0a00           mov bx, 0xa                              
  00c7  33d2             xor dx, dx                               
  00c9  f7f3             div bx                                   
  00cb  8bf8             mov di, ax                               
  00cd  46               inc si                                   
  00ce  83fe05           cmp si, 5                                
  00d1  72d5             jb 0xa8                                  
  00d3  c746f80000       mov word ptr [bp - 8], 0                 
  00d8  c746f60000       mov word ptr [bp - 0xa], 0               
  00dd  b80500           mov ax, 5                                
  00e0  2b460c           sub ax, word ptr [bp + 0xc]              
  00e3  8bf0             mov si, ax                               
  00e5  eb54             jmp 0x13b                                
  00e7  83fe04           cmp si, 4                                
  00ea  7428             je 0x114                                 
  00ec  807afa30         cmp byte ptr [bp + si - 6], 0x30         
  00f0  7522             jne 0x114                                
  00f2  837ef600         cmp word ptr [bp - 0xa], 0               
  00f6  751c             jne 0x114                                
  00f8  ff7610           push word ptr [bp + 0x10]                
  00fb  ff760e           push word ptr [bp + 0xe]                 
  00fe  6a20             push 0x20                                
  0100  ff7608           push word ptr [bp + 8]                   
  0103  8b4606           mov ax, word ptr [bp + 6]                
  0106  0346f8           add ax, word ptr [bp - 8]                
  0109  50               push ax                                  
  010a  90               nop                                      
  010b  0e               push cs                                  
  010c  e83500           call 0x144                               
  010f  83c40a           add sp, 0xa                              
  0112  eb23             jmp 0x137                                
  0114  ff7610           push word ptr [bp + 0x10]                
  0117  ff760e           push word ptr [bp + 0xe]                 
  011a  8a42fa           mov al, byte ptr [bp + si - 6]           
  011d  b400             mov ah, 0                                
  011f  50               push ax                                  
  0120  ff7608           push word ptr [bp + 8]                   
  0123  8b4606           mov ax, word ptr [bp + 6]                
  0126  0346f8           add ax, word ptr [bp - 8]                
  0129  50               push ax                                  
  012a  90               nop                                      
  012b  0e               push cs                                  
  012c  e81500           call 0x144                               
  012f  83c40a           add sp, 0xa                              
  0132  c746f60100       mov word ptr [bp - 0xa], 1               
  0137  ff46f8           inc word ptr [bp - 8]                    
  013a  46               inc si                                   
  013b  83fe05           cmp si, 5                                
  013e  72a7             jb 0xe7                                  
  0140  5f               pop di                                   
  0141  5e               pop si                                   
  0142  c9               leave                                    
  0143  cb               retf                                     

ovl23_0144:  ; ENTRY
  0144  55               push bp                                  
  0145  8bec             mov bp, sp                               
  0147  83ec0e           sub sp, 0xe                              
  014a  56               push si                                  
  014b  57               push di                                  
  014c  c41ee734         les bx, ptr [0x34e7]                     
  0150  26833f01         cmp word ptr es:[bx], 1                  
  0154  7414             je 0x16a                                 
  0156  c41ee734         les bx, ptr [0x34e7]                     
  015a  26833f02         cmp word ptr es:[bx], 2                  
  015e  740a             je 0x16a                                 
  0160  c41ee734         les bx, ptr [0x34e7]                     
  0164  26833f04         cmp word ptr es:[bx], 4                  
  0168  7505             jne 0x16f                                
  016a  b85000           mov ax, 0x50                             
  016d  eb03             jmp 0x172                                
  016f  b82800           mov ax, 0x28                             
  0172  8bf8             mov di, ax                               
  0174  8a46f3           mov al, byte ptr [bp - 0xd]              
  0177  8846f3           mov byte ptr [bp - 0xd], al              
  017a  bace03           mov dx, 0x3ce                            
  017d  b005             mov al, 5                                
  017f  ee               out dx, al                               
  0180  bacf03           mov dx, 0x3cf                            
  0183  b002             mov al, 2                                
  0185  ee               out dx, al                               
  0186  bac403           mov dx, 0x3c4                            
  0189  b002             mov al, 2                                
  018b  ee               out dx, al                               
  018c  bac503           mov dx, 0x3c5                            
  018f  b00f             mov al, 0xf                              
  0191  ee               out dx, al                               
  0192  bace03           mov dx, 0x3ce                            
  0195  b008             mov al, 8                                
  0197  ee               out dx, al                               
  0198  8b4608           mov ax, word ptr [bp + 8]                
  019b  c1e003           shl ax, 3                                
  019e  f7ef             imul di                                  
  01a0  034606           add ax, word ptr [bp + 6]                
  01a3  c746fe00a0       mov word ptr [bp - 2], 0xa000            
  01a8  8946fc           mov word ptr [bp - 4], ax                
  01ab  8b460a           mov ax, word ptr [bp + 0xa]              
  01ae  c1e003           shl ax, 3                                
  01b1  056efa           add ax, 0xfa6e                           
  01b4  c746fa00f0       mov word ptr [bp - 6], 0xf000            
  01b9  8946f8           mov word ptr [bp - 8], ax                
  01bc  bacf03           mov dx, 0x3cf                            
  01bf  b0ff             mov al, 0xff                             
  01c1  ee               out dx, al                               
  01c2  8bc7             mov ax, di                               
  01c4  6bc007           imul ax, ax, 7                           
  01c7  8b56fe           mov dx, word ptr [bp - 2]                
  01ca  8b5efc           mov bx, word ptr [bp - 4]                
  01cd  03d8             add bx, ax                               
  01cf  8956f6           mov word ptr [bp - 0xa], dx              
  01d2  895ef4           mov word ptr [bp - 0xc], bx              
  01d5  c45ef4           les bx, ptr [bp - 0xc]                   
  01d8  26c60700         mov byte ptr es:[bx], 0                  
  01dc  837e0e00         cmp word ptr [bp + 0xe], 0               
  01e0  7430             je 0x212                                 
  01e2  c45ef4           les bx, ptr [bp - 0xc]                   
  01e5  268a07           mov al, byte ptr es:[bx]                 
  01e8  8846f3           mov byte ptr [bp - 0xd], al              
  01eb  33f6             xor si, si                               
  01ed  eb1c             jmp 0x20b                                
  01ef  c45ef8           les bx, ptr [bp - 8]                     
  01f2  ff46f8           inc word ptr [bp - 8]                    
  01f5  268a07           mov al, byte ptr es:[bx]                 
  01f8  34ff             xor al, 0xff                             
  01fa  bacf03           mov dx, 0x3cf                            
  01fd  ee               out dx, al                               
  01fe  c45efc           les bx, ptr [bp - 4]                     
  0201  8a460c           mov al, byte ptr [bp + 0xc]              
  0204  268807           mov byte ptr es:[bx], al                 
  0207  017efc           add word ptr [bp - 4], di                
  020a  46               inc si                                   
  020b  83fe08           cmp si, 8                                
  020e  72df             jb 0x1ef                                 
  0210  eb2c             jmp 0x23e                                
  0212  c45ef4           les bx, ptr [bp - 0xc]                   
  0215  268a07           mov al, byte ptr es:[bx]                 
  0218  8846f3           mov byte ptr [bp - 0xd], al              
  021b  33f6             xor si, si                               
  021d  eb1a             jmp 0x239                                
  021f  c45ef8           les bx, ptr [bp - 8]                     
  0222  ff46f8           inc word ptr [bp - 8]                    
  0225  268a07           mov al, byte ptr es:[bx]                 
  0228  bacf03           mov dx, 0x3cf                            
  022b  ee               out dx, al                               
  022c  c45efc           les bx, ptr [bp - 4]                     
  022f  8a460c           mov al, byte ptr [bp + 0xc]              
  0232  268807           mov byte ptr es:[bx], al                 
  0235  017efc           add word ptr [bp - 4], di                
  0238  46               inc si                                   
  0239  83fe08           cmp si, 8                                
  023c  72e1             jb 0x21f                                 
  023e  90               nop                                      
  023f  0e               push cs                                  
  0240  e80400           call 0x247                               
  0243  5f               pop di                                   
  0244  5e               pop si                                   
  0245  c9               leave                                    
  0246  cb               retf                                     

ovl23_0247:  ; ENTRY
  0247  55               push bp                                  
  0248  8bec             mov bp, sp                               
  024a  833e843300       cmp word ptr [0x3384], 0                 
  024f  7418             je 0x269                                 
  0251  bace03           mov dx, 0x3ce                            
  0254  b008             mov al, 8                                
  0256  ee               out dx, al                               
  0257  bacf03           mov dx, 0x3cf                            
  025a  b0ff             mov al, 0xff                             
  025c  ee               out dx, al                               
  025d  bace03           mov dx, 0x3ce                            
  0260  b005             mov al, 5                                
  0262  ee               out dx, al                               
  0263  bacf03           mov dx, 0x3cf                            
  0266  b000             mov al, 0                                
  0268  ee               out dx, al                               
  0269  5d               pop bp                                   
  026a  cb               retf                                     

ovl23_026b:  ; ENTRY
  026b  55               push bp                                  
  026c  8bec             mov bp, sp                               
  026e  83ec36           sub sp, 0x36                             
  0271  56               push si                                  
  0272  57               push di                                  
  0273  be3200           mov si, 0x32                             
  0276  eb04             jmp 0x27c                                
  0278  c642ca00         mov byte ptr [bp + si - 0x36], 0         
  027c  8bc6             mov ax, si                               
  027e  4e               dec si                                   
  027f  0bc0             or ax, ax                                
  0281  75f5             jne 0x278                                
  0283  ff7608           push word ptr [bp + 8]                   
  0286  ff7606           push word ptr [bp + 6]                   
  0289  16               push ss                                  
  028a  8d46ca           lea ax, [bp - 0x36]                      
  028d  50               push ax                                  
  028e  9a704a0000       lcall 0, 0x4a70                          -> 0000:4a70
  0293  83c408           add sp, 8                                
  0296  ff760e           push word ptr [bp + 0xe]                 
  0299  6a00             push 0                                   
  029b  ff7610           push word ptr [bp + 0x10]                
  029e  16               push ss                                  
  029f  8d46ca           lea ax, [bp - 0x36]                      
  02a2  50               push ax                                  
  02a3  ff760c           push word ptr [bp + 0xc]                 
  02a6  ff760a           push word ptr [bp + 0xa]                 
  02a9  0e               push cs                                  
  02aa  e853fd           call 0                                   
  02ad  83c40e           add sp, 0xe                              
  02b0  b000             mov al, 0                                
  02b2  8846ff           mov byte ptr [bp - 1], al                
  02b5  8846fe           mov byte ptr [bp - 2], al                
  02b8  33ff             xor di, di                               
  02ba  8076ff01         xor byte ptr [bp - 1], 1                 
  02be  8a46ff           mov al, byte ptr [bp - 1]                
  02c1  b400             mov ah, 0                                
  02c3  50               push ax                                  
  02c4  ff7610           push word ptr [bp + 0x10]                
  02c7  8a43ca           mov al, byte ptr [bp + di - 0x36]        
  02ca  b400             mov ah, 0                                
  02cc  50               push ax                                  
  02cd  ff760c           push word ptr [bp + 0xc]                 
  02d0  8b460a           mov ax, word ptr [bp + 0xa]              
  02d3  03c7             add ax, di                               
  02d5  50               push ax                                  
  02d6  0e               push cs                                  
  02d7  e86afe           call 0x144                               
  02da  83c40a           add sp, 0xa                              
  02dd  6a00             push 0                                   
  02df  9a3900c130       lcall 0x30c1, 0x39                       -> ovl59:020d
  02e4  59               pop cx                                   
  02e5  8946fc           mov word ptr [bp - 4], ax                
  02e8  6a00             push 0                                   
  02ea  ff7610           push word ptr [bp + 0x10]                
  02ed  8a43ca           mov al, byte ptr [bp + di - 0x36]        
  02f0  b400             mov ah, 0                                
  02f2  50               push ax                                  
  02f3  ff760c           push word ptr [bp + 0xc]                 
  02f6  8b460a           mov ax, word ptr [bp + 0xa]              
  02f9  03c7             add ax, di                               
  02fb  50               push ax                                  
  02fc  0e               push cs                                  
  02fd  e844fe           call 0x144                               
  0300  83c40a           add sp, 0xa                              
  0303  837efc1b         cmp word ptr [bp - 4], 0x1b              
  0307  741b             je 0x324                                 
  0309  817efc4801       cmp word ptr [bp - 4], 0x148             
  030e  7414             je 0x324                                 
  0310  837efc09         cmp word ptr [bp - 4], 9                 
  0314  740e             je 0x324                                 
  0316  817efc5001       cmp word ptr [bp - 4], 0x150             
  031b  7407             je 0x324                                 
  031d  817efc0f01       cmp word ptr [bp - 4], 0x10f             
  0322  7503             jne 0x327                                
  0324  e91f01           jmp 0x446                                
  0327  837efc0d         cmp word ptr [bp - 4], 0xd               
  032b  7532             jne 0x35f                                
  032d  0bff             or di, di                                
  032f  7416             je 0x347                                 
  0331  8b460e           mov ax, word ptr [bp + 0xe]              
  0334  48               dec ax                                   
  0335  3bc7             cmp ax, di                               
  0337  740e             je 0x347                                 
  0339  8bf7             mov si, di                               
  033b  eb05             jmp 0x342                                
  033d  c642ca00         mov byte ptr [bp + si - 0x36], 0         
  0341  46               inc si                                   
  0342  3b760e           cmp si, word ptr [bp + 0xe]              
  0345  72f6             jb 0x33d                                 
  0347  33f6             xor si, si                               
  0349  eb0c             jmp 0x357                                
  034b  8a42ca           mov al, byte ptr [bp + si - 0x36]        
  034e  c45e06           les bx, ptr [bp + 6]                     
  0351  03de             add bx, si                               
  0353  268807           mov byte ptr es:[bx], al                 
  0356  46               inc si                                   
  0357  3b760e           cmp si, word ptr [bp + 0xe]              
  035a  72ef             jb 0x34b                                 
  035c  e9e700           jmp 0x446                                
  035f  817efc4d01       cmp word ptr [bp - 4], 0x14d             
  0364  7508             jne 0x36e                                
  0366  8a43ca           mov al, byte ptr [bp + di - 0x36]        
  0369  b400             mov ah, 0                                
  036b  8946fc           mov word ptr [bp - 4], ax                
  036e  817efc4f01       cmp word ptr [bp - 4], 0x14f             
  0373  752c             jne 0x3a1                                
  0375  8b760e           mov si, word ptr [bp + 0xe]              
  0378  eb1d             jmp 0x397                                
  037a  807aca00         cmp byte ptr [bp + si - 0x36], 0         
  037e  7417             je 0x397                                 
  0380  c646ff00         mov byte ptr [bp - 1], 0                 
  0384  8b460e           mov ax, word ptr [bp + 0xe]              
  0387  48               dec ax                                   
  0388  3bc6             cmp ax, si                               
  038a  7504             jne 0x390                                
  038c  8bfe             mov di, si                               
  038e  eb05             jmp 0x395                                
  0390  8bc6             mov ax, si                               
  0392  40               inc ax                                   
  0393  8bf8             mov di, ax                               
  0395  eb07             jmp 0x39e                                
  0397  8bc6             mov ax, si                               
  0399  4e               dec si                                   
  039a  0bc0             or ax, ax                                
  039c  75dc             jne 0x37a                                
  039e  e9a200           jmp 0x443                                
  03a1  817efc5301       cmp word ptr [bp - 4], 0x153             
  03a6  752d             jne 0x3d5                                
  03a8  8bf7             mov si, di                               
  03aa  eb22             jmp 0x3ce                                
  03ac  8a42cb           mov al, byte ptr [bp + si - 0x35]        
  03af  8842ca           mov byte ptr [bp + si - 0x36], al        
  03b2  6a00             push 0                                   
  03b4  ff7610           push word ptr [bp + 0x10]                
  03b7  8a42ca           mov al, byte ptr [bp + si - 0x36]        
  03ba  b400             mov ah, 0                                
  03bc  50               push ax                                  
  03bd  ff760c           push word ptr [bp + 0xc]                 
  03c0  8b460a           mov ax, word ptr [bp + 0xa]              
  03c3  03c6             add ax, si                               
  03c5  50               push ax                                  
  03c6  0e               push cs                                  
  03c7  e87afd           call 0x144                               
  03ca  83c40a           add sp, 0xa                              
  03cd  46               inc si                                   
  03ce  3b760e           cmp si, word ptr [bp + 0xe]              
  03d1  72d9             jb 0x3ac                                 
  03d3  eb6e             jmp 0x443                                
  03d5  817efc4701       cmp word ptr [bp - 4], 0x147             
  03da  750b             jne 0x3e7                                
  03dc  b000             mov al, 0                                
  03de  8846ff           mov byte ptr [bp - 1], al                
  03e1  b400             mov ah, 0                                
  03e3  8bf8             mov di, ax                               
  03e5  eb5c             jmp 0x443                                
  03e7  817efc4b01       cmp word ptr [bp - 4], 0x14b             
  03ec  7406             je 0x3f4                                 
  03ee  837efc08         cmp word ptr [bp - 4], 8                 
  03f2  750d             jne 0x401                                
  03f4  c646ff00         mov byte ptr [bp - 1], 0                 
  03f8  0bff             or di, di                                
  03fa  7502             jne 0x3fe                                
  03fc  eb01             jmp 0x3ff                                
  03fe  4f               dec di                                   
  03ff  eb42             jmp 0x443                                
  0401  837efc14         cmp word ptr [bp - 4], 0x14              
  0405  723c             jb 0x443                                 
  0407  c646ff00         mov byte ptr [bp - 1], 0                 
  040b  8a46fc           mov al, byte ptr [bp - 4]                
  040e  8843ca           mov byte ptr [bp + di - 0x36], al        
  0411  6a00             push 0                                   
  0413  ff7610           push word ptr [bp + 0x10]                
  0416  8a43ca           mov al, byte ptr [bp + di - 0x36]        
  0419  b400             mov ah, 0                                
  041b  50               push ax                                  
  041c  ff760c           push word ptr [bp + 0xc]                 
  041f  8b460a           mov ax, word ptr [bp + 0xa]              
  0422  03c7             add ax, di                               
  0424  50               push ax                                  
  0425  0e               push cs                                  
  0426  e81bfd           call 0x144                               
  0429  83c40a           add sp, 0xa                              
  042c  8b460e           mov ax, word ptr [bp + 0xe]              
  042f  48               dec ax                                   
  0430  3bc7             cmp ax, di                               
  0432  750e             jne 0x442                                
  0434  807efe00         cmp byte ptr [bp - 2], 0                 
  0438  7402             je 0x43c                                 
  043a  eb04             jmp 0x440                                
  043c  c646fe01         mov byte ptr [bp - 2], 1                 
  0440  eb01             jmp 0x443                                
  0442  47               inc di                                   
  0443  e974fe           jmp 0x2ba                                
  0446  33ff             xor di, di                               
  0448  eb20             jmp 0x46a                                
  044a  6a00             push 0                                   
  044c  ff7610           push word ptr [bp + 0x10]                
  044f  c45e06           les bx, ptr [bp + 6]                     
  0452  03df             add bx, di                               
  0454  268a07           mov al, byte ptr es:[bx]                 
  0457  98               cwde                                     
  0458  50               push ax                                  
  0459  ff760c           push word ptr [bp + 0xc]                 
  045c  8b460a           mov ax, word ptr [bp + 0xa]              
  045f  03c7             add ax, di                               
  0461  50               push ax                                  
  0462  0e               push cs                                  
  0463  e8defc           call 0x144                               
  0466  83c40a           add sp, 0xa                              
  0469  47               inc di                                   
  046a  3b7e0e           cmp di, word ptr [bp + 0xe]              
  046d  72db             jb 0x44a                                 
  046f  8b46fc           mov ax, word ptr [bp - 4]                
  0472  eb00             jmp 0x474                                
  0474  5f               pop di                                   
  0475  5e               pop si                                   
  0476  c9               leave                                    
  0477  cb               retf                                     

ovl23_0478:  ; ENTRY
  0478  55               push bp                                  
  0479  8bec             mov bp, sp                               
  047b  56               push si                                  
  047c  57               push di                                  
  047d  8b760a           mov si, word ptr [bp + 0xa]              
  0480  8b7e0c           mov di, word ptr [bp + 0xc]              
  0483  83fe03           cmp si, 3                                
  0486  7d1c             jge 0x4a4                                
  0488  b8042c           mov ax, 0x2c04                           
  048b  8ec0             mov es, ax                               
  048d  268b1e1001       mov bx, word ptr es:[0x110]              
  0492  d1e3             shl bx, 1                                
  0494  b8042c           mov ax, 0x2c04                           
  0497  8ec0             mov es, ax                               
  0499  2683bfd00000     cmp word ptr es:[bx + 0xd0], 0           
  049f  7403             je 0x4a4                                 
  04a1  e98e00           jmp 0x532                                
  04a4  83fe04           cmp si, 4                                
  04a7  7405             je 0x4ae                                 
  04a9  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  04ae  8bde             mov bx, si                               
  04b0  d1e3             shl bx, 1                                
  04b2  ffb70a08         push word ptr [bx + 0x80a]               
  04b6  6a00             push 0                                   
  04b8  0bff             or di, di                                
  04ba  7405             je 0x4c1                                 
  04bc  b80f00           mov ax, 0xf                              
  04bf  eb03             jmp 0x4c4                                
  04c1  b80700           mov ax, 7                                
  04c4  50               push ax                                  
  04c5  ff7608           push word ptr [bp + 8]                   
  04c8  ff7606           push word ptr [bp + 6]                   
  04cb  8bde             mov bx, si                               
  04cd  d1e3             shl bx, 1                                
  04cf  ffb70008         push word ptr [bx + 0x800]               
  04d3  8bde             mov bx, si                               
  04d5  d1e3             shl bx, 1                                
  04d7  ffb7f607         push word ptr [bx + 0x7f6]               
  04db  0e               push cs                                  
  04dc  e821fb           call 0                                   
  04df  83c40e           add sp, 0xe                              
  04e2  83fe04           cmp si, 4                                
  04e5  7405             je 0x4ec                                 
  04e7  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  04ec  0bff             or di, di                                
  04ee  7442             je 0x532                                 
  04f0  9a2000c130       lcall 0x30c1, 0x20                       -> ovl59:0142
  04f5  83fe04           cmp si, 4                                
  04f8  7405             je 0x4ff                                 
  04fa  9aa507bf12       lcall 0x12bf, 0x7a5                      -> 12bf:07a5
  04ff  8bde             mov bx, si                               
  0501  d1e3             shl bx, 1                                
  0503  ffb70a08         push word ptr [bx + 0x80a]               
  0507  6a00             push 0                                   
  0509  6a07             push 7                                   
  050b  ff7608           push word ptr [bp + 8]                   
  050e  ff7606           push word ptr [bp + 6]                   
  0511  8bde             mov bx, si                               
  0513  d1e3             shl bx, 1                                
  0515  ffb70008         push word ptr [bx + 0x800]               
  0519  8bde             mov bx, si                               
  051b  d1e3             shl bx, 1                                
  051d  ffb7f607         push word ptr [bx + 0x7f6]               
  0521  0e               push cs                                  
  0522  e8dbfa           call 0                                   
  0525  83c40e           add sp, 0xe                              
  0528  83fe04           cmp si, 4                                
  052b  7405             je 0x532                                 
  052d  9a5707bf12       lcall 0x12bf, 0x757                      -> 12bf:0757
  0532  5f               pop di                                   
  0533  5e               pop si                                   
  0534  5d               pop bp                                   
  0535  cb               retf                                     
