; res_129d file_off 0x149d0

res_129d_000e:  ; ENTRY
  000e  56               push si                                  
  000f  66c706aa6d000000 mov dword ptr [0x6daa], 0                
  0018  33f6             xor si, si                               
  001a  eb34             jmp 0x50                                 
  001c  8a845a35         mov al, byte ptr [si + 0x355a]           
  0020  98               cwde                                     
  0021  0bc0             or ax, ax                                
  0023  752a             jne 0x4f                                 
  0025  8bc6             mov ax, si                               
  0027  6bc014           imul ax, ax, 0x14                        
  002a  05a86e           add ax, 0x6ea8                           
  002d  8c1eac6d         mov word ptr [0x6dac], ds                
  0031  a3aa6d           mov word ptr [0x6daa], ax                
  0034  8bc6             mov ax, si                               
  0036  6bc032           imul ax, ax, 0x32                        
  0039  05ae6d           add ax, 0x6dae                           
  003c  c41eaa6d         les bx, ptr [0x6daa]                     
  0040  268c5f0a         mov word ptr es:[bx + 0xa], ds           
  0044  26894708         mov word ptr es:[bx + 8], ax             
  0048  c6845a3501       mov byte ptr [si + 0x355a], 1            
  004d  eb06             jmp 0x55                                 
  004f  46               inc si                                   
  0050  83fe05           cmp si, 5                                
  0053  7cc7             jl 0x1c                                  
  0055  8b16ac6d         mov dx, word ptr [0x6dac]                
  0059  a1aa6d           mov ax, word ptr [0x6daa]                
  005c  eb00             jmp 0x5e                                 
  005e  5e               pop si                                   
  005f  cb               retf                                     

res_129d_0060:  ; ENTRY
  0060  c8040000         enter 4, 0                               
  0064  56               push si                                  
  0065  8b760e           mov si, word ptr [bp + 0xe]              
  0068  56               push si                                  
  0069  ff7608           push word ptr [bp + 8]                   
  006c  ff7606           push word ptr [bp + 6]                   
  006f  90               nop                                      
  0070  0e               push cs                                  
  0071  e83500           call 0xa9                                
  0074  83c406           add sp, 6                                
  0077  8956fe           mov word ptr [bp - 2], dx                
  007a  8946fc           mov word ptr [bp - 4], ax                
  007d  66837efc00       cmp dword ptr [bp - 4], 0                
  0082  741a             je 0x9e                                  
  0084  56               push si                                  
  0085  ff760c           push word ptr [bp + 0xc]                 
  0088  ff760a           push word ptr [bp + 0xa]                 
  008b  c45efc           les bx, ptr [bp - 4]                     
  008e  26ff770a         push word ptr es:[bx + 0xa]              
  0092  26ff7708         push word ptr es:[bx + 8]                
  0096  9a45430000       lcall 0, 0x4345                          -> 0000:4345
  009b  83c40a           add sp, 0xa                              
  009e  8b56fe           mov dx, word ptr [bp - 2]                
  00a1  8b46fc           mov ax, word ptr [bp - 4]                
  00a4  eb00             jmp 0xa6                                 
  00a6  5e               pop si                                   
  00a7  c9               leave                                    
  00a8  cb               retf                                     

res_129d_00a9:  ; ENTRY
  00a9  c8040000         enter 4, 0                               
  00ad  8b560a           mov dx, word ptr [bp + 0xa]              
  00b0  c45e06           les bx, ptr [bp + 6]                     
  00b3  6626837f0600     cmp dword ptr es:[bx + 6], 0             
  00b9  753b             jne 0xf6                                 
  00bb  0e               push cs                                  
  00bc  e84fff           call 0xe                                 
  00bf  c45e06           les bx, ptr [bp + 6]                     
  00c2  26895708         mov word ptr es:[bx + 8], dx             
  00c6  26894706         mov word ptr es:[bx + 6], ax             
  00ca  c45e06           les bx, ptr [bp + 6]                     
  00cd  6626837f0600     cmp dword ptr es:[bx + 6], 0             
  00d3  7507             jne 0xdc                                 
  00d5  33d2             xor dx, dx                               
  00d7  33c0             xor ax, ax                               
  00d9  e98600           jmp 0x162                                
  00dc  c45e06           les bx, ptr [bp + 6]                     
  00df  66268b4706       mov eax, dword ptr es:[bx + 6]           
  00e4  668946fc         mov dword ptr [bp - 4], eax              
  00e8  c45efc           les bx, ptr [bp - 4]                     
  00eb  6626c74710000000 mov dword ptr es:[bx + 0x10], 0          
  00f4  eb44             jmp 0x13a                                
  00f6  c45e06           les bx, ptr [bp + 6]                     
  00f9  66268b470a       mov eax, dword ptr es:[bx + 0xa]         
  00fe  668946fc         mov dword ptr [bp - 4], eax              
  0102  0e               push cs                                  
  0103  e808ff           call 0xe                                 
  0106  c45efc           les bx, ptr [bp - 4]                     
  0109  2689570e         mov word ptr es:[bx + 0xe], dx           
  010d  2689470c         mov word ptr es:[bx + 0xc], ax           
  0111  c45efc           les bx, ptr [bp - 4]                     
  0114  6626837f0c00     cmp dword ptr es:[bx + 0xc], 0           
  011a  7502             jne 0x11e                                
  011c  ebb7             jmp 0xd5                                 
  011e  c45efc           les bx, ptr [bp - 4]                     
  0121  66268b470c       mov eax, dword ptr es:[bx + 0xc]         
  0126  668946fc         mov dword ptr [bp - 4], eax              
  012a  c45e06           les bx, ptr [bp + 6]                     
  012d  66268b470a       mov eax, dword ptr es:[bx + 0xa]         
  0132  c45efc           les bx, ptr [bp - 4]                     
  0135  6626894710       mov dword ptr es:[bx + 0x10], eax        
  013a  c45e06           les bx, ptr [bp + 6]                     
  013d  668b46fc         mov eax, dword ptr [bp - 4]              
  0141  662689470a       mov dword ptr es:[bx + 0xa], eax         
  0146  c45efc           les bx, ptr [bp - 4]                     
  0149  6626c7470c000000 mov dword ptr es:[bx + 0xc], 0           
  0152  c45e06           les bx, ptr [bp + 6]                     
  0155  26ff4704         inc word ptr es:[bx + 4]                 
  0159  8b56fe           mov dx, word ptr [bp - 2]                
  015c  8b46fc           mov ax, word ptr [bp - 4]                
  015f  e977ff           jmp 0xd9                                 
  0162  c9               leave                                    
  0163  cb               retf                                     

