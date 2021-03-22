import { useMemo, useState } from 'react'

const useUrlInputState = () => {
  const [state, setState] = useState('')

  const handlers = useMemo(
    () => ({
      handleUrlInputChange: (e) => {
        setState(e.target.value)
      },
      resetUrlInputState: () => {
        setState('')
      },
    }),
    []
  )

  return [state, handlers]
}

export default useUrlInputState
