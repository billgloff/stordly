jest.spyOn(document.head, 'querySelector').mockReturnValue({
  getAttribute: jest.fn().mockReturnValue('MOCK-CSRF-TOKEN-VALUE'),
})
