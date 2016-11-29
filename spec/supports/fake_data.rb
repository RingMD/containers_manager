module FakeData
  def fake_for(name)
    $data_sets[name]
  end
end
