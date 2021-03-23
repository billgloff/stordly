import React from 'react'
import { render, fireEvent, screen, act } from 'test-utils'
import userEvent from '@testing-library/user-event'

import CopyClipboardSubmitComponent from '../index'

beforeAll(() => {
  jest.createMockFromModule('../../__mocks__/window_prompt')
})

test('Successfully shows normal Submit Button', () => {
	const { asFragment } = render(<CopyClipboardSubmitComponent value={''} />)
	expect(screen.getByText('Shorten')).toBeInTheDocument()
	expect(asFragment()).toMatchSnapshot()	
})

test('Successfully shows Copy Clipboard Button', () => {
  const { asFragment } = render(<CopyClipboardSubmitComponent value={'http://localhost:8080/AhF5W9'} />)
  expect(screen.getByText('Copy')).toBeInTheDocument()
  expect(asFragment()).toMatchSnapshot()
})

test('Successfully shows Copied! when clicked', () => {
  const { asFragment } = render(
    <CopyClipboardSubmitComponent value={'http://localhost:8080/AhF5W9'} />
  )
  expect(screen.getByText('Copy')).toBeInTheDocument()
  expect(asFragment()).toMatchSnapshot()

	userEvent.click(screen.getByRole('button'))
	expect(screen.getByText('Copied!')).toBeInTheDocument()
	expect(asFragment()).toMatchSnapshot()
})