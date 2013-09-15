guard :shell do
  watch(/.+\.rb/) do |m|
    title = "Make output"
    msg = "Failure"
    status = :failed

    if system("rake")
      msg = "Tested"
      status = :success
    end

    n msg, title, status

    "-> #{msg}"
  end
end
