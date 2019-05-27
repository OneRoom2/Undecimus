#import <Foundation/Foundation.h>

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/sysctl.h>
#include <sys/utsname.h>

#include "KernelOffsets.h"
#include <common.h>
#include "utils.h"

uint32_t* offsets = NULL;

uint32_t kernel_offsets_11_0[] = {
    0xb, // KSTRUCT_OFFSET_TASK_LCK_MTX_TYPE
    0x10, // KSTRUCT_OFFSET_TASK_REF_COUNT
    0x14, // KSTRUCT_OFFSET_TASK_ACTIVE
    0x20, // KSTRUCT_OFFSET_TASK_VM_MAP
    0x28, // KSTRUCT_OFFSET_TASK_NEXT
    0x30, // KSTRUCT_OFFSET_TASK_PREV
    0x308, // KSTRUCT_OFFSET_TASK_ITK_SPACE
    0x368, // KSTRUCT_OFFSET_TASK_BSD_INFO
    0x3a8, // KSTRUCT_OFFSET_TASK_ALL_IMAGE_INFO_ADDR
    0x3b0, // KSTRUCT_OFFSET_TASK_ALL_IMAGE_INFO_SIZE
    0x3a0, // KSTRUCT_OFFSET_TASK_TFLAGS
    0x0, // KSTRUCT_OFFSET_TASK_LOCK

    0x0, // KSTRUCT_OFFSET_IPC_PORT_IO_BITS
    0x4, // KSTRUCT_OFFSET_IPC_PORT_IO_REFERENCES
    0x40, // KSTRUCT_OFFSET_IPC_PORT_IKMQ_BASE
    0x50, // KSTRUCT_OFFSET_IPC_PORT_MSG_COUNT
    0x60, // KSTRUCT_OFFSET_IPC_PORT_IP_RECEIVER
    0x68, // KSTRUCT_OFFSET_IPC_PORT_IP_KOBJECT
    0x88, // KSTRUCT_OFFSET_IPC_PORT_IP_PREMSG
    0x90, // KSTRUCT_OFFSET_IPC_PORT_IP_CONTEXT
    0xa0, // KSTRUCT_OFFSET_IPC_PORT_IP_SRIGHTS

    0x10, // KSTRUCT_OFFSET_PROC_PID
    0x108, // KSTRUCT_OFFSET_PROC_P_FD
    0x18, // KSTRUCT_OFFSET_PROC_TASK
    0x100, // KSTRUCT_OFFSET_PROC_UCRED
    0x0, // KSTRUCT_OFFSET_PROC_P_LIST
    0x2a8, // KSTRUCT_OFFSET_PROC_P_CSFLAGS
    0x410, // KSTRUCT_OFFSET_PROC_P_MEMSTAT_STATE
    0x58, // KSTRUCT_OFFSET_PROC_MLOCK
    0xf0, // KSTRUCT_OFFSET_PROC_UCRED_MLOCK
    0x40, // KSTRUCT_OFFSET_PROC_SVUID
    0x44, // KSTRUCT_OFFSET_PROC_SVGID

    0x0, // KSTRUCT_OFFSET_FILEDESC_FD_OFILES

    0x8, // KSTRUCT_OFFSET_FILEPROC_F_FGLOB

    0x38, // KSTRUCT_OFFSET_FILEGLOB_FG_DATA

    0x10, // KSTRUCT_OFFSET_SOCKET_SO_PCB

    0x10, // KSTRUCT_OFFSET_PIPE_BUFFER

    0x14, // KSTRUCT_OFFSET_IPC_SPACE_IS_TABLE_SIZE
    0x20, // KSTRUCT_OFFSET_IPC_SPACE_IS_TABLE

    0xd8, // KSTRUCT_OFFSET_VNODE_V_MOUNT
    0x78, // KSTRUCT_OFFSET_VNODE_VU_SPECINFO
    0x0, // KSTRUCT_OFFSET_VNODE_V_LOCK
    0xe0, // KSTRUCT_OFFSET_VNODE_V_DATA

    0x10, // KSTRUCT_OFFSET_SPECINFO_SI_FLAGS

    0x70, // KSTRUCT_OFFSET_MOUNT_MNT_FLAG
    0x8f8, // KSTRUCT_OFFSET_MOUNT_MNT_DATA
    0x18, // KSTRUCT_OFFSET_MOUNT_MNT_MLOCK

    0x10, // KSTRUCT_OFFSET_HOST_SPECIAL
    
    0x10, // KSTRUCT_OFFSET_UCRED_CR_REF
    0x18, // KSTRUCT_OFFSET_UCRED_CR_UID
    0x1c, // KSTRUCT_OFFSET_UCRED_CR_RUID
    0x20, // KSTRUCT_OFFSET_UCRED_CR_SVUID
    0x24, // KSTRUCT_OFFSET_UCRED_CR_NGROUPS
    0x28, // KSTRUCT_OFFSET_UCRED_CR_GROUPS
    0x68, // KSTRUCT_OFFSET_UCRED_CR_RGID
    0x6c, // KSTRUCT_OFFSET_UCRED_CR_SVGID
    0x70, // KSTRUCT_OFFSET_UCRED_CR_GMUID
    0x74, // KSTRUCT_OFFSET_UCRED_CR_FLAGS
    0x78, // KSTRUCT_OFFSET_UCRED_CR_LABEL
    
    0x0, // KSTRUCT_OFFSET_LABEL_L_FLAGS
    0x8, // KSTRUCT_OFFSET_LABEL_L_PERPOLICY
    
    0x18, // KSTRUCT_SIZE_IPC_ENTRY
    0x8, // KSTRUCT_OFFSET_IPC_ENTRY_IE_BITS
    
    0x54, // KSTRUCT_OFFSET_VNODE_V_FLAG
    
    0x1F, // KVTABLE_OFFSET_OSDICTIONARY_SETOBJECTWITHCHARP
    0x26, // KVTABLE_OFFSET_OSDICTIONARY_GETOBJECTWITHCHARP
    0x23, // KVTABLE_OFFSET_OSDICTIONARY_MERGE
    
    0x1E, // KVTABLE_OFFSET_OSARRAY_MERGE
    0x20, // KVTABLE_OFFSET_OSARRAY_REMOVEOBJECT
    0x22, // KVTABLE_OFFSET_OSARRAY_GETOBJECT
    
    0x05, // KVTABLE_OFFSET_OSOBJECT_RELEASE
    0x03, // KVTABLE_OFFSET_OSOBJECT_GETRETAINCOUNT
    0x04, // KVTABLE_OFFSET_OSOBJECT_RETAIN
    
    0x11, // KVTABLE_OFFSET_OSSTRING_GETLENGTH
    
    0x6c, // KFREE_ADDR_OFFSET
};

