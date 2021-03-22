export default (payload) => jest.fn(() =>
  Promise.resolve({
    json: () => Promise.resolve(payload),
  })
)