res_129d_0164:  ; ENTRY
  0164  c8080000         enter 8, 0                               
  0168  56               push si                                  
  0169  c45e0a           les bx, ptr [bp + 0xa]                   
  016c  66268b4710       mov eax, dword ptr es:[bx + 0x10]        
  0171  668946fc         mov dword ptr [bp - 4], eax              
  0175  c45e0a           les bx, ptr [bp + 0xa]                   
  0178  66268b470c       mov eax, dword ptr es:[bx + 0xc]         
  017d  668946f8         mov dword ptr [bp - 8], eax              
  0181  66837efc00       cmp dword ptr [bp - 4], 0                
  0186  750e             jne 0x196                                
  0188  c45e06           les bx, ptr [bp + 6]                     
  018b  668b46f8         mov eax, dword ptr [bp - 8]              
  018f  6626894706       mov dword ptr es:[bx + 6], eax           
  0194  eb0c             jmp 0x1a2                                
  0196  c45efc           les bx, ptr [bp - 4]                     
  0199  668b46f8         mov eax, dword ptr [bp - 8]              
  019d  662689470c       mov dword ptr es:[bx + 0xc], eax         
  01a2  66837ef800       cmp dword ptr [bp - 8], 0                
  01a7  750e             jne 0x1b7                                
  01a9  c45e06           les bx, ptr [bp + 6]                     
  01ac  668b46fc         mov eax, dword ptr [bp - 4]              
  01b0  662689470a       mov dword ptr es:[bx + 0xa], eax         
  01b5  eb0c             jmp 0x1c3                                
  01b7  c45ef8           les bx, ptr [bp - 8]                     
  01ba  668b46fc         mov eax, dword ptr [bp - 4]              
  01be  6626894710       mov dword ptr es:[bx + 0x10], eax        
  01c3  33f6             xor si, si                               
  01c5  eb1c             jmp 0x1e3                                
  01c7  8bc6             mov ax, si                               
  01c9  6bc014           imul ax, ax, 0x14                        
  01cc  8cda             mov dx, ds                               
  01ce  05a86e           add ax, 0x6ea8                           
  01d1  3b560c           cmp dx, word ptr [bp + 0xc]              
  01d4  750c             jne 0x1e2                                
  01d6  3b460a           cmp ax, word ptr [bp + 0xa]              
  01d9  7507             jne 0x1e2                                
  01db  c6845a3500       mov byte ptr [si + 0x355a], 0            
  01e0  eb06             jmp 0x1e8                                
  01e2  46               inc si                                   
  01e3  83fe05           cmp si, 5                                
  01e6  7cdf             jl 0x1c7                                 
  01e8  c45e06           les bx, ptr [bp + 6]                     
  01eb  26ff4f04         dec word ptr es:[bx + 4]                 
  01ef  5e               pop si                                   
  01f0  c9               leave                                    
  01f1  cb               retf                                     
  01f2  55               push bp                                  
  01f3  8bec             mov bp, sp                               
  01f5  56               push si                                  
  01f6  33f6             xor si, si                               
  01f8  eb06             jmp 0x200                                
  01fa  c6845a3500       mov byte ptr [si + 0x355a], 0            
  01ff  46               inc si                                   
  0200  83fe05           cmp si, 5                                
  0203  7cf5             jl 0x1fa                                 
  0205  c45e06           les bx, ptr [bp + 6]                     
  0208  6633c0           xor eax, eax                             
  020b  662689470a       mov dword ptr es:[bx + 0xa], eax         
  0210  c45e06           les bx, ptr [bp + 6]                     
  0213  6626894706       mov dword ptr es:[bx + 6], eax           
  0218  c45e06           les bx, ptr [bp + 6]                     
  021b  26c747040000     mov word ptr es:[bx + 4], 0              
  0221  5e               pop si                                   
  0222  5d               pop bp                                   
  0223  cb               retf                                     
  0224  a1               db a1                                    
