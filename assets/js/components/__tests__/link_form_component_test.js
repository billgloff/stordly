import React from 'react'
import { render, fireEvent, screen, act } from 'test-utils'
import userEvent from '@testing-library/user-event'

import fetchMock from '../__mocks__/fetch'
import LinkFormComponent from '../link_form_component'

beforeAll(() => {
  jest.createMockFromModule('../__mocks__/csrf')
  jest.createMockFromModule('../__mocks__/window_location')
})

test('Successfully shortens a given url', async () => {
	global.fetch = fetchMock({
		 data: { slug: 'ABC1234' } 
	})
	const promise = Promise.resolve()

	const { asFragment } = render(<LinkFormComponent />)
	expect(asFragment()).toMatchSnapshot()

	expect(screen.getByText('Shorten')).toBeInTheDocument()

	const urlInput = screen.getByRole('textbox')
	expect(urlInput).toBeInTheDocument()
	expect(urlInput).toHaveFocus()
	expect(urlInput).toHaveValue('')
	
	fireEvent.change(urlInput, {
    target: { value: 'https://www.google.com' },
  })
	expect(urlInput).toHaveValue('https://www.google.com')

	userEvent.click(screen.getByRole('button'))

	await act(() => promise)

	expect(urlInput).toHaveValue('http://localhost/ABC1234')
	expect(screen.getByText('Copy')).toBeInTheDocument()

	expect(asFragment()).toMatchSnapshot()
})

test('Renders an error with an invalid url', async () => {
	global.fetch = fetchMock({
    errors: { url: ['URL is not a valid URL!'] },
  })
  const promise = Promise.resolve()

  const { asFragment } = render(<LinkFormComponent />)
  expect(asFragment()).toMatchSnapshot()

  expect(screen.getByText('Shorten')).toBeInTheDocument()

  const urlInput = screen.getByRole('textbox')
  expect(urlInput).toBeInTheDocument()
  expect(urlInput).toHaveFocus()
  expect(urlInput).toHaveValue('')

  fireEvent.change(urlInput, {
    target: { value: 'httttps://www' },
  })
  expect(urlInput).toHaveValue('httttps://www')

  userEvent.click(screen.getByRole('button'))

  await act(() => promise)

  expect(urlInput).toHaveValue('httttps://www')
  expect(screen.getByText('Shorten')).toBeInTheDocument()
	expect(screen.getByText('URL is not a valid URL!')).toBeInTheDocument()

  expect(asFragment()).toMatchSnapshot()
})