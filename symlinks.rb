require 'pathname'

Pathname.glob('*').select(&:directory?).sort.each do |image|
  puts image
  versions = image.children.reject(&:symlink?).map { |v| Gem::Version.new(v.basename) }.sort
  links = versions.each_with_object({}) do |v, ax|
    (0..v.segments.length - 2).map { |p| v.segments[0..p].join('.') }.each do |parent|
      ax[parent] = [ax[parent], v].compact.max
    end
    ax['latest'] = versions.last
  end
  Dir.chdir(image) do
    links.sort.each do |link, version|
      version = links[link]
      puts "  #{version} -> #{link}"
      File.unlink(link) if File.symlink?(link)
      File.symlink(version.to_s, link)
    end
  end
end
