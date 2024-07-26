import { defineAuth, defineStorage } from '@aws-amplify/backend';

export const auth = defineAuth({
  loginWith: {
    email: true
  },
  groups: ['admin', 'auditor']
});

export const storage = defineStorage({
    name: 'myProjectFiles',
    access: (allow) => ({
      'media/*': [
            allow.authenticated.to(['read', "write", 'delete']),
            allow.guest.to(['read', "write", 'delete'])
            
         // additional actions such as "write" and "delete" can be specified depending on your use case
      ]
    })
});
  
