; ovl48 stub 307c file_off 0x6c5b0 size 0xac

ovl48_0000:  ; ENTRY
  0000  55               push bp                                  
  0001  8bec             mov bp, sp                               
  0003  83ec3e           sub sp, 0x3e                             
  0006  56               push si                                  
  0007  33f6             xor si, si                               
  0009  eb57             jmp 0x62                                 
  000b  16               push ss                                  
  000c  8d46c2           lea ax, [bp - 0x3e]                      
  000f  50               push ax                                  
  0010  56               push si                                  
  0011  9a84005830       lcall 0x3058, 0x84                       -> ovl44:14ac
  0016  83c406           add sp, 6                                
  0019  8bde             mov bx, si                               
  001b  6bdb06           imul bx, bx, 6                           
  001e  8a46f8           mov al, byte ptr [bp - 8]                
  0021  8887c445         mov byte ptr [bx + 0x45c4], al           
  0025  8bde             mov bx, si                               
  0027  6bdb06           imul bx, bx, 6                           
  002a  8a46fa           mov al, byte ptr [bp - 6]                
  002d  8887c545         mov byte ptr [bx + 0x45c5], al           
  0031  8bde             mov bx, si                               
  0033  6bdb06           imul bx, bx, 6                           
  0036  8a46fc           mov al, byte ptr [bp - 4]                
  0039  8887c645         mov byte ptr [bx + 0x45c6], al           
  003d  8bde             mov bx, si                               
  003f  6bdb06           imul bx, bx, 6                           
  0042  8a46fe           mov al, byte ptr [bp - 2]                
  0045  8887c745         mov byte ptr [bx + 0x45c7], al           
  0049  8bde             mov bx, si                               
  004b  6bdb06           imul bx, bx, 6                           
  004e  8a46f6           mov al, byte ptr [bp - 0xa]              
  0051  8887c945         mov byte ptr [bx + 0x45c9], al           
  0055  8bde             mov bx, si                               
  0057  6bdb06           imul bx, bx, 6                           
  005a  8a46f2           mov al, byte ptr [bp - 0xe]              
  005d  8887c845         mov byte ptr [bx + 0x45c8], al           
  0061  46               inc si                                   
  0062  83fe1d           cmp si, 0x1d                             
  0065  7ca4             jl 0xb                                   
  0067  5e               pop si                                   
  0068  c9               leave                                    
  0069  cb               retf                                     

ovl48_006a:  ; ENTRY
  006a  55               push bp                                  
  006b  8bec             mov bp, sp                               
  006d  56               push si                                  
  006e  1e               push ds                                  
  006f  68385c           push 0x5c38                              
  0072  6a01             push 1                                   
  0074  ff7606           push word ptr [bp + 6]                   
  0077  9a9300ab30       lcall 0x30ab, 0x93                       -> ovl57:21c1
  007c  83c408           add sp, 8                                
  007f  6a02             push 2                                   
  0081  1e               push ds                                  
  0082  68385c           push 0x5c38                              
  0085  9a06000b07       lcall 0x70b, 6                           -> 070b:0006
  008a  83c406           add sp, 6                                
  008d  8bf0             mov si, ax                               
  008f  0bf6             or si, si                                
  0091  7c16             jl 0xa9                                  
  0093  6a67             push 0x67                                
  0095  66ff7608         push dword ptr [bp + 8]                  
  0099  56               push si                                  
  009a  9a6d000b07       lcall 0x70b, 0x6d                        -> 070b:006d
  009f  83c408           add sp, 8                                
  00a2  56               push si                                  
  00a3  9a3a000b07       lcall 0x70b, 0x3a                        -> 070b:003a
  00a8  59               pop cx                                   
  00a9  5e               pop si                                   
  00aa  5d               pop bp                                   
  00ab  cb               retf                                     
