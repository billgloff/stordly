const originalWindow = { ...window }
location = window.location
const mockLocation = {
  ...originalWindow.location,
  origin: 'http://localhost',
}
delete window.location
global.window.location = mockLocation
