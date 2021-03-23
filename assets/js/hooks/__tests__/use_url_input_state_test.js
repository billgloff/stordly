import { renderHook, act } from '@testing-library/react-hooks'

import useUrlInputState from '../use_url_input_state'

test('allows you to handle url input changes', () => {
  const { result } = renderHook(() => useUrlInputState(''))

  const [url, { handleUrlInputChange, resetUrlInputState }] = result.current

  // assert initial state
  expect(result.current[0]).toEqual('')

  act(() => {
    handleUrlInputChange({ target: { value: 'https://google.com' } })
  })

  // assert state change
  expect(result.current[0]).toEqual('https://google.com')
})

test('allows you to reset the url input state', () => {
  const { result } = renderHook(() => useUrlInputState())

	const [url, { handleUrlInputChange, resetUrlInputState }] = result.current

  // assert initial state
  expect(result.current[0]).toEqual('')

	// change state so we can reset it
  act(() => {
    handleUrlInputChange({ target: { value: 'https://yahoo.com' } })
  })

  // assert state change
  expect(result.current[0]).toEqual('https://yahoo.com')

  act(() => {
    resetUrlInputState()
  })

  // assert state change
  expect(result.current[0]).toEqual('')
})