uint32_t kernel_offsets_11_3[] = {
    0xb, // KSTRUCT_OFFSET_TASK_LCK_MTX_TYPE
    0x10, // KSTRUCT_OFFSET_TASK_REF_COUNT
    0x14, // KSTRUCT_OFFSET_TASK_ACTIVE
    0x20, // KSTRUCT_OFFSET_TASK_VM_MAP
    0x28, // KSTRUCT_OFFSET_TASK_NEXT
    0x30, // KSTRUCT_OFFSET_TASK_PREV
    0x308, // KSTRUCT_OFFSET_TASK_ITK_SPACE
    0x368, // KSTRUCT_OFFSET_TASK_BSD_INFO
    0x3a8, // KSTRUCT_OFFSET_TASK_ALL_IMAGE_INFO_ADDR
    0x3b0, // KSTRUCT_OFFSET_TASK_ALL_IMAGE_INFO_SIZE
    0x3a0, // KSTRUCT_OFFSET_TASK_TFLAGS
    0x0, // KSTRUCT_OFFSET_TASK_LOCK

    0x0, // KSTRUCT_OFFSET_IPC_PORT_IO_BITS
    0x4, // KSTRUCT_OFFSET_IPC_PORT_IO_REFERENCES
    0x40, // KSTRUCT_OFFSET_IPC_PORT_IKMQ_BASE
    0x50, // KSTRUCT_OFFSET_IPC_PORT_MSG_COUNT
    0x60, // KSTRUCT_OFFSET_IPC_PORT_IP_RECEIVER
    0x68, // KSTRUCT_OFFSET_IPC_PORT_IP_KOBJECT
    0x88, // KSTRUCT_OFFSET_IPC_PORT_IP_PREMSG
    0x90, // KSTRUCT_OFFSET_IPC_PORT_IP_CONTEXT
    0xa0, // KSTRUCT_OFFSET_IPC_PORT_IP_SRIGHTS

    0x10, // KSTRUCT_OFFSET_PROC_PID
    0x108, // KSTRUCT_OFFSET_PROC_P_FD
    0x18, // KSTRUCT_OFFSET_PROC_TASK
    0x100, // KSTRUCT_OFFSET_PROC_UCRED
    0x0, // KSTRUCT_OFFSET_PROC_P_LIST
    0x2a8, // KSTRUCT_OFFSET_PROC_P_CSFLAGS
    0x410, // KSTRUCT_OFFSET_PROC_P_MEMSTAT_STATE
    0x58, // KSTRUCT_OFFSET_PROC_MLOCK
    0xf0, // KSTRUCT_OFFSET_PROC_UCRED_MLOCK
    0x40, // KSTRUCT_OFFSET_PROC_SVUID
    0x44, // KSTRUCT_OFFSET_PROC_SVGID

    0x0, // KSTRUCT_OFFSET_FILEDESC_FD_OFILES

    0x8, // KSTRUCT_OFFSET_FILEPROC_F_FGLOB

    0x38, // KSTRUCT_OFFSET_FILEGLOB_FG_DATA

    0x10, // KSTRUCT_OFFSET_SOCKET_SO_PCB

    0x10, // KSTRUCT_OFFSET_PIPE_BUFFER

    0x14, // KSTRUCT_OFFSET_IPC_SPACE_IS_TABLE_SIZE
    0x20, // KSTRUCT_OFFSET_IPC_SPACE_IS_TABLE

    0xd8, // KSTRUCT_OFFSET_VNODE_V_MOUNT
    0x78, // KSTRUCT_OFFSET_VNODE_VU_SPECINFO
    0x0, // KSTRUCT_OFFSET_VNODE_V_LOCK
    0xe0, // KSTRUCT_OFFSET_VNODE_V_DATA

    0x10, // KSTRUCT_OFFSET_SPECINFO_SI_FLAGS

    0x70, // KSTRUCT_OFFSET_MOUNT_MNT_FLAG
    0x8f8, // KSTRUCT_OFFSET_MOUNT_MNT_DATA
    0x18, // KSTRUCT_OFFSET_MOUNT_MNT_MLOCK

    0x10, // KSTRUCT_OFFSET_HOST_SPECIAL

    0x10, // KSTRUCT_OFFSET_UCRED_CR_REF
    0x18, // KSTRUCT_OFFSET_UCRED_CR_UID
    0x1c, // KSTRUCT_OFFSET_UCRED_CR_RUID
    0x20, // KSTRUCT_OFFSET_UCRED_CR_SVUID
    0x24, // KSTRUCT_OFFSET_UCRED_CR_NGROUPS
    0x28, // KSTRUCT_OFFSET_UCRED_CR_GROUPS
    0x68, // KSTRUCT_OFFSET_UCRED_CR_RGID
    0x6c, // KSTRUCT_OFFSET_UCRED_CR_SVGID
    0x70, // KSTRUCT_OFFSET_UCRED_CR_GMUID
    0x74, // KSTRUCT_OFFSET_UCRED_CR_FLAGS
    0x78, // KSTRUCT_OFFSET_UCRED_CR_LABEL
    
    0x0, // KSTRUCT_OFFSET_LABEL_L_FLAGS
    0x8, // KSTRUCT_OFFSET_LABEL_L_PERPOLICY
    
    0x18, // KSTRUCT_SIZE_IPC_ENTRY
    0x8, // KSTRUCT_OFFSET_IPC_ENTRY_IE_BITS
    
    0x54, // KSTRUCT_OFFSET_VNODE_V_FLAG
    
    0x1F, // KVTABLE_OFFSET_OSDICTIONARY_SETOBJECTWITHCHARP
    0x26, // KVTABLE_OFFSET_OSDICTIONARY_GETOBJECTWITHCHARP
    0x23, // KVTABLE_OFFSET_OSDICTIONARY_MERGE
    
    0x1E, // KVTABLE_OFFSET_OSARRAY_MERGE
    0x20, // KVTABLE_OFFSET_OSARRAY_REMOVEOBJECT
    0x22, // KVTABLE_OFFSET_OSARRAY_GETOBJECT
    
    0x05, // KVTABLE_OFFSET_OSOBJECT_RELEASE
    0x03, // KVTABLE_OFFSET_OSOBJECT_GETRETAINCOUNT
    0x04, // KVTABLE_OFFSET_OSOBJECT_RETAIN
    
    0x11, // KVTABLE_OFFSET_OSSTRING_GETLENGTH
    
    0x6c, // KFREE_ADDR_OFFSET
};

uint32_t kernel_offsets_12_0[] = {
    0xb, // KSTRUCT_OFFSET_TASK_LCK_MTX_TYPE
    0x10, // KSTRUCT_OFFSET_TASK_REF_COUNT
    0x14, // KSTRUCT_OFFSET_TASK_ACTIVE
    0x20, // KSTRUCT_OFFSET_TASK_VM_MAP
    0x28, // KSTRUCT_OFFSET_TASK_NEXT
    0x30, // KSTRUCT_OFFSET_TASK_PREV
    0x300, // KSTRUCT_OFFSET_TASK_ITK_SPACE
#if __arm64e__
    0x368, // KSTRUCT_OFFSET_TASK_BSD_INFO
#else
    0x358, // KSTRUCT_OFFSET_TASK_BSD_INFO
#endif
#if __arm64e__
    0x3a8, // KSTRUCT_OFFSET_TASK_ALL_IMAGE_INFO_ADDR
#else
    0x398, // KSTRUCT_OFFSET_TASK_ALL_IMAGE_INFO_ADDR
#endif
#if __arm64e__
    0x3b0, // KSTRUCT_OFFSET_TASK_ALL_IMAGE_INFO_SIZE
#else
    0x3a0, // KSTRUCT_OFFSET_TASK_ALL_IMAGE_INFO_SIZE
#endif
#if __arm64e__
    0x400, // KSTRUCT_OFFSET_TASK_TFLAGS
#else
    0x390, // KSTRUCT_OFFSET_TASK_TFLAGS
#endif
    0x0, // KSTRUCT_OFFSET_TASK_LOCK
    
    0x0, // KSTRUCT_OFFSET_IPC_PORT_IO_BITS
    0x4, // KSTRUCT_OFFSET_IPC_PORT_IO_REFERENCES
    0x40, // KSTRUCT_OFFSET_IPC_PORT_IKMQ_BASE
    0x50, // KSTRUCT_OFFSET_IPC_PORT_MSG_COUNT
    0x60, // KSTRUCT_OFFSET_IPC_PORT_IP_RECEIVER
    0x68, // KSTRUCT_OFFSET_IPC_PORT_IP_KOBJECT
    0x88, // KSTRUCT_OFFSET_IPC_PORT_IP_PREMSG
    0x90, // KSTRUCT_OFFSET_IPC_PORT_IP_CONTEXT
    0xa0, // KSTRUCT_OFFSET_IPC_PORT_IP_SRIGHTS
    
    0x60, // KSTRUCT_OFFSET_PROC_PID
    0x108, // KSTRUCT_OFFSET_PROC_P_FD
    0x10, // KSTRUCT_OFFSET_PROC_TASK
    0xf8, // KSTRUCT_OFFSET_PROC_UCRED
    0x0, // KSTRUCT_OFFSET_PROC_P_LIST
    0x290, // KSTRUCT_OFFSET_PROC_P_CSFLAGS
    0x3f8, // KSTRUCT_OFFSET_PROC_P_MEMSTAT_STATE
    0x50, // KSTRUCT_OFFSET_PROC_MLOCK
    0xe8, // KSTRUCT_OFFSET_PROC_UCRED_MLOCK
    0x32, // KSTRUCT_OFFSET_PROC_SVUID
    0x36, // KSTRUCT_OFFSET_PROC_SVGID
    
    0x0, // KSTRUCT_OFFSET_FILEDESC_FD_OFILES
    
    0x8, // KSTRUCT_OFFSET_FILEPROC_F_FGLOB
    
    0x38, // KSTRUCT_OFFSET_FILEGLOB_FG_DATA
    
    0x10, // KSTRUCT_OFFSET_SOCKET_SO_PCB
    
    0x10, // KSTRUCT_OFFSET_PIPE_BUFFER
    
    0x14, // KSTRUCT_OFFSET_IPC_SPACE_IS_TABLE_SIZE
    0x20, // KSTRUCT_OFFSET_IPC_SPACE_IS_TABLE
    
    0xd8, // KSTRUCT_OFFSET_VNODE_V_MOUNT
    0x78, // KSTRUCT_OFFSET_VNODE_VU_SPECINFO
    0x0, // KSTRUCT_OFFSET_VNODE_V_LOCK
    0xe0, // KSTRUCT_OFFSET_VNODE_V_DATA
    
    0x10, // KSTRUCT_OFFSET_SPECINFO_SI_FLAGS
    
    0x70, // KSTRUCT_OFFSET_MOUNT_MNT_FLAG
    0x8f8, // KSTRUCT_OFFSET_MOUNT_MNT_DATA
    0x18, // KSTRUCT_OFFSET_MOUNT_MNT_MLOCK
    
    0x10, // KSTRUCT_OFFSET_HOST_SPECIAL
    
    0x10, // KSTRUCT_OFFSET_UCRED_CR_REF
    0x18, // KSTRUCT_OFFSET_UCRED_CR_UID
    0x1c, // KSTRUCT_OFFSET_UCRED_CR_RUID
    0x20, // KSTRUCT_OFFSET_UCRED_CR_SVUID
    0x24, // KSTRUCT_OFFSET_UCRED_CR_NGROUPS
    0x28, // KSTRUCT_OFFSET_UCRED_CR_GROUPS
    0x68, // KSTRUCT_OFFSET_UCRED_CR_RGID
    0x6c, // KSTRUCT_OFFSET_UCRED_CR_SVGID
    0x70, // KSTRUCT_OFFSET_UCRED_CR_GMUID
    0x74, // KSTRUCT_OFFSET_UCRED_CR_FLAGS
    0x78, // KSTRUCT_OFFSET_UCRED_CR_LABEL
    
    0x0, // KSTRUCT_OFFSET_LABEL_L_FLAGS
    0x8, // KSTRUCT_OFFSET_LABEL_L_PERPOLICY
    
    0x18, // KSTRUCT_SIZE_IPC_ENTRY
    0x8, // KSTRUCT_OFFSET_IPC_ENTRY_IE_BITS
    
    0x54, // KSTRUCT_OFFSET_VNODE_V_FLAG
    
    0x1F, // KVTABLE_OFFSET_OSDICTIONARY_SETOBJECTWITHCHARP
    0x26, // KVTABLE_OFFSET_OSDICTIONARY_GETOBJECTWITHCHARP
    0x23, // KVTABLE_OFFSET_OSDICTIONARY_MERGE
    
    0x1E, // KVTABLE_OFFSET_OSARRAY_MERGE
    0x20, // KVTABLE_OFFSET_OSARRAY_REMOVEOBJECT
    0x22, // KVTABLE_OFFSET_OSARRAY_GETOBJECT
    
    0x05, // KVTABLE_OFFSET_OSOBJECT_RELEASE
    0x03, // KVTABLE_OFFSET_OSOBJECT_GETRETAINCOUNT
    0x04, // KVTABLE_OFFSET_OSOBJECT_RETAIN
    
    0x11, // KVTABLE_OFFSET_OSSTRING_GETLENGTH
    
    0x6c, // KFREE_ADDR_OFFSET
};

uint32_t koffset(enum kernel_offset offset)
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        LOG("kCFCoreFoundationVersionNumber: %f", kCFCoreFoundationVersionNumber);
        if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_12_0) {
            LOG("offsets selected for iOS 12.0 or above");
            offsets = kernel_offsets_12_0;
        } else if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_11_3) {
            LOG("offsets selected for iOS 11.3 or above");
            offsets = kernel_offsets_11_3;
        } else if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_11_0) {
            LOG("offsets selected for iOS 11.0 to 11.2.6");
            offsets = kernel_offsets_11_0;
        } else {
            LOG("iOS version too low, 11.0 required");
            offsets = NULL;
        }
    });
    if (offsets == NULL) {
        return 0;
    }
    return offsets[offset];
}
